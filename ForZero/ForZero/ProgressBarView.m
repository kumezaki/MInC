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

@synthesize progressVal =_progressVal;

- (float)progressVal {
    return _progressVal;
}

- (void)setProgressVal:(float)newProgressVal {
    if (_progressVal != newProgressVal) {
        _progressVal = newProgressVal;
        [self setNeedsDisplay];
    }
}

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
#if 0 // optional overlay?
    UIView *overlay = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.origin.x+10, 
                                                             self.bounds.origin.y+10, 
                                                             self.bounds.size.width-20, 
                                                             self.bounds.size.height-20)];
    overlay.backgroundColor = [UIColor darkGrayColor];
    overlay.layer.cornerRadius = kCornerRadius;
    [self addSubview:overlay];
    [self sendSubviewToBack:overlay];
    [overlay release];
#endif
    self.layer.cornerRadius = kCornerRadius;
}

#define kLineOffset 10
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(c, 20.0);
	[[UIColor greenColor] setStroke];

    // get the value
    float prog = self.progressVal;
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat perimeter = (width + height)*2;
    
    // scale 0. to 1. values to the perimeter of the view
    prog = perimeter * prog;
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 0, kLineOffset);
    // top line
    if (prog <= width) {
        CGContextAddLineToPoint(c,prog,kLineOffset);
    }
    else CGContextAddLineToPoint(c, width, kLineOffset);
    
    //right line
    if (prog >= width - (kLineOffset*4) && prog <= width+height) {
        CGContextMoveToPoint(c, width-kLineOffset, 0);
        CGContextAddLineToPoint(c, width-kLineOffset, prog - CGContextGetPathCurrentPoint(c).x);
    }
    else if (prog > width+height) {
        CGContextMoveToPoint(c, width-kLineOffset, 0);
        CGContextAddLineToPoint(c, width-kLineOffset, height);
    }
    // bottom line
    if (prog >= width - (kLineOffset*4) && prog >= width + (height - kLineOffset*2)) {
        CGContextMoveToPoint(c, width, height-kLineOffset);
        CGContextAddLineToPoint(c, 
                                width - (prog-(width + height - kLineOffset*2)), 
                                height-kLineOffset);
    }
    else if (prog >= perimeter - (height - kLineOffset*2)){
        CGContextMoveToPoint(c, 0, height-kLineOffset);
        CGContextAddLineToPoint(c, 0, height-kLineOffset);
    }
    
    // left line
    if (prog >= perimeter - (height+kLineOffset*4)) {
        CGContextMoveToPoint(c, kLineOffset, height);
        CGContextAddLineToPoint(c, kLineOffset, height - (prog - (perimeter - height-kLineOffset*2)));
    }
    CGContextStrokePath(c);
}

- (void)dealloc
{
    [super dealloc];
}

@end
