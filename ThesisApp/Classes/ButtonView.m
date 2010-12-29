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
        // Initialization code.
    }
    return self;
}

- (void) setAQPlayer:(AQPlayer *)AQPlayer{
	mAQPlayer = AQPlayer;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
	
	//Create slideButton array
	int x = 0;
	int y = 145;
	
	for (int i = 0; i < kNumberNotes; i++) {
		NSString *nIndex = [NSString stringWithFormat:@"%i", i];
		CGRect buttonRect = CGRectMake(x, y, 120, 145);
		slideButton[i] = [[CLSlipperyButton alloc]initWithFrame:buttonRect];
		[slideButton[i] setTitle:nIndex forState:0] ;
		[slideButton[i] setHidden:NO];
		[slideButton[i] addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
		[slideButton[i] addTarget:self action:@selector(startSound:) forControlEvents:UIControlEventTouchDown];
		[slideButton[i] addTarget:self action:@selector(stopSound:) forControlEvents:UIControlEventTouchUpInside];
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
	}
}


- (void)dealloc {
	
	for (int i = 0; i < kNumberNotes; i++) [slideButton[i] release];
    [super dealloc];
}

- (IBAction)buttonPressed: (id)sender
{
	currentButton = sender;
	//slideButton[[currentButton.titleLabel.text intValue]-1]=currentButton;
	
}
-(IBAction) startSound:(id)sender
{	
	[mAQPlayer startNote:[currentButton.titleLabel.text intValue]];
}

-(IBAction) stopSound:(id)sender
{
	[mAQPlayer stopNote:[currentButton.titleLabel.text intValue]];
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{	
	
	CGPoint touchPoint = [[touches anyObject] locationInView:self];
	
	for (int i = 0; i < kNumberNotes ; i++) 
	{
		if (CGRectContainsPoint(slideButton[i].frame, touchPoint))
		{
			[slideButton[i] sendActionsForControlEvents: UIControlEventTouchDown];
			slideButton[i].highlighted=YES;
			break;
		}
	}
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{	

	CGPoint touchPoint = [[touches anyObject] locationInView:self];
	
	if (!CGRectContainsPoint(currentButton.frame, touchPoint)) {
		[self stopSound:currentButton];
		currentButton.highlighted=NO;
		
		for (int i = 0; i < kNumberNotes ; i++) 
		{
			if (CGRectContainsPoint(slideButton[i].frame, touchPoint))
			{
				currentButton = slideButton[i];
				[self startSound:currentButton];
				currentButton.highlighted=YES;
				break;
			}
		}
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{		
	[currentButton sendActionsForControlEvents: UIControlEventTouchUpInside];
	currentButton.highlighted=NO;
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}


@end
