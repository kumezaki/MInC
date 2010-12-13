//
//  MainViewController.m
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

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
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	mAQPlayer = [AQPlayer new];
	[mAQPlayer start];
	[mAQPlayer setMode:0];
	accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.updateInterval = .5;
	accelerometer.delegate = self;
	[super viewDidLoad];
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender
{    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)dealloc
{
	accelerometer.delegate = nil;
	[accelerometer release];
	[mAQPlayer stop];
	[mAQPlayer release];
    [super dealloc];
}


- (IBAction)changeMode:(int)anInt
{
	if (modeIndex == 0 && anInt == -1) modeIndex = 5;
	else if (modeIndex == 5 && anInt == 1) modeIndex = 0;
	else modeIndex += anInt;
	
	[mAQPlayer setMode:modeIndex];
	
	switch (modeIndex){
		case 0:	modeLabel.text = @"Mode 1"; break;
		case 1: modeLabel.text = @"Mode 2"; break;
		case 2: modeLabel.text = @"Mode 3"; break;
		case 3: modeLabel.text = @"Mode 4"; break;
		case 4: modeLabel.text = @"Mode 5"; break;
		case 5: modeLabel.text = @"Mode 6"; break;
		default: break;
	}
}


-(IBAction) startSound:(UIButton *)sender
{			
	[mAQPlayer startNote:([sender.titleLabel.text intValue]-1)];
}

-(IBAction) stopSound:(UIButton *)sender
{		
	[mAQPlayer stopNote:([sender.titleLabel.text intValue]-1)];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
#define LIMIT_ACC_VAL(n)	n < -1. ? -1. : n > 1. ? 1. : n

	double y = acceleration.y;
	
	int k = y < -0.25 ? 1 : y > 0.25 ? -1 : 0;

	[self changeMode:k];
}

@end
