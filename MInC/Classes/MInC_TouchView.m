//
//  MInC_TouchView.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_TouchView.h"

#import "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

#import "MInC_Player.h"

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
    
    AnimationView = nil;
    
    PlayerPosArray = [[NSMutableArray alloc] init];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)draw_rect {

    const unsigned long num_players = gAQP.PlayerDictionary.count;
    const unsigned long num_seqs = gAQP.Sequences.count;
    const Float64 x_delta = self.superview.bounds.size.width / num_players;
    const Float64 x_start = x_delta * (num_players / 2);
    const Float64 status_bar_height= 20.; /* for iOS 6 this value should be 0. */
    const Float64 y_bottom = self.superview.bounds.size.height-status_bar_height;
    NSLog(@"%f %f",self.superview.bounds.size.width,self.superview.bounds.size.height);

    NSArray* keys = [gAQP.PlayerDictionary allKeys];
    for (int i = 0; i < keys.count; i++) NSLog(@"before sort %@",keys[i]);
    keys = [[gAQP.PlayerDictionary allKeys] sortedArrayUsingComparator:^(id obj1, id obj2)
        {
            /* ensure that "this" player is the first element */
            if ([obj1 intValue] == gAQP.PlayerID)
                return NSOrderedAscending;
            if ([obj2 intValue] == gAQP.PlayerID)
                return NSOrderedDescending;
            
            if ([obj1 intValue] > [obj2 intValue])
                return NSOrderedDescending;
            if ([obj1 intValue] < [obj2 intValue])
                return NSOrderedAscending;

            return NSOrderedSame;
        }
    ];
    for (int i = 0; i < keys.count; i++) NSLog(@"after sort %@",keys[i]);
    
    int i = 0;
    while (i < keys.count)
    {
        MInC_Player* player = gAQP.PlayerDictionary[keys[i]];
        BOOL this_player = [keys[i] integerValue] == gAQP.PlayerID;
        
        int offset = (i + 1) / 2;
        int sign = i % 2;
        Float64 x = (sign == 0 ? offset : -offset) * x_delta + x_start;
        
        float h = (float)player.SeqPos_Cur / num_seqs * y_bottom;
        
        UIColor *rectColor = this_player ? [UIColor whiteColor] : [UIColor darkGrayColor];
        [rectColor set];
        
        UIRectFill(CGRectMake(x, y_bottom-h, x_delta, h));
        
        Float64 pan = (x + (x_delta / 2)) / self.superview.bounds.size.width;
        NSLog(@"%@ Pan %f",keys[i],pan);
        [player setPan:pan];

        i++;
    }

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

#if 0 /* one circle combining touches */
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

-(void) flashScreen {

//    NSLog(@"Flash Screen executed");
    
    if (AnimationView == nil)
    {
        UIWindow* wnd = [UIApplication sharedApplication].keyWindow;
        AnimationView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wnd.frame.size.width, wnd.frame.size.height)];
        AnimationView.backgroundColor = [UIColor whiteColor];
        [wnd addSubview: AnimationView];
    }
    
    AnimationView.alpha = 1.;
    [UIView beginAnimations: nil context: nil];
    
    [UIView setAnimationDuration: 1.0];
    AnimationView.alpha = 0.;
    
    [UIView commitAnimations];
}


#define TOUCH_ASSIGN(lval,val) { lval = val; /* NSLog(@"assigning %s to %s\n",#val,#lval); */ break; }

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"touchesBegan count:%d\n",touches.count);
	for (UITouch* t in touches)
	{
		for (SInt32 i = 0; i < MAX_NUM_TOUCHES; i++)
			if (Touch[i] == nil) TOUCH_ASSIGN(Touch[i],t)
	}
	[self processTouch:touches];
    
    [gFirstView setSequence];

    /* temporarily map touchesBegan to advancing sequence here */
    [self flashScreen];
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
    
#if 0
	Float64 x = pt.x/self.bounds.size.width;
	Float64 y = 1. - (pt.y/self.bounds.size.height);

	[gFirstView sendOSC_Filter:x];
    Float64 cutoff_freq = kSR / 2. * (x > 0.9? 0.9 : x); /* 90% is max */
    [gAQP.Biquad biquad_set:LPF :0. :cutoff_freq :kSR :0.5];
    NSLog(@"cutoff freq %f",cutoff_freq);
    
	[gFirstView sendOSC_Volume:y];
    gAQP->Sequencer_Pri.AmpMultiplier_Control = y;
    NSLog(@"amplitude %f",y);
#endif
    
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
