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
	IBOutlet UILabel *waveFormLabel;
	IBOutlet UILabel *modeLabel;
	IBOutlet UILabel *accelDataX;
	IBOutlet UILabel *accelDataY;
	IBOutlet UILabel *accelDataZ;
	
	UIStatusBarStyle oldStatusBarStyle;
	UIAccelerometer *accelerometer;
	
	AQPlayer *mAQPlayer;
	FlipsideViewController *controller;
	
	int modeIndex;
	BOOL modeDidChange;
}

- (void) setWaveFormLabel;
- (void) setModeLabel;


- (IBAction)showInfo:(id)sender;
- (IBAction)changeMode:(int)anInt;

- (IBAction)startSound:(UIButton *)sender;
- (IBAction)stopSound:(UIButton *)sender;

@end
