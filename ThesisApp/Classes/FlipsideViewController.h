//
//  FlipsideViewController.h
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppBrain.h"

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
		
	AppBrain	*mAppBrain;

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

-(void) setAppBrain:(AppBrain*) AppBrain;
- (IBAction)done:(id)sender;
- (IBAction)changeWaveType:(UIButton *)sender;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

