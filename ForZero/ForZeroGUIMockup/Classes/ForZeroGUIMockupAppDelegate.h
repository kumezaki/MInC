//
//  ForZeroGUIMockupAppDelegate.h
//  ForZeroGUIMockup
//
//  Created by Kojiro Umezaki on 9/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForZeroGUIMockupViewController;

@interface ForZeroGUIMockupAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ForZeroGUIMockupViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ForZeroGUIMockupViewController *viewController;

@end

