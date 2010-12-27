//
//  TouchView.m
//  SimpleSynth
//
//  Created by Kojiro Umezaki on 12/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TouchView.h"


@implementation TouchView


- (void)awakeFromNib {

	mFreq_Default = 0.5;
	mFreq = mFreq_Default;
	mFreq_Delta = 0.;

	mX = 0.5;

	mTouchX_Start = -1.;
	mTouchY_Start = -1.;

	[self UpdatePosition];
}
	
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	UIColor *rectColor = [UIColor greenColor];
	[rectColor set];
	
	double x = self.bounds.size.width * mX;
	double y = self.bounds.size.height * 0.0;
	double w = 5.;
	double h = self.bounds.size.height;

	CGContextRef contextRef = UIGraphicsGetCurrentContext();
	CGContextFillRect(contextRef, CGRectMake(x,y,w,h));
}

- (void)dealloc {
    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"touchesBegan");
	CGPoint pt = [[touches anyObject] locationInView:self];
//	NSLog(@"%lf,%lf",pt.x,pt.y);
	mTouchX_Start = pt.x;
	mTouchY_Start = pt.y;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"touchesMoved");
	CGPoint pt = [[touches anyObject] locationInView:self];
//	NSLog(@"%lf,%lf",pt.x,pt.y);
	if (pt.x > mTouchX_Start)
	{
		Float64 delta_x = (pt.x - mTouchX_Start) / self.bounds.size.width * 2.5;
//		NSLog(@"%lf",delta_x);
		mFreq = mFreq_Default * (1. + delta_x);
	}
	else
		mFreq = 0.0;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"touchesEnded");
	
	if (mFreq > mFreq_Default)
		mFreq_Delta = -0.015;
	else
		mFreq_Delta = +0.03;

	mTouchX_Start = -1.;
	mTouchY_Start = -1.;
}

-(void)UpdatePosition
{
	mFreq += mFreq_Delta;
	if (mFreq_Delta < 0. && mFreq < mFreq_Default) { mFreq = mFreq_Default; mFreq_Delta = 0.; }
	if (mFreq_Delta > 0. && mFreq > mFreq_Default) { mFreq = mFreq_Default; mFreq_Delta = 0.; }
	
	mX += mFreq / 30.;
	mX -= mX > 1. ? 1. : 0.;

	[self setNeedsDisplay];

	[NSTimer scheduledTimerWithTimeInterval:1./30. target:self selector:@selector(UpdatePosition) userInfo:nil repeats:NO];
}

@end
