//
//  SimpleSynthAppDelegate.h
//  SimpleSynth
//
//  Created by Kojiro Umezaki on 12/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleSynthAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

