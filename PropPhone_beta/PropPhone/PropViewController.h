//
//  PropViewController.h
//  Prop Phone
//
//  Created by Chris Lavender on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ActionViewController.h"
#import "GDMediaPlayer.h"
#import "PropServer.h"
#import "ConnectionLogicDelegate.h"

@class PropViewController;

@protocol PropViewControllerDelegate
- (void)killProp:(PropViewController*)requestor;
@end

@interface PropViewController : UIViewController <MPMediaPickerControllerDelegate, ActionViewControllerDelegate, ConnectionLogicDelegate, GDMediaPlayerDelegate,UIPickerViewDelegate>
{    
    GDMediaPlayer           *mMediaPlayer;
    PropServer              *mServer;
    NSString                *mTransportState;
    
    UIView                  *timerSetView;
}
@property(nonatomic, assign) id <PropViewControllerDelegate> delegate;

@property(nonatomic, retain) IBOutlet UIView *timerSetView;

@property(nonatomic, retain) IBOutlet UIButton          *playButton;
@property(nonatomic, retain) IBOutlet UIButton          *pauseButton;
@property(nonatomic, retain) IBOutlet UIButton          *stopButton;
@property(nonatomic, retain) IBOutlet UIButton          *loopButton;
@property(nonatomic, retain) IBOutlet UIButton          *timerButton;
@property(nonatomic, retain) IBOutlet UIButton          *phoneButton;
@property(nonatomic, retain) IBOutlet UIButton          *ipodButton;
@property(nonatomic, retain) IBOutlet UIBarButtonItem   *timerSaveButton;
@property(nonatomic, retain) IBOutlet UIBarButtonItem   *timerCancelButton;
@property(nonatomic, retain) IBOutlet UIButton          *led;
@property(nonatomic, retain) IBOutlet UILabel           *status;
@property(nonatomic, retain) IBOutlet UILabel           *countdownLable;
@property(nonatomic, retain) IBOutlet UIPickerView      *timerScrollView;


- (IBAction)    done;
- (IBAction)    mediaTransport:     (id)sender;
- (IBAction)    propViewPlayButton: (UIButton*)sender;
- (IBAction)    showMediaPicker:    (UIButton*)sender;
- (IBAction)    setCountdownState:  (UIBarButtonItem*)sender;
- (IBAction)    loopPlaybackToggle;
- (IBAction)    selectDefaultSound;
- (IBAction)    showTimerSetView;
- (IBAction)    dismissTimerSetView;

@end
