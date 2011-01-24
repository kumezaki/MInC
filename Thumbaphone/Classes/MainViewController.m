//
//  MainViewController.m
//  Thumbaphone
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

@synthesize waveFormLabel;
@synthesize modeLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.wantsFullScreenLayout = YES;       
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[buttonView becomeFirstResponder];
    StatusBarStyle = [[UIApplication sharedApplication] statusBarStyle];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
	
	[self setModeLabel];
	[self setWaveFormLabel];
}

- (void)viewWillDisappear:(BOOL)animated {
	[buttonView resignFirstResponder];
	[super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    //return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	mAppBrain = [[AppBrain alloc]init];
	
//Turn on the accelerometer, set update interval & assign delegate
	accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.updateInterval = .09;
	accelerometer.delegate = self;
	
//Create 2nd view, alloc/init, assign delegate, call setAQPlayer method
	controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	[controller setAppBrain:mAppBrain];
	
//Create buttonView	
	CGRect viewRect = CGRectMake(0,30,480,290);
	buttonView = [[ButtonViewController alloc] initWithFrame:viewRect];
	[buttonView setHidden:NO];
	[self.view addSubview:buttonView];
	[buttonView setAppBrain:mAppBrain];
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
	accelerometer.delegate = nil;
	self.waveFormLabel=nil;
	self.modeLabel=nil;
	[mAppBrain release];

	[accelerometer release];
	[controller release];
    [super dealloc];
}

- (void)changeMode {	
	if (mAppBrain.mCurrentMode == 5) [mAppBrain setMode:0];
	else [mAppBrain setMode:mAppBrain.mCurrentMode + 1];
	[self setModeLabel];
}

- (IBAction)setModeLabel {	
	modeLabel.text = [NSString stringWithFormat:@"Note Set: %i", mAppBrain.mCurrentMode+1];
}

- (IBAction)setWaveFormLabel {
	waveFormLabel.text = [NSString stringWithFormat:@"Sound: %@",mAppBrain.mWaveType];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	if (motion == UIEventSubtypeMotionShake) {
		[self changeMode];
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
		//NSLog(@"SHAKE SHAKE SHAKE!!!");
	}
}

#define kFilteringFactor 0.75
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	//LowPass Filter
	//double yAxis = acceleration.y * kFilteringFactor + yAxis * (1.0 - kFilteringFactor);
	
	//if (yAxis > -0.12 && yAxis < 0.12) modeDidChange = NO;
	//int k = yAxis < -0.25 ? 1 : yAxis > 0.25 ? -1 : 0;

	//[self changeMode:k];
}

@end
