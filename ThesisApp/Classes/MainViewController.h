//
//  MainViewController.h
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "FlipsideViewController.h"

#import "AQPlayer.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIAccelerometerDelegate>
{
	IBOutlet UILabel *modeLabel;
	
	UIStatusBarStyle oldStatusBarStyle;
	UIAccelerometer *accelerometer;
	
	AQPlayer *mAQPlayer;
	
	int modeIndex;
	
}

- (IBAction)startSound:(UIButton *)sender;
- (IBAction)stopSound:(UIButton *)sender;
- (IBAction)changeMode:(int)anInt;
- (IBAction)showInfo:(id)sender;

@end
