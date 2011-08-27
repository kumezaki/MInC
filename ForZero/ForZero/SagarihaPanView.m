//
//  SagarihaPanView.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 10/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SagarihaPanView.h"


@implementation SagarihaPanView

/*
- (void)awakeFromNib {
	[self Set:0.5:0.5];
        
}
*/
- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        // Initialization code
        [self Set:0.5:0.5];

    }
    return self;
}

- (void)drawCircleAtPoint:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef)context
{
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
	CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
	CGContextStrokePath(context);
	UIGraphicsPopContext();
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
	UIColor *rectColor = [UIColor greenColor];
	[rectColor set];

	UIRectFill(CGRectMake(mX-5., mY-5., 10.0, 10.0));
	UIRectFill(CGRectMake(mX-5., mY-5., 10.0, 10.0));
    
    CGPoint midPoint;
    midPoint.x = mX;
    midPoint.y = mY;
    
    CGFloat size = self.bounds.size.width / 2;
    if (self.bounds.size.height < self.bounds.size.width) size = self.bounds.size.height / 2;
    size *= 0.20;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 5.0);
    [[UIColor greenColor] setStroke];
    
    [self drawCircleAtPoint:midPoint withRadius:size inContext:context];

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
	mXX = x * self.bounds.size.width;
	mYY = y * self.bounds.size.height;
    
    mX = self.bounds.origin.x + self.bounds.size.width/2;
    mY = self.bounds.origin.y + self.bounds.size.height/2;
}

-(void)SetVelocity:(double)x:(double)y
{
	mX += x * (self.bounds.size.width * 0.1);
	mY += y * (self.bounds.size.height * 0.1);
	
	mX = mX < 0 ? 0 : mX > self.bounds.size.width ? self.bounds.size.width : mX;
	mY = mY < 0 ? 0 : mY > self.bounds.size.height ? self.bounds.size.height : mY;

}

@end
