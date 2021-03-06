//
//  TouchView.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_TouchView.h"

#import "MInC_AQPlayer.h"
#import "MInC_AppDelegate.h"

extern MInC_AQPlayer *gAQP;

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

#define DIAGONAL(x,y) sqrt(((x) * (x)) + ((y) * (y)))

#define DEFAULT_RADIUS  0.1

@implementation MInC_TouchView

- (void)awakeFromNib {

    const Float64 rad = DEFAULT_RADIUS;
	for (SInt32 i = 0; i < MAX_NUM_TOUCHES; i++)
	{
		X[i] = (0.5 + (i==0?-rad:+rad)) * self.bounds.size.width;
		Y[i] = (0.5 + (i==0?-rad:+rad)) * self.bounds.size.height;
		Touch[i] = nil;
	}
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)draw_rect {

    // Drawing code
	UIColor *rectColor = [UIColor darkGrayColor];
	[rectColor set];

#if 0 /* one rect per touch */
	UIRectFill(CGRectMake(X[0]-5., Y[0]-5., 10.0, 10.0));
	UIRectFill(CGRectMake(X[1]-5., Y[1]-5., 10.0, 10.0));
#endif
    
#if 0 /* one rect combining touches */
	Float64 x = X[0] < X[1] ? X[0] : X[1];
	Float64 y = Y[0] < Y[1] ? Y[0] : Y[1];
	Float64 w = fabs(X[0] - X[1]);
	Float64 h = fabs(Y[0] - Y[1]);
	UIRectFill(CGRectMake(x,y,w,h));
#endif

#if 1 /* one circle combining touches */
	Float64 w = fabs(X[0] - X[1]);
	Float64 h = fabs(Y[0] - Y[1]);

#if 1
    /* constant radius */
    w = h = self.bounds.size.width * DEFAULT_RADIUS;
#else
    /* variable radius */
	w = h = w > h ? w : h;
#endif

	Float64 x = ((X[0] + X[1]) / 2.) - w / 2;
	Float64 y = ((Y[0] + Y[1]) / 2.) - h / 2;
	
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	CGContextFillEllipseInRect(contextRef, CGRectMake(x,y,w,h));
#endif
}


- (void)dealloc {
    [super dealloc];
}

#define TOUCH_ASSIGN(lval,val) { lval = val; NSLog(@"assigning %s to %s\n",#val,#lval); break; }

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"touchesBegan count:%d\n",touches.count);
	for (UITouch* t in touches)
	{
		for (SInt32 i = 0; i < MAX_NUM_TOUCHES; i++)
			if (Touch[i] == nil) TOUCH_ASSIGN(Touch[i],t)
	}
	[self processTouch:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"touchesMoved count:%d\n",touches.count);
	[self processTouch:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"touchesEnded count:%d\n",touches.count);
	for (UITouch* t in touches)
	{
		for (SInt32 i = 0; i < MAX_NUM_TOUCHES; i++)
			if (Touch[i] == t) TOUCH_ASSIGN(Touch[i],nil)
	}
	[self processTouch:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesCancelled\n");
}

-(void)processTouch:(NSSet *)touches
{
    //	NSLog(@"UIView size: %f %f\n",self.bounds.size.width,self.bounds.size.height);
    
    if (Touch[0] == nil) return;
    CGPoint pt = [Touch[0] locationInView:self];
    
    //	for (SInt32 i = 0; i < MAX_NUM_TOUCHES; i++) NSLog(@"Touch[%d] (%f,%f)\n",i,X[i],Y[i]);
    
	Float64 x = pt.x/self.bounds.size.width;
	Float64 y = 1. - (pt.y/self.bounds.size.height);
    
	[gFirstView sendOSC_Filter:x];
    Float64 cutoff_freq = kSR / 2. * (x > 0.9? 0.9 : x); /* 90% is max */
    [gAQP.Biquad biquad_set:LPF :0. :cutoff_freq :kSR :0.5];
    NSLog(@"cutoff freq %f",cutoff_freq);
    
	[gFirstView sendOSC_Volume:y];
    gAQP->Sequencer_Pri.AmpMultiplier_Control = y;
    NSLog(@"amplitude %f",y);
    
    X[0] = X[1] = pt.x;
    Y[0] = Y[1] = pt.y;
    
	[self setNeedsDisplay];
}

#if 0 /* for multi-touch, variable radius */
-(void)processTouch:(NSSet *)touches
{
    //	NSLog(@"UIView size: %f %f\n",self.bounds.size.width,self.bounds.size.height);
    
	[self updateCoordinates:0:1];
	[self updateCoordinates:1:0];
    
    //	for (SInt32 i = 0; i < MAX_NUM_TOUCHES; i++) NSLog(@"Touch[%d] (%f,%f)\n",i,X[i],Y[i]);
    
	Float64 x = X[0]/self.bounds.size.width;
	Float64 y = 1. - (Y[0]/self.bounds.size.height);
	Float64 z = DIAGONAL(X[1]-X[0],Y[1]-Y[0]) / DIAGONAL(self.bounds.size.width,self.bounds.size.height);
    
	[gFirstView sendOSC_Filter:x];
    [gAQP.Biquad biquad_set:LPF :0. :kSR/2.*x :kSR :1.0];
    
	[gFirstView sendOSC_Waveform:y];
    
	[gFirstView sendOSC_Volume:z];
    gAQP->Sequencer_Pri->AmpMultiplier = z;
    
	[self setNeedsDisplay];
}
#endif

-(void)updateCoordinates:(SInt32)a_index :(SInt32)b_index
{
	if (Touch[a_index] != nil)
	{
		CGPoint pt = [Touch[a_index] locationInView:self];
		if (Touch[b_index] == nil)
		{
			Float64 dif;
			
#define UPDATE_COORD(member_coord,pt_coord) \
	dif = pt_coord - (member_coord[0] + member_coord[1]) / 2.; \
	for (SInt32 i = 0; i < MAX_NUM_TOUCHES; i++) member_coord[i] += dif;
	
			UPDATE_COORD(X,pt.x)
			UPDATE_COORD(Y,pt.y)
		}
		else
		{
			X[a_index]=pt.x;
			Y[a_index]=pt.y;
		}
	}
}

#if 0
#if 1
	Float64 amp = 1. - (pt.y/self.bounds.size.height);
	amp *= amp;
#else
	Float64 rel_pos_y = pt.y/self.bounds.size.height;
	Float64 db = rel_pos_y * -60.;
	Float64 amp = pow(10.,db/20.);		
#endif
	amp = amp > 1.0 ? 1.0 : amp < 0.0 ? 0.0 : amp;
	NSLog(@"Amp: %f\n",amp);

	Float64 dur = pt.x/self.bounds.size.width;
	dur = dur > 1.0 ? 1.0 : dur < 0.0 ? 0.0 : dur;
	NSLog(@"Dur: %f\n",dur);

	Sequencer* q = gAQP->Sequencer_Pri;
	if (q != nil)
	{
		q->AmpMultiplier = amp;
		q->DurMultiplier = dur;
	}
#endif

@end
