//
//  ControlViewController.h
//  Prop Phone
//
//  Created by Chris Lavender on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerBrowser.h"
#import "ServerBrowserDelegate.h"

#import "ControlClient.h"
#import "ConnectionLogicDelegate.h"

@class ControlViewController;

@protocol ControlViewControllerDelegate
- (void)killControl:(ControlViewController*)requestor;
@end

@interface ControlViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ServerBrowserDelegate, ConnectionLogicDelegate>
{
    ServerBrowser   *serverBrowser;
    
    IBOutlet UITableView                *serverList;
}

@property   (nonatomic,assign)  id<ControlViewControllerDelegate> delegate;

@property   (nonatomic,retain)  ControlClient           *clientConnection;

#pragma mark - IBOutlets
@property   (nonatomic, retain) IBOutlet UIButton       *loopButton;
@property   (nonatomic,retain)  IBOutlet UIView         *bv;
@property   (nonatomic,retain)  IBOutlet UIButton       *led;
@property   (nonatomic,retain)  IBOutlet UILabel        *status;
@property   (nonatomic,retain)  IBOutlet UIButton       *playButton;


#pragma mark - Browser IBOutlets
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView  *activityIndicator;
@property (nonatomic, retain) IBOutlet UILabel                  *nameLabel;
@property (nonatomic, retain) IBOutlet UILabel                  *statusLabel;

#pragma mark - IBActions
- (IBAction)    done;
- (IBAction)    showBrowser;
- (IBAction)    dismissBrowser;
- (IBAction)    mediaTransport:         (UIButton*)sender;
- (IBAction)    playDefaultSound:       (UIButton*)sender;
- (IBAction)    sendLoopPlaybackToggle;

@end
