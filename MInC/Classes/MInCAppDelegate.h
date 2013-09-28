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

@interface MInCAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

	UIWindow *window;
	UITabBarController *tabBarController;

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

#if 0
	NSThread				*Thread;
#endif
    
	NSString				*InterstitialString;
	NSString				*ServerIPAddString;

@public
    
	SecondView				*SecondView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) SecondView *SecondView;

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
