//
//  ButtonViewController.h
//  Thumbafon
//
//  Created by Chris Lavender on 12/28/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AQPlayer.h"

@class MainViewController, CLSlipperyButton, Networking;

@interface ButtonViewController : UIView {
	
	AQPlayer			*mAQPlayer;
	CLSlipperyButton	*slickButton[kNumberVoices];
	Networking			*network;

	NSMutableDictionary	*touchDict;
	
}

- (void)setAQPlayer:(AQPlayer*) aqplayer;

- (IBAction)startSound:(CLSlipperyButton *)sender;
- (IBAction)stopSound:(CLSlipperyButton *)sender;



@end
