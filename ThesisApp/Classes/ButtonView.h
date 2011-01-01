//
//  ButtonView.h
//  ThesisApp
//
//  Created by Chris Lavender on 12/28/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLSlipperyButton.h"
#import "AQPlayer.h"

@interface ButtonView : UIView {
	
	AQPlayer		*mAQPlayer;

	CLSlipperyButton*slickButton[kNumberNotes];
	NSMutableDictionary	*touchDic;

}

- (void)setAQPlayer:(AQPlayer*) AQPlayer;

- (IBAction)startSound:(CLSlipperyButton *)sender;
- (IBAction)stopSound:(CLSlipperyButton *)sender;



@end
