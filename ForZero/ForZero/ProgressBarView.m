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
    UIView *overlay = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.origin.x+10, 
                                                             self.bounds.origin.y+10, 
                                                             self.bounds.size.width-20, 
                                                             self.bounds.size.height-20)];
    overlay.backgroundColor = [UIColor darkGrayColor];
    overlay.layer.cornerRadius = kCornerRadius;
    [self addSubview:overlay];
    [self sendSubviewToBack:overlay];
    self.layer.cornerRadius = kCornerRadius;
    [overlay release];
}

#define kLineOffset 10
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 20.0);
	[[UIColor greenColor] setStroke];
    
    // ask the delegate for a value
    float prog = [self.delegate progressValueForProgressBarView:self];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat perimeter = (width + height)*2;
    
    // scale 0. to 1. values to the perimeter of the view
    prog = perimeter * prog;
    
    float top;
    float right;
    float bottom;
    float left;
    
    // set top line progress
    if (prog < width) {
        top = prog; // top is an X value
    }
    else top = width;
    
    // set right line progress
    if ((prog - width) < height) {
        right = prog - width; // right is a Y value
    }
    else right = height;
    
    if (right < 0) {
        right = -1;
    }
    
    // set bottom line progress
    if (prog >= (width + height) && prog < (perimeter - height)) {
        bottom = width - (prog - (width + height));
    }
    else if (right == height) bottom = 0;// bottom is an X value
    else bottom = -1;
    
    // set left line progress
    if (prog >= (perimeter - height)) {
        left = height - (prog - (perimeter - height));
    }
    else left = -1;
    // DON'T LEAVE THIS PRINTF ON!!! testing purposes only.
    // printf("top:%f right:%f bottom:%f left:%f\n", top, right, bottom, left);
    
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, kLineOffset);
    CGContextAddLineToPoint(context,top,kLineOffset);
    if (right != -1) {
        CGContextMoveToPoint(context, width-kLineOffset, 0);
        CGContextAddLineToPoint(context, width-kLineOffset, right);
    }
    if (bottom != -1){
        CGContextMoveToPoint(context, width-kLineOffset,height-kLineOffset);
        CGContextAddLineToPoint(context, bottom, height-kLineOffset); 
    }
    if (left != -1){
        CGContextMoveToPoint(context, kLineOffset, height-kLineOffset);
        CGContextAddLineToPoint(context, kLineOffset, left);
    }
    CGContextStrokePath(context);
}

- (void)dealloc
{
    [super dealloc];
}

@end
