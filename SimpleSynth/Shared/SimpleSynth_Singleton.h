//
//  SimpleSynth_Singleton.h
//  SimpleSynth
//
//  Created by Kojiro Umezaki on 12/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "TouchView.h"

#define kNumViews	4

@interface SimpleSynth_Singleton : NSObject {
	TouchView*	mView[kNumViews];
	UIButton*	mButtons[kNumViews];
}

-(UIWindow*)GetAppWindow;

-(void)doButton:(id)sender;

@end

@interface SimpleSynth_Singleton_iPhone : SimpleSynth_Singleton {
}

-(UIWindow*)GetAppWindow;

@end

@interface SimpleSynth_Singleton_iPad : SimpleSynth_Singleton {
}

-(UIWindow*)GetAppWindow;

@end
