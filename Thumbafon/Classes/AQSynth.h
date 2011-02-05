//
//  AQSynth.h
//  Thumbafon
//
//  Created by Chris Lavender on 1/30/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AQPlayer.h"

@class Voice, Mode;

@interface AQSynth : AQPlayer {

	Float64		theta;
	Float64		deltaTheta;
	UInt8		currentMode;
	
	Mode		*mode[kNumberModes];
	Voice		*voice[kNumberVoices];
	
	
}
@property UInt8 currentMode;

- (void)startVoice:(UInt8)note_pos;
- (void)stopVoice:(UInt8)note_pos;
- (void)setMode:(UInt8)val;


@end
