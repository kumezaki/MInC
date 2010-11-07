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
	[mAQPlayer stop];
	[mAQPlayer release];
    [super dealloc];
}

//trying to send an arguement to Mode* in order to select a pitch... 
-(IBAction) startSound:(UIButton *)sender 
{
	// KU: this looks good...now also set amplitude

	if ([sender.titleLabel.text isEqual:@"1"]) {
		[mAQPlayer setFreq:262 withNotePos:0]; //C4
   	
	}else if ([sender.titleLabel.text isEqual:@"2"]) {
		[mAQPlayer setFreq:330 withNotePos:1];//E4

	}else if ([sender.titleLabel.text isEqual:@"3"]) {
		[mAQPlayer setFreq:349 withNotePos:2];//F4

	}else if ([sender.titleLabel.text isEqual:@"4"]) {
		[mAQPlayer setFreq:392 withNotePos:3];//G4

	}else if ([sender.titleLabel.text isEqual:@"5"]) {
		[mAQPlayer setFreq:466 withNotePos:4];//Bb4

	}else if ([sender.titleLabel.text isEqual:@"6"]) {
		[mAQPlayer setFreq:523 withNotePos:5];//C5
		
	}else if ([sender.titleLabel.text isEqual:@"7"]) {
		[mAQPlayer setFreq:659 withNotePos:6];//E5

	}else if ([sender.titleLabel.text isEqual:@"8"]) {
		[mAQPlayer setFreq:699 withNotePos:7];//F5
	}
	
	[mAQPlayer start];

}

-(IBAction) stopSound:(UIButton *)sender 
{
	// KU: this should have contents much like startSound above
	// However, it should set amplitude and not frequency
	[mAQPlayer stop];
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
