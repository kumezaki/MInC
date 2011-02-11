//
//  MainViewController.h
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "FlipsideViewController.h"

@class AQPlayer, ButtonViewController;

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	IBOutlet UILabel		*soundLabel;
	IBOutlet UILabel		*modeLabel;
	
	UIStatusBarStyle		StatusBarStyle;
		
	AQPlayer				*mAQPlayer;
	FlipsideViewController	*controller;
	ButtonViewController	*buttonView;
	
	NSString *mLabelText;
		
}
@property(retain) IBOutlet UILabel	*soundLabel;
@property(retain) IBOutlet UILabel	*modeLabel;

- (void)changeMode;

- (IBAction)showInfo:(id)sender;
- (IBAction)setModeLabel;
- (IBAction)setSoundLabel;

-(void)checkIncomingMessages;

@end
