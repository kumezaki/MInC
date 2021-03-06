//
//  MainViewController.h
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "FlipsideViewController.h"
#import "NetworkMessages.h"
#import "InterstitialMessageView.h"
#import "SagarihaAudioQueuePlayer.h"
#import "ServerControlView.h"
#import "ClientControlView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, NetworkMessagesDelegate, 
SagarihaAudioQueuePlayerDelegate, InterstitialMessageViewDelegate> 

// elements in top layer of MainView
@property (nonatomic, retain) IBOutlet ServerControlView        *serverViewContainer;
@property (nonatomic, retain) IBOutlet ClientControlView        *clientViewContainer;

#if _AlphaInterstitial_
@property (nonatomic, retain) IBOutlet InterstitialMessageView  *interstitialView; 
#endif

@property (nonatomic, retain) IBOutlet UIButton                 *uploadButton;
@property (nonatomic, retain) IBOutlet UIButton                 *downloadButton;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView  *downloadIndicator;

@property (nonatomic, retain) IBOutlet UIProgressView           *downloadProgView;

// model objects
@property (nonatomic, retain) NetworkMessages           *networking;
@property (nonatomic, retain) SagarihaAudioQueuePlayer  *aqPlayer;

@property (nonatomic) float serverRecordProgVal;
@property (nonatomic) int serverPlayMeterVal;
@property (nonatomic) int serverRecordMeterVal;

- (IBAction)showInfo:(id)sender;

- (IBAction)requestHint;
- (IBAction)downloadAudioFile;

- (void)setCue:(int)cue_num;
- (void)updateDownloadProg;
- (void)displayAlertMessage:(NSString*)alertMsg;

@end
