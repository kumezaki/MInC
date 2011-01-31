//
//  FlipsideViewController.m
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;

@synthesize flipWaveFormLabel;
@synthesize flipModeLabel;

- (void) setAppBrain:(AppBrain *)AppBrain{
	mAppBrain = AppBrain;
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
	self.flipWaveFormLabel=nil;
	self.flipModeLabel=nil;
	[mMoreInfo release];
    [super dealloc];
}

- (IBAction)changeWaveType:(UIButton *)sender
{
	NSString *label = sender.titleLabel.text;
	[mAppBrain setWaveType:label];
	[mAppBrain setEnvelopeType];
	[self changeFlipWaveFormLabel];
}

- (IBAction)changeModeType:(UIButton *)sender {
	if ([sender.titleLabel.text isEqual:@"Dorian"]) [mAppBrain setMode:1];
	else if ([sender.titleLabel.text isEqual:@"Phrygian"]) [mAppBrain setMode:2];
	else if ([sender.titleLabel.text isEqual:@"Lydian"]) [mAppBrain setMode:3];
	else if ([sender.titleLabel.text isEqual:@"Mixolydian"]) [mAppBrain setMode:4];
	else if ([sender.titleLabel.text isEqual:@"Aeolean"]) [mAppBrain setMode:5];
	else [mAppBrain setMode:0];
	
	[self changeFlipModeLabel];
}

- (IBAction)openMoreInfo:(id)sender {    		
	mMoreInfo.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:mMoreInfo animated:YES];
}

- (IBAction)changeFlipModeLabel {

	int j = mAppBrain.mCurrentMode;
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

- (IBAction)changeFlipWaveFormLabel {
	flipWaveFormLabel.text = [NSString stringWithFormat:@"%@",mAppBrain.mWaveType];
}


@end