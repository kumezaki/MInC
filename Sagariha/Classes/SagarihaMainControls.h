//
//  SagarihaMainControls.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SagarihaPanView.h"

@interface SagarihaMainControls : NSObject <UIAccelerometerDelegate> {

	IBOutlet UISegmentedControl	*mStateServerSegControl;
	IBOutlet UISegmentedControl	*mStateClientSegControl;

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
}

@property(nonatomic, retain) IBOutlet UISegmentedControl	*mStateServerSegControl;
@property(nonatomic, retain) IBOutlet UISegmentedControl	*mStateClientSegControl;

@property(nonatomic, retain) IBOutlet UIProgressView		*mRecProgView;
@property(nonatomic, retain) IBOutlet UIProgressView		*mDownloadProgView;

-(IBAction)SetStateServer:(id)sender;
-(IBAction)SetStateClient:(id)sender;

-(IBAction)SetEnvPeriod:(id)sender;
-(IBAction)SetDelayLevel:(id)sender;
-(IBAction)SetPan:(id)sender;
-(IBAction)SetVolumeServer:(id)sender;
-(IBAction)SetVolumeClient:(id)sender;

-(IBAction)RequestHint;

-(void) SetCue:(int)cue_num;

-(void)updateDownloadProg;
-(void)downloadEnd;

@end
