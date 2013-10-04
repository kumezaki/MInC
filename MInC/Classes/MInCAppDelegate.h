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

	AQPlayer				*AQP;

	NSString				*InterstitialString;
	NSString				*ServerIPAddString;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) SecondView *SecondView;

-(NSString *)getIPAddress;
-(void)setServerIPAddress:(NSString *)str;
-(void)setServerPortNum:(NSString *)str;

-(void)checkIncomingMessages;

-(void)sendHeartBeat;

+(NSString *)dataFilePath;
-(void) readDataFile;
-(void) writeDataFile;

@end
