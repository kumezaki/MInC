//
//  SagarihaMainControls.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SagarihaMainControls.h"

#import "SagarihaAppDelegate.h"
#import "SagarihaNetworking.h"
#import "SagarihaSingleton.h"

extern SagarihaSingleton* singleton;

#define FLOAT_TO_MRMR_INT(v) (int)(v * 1000. + 0.5)

@implementation SagarihaMainControls

@synthesize mStateServerSegControl;
@synthesize mStateClientSegControl;

@synthesize mRecProgView;
@synthesize mDownloadProgView;
@synthesize mDownloadIndicator;

-(void)awakeFromNib
{
    [singleton setNetworkingDelegate:self];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[UIAccelerometer sharedAccelerometer].updateInterval = 0.1;
}

-(IBAction)SetStateServer:(id)sender
{
	[singleton->networking SendOSCMsgWithIntValue:"/saga/state\0":12:mStateServerSegControl.selectedSegmentIndex];
}

-(IBAction)SetStateClient:(id)sender
{
	switch (mStateClientSegControl.selectedSegmentIndex)
	{
		case 0: /* stop */
			[singleton->mAudioQueuePlayer Stop];
			break;
		case 1: /* play */
			[singleton->mAudioQueuePlayer Start];
			break;
		case 2:	/* download */
			singleton.nextAudioIndex = 0;
#if 0
			[singleton->networking SendOSCMsgWithIntValue:"/saga/audio\0":12:singleton.nextAudioIndex];
#else
			[singleton->networking DoReceiveTCP]; /* Question: hasn't the TCP thread already started? What call this here? */
            [mDownloadIndicator startAnimating];
            //[singleton->networking SendOSCMsg:"/saga/download\0\0":16];

#endif
			break;
	}
}

-(IBAction)SetEnvPeriod:(id)sender
{
	[singleton->networking SendOSCMsgWithIntValue:"/saga/period\0\0\0\0":16:FLOAT_TO_MRMR_INT([mEnvPeriodSlider value])];
}

-(IBAction)SetDelayLevel:(id)sender
{
	[singleton->networking SendOSCMsgWithIntValue:"/saga/delay\0":12:FLOAT_TO_MRMR_INT([mDelayLevelSlider value])];
}

-(IBAction)SetPan:(id)sender
{
	[singleton->networking SendOSCMsgWithIntValue:"/saga/pan\0\0\0":12:FLOAT_TO_MRMR_INT([mPanSlider value])];
}

-(IBAction)SetVolumeServer:(id)sender
{
	//	NSLog(@"%f\n",[mVolumeServerSlider value]);
	[singleton->networking SendOSCMsgWithIntValue:"/saga/vol_s\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeServerSlider value])];
}

-(IBAction)SetVolumeClient:(id)sender
{
	//	NSLog(@"%f\n",[mVolumeClientSlider value]);
	//	[self SendOSCMsgWithIntValue:"/saga/vol_c\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeClientSlider value])];
	singleton->mAudioQueuePlayer->mAmp = [mVolumeClientSlider value];
}

-(IBAction)RequestHint
{
	[singleton->networking SendOSCMsg:"/saga/hint\0\0":12];
}

-(void) SetCue:(int)cue_num
{
	mStateServerSegControl.hidden = cue_num < 2;
	mRecProgView.hidden = cue_num < 2;
	
	mEnvPeriodSlider.hidden = cue_num < 3;
	mEnvPeriodLabel.hidden = cue_num < 3;
	
	//mPanView.hidden = NO; cue_num < 4;
	//mPanLabel.hidden = NO; cue_num < 4;
	
	mDelayLevelSlider.hidden = cue_num < 5;
	mDelayLevelLabel.hidden = cue_num < 5;
	
	mStateClientSegControl.hidden = YES;
	mDownloadProgView.hidden = YES;
	
	mVolumeServerSlider.hidden = cue_num < 7;
	mVolumeServerLabel.hidden = cue_num < 7;
	
	mVolumeClientSlider.hidden = YES;
	mVolumeClientLabel.hidden = YES;
	
	//	NSLog(@"setting cue number to %d\n",cue_num);
}

-(void)updateDownloadProg {
    
    if (singleton->mOSCMsg_DownloadProg >= 0.)
	{
		mDownloadProgView.progress = singleton->mOSCMsg_DownloadProg;
		singleton->mOSCMsg_DownloadProg = -1.;
	}
}

#define __VINNIE__	0

-(void)downloadEnded {
    if (singleton->mOSCMsg_DownloadEnd)
	{
		NSLog(@"Download ended");
#if __VINNIE__
		[singleton->mAudioQueuePlayer->mWaveTable->mArray writeToFile:@"SagarihaAudio.aif" atomically:YES];
        mStateClientSegControl.selectedSegmentIndex = 0;
#else
        [mDownloadIndicator stopAnimating];
        
        mStateClientSegControl.selectedSegmentIndex = 1;
		[singleton->mAudioQueuePlayer Start];
#endif
		singleton->mOSCMsg_DownloadEnd = NO;
	}
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
#if 0
	NSLog(@"%f, %f, %f\n", acceleration.x, acceleration.y, acceleration.z);
#endif
	
#define LIMIT_ACC_VAL(n)	n < -1. ? -1. : n > 1. ? 1. : n
	
	float x = LIMIT_ACC_VAL(acceleration.x);
	float y = LIMIT_ACC_VAL(acceleration.y+0.35);
//	float z = LIMIT_ACC_VAL(acceleration.z);
	
	//	[mPanView Set:(x+1.)/2:1.-((y+1.)/2)];
	[mPanView SetVelocity:x:-y];
	[mPanView setNeedsDisplay];
	
	x = [mPanView GetX] * 2. - 1.;
	y = (1. - [mPanView GetY]) * 2. - 1.;
	
	[singleton->networking SendOSCMsgWithFloatValue:"/saga/accelx\0\0\0\0":16:x];
	[singleton->networking SendOSCMsgWithFloatValue:"/saga/accely\0\0\0\0":16:y];
//	[singleton->networking SendOSCMsgWithFloatValue:"/saga/accelz\0\0\0\0":16:z];
	
#if 0
	NSLog(@"%f, %f, %f\n",x,y,z);
#endif
}

@end
