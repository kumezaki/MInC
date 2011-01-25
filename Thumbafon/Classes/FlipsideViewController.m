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
	[mMoreInfo release];
    [super dealloc];
}

- (IBAction)changeWaveType:(UIButton *)sender
{
	NSString *label = sender.titleLabel.text;
	[mAppBrain setWaveType:label];
}

- (IBAction)openMoreInfo:(id)sender {    		
	mMoreInfo.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:mMoreInfo animated:YES];
}


@end