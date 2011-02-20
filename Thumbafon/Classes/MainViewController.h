//
//  MainViewController.h
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "FlipsideViewController.h"
#import "AQPlayer.h"

@class ButtonView, MessageView;

@interface MainViewController : UIViewController <UIAlertViewDelegate,FlipsideViewControllerDelegate>  {
	IBOutlet UILabel		*soundLabel;
	IBOutlet UILabel		*modeLabel;
	
	UIStatusBarStyle		StatusBarStyle;
		
	AQPlayer				*mAQPlayer;
	FlipsideViewController	*controller;
	ButtonView				*buttView;
	MessageView				*messView;
	
	NSString				*mLabelText;
	NSString				*mAlertMsg;
}
@property(retain) IBOutlet UILabel	*soundLabel;
@property(retain) IBOutlet UILabel	*modeLabel;
@property(readwrite, retain) NSString *mLabelText;
@property(readwrite, retain) NSString *mAlertMsg;

- (void)changeMode;

- (IBAction)showInfo:(id)sender;
- (IBAction)setModeLabel;
- (IBAction)setSoundLabel;

- (IBAction)setMsgLabel;

- (void)oneButtonAlert;
- (void)twoButtonAlert;

- (void)networkUISwitchShutOff:(BOOL)state;

@end
