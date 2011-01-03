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
		touchDic = [[NSMutableDictionary alloc] initWithCapacity:5];
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
	[touchDic release];
	[super dealloc];
}

#pragma mark -

- (IBAction)startSound:(CLSlipperyButton *)sender {	
	[mAppBrain startNote:[sender.titleLabel.text intValue]];
}

- (IBAction)stopSound:(CLSlipperyButton *)sender {
	[mAppBrain stopNote:[sender.titleLabel.text intValue]];
}

- (void)cancelTouches {
}

#pragma mark -
#pragma mark UIGestureRecognizer methodology

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	UITouch *touch = [touches anyObject];
	CGPoint touchPoint = [touch locationInView:self];
	for (int i = 0; i < kNumberNotes; i++) {
		if(CGRectContainsPoint(slickButton[i].frame, touchPoint)) {
			if (!slickButton[i].highlighted) {
				slickButton[i].highlighted = YES;
				[self startSound:slickButton[i]];
				[touchDic setObject:slickButton[i] forKey:[NSValue valueWithPointer:touch]];
				break;
			}
		}
	}
	//NSLog(@"touchDic BEGAN %i",[touchDic count]);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {	
	UITouch *touch = [touches anyObject];
	CLSlipperyButton *movedButton = [touchDic objectForKey:[NSValue valueWithPointer:touch]];
	CGPoint touchPoint = [touch locationInView:self];		
	if (movedButton.highlighted && !CGRectContainsPoint(movedButton.frame, touchPoint)) {
		movedButton.highlighted = NO;
		[self stopSound:movedButton];
	}
	for (int i = 0; i < kNumberNotes; i++) {
		if(!movedButton.highlighted && CGRectContainsPoint(slickButton[i].frame, touchPoint)) {
			slickButton[i].highlighted = YES;
			[self startSound:slickButton[i]];
			[touchDic setObject:slickButton[i] forKey:[NSValue valueWithPointer:touch]];
			break;
		}
	}
}		

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CLSlipperyButton *endedButton = [touchDic objectForKey:[NSValue valueWithPointer:touch]];
	endedButton.highlighted = NO;
	[self stopSound:endedButton];
	[touchDic removeObjectForKey:[NSValue valueWithPointer:touch]];
	//NSLog(@"touchDic END %i",[touchDic count]);
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}


@end
