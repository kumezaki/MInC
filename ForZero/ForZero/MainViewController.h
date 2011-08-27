//
//  MainViewController.h
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FlipsideViewController.h"
#import "SagarihaPanView.h"
#import "NetworkMessages.h"
#import "SagarihaAudioQueuePlayer.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIAccelerometerDelegate, NetworkMessagesDelegate> {
    
    IBOutlet UISegmentedControl         *mStateServerSegControl;
	IBOutlet UISegmentedControl         *mStateClientSegControl;
    IBOutlet UIActivityIndicatorView    *mDownloadIndicator;
    
	IBOutlet UILabel			*mEnvPeriodLabel;
	IBOutlet UISlider			*mEnvPeriodSlider;
	IBOutlet UILabel			*mDelayLevelLabel;
	IBOutlet UISlider			*mDelayLevelSlider;
	IBOutlet UILabel			*mPanLabel;
	IBOutlet UISlider			*mPanSlider;
	IBOutlet UILabel			*mVolumeServerLabel;
	IBOutlet UISlider			*mVolumeServerSlider;
	IBOutlet UILabel			*mVolumeClientLabel;
	IBOutlet UISlider			*mVolumeClientSlider;
    
	IBOutlet UIButton			*mHintButton;
    
	IBOutlet UIProgressView		*mRecProgView;
	IBOutlet UIProgressView		*mDownloadProgView;
    
	IBOutlet SagarihaPanView	*mPanView;
    
@public    
    SagarihaAudioQueuePlayer    *mAudioQueuePlayer;

}
@property(nonatomic,retain) IBOutlet UISegmentedControl        *mStateServerSegControl;
@property(nonatomic,retain) IBOutlet UISegmentedControl        *mStateClientSegControl;

@property(nonatomic,retain) IBOutlet UIProgressView            *mRecProgView;
@property(nonatomic,retain) IBOutlet UIProgressView            *mDownloadProgView;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView   *mDownloadIndicator;

@property(nonatomic,retain) NetworkMessages                     *networking;


- (IBAction)showInfo:(id)sender;

- (IBAction)setStateServer:(id)sender;
- (IBAction)setStateClient:(id)sender;

- (IBAction)setEnvPeriod:(id)sender;
- (IBAction)setDelayLevel:(id)sender;
- (IBAction)setPan:(id)sender;
- (IBAction)setVolumeServer:(id)sender;
- (IBAction)setVolumeClient:(id)sender;

- (IBAction)requestHint;

- (void)setCue:(int)cue_num;
- (void)updateDownloadProg;

@end
