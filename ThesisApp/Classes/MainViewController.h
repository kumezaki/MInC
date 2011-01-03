//
//  MainViewController.h
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "AppBrain.h"
#import "AppBrain.h"
#import "FlipsideViewController.h"
#import "ButtonView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIAccelerometerDelegate> {
	IBOutlet UILabel		*waveFormLabel;
	IBOutlet UILabel		*modeLabel;
	
	UIStatusBarStyle		StatusBarStyle;
	UIAccelerometer			*accelerometer;
		
	AppBrain				*mAppBrain;
	FlipsideViewController	*controller;
	ButtonView				*buttonView;
		
	int modeIndex;
	BOOL modeDidChange;
}
@property(retain) IBOutlet UILabel	*waveFormLabel;
@property(retain) IBOutlet UILabel	*modeLabel;

- (void)changeMode:(int)anInt;

- (IBAction)showInfo:(id)sender;
- (IBAction)setModeLabel;
- (IBAction)setWaveFormLabel;

@end
