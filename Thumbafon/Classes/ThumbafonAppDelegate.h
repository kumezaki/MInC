//
//  ThumbafonAppDelegate.h
//  Thumbafon
//
//  Created by Chris Lavender on 10/30/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface ThumbafonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow			*window;
    MainViewController	*mainViewController;
	
	BOOL	networkWasOn;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

