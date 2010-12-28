//
//  MainViewController.m
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

@synthesize waveFormLabel;
@synthesize modeLabel;
@synthesize mAQPlayer;

// the designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        self.wantsFullScreenLayout = YES; // we want to overlap the status bar.
        
        // when presented, we want to display using a cross dissolve
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    oldStatusBarStyle = [[UIApplication sharedApplication] statusBarStyle];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];    
}

// override to allow orientations other than the default portrait orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
//Create AQPlayer, alloc/init, and start it
	mAQPlayer = [[AQPlayer alloc]init];
	[mAQPlayer start];
	
//Turn on the accelerometer, set update interval & assign delegate
	accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.updateInterval = .09;
	accelerometer.delegate = self;
	
//Create 2nd view controller, alloc/init, assign delegate, call setAQPlayer method
	controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	[controller setAQPlayer:mAQPlayer];
	
//Create slideButton array
	int x = 0;
	int y = 175;
	
	for (int i = 0; i < kNumberNotes; i++) {
		NSString *nIndex = [NSString stringWithFormat:@"%i", i];
		CGRect buttonRect = CGRectMake(x, y, 120, 145);
		slideButton[i] = [[CLSlipperyButton alloc]initWithFrame:buttonRect];
		[slideButton[i] setTitle:nIndex forState:0] ;
		[slideButton[i] setHidden:NO];
		[slideButton[i] addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventAllEvents];
		[self.view addSubview:slideButton[i]];
		x+=120;
		
		NSLog(@"buttonArray[%i] #%i", i, [slideButton[i].titleLabel.text intValue]);
		
		if (i == 3) {
			x = 0;
			y = 30;
		}
		else if (i > 3) y = 30;
		
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
		
//Call labeling methods
	[self setModeLabel];
	[self setWaveFormLabel];
	
	[super viewDidLoad];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{	
	[self setWaveFormLabel];
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    		
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];

}

- (void)dealloc
{
	accelerometer.delegate = nil;
	[accelerometer release];
	[mAQPlayer stop];
	[mAQPlayer release];
	[controller release];
	for (int i = 0; i < kNumberNotes; i++) [slideButton[i] release];
	self.waveFormLabel=nil;
	self.modeLabel=nil;
    [super dealloc];
}

- (IBAction)buttonPressed: (id)sender
{
	currentButton = sender;
	//slideButton[[currentButton.titleLabel.text intValue]-1]=currentButton;

}

- (void)changeMode:(int)anInt
{	
	if (anInt != 0 && !modeDidChange) {
		
		if (modeIndex == 0 && anInt == -1) modeIndex = 5;
		else if (modeIndex == 5 && anInt == 1) modeIndex = 0;
		else modeIndex += anInt;
		
		[mAQPlayer setMode:modeIndex];
		[self setModeLabel];
		modeDidChange = YES;
	}
}

-(IBAction)setModeLabel
{	
	modeLabel.text = [NSString stringWithFormat:@"Note Set: %i", mAQPlayer.mCurrentMode+1];
}

-(IBAction) setWaveFormLabel
{
	waveFormLabel.text = [NSString stringWithFormat:@"Sound: %@",mAQPlayer.mWaveType];
}

-(IBAction) startSound:(id)sender
{	
	[mAQPlayer startNote:[currentButton.titleLabel.text intValue]];
}

-(IBAction) stopSound:(id)sender
{
	[mAQPlayer stopNote:[currentButton.titleLabel.text intValue]];
}


- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	double yAxis = acceleration.y;
	if (yAxis > -0.15 && yAxis < 0.15) modeDidChange = NO;
	int k = yAxis < -0.3 ? 1 : yAxis > 0.3 ? -1 : 0;
	//if (k == 0) modeDidChange = NO;		

	[self changeMode:k];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{			
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{	
	CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
	
	if (!CGRectContainsPoint(currentButton.frame, touchPoint)) {
		NSLog(@"currentbutton %@", currentButton.titleLabel.text);
		[currentButton touchesEnded:touches withEvent:event];
		
		for (int i = 0; i < kNumberNotes ; i++) 
		{
			NSLog(@"buttonArray[%i] #%@", i, slideButton[i].titleLabel.text);

			if (CGRectContainsPoint(slideButton[i].frame, touchPoint))
			{
			currentButton = slideButton[i];
			[currentButton touchesBegan:touches withEvent:event];
			break;
			}
		}
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{		
}


@end
