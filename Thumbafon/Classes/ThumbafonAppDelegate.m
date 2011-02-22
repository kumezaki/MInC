//
//  ThumbafonAppDelegate.m
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "ThumbafonAppDelegate.h"
#import "MainViewController.h"
#import "Networking.h"

@implementation ThumbafonAppDelegate

@synthesize window;
@synthesize mainViewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the main view controller's view to the window and display.
    [window addSubview:mainViewController.view];	
    [window makeKeyAndVisible];

	//for shake gesture
	application.applicationSupportsShakeToEdit = YES;
	
	mNetworkWasOn = [[NSUserDefaults alloc]init];
	
	network = [[Networking alloc]init];
	network.mMainView = mainViewController;
	
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
	NSLog(@"Will Resign Active");
	if (network.powerSwitch) {
		networkWasOn = YES;
		[mNetworkWasOn setBool:networkWasOn forKey:@"networkState"];
		NSLog(@"ON Remembered");
		[mainViewController networkUISwitchShutOff:NO];
	}

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	NSLog(@"Did Enter Background");
	if (network.powerSwitch) {
		networkWasOn = YES;
		[mNetworkWasOn setBool:networkWasOn forKey:@"networkState"];
		NSLog(@"ON Remembered");
		[mainViewController networkUISwitchShutOff:NO];
	}
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
	NSLog(@"Will Enter Foreground");
	if ([mNetworkWasOn boolForKey:@"networkState"]) {
		NSLog(@"OFF Remembered");
		[mainViewController networkUISwitchShutOff:YES];
		networkWasOn = NO;
	}
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
	NSLog(@"Did Become Active");
	if ([mNetworkWasOn boolForKey:@"networkState"]) {
		NSLog(@"OFF Remembered");
		[mainViewController networkUISwitchShutOff:YES];
		networkWasOn = NO;
	}	
}


- (void)applicationWillTerminate:(UIApplication *)application {
	/*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	if (network.powerSwitch) {
		[mainViewController networkUISwitchShutOff:NO];
	}

}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[mNetworkWasOn release];
	[network release];
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
