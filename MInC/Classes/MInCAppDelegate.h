//
//  MInCAppDelegate.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AQPlayer.h"
#import "SecondView.h"

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
		
	NSArray					*ImageArray;
	
	AQPlayer				*AQP;
	
	BOOL					WithServer;
	
	char					ip_add_buf[32];
	SInt32					ip_add_size;
	
	char					InBuffer[1024];
	ssize_t					InBufferLength;

	char					OutBuffer[1024];
	SInt32					OutBufferLength;
	
	SInt16					ReceivePortNum;
	
	NSThread				*Thread;

	NSString				*InterstitialString;
	BOOL					NewMod;
	NSString				*ServerIPAddString;

@public
	UInt32					SendIPAddress;
	SInt16					SendPortNum;

	SecondView				*SecondView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) SecondView *SecondView;

-(void)setWithServer:(BOOL)on;

-(void)sendOSCMsg:(const char*)osc_str :(SInt32)osc_str_length;
-(void)sendOSCMsgWithIntValue:(const char*)osc_str :(SInt32)osc_str_length :(SInt32)val;

-(IBAction)SetSequence;

-(IBAction)SetSpeaker:(id)sender;
-(IBAction)SetInstrument:(id)sender;

-(IBAction)Set8vbDown:(id)sender;
-(IBAction)Set8vbUp:(id)sender;
-(void)send8vb:(BOOL)direction;

-(IBAction)Set8vaDown:(id)sender;
-(IBAction)Set8vaUp:(id)sender;
-(void)send8va:(BOOL)direction;

-(IBAction)Set2xSlowDown:(id)sender;
-(IBAction)Set2xSlowUp:(id)sender;
-(void)send2xSlow:(BOOL)direction;

-(IBAction)Set2xFastDown:(id)sender;
-(IBAction)Set2xFastUp:(id)sender;
-(void)send2xFast:(BOOL)direction;

-(IBAction)SetNoteDuration:(id)sender;

-(IBAction)Hint:(id)sender;
-(IBAction)Status:(id)sender;

-(void)sendOSC_Filter:(Float64)val;
-(void)sendOSC_Volume:(Float64)val;
-(void)sendOSC_Waveform:(Float64)val;

-(void)send_udp;
-(void)receive_udp;
-(void)parse_osc;

-(NSString *)getIPAddress;
-(void)setServerIPAddress:(NSString *)str;
-(void)setServerPortNum:(NSString *)str;

-(void)checkIncomingMessages;

-(void)sendHeartBeat;

+(NSString *)dataFilePath;
-(void) readDataFile;
-(void) writeDataFile;

-(void) createImageArray;

@end
