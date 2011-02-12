//
//  FlipsideViewController.m
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MoreInfoViewController.h"
#import "Networking.h"
#import "AQSound.h"

@implementation FlipsideViewController

@synthesize delegate;

@synthesize flipSoundLabel;
@synthesize flipModeLabel;

- (void) setAQPlayer:(AQPlayer*)aqplayer{
	mAQPlayer = aqplayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
	
	//Create MoreInfoView, set controller
	mMoreInfo = [[MoreInfoViewController alloc] initWithNibName:@"MoreInfoView" bundle:nil];
}


- (IBAction)done:(id)sender {
	[self.delegate flipsideViewControllerDidFinish:self];	
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}



- (void)dealloc {
	self.flipSoundLabel=nil;
	self.flipModeLabel=nil;
	if (network != nil) [network release];
	[mMoreInfo release];
    [super dealloc];
}

- (IBAction)changeSound:(UIButton *)sender
{
	NSString *label = sender.titleLabel.text;
	[(AQSound*)mAQPlayer setSound:label];
	[self changeFlipSoundLabel];
}

- (IBAction)changeFlipSoundLabel {
	flipSoundLabel.text = [NSString stringWithFormat:@"%@",((AQSound*)mAQPlayer).soundType];
}


- (IBAction)changeMode:(UIButton *)sender {
	if ([sender.titleLabel.text isEqual:@"Dorian"]) [(AQSynth*)mAQPlayer setMode:1];
	else if ([sender.titleLabel.text isEqual:@"Phrygian"]) [(AQSynth*)mAQPlayer setMode:2];
	else if ([sender.titleLabel.text isEqual:@"Lydian"]) [(AQSynth*)mAQPlayer setMode:3];
	else if ([sender.titleLabel.text isEqual:@"Mixolydian"]) [(AQSynth*)mAQPlayer setMode:4];
	else if ([sender.titleLabel.text isEqual:@"Aeolean"]) [(AQSynth*)mAQPlayer setMode:5];
	else [(AQSynth*)mAQPlayer setMode:0];
	
	[self changeFlipModeLabel];
}

- (IBAction)changeFlipModeLabel {

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
	flipModeLabel.text = mLabelText;//set new labels 
}

- (IBAction)openMoreInfo:(id)sender {    		
	mMoreInfo.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:mMoreInfo animated:YES];
}

- (IBAction)networkSwitch:(UISwitch *)sender {

	if (sender.on && network == nil) {
		network = [[Networking alloc] init];
		//mTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkIncomingMessages) userInfo:nil repeats:YES];
	}
	
	else if (!sender.on && network != nil) {
		[mTimer invalidate];
		mTimer = nil;
		[network release];
		network = nil;
	}
}

-(void)checkIncomingMessages
{
	NSLog(@"checkIncomingMessages");
	if (network != nil) {
		if (network.mInterstitialString != nil)
		{
			/* do something with the string */
			
			[network.mInterstitialString release];
			network.mInterstitialString = nil;
		}
	}
}


- (IBAction)hintButton {

	if (network == nil) {
		mAlert = [[UIAlertView alloc] initWithTitle:@"Hint Window" 
										   message:@"During a networked performance, use the HINTS button to see messages from the artist." 
										  delegate:self 
								 cancelButtonTitle:@"Return" 
								 otherButtonTitles: nil];
		[mAlert show];
		[mAlert release];
	}
	else [network requestHint];

}

@end