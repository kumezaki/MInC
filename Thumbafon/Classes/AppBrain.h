//
//  AppBrain.h
//  Thumbafon
//
//  Created by Chris Lavender on 1/3/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AQPlayer.h"

@class Mode, Note, WaveFormTable;

@interface AppBrain : AQPlayer {

@private
	
	NSString *mWaveType;
	int mCurrentMode;
	Mode *mModes[kNumberModes];
	Note *mNotes[kNumberNotes];
	WaveFormTable *mWaveTable;
}

@property int mCurrentMode;
@property (nonatomic, retain) NSString *mWaveType;

- (void)startNote:(int)note_pos;
- (void)stopNote:(int)note_pos;

- (void)setMode:(int)val;
- (void)setWaveType:(NSString *)waveType;
- (void)setEnvelopeType:(NSString *)envType;

- (void)ampAdjust:(double)uiData;

- (void)fillAudioBuffer:(double*)sampleBuffer:(UInt32)numFrames;

@end