//
//  MInCAppDelegate.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MInC_AppDelegate.h"

#import "MInC_AQPlayer.h"

@implementation MInC_AppDelegate

@synthesize window;
@synthesize tabBarController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
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


- (void)dealloc {

    [tabBarController release];
    [window release];

    [super dealloc];
}

-(id)init {

	[super init];
    
    [[MInC_AQPlayer alloc] init];
    
	return self;
}

@end
