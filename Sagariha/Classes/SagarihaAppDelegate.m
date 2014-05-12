//
//  SagarihaAppDelegate.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 9/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SagarihaAppDelegate.h"

#import "SagarihaSingleton.h"

#include <arpa/inet.h>
#include <fcntl.h>
#include <ifaddrs.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>

SagarihaSingleton* singleton = nil;

@implementation SagarihaAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Add the tab bar controller's current view as a subview of the window
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
}

/*
 // Optional UITabBarControllerDelegate method
 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
 }
 */

/*
 // Optional UITabBarControllerDelegate method
 - (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
 }
 */

- (id)init
{
	[super init];

	singleton = [[SagarihaSingleton alloc] init];
	
	return self;
}

- (void)dealloc {

    [singleton release];
    [tabBarController release];
    [window release];

    [super dealloc];
}

@end
