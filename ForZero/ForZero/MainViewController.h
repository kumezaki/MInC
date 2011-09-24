//
//  MainViewController.h
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FlipsideViewController.h"
#import "NetworkMessages.h"
#import "InterstitialMessageView.h"
#import "SagarihaAudioQueuePlayer.h"
#import "ServerControlView.h"
#import "ClientControlView.h"


@interface MainViewController : UIViewController <UIAccelerometerDelegate, FlipsideViewControllerDelegate, NetworkMessagesDelegate, SagarihaAudioQueuePlayerDelegate, InterstitialMessageViewDelegate, ControlViewDelegate> {

}

// elements in top layer of MainView
@property (nonatomic, retain) IBOutlet ServerControlView        *serverViewContainer;
@property (nonatomic, retain) IBOutlet ClientControlView        *clientViewContainer;

@property (nonatomic, retain) IBOutlet UIButton                 *uploadButt;
@property (nonatomic, retain) IBOutlet UIButton                 *downloadButt;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView  *downloadIndicator;

@property (nonatomic, retain) IBOutlet UIProgressView           *downloadProgView;

// model objects
@property (nonatomic, retain) NetworkMessages           *networking;
@property (nonatomic, retain) SagarihaAudioQueuePlayer  *aqPlayer;

@property (nonatomic) float progVal;

- (IBAction)showInfo:(id)sender;

- (IBAction)requestHint;
- (IBAction)downloadAudioFile;

- (void)setCue:(int)cue_num;
- (void)updateDownloadProg;

@end
