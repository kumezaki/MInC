//
//  MInCAppDelegate.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AQPlayer.h"

@interface MInCAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, UIAccelerometerDelegate> {

	UIWindow *window;
	UITabBarController *tabBarController;

	IBOutlet UIButton			*mNextButton;
	IBOutlet UIImageView		*mNotationView;
	IBOutlet UISlider			*mNoteDurationSlider;
	IBOutlet UIView				*mTouchView;
	IBOutlet UILabel			*mStatusLabel;
	IBOutlet UISegmentedControl	*mSpeakerSegControl;
	IBOutlet UISegmentedControl	*mInstrSegControl;
	IBOutlet UIButton			*m8vbButton;
	IBOutlet UIButton			*m8vaButton;
	IBOutlet UIButton			*m2xSlowButton;
	IBOutlet UIButton			*m2xFastButton;
	IBOutlet UIButton			*mHintButton;
	IBOutlet UIButton			*mStatusButton;

	NSArray					*mImageArray;
	
	AQPlayer				*mAQP;
	
	BOOL					mWithServer;
	
	char					ip_add_buf[32];
	int						ip_add_size;
	
	char					mInBuffer[1024];
	ssize_t					mInBufferLength;

	char					mOutBuffer[1024];
	int						mOutBufferLength;
	
	SInt16					mReceivePortNum;
	
	NSThread				*mThread;

	NSString				*mInterstitialString;
	BOOL					mNewMod;

@public
	UInt32					mSendIPAddress;
	SInt16					mSendPortNum;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

-(void)SetWithServer:(BOOL)on;

-(void)SendOSCMsg:(const char*)osc_str:(int)osc_str_length;
-(void)SendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;

-(IBAction)SetSequence;

-(IBAction)SetSpeaker:(id)sender;
-(IBAction)SetInstrument:(id)sender;

-(IBAction)Set8vbDown:(id)sender;
-(IBAction)Set8vbUp:(id)sender;
-(void)Send8vb:(BOOL)direction;

-(IBAction)Set8vaDown:(id)sender;
-(IBAction)Set8vaUp:(id)sender;
-(void)Send8va:(BOOL)direction;

-(IBAction)Set2xSlowDown:(id)sender;
-(IBAction)Set2xSlowUp:(id)sender;
-(void)Send2xSlow:(BOOL)direction;

-(IBAction)Set2xFastDown:(id)sender;
-(IBAction)Set2xFastUp:(id)sender;
-(void)Send2xFast:(BOOL)direction;

-(IBAction)SetNoteDuration:(id)sender;

-(IBAction)Hint:(id)sender;
-(IBAction)Status:(id)sender;

-(void)SendOSC_Filter:(double)val;
-(void)SendOSC_Volume:(double)val;
-(void)SendOSC_Waveform:(double)val;

-(void)send_udp;
-(void)receive_udp;
-(void)parse_osc;

-(NSString *)getIPAddress;

-(void)checkIncomingMessages;

-(void)sendHeartBeat;

+(NSString *)dataFilePath;
-(void) readDataFile;
-(void) writeDataFile;

@end
