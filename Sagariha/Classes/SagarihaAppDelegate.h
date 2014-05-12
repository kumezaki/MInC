//
//  SagarihaAppDelegate.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 9/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SagarihaInterstitialMessageControls.h"
#import "SagarihaMainControls.h"
#import "SagarihaNetworkControls.h"

@interface SagarihaAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    
    UIWindow                    *window;
	UITabBarController          *tabBarController;

@public
	
	IBOutlet SagarihaMainControls					*main_controls;
	IBOutlet SagarihaNetworkControls				*network_controls;
	IBOutlet SagarihaInterstitialMessageControls	*interstial_controls;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
