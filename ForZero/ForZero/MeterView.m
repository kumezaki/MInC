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

- (void)setMeterVal:(int)newMeterVal {
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
    
    CGFloat borderWidth = 2;

    CGFloat boxHeight = (height / 7) - (borderWidth * 2);
    CGFloat boxWidth = width - (borderWidth * 2);
;
    // get the value from the value property
    int val = self.meterVal;

    if (val > 0) {
        [[UIColor greenColor] setFill];
        int boxNum = 1;
        CGContextBeginPath(c);
        CGContextFillRect(c, CGRectMake(borderWidth, height - ((boxHeight*boxNum) + (borderWidth*boxNum)), boxWidth, boxHeight));
    }
    if (val > 1) {
        int boxNum = 2;
        CGContextBeginPath(c);
        CGContextFillRect(c, CGRectMake(borderWidth, height - ((boxHeight*boxNum) + (borderWidth*boxNum)), boxWidth, boxHeight));
    }
    if (val > 2) {
        int boxNum = 3;
        CGContextBeginPath(c);
        CGContextFillRect(c, CGRectMake(borderWidth, height - ((boxHeight*boxNum) + (borderWidth*boxNum)), boxWidth, boxHeight));
    }
    if (val > 3) {
        [[UIColor yellowColor] setFill];
        int boxNum = 4;
        CGContextBeginPath(c);
        CGContextFillRect(c, CGRectMake(borderWidth, height - ((boxHeight*boxNum) + (borderWidth*boxNum)), boxWidth, boxHeight));
    }
    if (val > 4) {
        int boxNum = 5;
        CGContextBeginPath(c);
        CGContextFillRect(c, CGRectMake(borderWidth, height - ((boxHeight*boxNum) + (borderWidth*boxNum)), boxWidth, boxHeight));
    }
    if (val > 5) {
        [[UIColor orangeColor] setFill];
        int boxNum = 6;
        CGContextBeginPath(c);
        CGContextFillRect(c, CGRectMake(borderWidth, height - ((boxHeight*boxNum) + (borderWidth*boxNum)), boxWidth, boxHeight));
    }
    if (val > 6) {
        int boxNum = 7;
        CGContextBeginPath(c);
        CGContextFillRect(c, CGRectMake(borderWidth, height - ((boxHeight*boxNum) + (borderWidth*boxNum)), boxWidth, boxHeight));

    }
    if (val > 7) {
        [[UIColor redColor] setFill];
        int boxNum = 8;
        CGContextBeginPath(c);
        CGContextFillRect(c, CGRectMake(borderWidth, height - ((boxHeight*boxNum) + (borderWidth*boxNum)), boxWidth, boxHeight));
    }
}


@end
