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
		
	AppBrain	*mAppBrain;
	MoreInfoViewController *mMoreInfo;

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

-(void) setAppBrain:(AppBrain*) AppBrain;
-(IBAction) done:(id)sender;
-(IBAction) changeWaveType:(UIButton *)sender;
- (IBAction)openMoreInfo:(id)sender;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

