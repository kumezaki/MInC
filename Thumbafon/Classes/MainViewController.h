//
//  MainViewController.h
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "FlipsideViewController.h"
#import "AQPlayer.h"

@class ButtonViewController;

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	IBOutlet UILabel		*soundLabel;
	IBOutlet UILabel		*modeLabel;
	
	UIStatusBarStyle		StatusBarStyle;
		
	AQPlayer				*mAQPlayer;
	FlipsideViewController	*controller;
	ButtonViewController	*buttonView;
	
	NSString				*mLabelText;
	UILabel					*mMsgLabel;
}
@property(retain) IBOutlet UILabel	*soundLabel;
@property(retain) IBOutlet UILabel	*modeLabel;
@property(readwrite, retain) NSString *mLabelText;

- (void)changeMode;

- (IBAction)showInfo:(id)sender;
- (IBAction)setModeLabel;
- (IBAction)setSoundLabel;
- (IBAction)setMsgLabel;

@end
