//
//  FlipsideViewController.h
//  ThesisApp
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AQPlayer.h"

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
		
	AQPlayer *mAQPlayer;

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;

-(void) setAQPlayer:(AQPlayer*) AQPlayer;
- (IBAction)done:(id)sender;
- (IBAction)changeWaveType:(UIButton *)sender;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

