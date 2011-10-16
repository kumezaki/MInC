//
//  SagarihaPanView.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 10/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "SagarihaPanView.h"


@implementation SagarihaPanView


- (void)awakeFromNib {
	[self Set:0.5:0.5];
    self.backgroundColor    = [UIColor blackColor];
    self.layer.cornerRadius = kCornerRadius;
}

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    /*
	UIColor *rectColor = [UIColor greenColor];
	[rectColor set];
	UIRectFill(CGRectMake(mX-5., mY-5., 10.0, 10.0));
    */
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(context, 5.0);
	[[UIColor greenColor] setStroke];
    [[UIColor greenColor] setFill];
    UIGraphicsPushContext(context);
	
    CGContextBeginPath(context);
	CGContextAddArc(context, mX, mY, 20, 0, 2*M_PI, YES);
    CGContextFillPath(context);
}


- (void)dealloc {
    [super dealloc];
}


-(double)GetX
{
	return mX / self.bounds.size.width;
}

-(double)GetY
{
	return mY / self.bounds.size.height;
}

-(void)Set:(double)x:(double)y
{
	mX = x * self.bounds.size.width;
	mY = y * self.bounds.size.height;
}

-(void)SetVelocity:(double)x:(double)y
{
	mX += x * (self.bounds.size.width * 0.1);
	mY += y * (self.bounds.size.height * 0.1);
	
	mX = mX < 0 ? 0 : mX > self.bounds.size.width ? self.bounds.size.width : mX;
	mY = mY < 0 ? 0 : mY > self.bounds.size.height ? self.bounds.size.height : mY;
}

@end
