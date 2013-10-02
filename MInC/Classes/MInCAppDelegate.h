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

	NSArray					*ImageArray;
	
	AQPlayer				*AQP;

	NSString				*InterstitialString;
	NSString				*ServerIPAddString;

@public
    
	SecondView				*SecondView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) SecondView *SecondView;

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
