//
//  SagarihaAppDelegate.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 9/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SagarihaAudioQueuePlayer.h"
#import "SagarihaPanView.h"

@interface SagarihaAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, UITextFieldDelegate, UIAccelerometerDelegate> {
    UIWindow *window;
	UITabBarController *tabBarController;

	IBOutlet UISegmentedControl	*mStateServerSegControl;
	IBOutlet UISegmentedControl	*mStateClientSegControl;
	IBOutlet UIProgressView		*mRecProgView;
	IBOutlet UIProgressView		*mDownloadProgView;
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
	IBOutlet UITextField		*mIPAddressTextField;
	IBOutlet UITextField		*mPortNumTextField;
	IBOutlet UIView				*mInterstitialView;
	IBOutlet UILabel			*mInterstitialLabel;
	IBOutlet UIButton			*mHintButton;
	IBOutlet UIButton			*mOKButton;
	IBOutlet SagarihaPanView	*mPanView;

	IBOutlet UIButton			*mStartButton;
	IBOutlet UIButton			*mSubtractButton;
	IBOutlet UIButton			*mStopButton;
	IBOutlet UIButton			*mPanicButton;

	char					ip_add_buf[32];
	int						ip_add_size;
	
	char					mInBuffer[1024];
	ssize_t					mInBufferLength;

	char					mOutBuffer[1024];
	ssize_t					mOutBufferLength;

	NSThread				*mThread;

	int						mOSCMsg_State;
	float					mOSCMsg_RecProg;
	float					mOSCMsg_DownloadProg;
	BOOL					mOSCMsg_DownloadEnd;
	int						mOSCMsg_InterstitialMsgDur;
	NSString*				mOSCMsg_InterstitialMsg;
	int						mOSCMsg_Cue;
	
	int						mNextAudioIndex;
	
	NSTimer*				mAudioTimer;
	
	SagarihaAudioQueuePlayer*	mAudioQueuePlayer;
	
@public
	UInt32					mSendIPAddress;
	SInt16					mSendPortNum;

	SInt16					mReceivePortNum;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

-(IBAction)SetStateServer:(id)sender;
-(IBAction)SetStateClient:(id)sender;
-(IBAction)SetEnvPeriod:(id)sender;
-(IBAction)SetDelayLevel:(id)sender;
-(IBAction)SetPan:(id)sender;
-(IBAction)SetVolumeServer:(id)sender;
-(IBAction)SetVolumeClient:(id)sender;
-(IBAction)InterstitialMsgDone:(id)sender;

-(IBAction)IPAddressChanged:(id)sender;
-(IBAction)PortNumChanged:(id)sender;

-(IBAction)RequestHint;
-(void)turnInterstitialMsgOn;
-(void)turnInterstitialMsgOff;

-(void)RequestAudio;
-(void)ResetAudioTimer;

-(void)SendOSCMsg:(const char*)osc_str:(int)osc_str_length;
-(void)SendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;
-(void)SendOSCMsgWithFloatValue:(const char*)osc_str:(int)osc_str_length:(float)val;

-(void)send_udp;
-(void)receive_udp;
-(void)parse_osc;

-(void)checkIncomingMessages;

-(NSString *)getIPAddress;

+(NSString *)dataFilePath;
-(void) readDataFile;
-(void) writeDataFile;

-(void) SetCue:(int)cue_num;

-(IBAction)ForZero_Start:(id)sender;
-(IBAction)ForZero_Subtract:(id)sender;
-(IBAction)ForZero_Stop:(id)sender;
-(IBAction)ForZero_Panic:(id)sender;

@end
