//
//  MainViewController.h
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "FlipsideViewController.h"
#import "AQPlayer.h"
#import "CLSlipperyButton.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIAccelerometerDelegate>
{
	IBOutlet UILabel *waveFormLabel;
	IBOutlet UILabel *modeLabel;

	UIStatusBarStyle oldStatusBarStyle;
	UIAccelerometer *accelerometer;
	
	CLSlipperyButton *currentButton;
	CLSlipperyButton *slideButton[kNumberNotes];
	
	AQPlayer *mAQPlayer;
	FlipsideViewController *controller;
		
	int modeIndex;
	BOOL modeDidChange;
}
@property(retain) IBOutlet UILabel *waveFormLabel;
@property(retain) IBOutlet UILabel *modeLabel;
@property(retain) IBOutlet AQPlayer *mAQPlayer;




- (IBAction)showInfo:(id)sender;

- (void)changeMode:(int)anInt;
- (IBAction)buttonPressed: (CLSlipperyButton *)sender;
- (IBAction)setModeLabel;
- (IBAction)setWaveFormLabel;
- (IBAction)startSound:(UIButton *)sender;
- (IBAction)stopSound:(UIButton *)sender;

@end
