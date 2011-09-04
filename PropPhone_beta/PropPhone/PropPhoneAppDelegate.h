//
//  PropPhoneAppDelegate.h
//  PropPhone
//
//  Created by Chris Lavender on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface PropPhoneAppDelegate : NSObject <UIApplicationDelegate> {
    MainViewController *mvc;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *actWheel;

// Main instance of the app delegate
+ (PropPhoneAppDelegate*)getInstance;

@end
