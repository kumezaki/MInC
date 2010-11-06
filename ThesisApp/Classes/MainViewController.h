//
//  MainViewController.h
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "FlipsideViewController.h"

#import "AQPlayer.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>
{

	UIStatusBarStyle oldStatusBarStyle;
	
	AQPlayer *mAQPlayer;
	
	IBOutlet UISlider *mAmpSlider;
	IBOutlet UISlider *mFreqSlider;
	
}

- (IBAction) startSound:(UIButton *)sender;
- (IBAction) stopSound:(UIButton *)sender;

//- (IBAction)doAmp:(id)sender;
//- (IBAction)doFreq:(id)sender;

- (IBAction)showInfo:(id)sender;


@end
