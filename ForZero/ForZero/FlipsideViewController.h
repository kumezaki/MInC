//
//  FlipsideViewController.h
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "NetworkMessages.h"

@protocol FlipsideViewControllerDelegate;

@interface FlipsideViewController : UIViewController <UITextFieldDelegate>{

}
@property (nonatomic, assign) id <FlipsideViewControllerDelegate>   delegate;
@property (nonatomic, assign) NetworkMessages   *networking;

@property (nonatomic, retain) IBOutlet UIView       *serverView;
@property (nonatomic, retain) IBOutlet UIView       *clientView;
@property (nonatomic, retain) IBOutlet UITextField  *ipAddressTextField;
@property (nonatomic, retain) IBOutlet UILabel      *ipLabel;
@property (nonatomic, retain) IBOutlet UITextField  *portNumTextField;
@property (nonatomic, retain) IBOutlet UILabel      *portLabel;
@property (nonatomic, retain) IBOutlet UILabel      *devIPLabel;



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
