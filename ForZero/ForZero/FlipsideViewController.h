//
//  FlipsideViewController.h
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkMessages.h"

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController <UITextFieldDelegate>{

    IBOutlet UITextField		*mIPAddressTextField;
	IBOutlet UITextField		*mPortNumTextField;
    
    IBOutlet UIButton			*mStartButton;
	IBOutlet UIButton			*mSubtractButton;
	IBOutlet UIButton			*mStopButton;
	IBOutlet UIButton			*mPanicButton;

}

@property (nonatomic, assign) id <FlipsideViewControllerDelegate>   delegate;

@property (nonatomic, assign) NetworkMessages                    *networking;

- (IBAction)done:(id)sender;

-(IBAction)IPAddressChanged:(id)sender;
-(IBAction)PortNumChanged:(id)sender;

-(IBAction)ForZero_Start:(id)sender;
-(IBAction)ForZero_Subtract:(id)sender;
-(IBAction)ForZero_Stop:(id)sender;
-(IBAction)ForZero_Panic:(id)sender;


@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end
