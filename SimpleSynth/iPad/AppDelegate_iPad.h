//
//  AppDelegate_iPad.h
//  SimpleSynth
//
//  Created by Kojiro Umezaki on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SimpleSynth_Singleton.h"

@interface AppDelegate_iPad : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SimpleSynth_Singleton*	mSingleton;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
