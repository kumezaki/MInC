//
//  ThumbafonAppDelegate.h
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController, Networking;

@interface ThumbafonAppDelegate : NSObject <UIApplicationDelegate> {
    
	UIWindow			*window;
	NSUserDefaults		*mNetworkWasOn;
	
    MainViewController	*mainViewController;
	Networking			*network;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

