//
//  ActionViewController.h
//  propPractice
//
//  Created by Chris Lavender on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ActionViewControllerDelegate;

@interface ActionViewController : UIViewController {
    
    IBOutlet  UIView   *standbyView;
    IBOutlet  UIView   *incomingCallView;
    IBOutlet  UIView   *endCallview;
}

@property (nonatomic, assign) id <ActionViewControllerDelegate> delegate;
@property (nonatomic, retain) NSString  *transportState;

- (IBAction)done:(id)sender;
- (IBAction)answerCall;
- (IBAction)endCall;

@end


@protocol ActionViewControllerDelegate
- (void)actionViewControllerDidFinish:(ActionViewController *)controller;
- (void)userRespondedFromActionView:(ActionViewController *)controller withAction:(NSString*)action;

@end
