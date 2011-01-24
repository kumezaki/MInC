//
//  MainViewController.h
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "AppBrain.h"
#import "FlipsideViewController.h"
#import "ButtonViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIAccelerometerDelegate> {
	IBOutlet UILabel		*waveFormLabel;
	IBOutlet UILabel		*modeLabel;
	
	UIStatusBarStyle		StatusBarStyle;
	UIAccelerometer			*accelerometer;
		
	AppBrain				*mAppBrain;
	FlipsideViewController	*controller;
	ButtonViewController	*buttonView;
		
}
@property(retain) IBOutlet UILabel	*waveFormLabel;
@property(retain) IBOutlet UILabel	*modeLabel;

- (void)changeMode;

- (IBAction)showInfo:(id)sender;
- (IBAction)setModeLabel;
- (IBAction)setWaveFormLabel;

@end
