//
//  ProgressBarView.m
//  ForZero
//
//  Created by Chris Lavender on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "ProgressBarView.h"

@implementation ProgressBarView

@synthesize delegate=_delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [super  awakeFromNib];
    self.layer.cornerRadius = kCornerRadius;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 15.0);
	[[UIColor greenColor] setStroke];
    
    // ask the delegate for a value
    float prog = [self.delegate progressValueForProgressBarView:self];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat perimeter = (width*2) + (height*2);
    
    // scale 0. to 1. values to the perimeter of the view
    prog = perimeter * prog;
    
    float top;
    float right;
    float bottom;
    float left;
    
    // set top line progress
    if (prog < width) {
        top = prog;
    }
    else top = width;
    
    // set right line progress
    if ((prog - width) < height) {
        right = prog - width;
    }
    else right = height;
    if (right < 0) {
        right = -1;
    }
    
    // set bottom line progress
    if (prog >= (width + height) && prog < (perimeter - height)) {
        bottom = width - (prog - (width + height));
    }
    else if (right == height) bottom = 0;
    else bottom = -1;
    
    // set left line progress
    if (prog >= (perimeter - height)) {
        left = height - (prog - (perimeter - height));
    }
    else left = -1;
    // DON'T LEAVE THIS PRINTF ON!!! testing purposes only.
    // printf("top:%f right:%f bottom:%f left:%f\n", top, right, bottom, left);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, 0);
    
    CGContextAddLineToPoint(context,top,0);
    if (right != -1)CGContextAddLineToPoint(context, width, right);
    if (bottom != -1)CGContextAddLineToPoint(context, bottom, height);
    if (left != -1) CGContextAddLineToPoint(context, 0, left);    
    CGContextStrokePath(context);
}

- (void)dealloc
{
    [super dealloc];
}

@end
