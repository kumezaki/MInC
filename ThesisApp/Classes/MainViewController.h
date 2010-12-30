//
//  MainViewController.h
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "AQPlayer.h"
#import "FlipsideViewController.h"
#import "ButtonView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIAccelerometerDelegate> {
	IBOutlet UILabel		*waveFormLabel;
	IBOutlet UILabel		*modeLabel;
	
	UIStatusBarStyle		StatusBarStyle;
	UIAccelerometer			*accelerometer;
		
	AQPlayer				*mAQPlayer;
	FlipsideViewController	*controller;
	ButtonView				*buttonView;
		
	int modeIndex;
	BOOL modeDidChange;
}
@property(retain) IBOutlet UILabel	*waveFormLabel;
@property(retain) IBOutlet UILabel	*modeLabel;

- (IBAction)showInfo:(id)sender;

- (void)changeMode:(int)anInt;

- (IBAction)setModeLabel;
- (IBAction)setWaveFormLabel;

@end
