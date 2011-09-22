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

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIAccelerometerDelegate, NetworkMessagesDelegate, SagarihaAudioQueuePlayerDelegate, InterstitialMessageViewDelegate, ServerControlViewDelegate> {
    
	IBOutlet UIButton			*mHintButton;    

}
// elements in top layer of MainView
@property (nonatomic, retain) IBOutlet ServerControlView        *serverView;
@property (nonatomic, retain) IBOutlet UIView                   *clientView;
@property (nonatomic, retain) IBOutlet UIButton                 *uploadButt;
@property (nonatomic, retain) IBOutlet UIButton                 *downloadButt;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView  *downloadIndicator;

// elements in sub layers of MainView
@property (nonatomic, retain) IBOutlet UIButton *serverRecButt;
@property (nonatomic, retain) IBOutlet UIButton *serverStopButt;
@property (nonatomic, retain) IBOutlet UIButton *serverPlayButt;

@property (nonatomic, retain) IBOutlet UIButton *clientRecButt;
@property (nonatomic, retain) IBOutlet UIButton *clientStopButt;
@property (nonatomic, retain) IBOutlet UIButton *clientPlayButt;

@property (nonatomic, retain) IBOutlet UIProgressView   *recProgView;
@property (nonatomic, retain) IBOutlet UIProgressView   *downloadProgView;

// model objects
@property (nonatomic, retain) NetworkMessages           *networking;
@property (nonatomic, retain) SagarihaAudioQueuePlayer  *aqPlayer;

@property (nonatomic) float progVal;


- (IBAction)showInfo:(id)sender;

- (IBAction)setStateServer: (id)sender;
- (IBAction)setStateClient: (id)sender;

- (IBAction)setEnvPeriod:   (id)sender;
- (IBAction)setDelayLevel:  (id)sender;
- (IBAction)setPan:         (id)sender;
- (IBAction)setVolumeServer:(id)sender;
- (IBAction)setVolumeClient:(id)sender;

- (IBAction)requestHint;
- (IBAction)downloadAudioFile;

- (void)setCue:(int)cue_num;
- (void)updateDownloadProg;

@end
