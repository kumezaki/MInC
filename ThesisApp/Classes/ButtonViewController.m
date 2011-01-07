//
//  ButtonViewController.m
//  ThesisApp
//
//  Created by Chris Lavender on 12/28/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "ButtonViewController.h"


@implementation ButtonViewController

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		self.userInteractionEnabled = YES;
		self.multipleTouchEnabled = YES;
		touchDict = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    return self;
}

- (void) setAppBrain:(AppBrain *)AppBrain {
	mAppBrain = AppBrain;
}

- (void)drawRect:(CGRect)rect {	
// Create slickButton array
	int x = 0;
	int y = 145;
	
	for (int i = 0; i < kNumberNotes; i++) {
		NSString *nIndex = [NSString stringWithFormat:@"%i", i];
		CGRect buttonRect = CGRectMake(x, y, 120, 145);
		slickButton[i] = [[CLSlipperyButton alloc]initWithFrame:buttonRect];
		[slickButton[i] setTitle:nIndex forState:0] ;
		[slickButton[i] setHidden:NO];
		[self addSubview:slickButton[i]];		
		
		x+=120;
		if (i == 3) {
			x = 0;
			y = 0;
		}
		else if (i > 3) y = 0;
		
		switch (i) {
			case 0:
				[slickButton[i] setImage:[UIImage imageNamed:@"red1.png"] forState:UIControlStateNormal];
				[slickButton[i] setImage:[UIImage imageNamed:@"red2.png"] forState:UIControlStateHighlighted];
				break;
			case 1:
				[slickButton[i] setImage:[UIImage imageNamed:@"pink1.png"] forState:UIControlStateNormal];
				[slickButton[i] setImage:[UIImage imageNamed:@"pink2.png"] forState:UIControlStateHighlighted];
				break;
			case 2:
				[slickButton[i] setImage:[UIImage imageNamed:@"purple1.png"] forState:UIControlStateNormal];
				[slickButton[i] setImage:[UIImage imageNamed:@"purple2.png"] forState:UIControlStateHighlighted];
				break;
			case 3:
				[slickButton[i] setImage:[UIImage imageNamed:@"blue1.png"] forState:UIControlStateNormal];
				[slickButton[i] setImage:[UIImage imageNamed:@"blue2.png"] forState:UIControlStateHighlighted];
				break;
			case 4:
				[slickButton[i] setImage:[UIImage imageNamed:@"aqua1.png"] forState:UIControlStateNormal];
				[slickButton[i] setImage:[UIImage imageNamed:@"aqua2.png"] forState:UIControlStateHighlighted];
				break;
			case 5:
				[slickButton[i] setImage:[UIImage imageNamed:@"green1.png"] forState:UIControlStateNormal];
				[slickButton[i] setImage:[UIImage imageNamed:@"green2.png"] forState:UIControlStateHighlighted];
				break;
			case 6:
				[slickButton[i] setImage:[UIImage imageNamed:@"seafoam1.png"] forState:UIControlStateNormal];
				[slickButton[i] setImage:[UIImage imageNamed:@"seafoam2.png"] forState:UIControlStateHighlighted];
				break;
			case 7:
				[slickButton[i] setImage:[UIImage imageNamed:@"yellow1.png"] forState:UIControlStateNormal];
				[slickButton[i] setImage:[UIImage imageNamed:@"yellow2.png"] forState:UIControlStateHighlighted];
				break;
			default:
				break;
		}
		[slickButton[i] release];
	}
}

- (void)dealloc {	
	[touchDict release];
	[super dealloc];
}

#pragma mark -

- (IBAction)startSound:(CLSlipperyButton *)sender {	
	[mAppBrain startNote:[sender.titleLabel.text intValue]];
}

- (IBAction)stopSound:(CLSlipperyButton *)sender {
	[mAppBrain stopNote:[sender.titleLabel.text intValue]];
}

#pragma mark -
#pragma mark UIResponder methodology

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	UITouch *touch = [touches anyObject];
	CGPoint touchPoint = [touch locationInView:self];
	for (int i = 0; i < kNumberNotes; i++) {
		if(CGRectContainsPoint(slickButton[i].frame, touchPoint)) {
			if (!slickButton[i].highlighted) {
				slickButton[i].highlighted = YES;
				[self startSound:slickButton[i]];
				[touchDict setObject:slickButton[i] forKey:[NSValue valueWithPointer:touch]];
				break;
			}
		}
	}
	//NSLog(@"touchDict BEGAN %i",[touchDict count]);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {	
	UITouch *touch = [touches anyObject];
	CLSlipperyButton *movedButton = [touchDict objectForKey:[NSValue valueWithPointer:touch]];
	CGPoint touchPoint = [touch locationInView:self];		
	if (movedButton.highlighted && !CGRectContainsPoint(movedButton.frame, touchPoint)) {
		movedButton.highlighted = NO;
		[self stopSound:movedButton];
	}
	//this is for potential volume swells...
	else if (movedButton.highlighted && CGRectContainsPoint(movedButton.frame, touchPoint)) {
		CGPoint buttonTouch = [touch locationInView:touch.view];
		double yVal = 1/buttonTouch.y;
		yVal = yVal > 0.8 ? 0.8 : yVal < 0.4 ? 0.4 : yVal;
		[mAppBrain ampAdjust:yVal];
		//NSLog(@"buttonTouch.x = %f, buttonTouch.y = %f", buttonTouch.x, buttonTouch.y);
	}
	for (int i = 0; i < kNumberNotes; i++) {
		if(!movedButton.highlighted && CGRectContainsPoint(slickButton[i].frame, touchPoint)) {
			slickButton[i].highlighted = YES;
			[self startSound:slickButton[i]];
			[touchDict setObject:slickButton[i] forKey:[NSValue valueWithPointer:touch]];
			break;
		}
	}
}		

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CLSlipperyButton *endedButton = [touchDict objectForKey:[NSValue valueWithPointer:touch]];
	endedButton.highlighted = NO;
	[self stopSound:endedButton];
	[touchDict removeObjectForKey:[NSValue valueWithPointer:touch]];
	//NSLog(@"touchDict END %i",[touchDict count]);
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

//Shake Gesture gets sent up the chain to MainViewController
-(BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	[self.nextResponder motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event];
}
@end
