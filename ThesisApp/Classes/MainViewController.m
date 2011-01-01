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

// the designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.wantsFullScreenLayout = YES; // we want to overlap the status bar.        
        // when presented, we want to display using a cross dissolve
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    StatusBarStyle = [[UIApplication sharedApplication] statusBarStyle];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
	
	[self setModeLabel];
	[self setWaveFormLabel];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];    
}

// override to allow orientations other than the default portrait orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
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
	
//Create ButtonView	
	CGRect viewRect = CGRectMake(0,30,480,290);
	buttonView = [[ButtonView alloc] initWithFrame:viewRect];
	[buttonView setHidden:NO];
	[self.view addSubview:buttonView];
	[buttonView setAQPlayer:mAQPlayer];
	[buttonView release];	

	[super viewDidLoad];
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {	
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender {    		
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
}

- (void)dealloc {
	[mAQPlayer stop];
	accelerometer.delegate = nil;
	self.waveFormLabel=nil;
	self.modeLabel=nil;
	[mAQPlayer release];
	[accelerometer release];
	[controller release];
    [super dealloc];
}

- (void)changeMode:(int)anInt {	
	if (anInt != 0 && !modeDidChange) {
		
		if (modeIndex == 0 && anInt == -1) modeIndex = 5;
		else if (modeIndex == 5 && anInt == 1) modeIndex = 0;
		else modeIndex += anInt;
		
		[mAQPlayer setMode:modeIndex];
		[self setModeLabel];
		modeDidChange = YES;
	}
}

- (IBAction)setModeLabel {	
	modeLabel.text = [NSString stringWithFormat:@"Note Set: %i", mAQPlayer.mCurrentMode+1];
}

- (IBAction)setWaveFormLabel {
	waveFormLabel.text = [NSString stringWithFormat:@"Sound: %@",mAQPlayer.mWaveType];
}

#define kFilteringFactor 0.75
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	//LowPass Filter
	double yAxis = acceleration.y * kFilteringFactor + yAxis * (1.0 - kFilteringFactor);
	
	if (yAxis > -0.18 && yAxis < 0.18) modeDidChange = NO;
	int k = yAxis < -0.25 ? 1 : yAxis > 0.25 ? -1 : 0;

	[self changeMode:k];
}

@end
