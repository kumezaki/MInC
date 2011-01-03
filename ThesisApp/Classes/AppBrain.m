//
//  AppBrain.m
//  ThesisApp
//
//  Created by Chris Lavender on 1/3/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import "AppBrain.h"
#import "Content.h"

@implementation AppBrain

@synthesize mWaveType;
@synthesize mCurrentMode;

-(void) setMode:(int)val {
	mCurrentMode = val;
	for (int i = 0; i < kNumberNotes; i++) mNotes[i].mFreq = [mModes[mCurrentMode] getNoteFreq:i];
	AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
}

-(void) setWaveType:(NSString *)waveType {
	mWaveType = waveType;
	[mWaveTable createWaveType:mWaveType];
}

-(void) startNote:(int)note_pos {	
	[mNotes[note_pos] on];
}

-(void) stopNote:(int)note_pos {	
	[mNotes[note_pos] off];
}


-(id)init {
	[super init];
	
	mWaveTable = [WaveFormTable new];
	mWaveType = [NSString new];
	
	for (int i = 0; i < kNumberNotes; i++) {
		mNotes[i] = [Note new];
		[mNotes[i] setWaveTable:mWaveTable];
	}
	
	for (int j = 0; j < kNumberModes; j++) {
		mModes[j] = [Mode new];
		switch (j) {
			case 0: [mModes[j] assignMode:pitchSet01]; break;
			case 1: [mModes[j] assignMode:pitchSet02]; break;
			case 2: [mModes[j] assignMode:pitchSet03]; break;
			case 3: [mModes[j] assignMode:pitchSet04]; break;
			case 4: [mModes[j] assignMode:pitchSet05]; break;
			case 5: [mModes[j] assignMode:pitchSet06]; break;
			default: break;
		}
	}
	[self setWaveType: @"sine wave"];
	[self setMode:0];
	return self;
}

- (void)dealloc {
	for (int i = 0; i < kNumberNotes; i++) [mNotes[i] release];
	for (int j = 0; j < kNumberModes; j++) [mModes[j] release];	
	[mWaveType release];
	[mWaveTable release];
	[super dealloc];
}

- (void)fillAudioBuffer:(double*)sampleBuffer:(UInt32)numFrames{
	
	for (int i = 0; i < kNumberNotes; i++) {
		[mNotes[i] fillAudioBuffer:sampleBuffer :numFrames];
	}
	
}

@end
