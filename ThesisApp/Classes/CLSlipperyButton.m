//
//  CLSlipperyButton.m
//
//  Created by Chris Lavender on 12/27/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "CLSlipperyButton.h"

@implementation CLSlipperyButton

@synthesize buttonType;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
	return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touches");
	[self sendActionsForControlEvents: UIControlEventTouchDown];
	self.highlighted=YES;
	[self.nextResponder touchesBegan:touches withEvent:event];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{		
	[self.nextResponder touchesMoved:touches withEvent:event];
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self sendActionsForControlEvents: UIControlEventTouchUpInside];
	self.highlighted=NO;
	[self.nextResponder touchesEnded:touches withEvent:event];
}

@end
