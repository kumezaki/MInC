//
//  FlipsideViewController.h
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AQPlayer, MoreInfoViewController, Networking;

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
	
	IBOutlet UILabel		*flipSoundLabel;
	IBOutlet UILabel		*flipModeLabel;

@private
	AQPlayer				*mAQPlayer;
	MoreInfoViewController	*mMoreInfo;
	Networking				*network;
	
	NSString				*mLabelText;
}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property(retain) IBOutlet UILabel	*flipSoundLabel;
@property(retain) IBOutlet UILabel	*flipModeLabel;

- (void)setAQPlayer:(AQPlayer *)aqplayer;
- (IBAction)done:(id)sender;
- (IBAction)openMoreInfo:(id)sender;

- (IBAction)changeMode:(UIButton *)sender;
- (IBAction)changeSound:(UIButton *)sender;

- (IBAction)changeFlipModeLabel;
- (IBAction)changeFlipSoundLabel;

- (IBAction)networkSwitch:(UISwitch *)sender;
- (IBAction)hintButton;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

