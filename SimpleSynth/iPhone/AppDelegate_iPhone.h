//
//  AppDelegate_iPhone.h
//  SimpleSynth
//
//  Created by Kojiro Umezaki on 12/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TouchView.h"

#define kNumViews	4

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	TouchView*	mView[kNumViews];
	UIButton*	mButtons[kNumViews];
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

