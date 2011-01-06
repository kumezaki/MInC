//
//  AppBrain.h
//  ThesisApp
//
//  Created by Chris Lavender on 1/3/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AQPlayer.h"
#import "Envelope.h"
#import "Mode.h"
#import "Note.h"
#import "WaveFormTable.h"

@interface AppBrain : AQPlayer {

@private
	
	NSString *mWaveType;
	
	double mFreq;
	int mCurrentMode;
	int numTouches;//temp
	
@public
	
	Mode *mModes[kNumberModes];
	Note *mNotes[kNumberNotes];
	WaveFormTable *mWaveTable;		
}

@property int numTouches;//temp
@property int mCurrentMode;
@property (nonatomic, retain) NSString *mWaveType;

-(void) startNote:(int)note_pos;
-(void) stopNote:(int)note_pos;

-(void) setMode:(int)val;
-(void) setWaveType:(NSString *)waveType;

- (void)fillAudioBuffer:(double*)sampleBuffer:(UInt32)numFrames;

@end
