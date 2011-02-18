//
//  MainViewController.m
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "MainViewController.h"

#import "ButtonView.h"
#import "AQSound.h"
#import "Networking.h"
#import "MessageView.h"

extern Networking *gNetwork;

@implementation MainViewController

@synthesize soundLabel;
@synthesize modeLabel;
@synthesize mLabelText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.wantsFullScreenLayout = YES;       
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	[buttView becomeFirstResponder];
    StatusBarStyle = [[UIApplication sharedApplication] statusBarStyle];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
	
	if (gNetwork !=nil && gNetwork.mMainView == nil) {
		
		gNetwork.mMainView = self;
		
		CGRect viewRect = CGRectMake(0,0,420,30);
		messView = [[MessageView alloc] initWithFrame:viewRect];
		[messView setHidden:YES];
		[self.view addSubview:messView];		
	}
	
	[self setModeLabel];
	[self setSoundLabel];
}

- (void)viewWillDisappear:(BOOL)animated {
	
	[buttView resignFirstResponder];
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
	
	//Create buttView	
	CGRect viewRect = CGRectMake(0,30,480,290);
	buttView = [[ButtonView alloc] initWithFrame:viewRect];
	[buttView setHidden:NO];
	[self.view addSubview:buttView];
	[buttView setAQPlayer:mAQPlayer];
		
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
	if (messView != nil) [messView release];
	[buttView release];
	[mAQPlayer release];
	[controller release];
    [super dealloc];
}

- (void)changeMode {	
	
	if (((AQSynth*)mAQPlayer).currentMode == 5) {
		((AQSynth*)mAQPlayer).currentMode = 0;
		[(AQSynth*)mAQPlayer setMode];
	}
	else {
		((AQSynth*)mAQPlayer).currentMode = ((AQSynth*)mAQPlayer).currentMode + 1;
		[(AQSynth*)mAQPlayer setMode];
	}
	[self setModeLabel];
}

- (IBAction)setModeLabel {	
	
	if (messView != nil) {
		[messView setHidden:YES];
	}
	
	int j = ((AQSynth*)mAQPlayer).currentMode;
	switch (j) {
		case 0: self.mLabelText = [NSString stringWithFormat:@"Ionian"]; break;
		case 1: self.mLabelText = [NSString stringWithFormat:@"Dorian"]; break;
		case 2: self.mLabelText = [NSString stringWithFormat:@"Phrygian"]; break;
		case 3: self.mLabelText = [NSString stringWithFormat:@"Lydian"]; break;
		case 4: self.mLabelText = [NSString stringWithFormat:@"Mixolydian"]; break;
		case 5: self.mLabelText = [NSString stringWithFormat:@"Aeolean"]; break;
		default: break;
	}
	modeLabel.text = self.mLabelText;//set new labels
}

- (IBAction)setMsgLabel {

	[messView setHidden:NO];
	messView.mMsgLabel.text = self.mLabelText;
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
