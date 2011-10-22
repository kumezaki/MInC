//
//  MeterView.m
//  ForZero
//
//  Created by Chris Lavender on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MeterView.h"

@implementation MeterView
@synthesize meterVal    =_meterVal;

- (float)meterVal {
    return _meterVal;
}

- (void)setMeterVal:(float)newMeterVal {
    if (_meterVal != newMeterVal) {
        _meterVal = newMeterVal;
        
        [self setNeedsDisplay];
    }
}
- (void) dealloc {
    
     [super dealloc];
}

- (void)setup {
    self.backgroundColor = [UIColor blackColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [self setup];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect 
{
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
	CGContextSetLineWidth(c, width*4);
	[[UIColor greenColor] setStroke];
    
    // get a value from the value property
    float val = self.meterVal;
    
    // scale 0. to 1. values to the hieght of the view
    val = height * val;
    
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, 0, height);
    CGContextAddLineToPoint(c, 0, height - val);
    CGContextStrokePath(c);
}


@end
