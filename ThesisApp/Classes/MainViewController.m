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
- (void)viewDidLoad {
	mAQPlayer = [AQPlayer new];
	[super viewDidLoad];
}



- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}



- (void)dealloc {
	
	[mAQPlayer release];
    [super dealloc];
}

-(IBAction) startSound:(UIButton *)sender 
{
	if ([sender.titleLabel.text isEqual:@"1"]) {
		mAQPlayer.mFreq = 196;
	}else if ([sender.titleLabel.text isEqual:@"2"]) {
		mAQPlayer.mFreq = 220;

	}else if ([sender.titleLabel.text isEqual:@"3"]) {
		mAQPlayer.mFreq = 233;

	}else if ([sender.titleLabel.text isEqual:@"4"]) {
		mAQPlayer.mFreq = 262;

	}else if ([sender.titleLabel.text isEqual:@"5"]) {
		mAQPlayer.mFreq = 294;

	}else if ([sender.titleLabel.text isEqual:@"6"]) {
		mAQPlayer.mFreq = 349;

	}else if ([sender.titleLabel.text isEqual:@"7"]) {
		mAQPlayer.mFreq = 392;

	}else if ([sender.titleLabel.text isEqual:@"8"]) {
		mAQPlayer.mFreq = 440;

	}
	[mAQPlayer Start];
}

-(IBAction) stopSound:(UIButton *)sender 
{
	[mAQPlayer Stop];
}

//-(IBAction) doAmp:(id)sender
//{
//	[mAQPlayer setMAmp:mAmpSlider.value];
//}
//
//-(IBAction) doFreq:(id)sender
//{
//	[mAQPlayer setMFreq:mFreqSlider.value*1000];
//	
//}


@end
