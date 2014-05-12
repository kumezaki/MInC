//
//  SagarihaPanView.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 10/4/10.
//  Copyright 2010 __yCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "SagarihaPanView.h"


@implementation SagarihaPanView
@synthesize delegate;
@synthesize touchPoint =_touchPoint;
@synthesize enabled = _enabled;

- (void)setTouchPoint:(CGPoint)newTouchPoint {
    if (!CGPointEqualToPoint(newTouchPoint, _touchPoint)) {
        _touchPoint.x = newTouchPoint.x < 0 ? 0 : newTouchPoint.x > self.bounds.size.width ? self.bounds.size.width : newTouchPoint.x;
        _touchPoint.y = newTouchPoint.y < 0 ? 0 : newTouchPoint.y > self.bounds.size.height ? self.bounds.size.height : newTouchPoint.y;
        
        // set to relative location
        x = _touchPoint.x / self.bounds.size.width; 
        y = _touchPoint.y / self.bounds.size.height;
        
        [self setNeedsDisplay];
        
        [self.delegate panViewTouchPadValuesDidChange:self];
    }
}

- (void)detectOrientationChange:(NSNotification*)notification {
    [self setNeedsDisplay];
}

- (void)awakeFromNib {
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(detectOrientationChange:) 
                                                 name:@"UIDeviceOrientationDidChangeNotification" 
                                               object:nil]; 
    x = 0.5;
    y = 0.5;
    
    enabled = NO;
    
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
	UIRectFill(CGRectMake(x-5., y-5., 10.0, 10.0));
    */
	
    // convert relative location to absolute
    // will be different depending on orientation
    
    int pix_x = x * self.bounds.size.width;
    int pix_y = y * self.bounds.size.height;
    
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(context, 5.0);
    UIColor* color = _enabled ? [UIColor greenColor] : [UIColor grayColor];
	[color setStroke];
    [color setFill];
    UIGraphicsPushContext(context);
	
    CGContextSetAlpha(context,_enabled ? 1.0 : 0.5);
    CGContextBeginPath(context);
	CGContextAddArc(context, pix_x, pix_y, 25, 0, 2*M_PI, YES);
    CGContextFillPath(context);
}


- (void)dealloc {
    
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
     
    [super dealloc];
}

-(void)doTouch:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!_enabled) return;
    UITouch *touch = [touches anyObject];
	self.touchPoint = [touch locationInView:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self doTouch:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self doTouch:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self doTouch:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

/*
-(Float64)GetX
{
	return x / self.bounds.size.width;
}

-(Float64)GetY
{
	return y / self.bounds.size.height;
}

-(void)Set:(Float64)x:(Float64)y
{
	x = x * self.bounds.size.width;
	y = y * self.bounds.size.height;
}

-(void)SetVelocity:(Float64)x:(Float64)y
{
	x += x * (self.bounds.size.width * 0.1);
	y += y * (self.bounds.size.height * 0.1);
	
	x = x < 0 ? 0 : x > self.bounds.size.width ? self.bounds.size.width : x;
	y = y < 0 ? 0 : y > self.bounds.size.height ? self.bounds.size.height : y;
}
*/
@end
