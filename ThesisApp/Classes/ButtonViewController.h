//
//  ButtonViewController.h
//  ThesisApp
//
//  Created by Chris Lavender on 12/28/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppBrain.h"

@class MainViewController, CLSlipperyButton;

@interface ButtonViewController : UIView {
	
	AppBrain			*mAppBrain;
	CLSlipperyButton	*slickButton[kNumberNotes];
	
	NSMutableDictionary	*touchDict;
	
}

- (void)setAppBrain:(AppBrain*) AppBrain;

- (IBAction)startSound:(CLSlipperyButton *)sender;
- (IBAction)stopSound:(CLSlipperyButton *)sender;



@end
