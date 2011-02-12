//
//  MainViewController.m
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "MainViewController.h"

#import "ButtonViewController.h"
#import "AQSound.h"

@implementation MainViewController

@synthesize soundLabel;
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
	[self setSoundLabel];
}

- (void)viewWillDisappear:(BOOL)animated {
	[buttonView resignFirstResponder];
	[controller changeFlipSoundLabel];
	[controller changeFlipModeLabel];
	[super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

	//Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	mAQPlayer = [[AQSound alloc] init];
	
	//Create 2nd view, alloc/init, assign delegate, call setmAQPlayer method
	controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	[controller setAQPlayer:mAQPlayer];
	
	//Create buttonView	
	CGRect viewRect = CGRectMake(0,30,480,290);
	buttonView = [[ButtonViewController alloc] initWithFrame:viewRect];
	[buttonView setHidden:NO];
	[self.view addSubview:buttonView];
	[buttonView setAQPlayer:mAQPlayer];
		
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
	self.soundLabel=nil;
	self.modeLabel=nil;
	[buttonView release];
	[mAQPlayer release];
	[controller release];
    [super dealloc];
}

- (void)changeMode {	
	if (((AQSynth*)mAQPlayer).currentMode == 5) [(AQSynth*)mAQPlayer setMode:0];
	else [(AQSynth*)mAQPlayer setMode:((AQSynth*)mAQPlayer).currentMode + 1];
	[self setModeLabel];
}

- (IBAction)setModeLabel {	
	int j = ((AQSynth*)mAQPlayer).currentMode;
	switch (j) {
		case 0: mLabelText = [NSString stringWithFormat:@"Ionian"]; break;
		case 1: mLabelText = [NSString stringWithFormat:@"Dorian"]; break;
		case 2: mLabelText = [NSString stringWithFormat:@"Phrygian"]; break;
		case 3: mLabelText = [NSString stringWithFormat:@"Lydian"]; break;
		case 4: mLabelText = [NSString stringWithFormat:@"Mixolydian"]; break;
		case 5: mLabelText = [NSString stringWithFormat:@"Aeolean"]; break;
		default: break;
	}
	modeLabel.text = mLabelText;//set new labels
}

- (IBAction)setSoundLabel {
	soundLabel.text = [NSString stringWithFormat:@"%@",((AQSound*)mAQPlayer).soundType];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	if (motion == UIEventSubtypeMotionShake) {
		[self changeMode];
		AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	}
}

@end
