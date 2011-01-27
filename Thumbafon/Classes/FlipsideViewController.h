//
//  FlipsideViewController.h
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppBrain.h"
#import "MoreInfoViewController.h"

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
	
	IBOutlet UILabel		*flipWaveFormLabel;
	IBOutlet UILabel		*flipModeLabel;
	
	AppBrain	*mAppBrain;
	MoreInfoViewController *mMoreInfo;
	
	NSString *mLabelText;

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
@property(retain) IBOutlet UILabel	*flipWaveFormLabel;
@property(retain) IBOutlet UILabel	*flipModeLabel;

- (void)setAppBrain:(AppBrain*) AppBrain;
- (IBAction)done:(id)sender;
- (IBAction)changeModeType:(UIButton *)sender;
- (IBAction)changeWaveType:(UIButton *)sender;
- (IBAction)openMoreInfo:(id)sender;

- (IBAction)changeFlipModeLabel;
- (IBAction)changeFlipWaveFormLabel;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

