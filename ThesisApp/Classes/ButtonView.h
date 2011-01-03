//
//  ButtonView.h
//  ThesisApp
//
//  Created by Chris Lavender on 12/28/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLSlipperyButton.h"
#import "AppBrain.h"

@interface ButtonView : UIView {
	
	AppBrain		*mAppBrain;

	CLSlipperyButton*slickButton[kNumberNotes];
	NSMutableDictionary	*touchDic;

}

- (void)setAppBrain:(AppBrain*) AppBrain;

- (IBAction)startSound:(CLSlipperyButton *)sender;
- (IBAction)stopSound:(CLSlipperyButton *)sender;



@end
