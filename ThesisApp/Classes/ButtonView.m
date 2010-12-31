//
//  ButtonView.m
//  ThesisApp
//
//  Created by Chris Lavender on 12/28/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "ButtonView.h"


@implementation ButtonView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		self.userInteractionEnabled = YES;
		self.multipleTouchEnabled = YES;
		touchDic = (NSMutableDictionary*)CFDictionaryCreateMutable(NULL, 4,
																   &kCFTypeDictionaryKeyCallBacks,
																   &kCFTypeDictionaryValueCallBacks);
    }
    return self;
}

- (void) setAQPlayer:(AQPlayer *)AQPlayer {
	mAQPlayer = AQPlayer;
}

- (void)drawRect:(CGRect)rect {	
// Create slideButton array
	int x = 0;
	int y = 145;
	
	for (int i = 0; i < kNumberNotes; i++) {
		NSString *nIndex = [NSString stringWithFormat:@"%i", i];
		CGRect buttonRect = CGRectMake(x, y, 120, 145);
		slideButton[i] = [[CLSlipperyButton alloc]initWithFrame:buttonRect];
		[slideButton[i] setTitle:nIndex forState:0] ;
		[slideButton[i] setHidden:NO];
		[self addSubview:slideButton[i]];		
		
		x+=120;
		if (i == 3) {
			x = 0;
			y = 0;
		}
		else if (i > 3) y = 0;
		
		switch (i) {
			case 0:
				[slideButton[i] setImage:[UIImage imageNamed:@"red1.png"] forState:UIControlStateNormal];
				[slideButton[i] setImage:[UIImage imageNamed:@"red2.png"] forState:UIControlStateHighlighted];
				break;
			case 1:
				[slideButton[i] setImage:[UIImage imageNamed:@"pink1.png"] forState:UIControlStateNormal];
				[slideButton[i] setImage:[UIImage imageNamed:@"pink2.png"] forState:UIControlStateHighlighted];
				break;
			case 2:
				[slideButton[i] setImage:[UIImage imageNamed:@"purple1.png"] forState:UIControlStateNormal];
				[slideButton[i] setImage:[UIImage imageNamed:@"purple2.png"] forState:UIControlStateHighlighted];
				break;
			case 3:
				[slideButton[i] setImage:[UIImage imageNamed:@"blue1.png"] forState:UIControlStateNormal];
				[slideButton[i] setImage:[UIImage imageNamed:@"blue2.png"] forState:UIControlStateHighlighted];
				break;
			case 4:
				[slideButton[i] setImage:[UIImage imageNamed:@"aqua1.png"] forState:UIControlStateNormal];
				[slideButton[i] setImage:[UIImage imageNamed:@"aqua2.png"] forState:UIControlStateHighlighted];
				break;
			case 5:
				[slideButton[i] setImage:[UIImage imageNamed:@"green1.png"] forState:UIControlStateNormal];
				[slideButton[i] setImage:[UIImage imageNamed:@"green2.png"] forState:UIControlStateHighlighted];
				break;
			case 6:
				[slideButton[i] setImage:[UIImage imageNamed:@"seafoam1.png"] forState:UIControlStateNormal];
				[slideButton[i] setImage:[UIImage imageNamed:@"seafoam2.png"] forState:UIControlStateHighlighted];
				break;
			case 7:
				[slideButton[i] setImage:[UIImage imageNamed:@"yellow1.png"] forState:UIControlStateNormal];
				[slideButton[i] setImage:[UIImage imageNamed:@"yellow2.png"] forState:UIControlStateHighlighted];
				break;
			default:
				break;
		}
		[slideButton[i] release];
	}
}

- (void)dealloc {	
	[touchDic release];
	[super dealloc];
}

#pragma mark -

- (IBAction)startSound:(CLSlipperyButton *)sender {	
	[mAQPlayer startNote:[sender.titleLabel.text intValue]];
}

- (IBAction)stopSound:(CLSlipperyButton *)sender {
	[mAQPlayer stopNote:[sender.titleLabel.text intValue]];
}

- (void)cancelTouches {
	for (int i = 0; i < kNumberNotes; i++) {
		slideButton[i].highlighted = NO;
		[self stopSound:slideButton[i]];
	}
	NSArray *cancelledTouches = [touchDic allKeys];
	[touchDic removeObjectsForKeys:cancelledTouches];
	if ([touchDic count] == 0) maxTouches = NO;
}

#pragma mark -
#pragma mark UIGestureRecognizer methodology

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	if (!maxTouches) {
		for (UITouch * touch in touches) {
			CGPoint touchPoint = [touch locationInView:self];
			for (int i = 0; i < kNumberNotes; i++) {
				if(CGRectContainsPoint(slideButton[i].frame, touchPoint)) {
					if (!slideButton[i].highlighted) {
						slideButton[i].highlighted = YES;
						[self startSound:slideButton[i]];
						[touchDic setObject:slideButton[i] forKey:[NSValue valueWithPointer:touch]];
						if ([touchDic count] > 4) {
							maxTouches = YES; 
							[self cancelTouches];
						}
						break;
					}
				}
			}
		}
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {	
	if (!maxTouches) {
		for (UITouch * touch in touches) {
			CLSlipperyButton *movedButton = [touchDic objectForKey:[NSValue valueWithPointer:touch]];
			CGPoint touchPoint = [touch locationInView:self];		
			if (!CGRectContainsPoint(movedButton.frame, touchPoint)) {
				movedButton.highlighted = NO;
				[self stopSound:movedButton];
			}	
			for (int i = 0; i < kNumberNotes; i++) {
				if(CGRectContainsPoint(slideButton[i].frame, touchPoint)) {
					slideButton[i].highlighted = YES;
					[self startSound:slideButton[i]];
					[touchDic setObject:slideButton[i] forKey:[NSValue valueWithPointer:touch]];
					if ([touchDic count] > 4) {
						maxTouches = YES; 
						[self cancelTouches];
					}
					break;
				}
			}
		}
	}
}		

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch * touch in touches) {
		CLSlipperyButton *endedButton = [touchDic objectForKey:[NSValue valueWithPointer:touch]];
		endedButton.highlighted = NO;
		[self stopSound:endedButton];
		[touchDic removeObjectForKey:[NSValue valueWithPointer:touch]];
	}
	if ([touchDic count] == 0) maxTouches = NO;
}

@end
