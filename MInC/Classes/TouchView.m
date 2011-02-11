//
//  TouchView.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TouchView.h"

#import "AQPlayer.h"
#import "MInCAppDelegate.h"

extern AQPlayer *gAQP;

#define DIAGONAL(x,y) sqrt(((x) * (x)) + ((y) * (y)))

@implementation TouchView

- (void)awakeFromNib {

	for (int i = 0; i < MAX_NUM_TOUCHES; i++)
	{
		mX[i] = (0.5 + (i==0?-0.25:+0.25)) * self.bounds.size.width;
		mY[i] = (0.5 + (i==0?-0.25:+0.25)) * self.bounds.size.height;
		mTouch[i] = nil;
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

#if 0
	UIRectFill(CGRectMake(mX[0]-5., mY[0]-5., 10.0, 10.0));
	UIRectFill(CGRectMake(mX[1]-5., mY[1]-5., 10.0, 10.0));
#else
#if 0
	double x = mX[0] < mX[1] ? mX[0] : mX[1];
	double y = mY[0] < mY[1] ? mY[0] : mY[1];
	double w = fabs(mX[0] - mX[1]);
	double h = fabs(mY[0] - mY[1]);
	UIRectFill(CGRectMake(x,y,w,h));
#else
	double w = fabs(mX[0] - mX[1]);
	double h = fabs(mY[0] - mY[1]);
	w = h = w > h ? w : h;
	double x = ((mX[0] + mX[1]) / 2.) - w / 2;
	double y = ((mY[0] + mY[1]) / 2.) - h / 2;
	
	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	CGContextFillEllipseInRect(contextRef, CGRectMake(x,y,w,h));
#endif
#endif
}


- (void)dealloc {
    [super dealloc];
}

#define TOUCH_ASSIGN(lval,val) { lval = val; printf("assigning %s to %s\n",#val,#lval); break; }

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	printf("touchesBegan count:%d\n",touches.count);
	for (UITouch* t in touches)
	{
		for (int i = 0; i < MAX_NUM_TOUCHES; i++)
			if (mTouch[i] == nil) TOUCH_ASSIGN(mTouch[i],t)
	}
	[self ProcessTouch:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	printf("touchesMoved count:%d\n",touches.count);
	[self ProcessTouch:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	printf("touchesEnded count:%d\n",touches.count);
	for (UITouch* t in touches)
	{
		for (int i = 0; i < MAX_NUM_TOUCHES; i++)
			if (mTouch[i] == t) TOUCH_ASSIGN(mTouch[i],nil)
	}
	[self ProcessTouch:touches];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	printf("touchesCancelled\n");
}

-(void)ProcessTouch:(NSSet *)touches
{
#if 0
	printf("UIView size: %f %f\n",self.bounds.size.width,self.bounds.size.height);
#endif
	
	[self UpdateCoordinates:0:1];
	[self UpdateCoordinates:1:0];

#if 0
	for (int i = 0; i < MAX_NUM_TOUCHES; i++)
		printf("mTouch[%d] (%f,%f)\n",i,mX[i],mY[i]);
#endif

	double x = mX[0]/self.bounds.size.width;
	double y = 1. - (mY[0]/self.bounds.size.height);
	double z = DIAGONAL(mX[1]-mX[0],mY[1]-mY[0]) / DIAGONAL(self.bounds.size.width,self.bounds.size.height);

	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];

	[appDelegate SendOSC_Filter:x];
	[appDelegate SendOSC_Waveform:y];
	[appDelegate SendOSC_Volume:z];

	[self setNeedsDisplay];
}

-(void)UpdateCoordinates:(int)a_index:(int)b_index
{
	if (mTouch[a_index] != nil)
	{
		CGPoint pt = [mTouch[a_index] locationInView:self];
		if (mTouch[b_index] == nil)
		{
			double dif;
			
#define UPDATE_COORD(member_coord,pt_coord) \
	dif = pt_coord - (member_coord[0] + member_coord[1]) / 2.; \
	for (int i = 0; i < MAX_NUM_TOUCHES; i++) member_coord[i] += dif;
	
			UPDATE_COORD(mX,pt.x)
			UPDATE_COORD(mY,pt.y)
		}
		else
		{
			mX[a_index]=pt.x;
			mY[a_index]=pt.y;
		}
	}
}

#if 0
#if 1
	double amp = 1. - (pt.y/self.bounds.size.height);
	amp *= amp;
#else
	double rel_pos_y = pt.y/self.bounds.size.height;
	double db = rel_pos_y * -60.;
	double amp = pow(10.,db/20.);		
#endif
	amp = amp > 1.0 ? 1.0 : amp < 0.0 ? 0.0 : amp;
	printf("Amp: %f\n",amp);

	double dur = pt.x/self.bounds.size.width;
	dur = dur > 1.0 ? 1.0 : dur < 0.0 ? 0.0 : dur;
	printf("Dur: %f\n",dur);

	Sequencer* q = gAQP->mSequencer_Pri;
	if (q != nil)
	{
		q->mAmpMultiplier = amp;
		q->mDurMultiplier = dur;
	}
#endif

@end