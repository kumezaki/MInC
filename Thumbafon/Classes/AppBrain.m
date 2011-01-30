//
//  AppBrain.m
//  Thumbafon
//
//  Created by Chris Lavender on 1/3/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import "AppBrain.h"

#import "Mode.h"
#import "Note.h"
#import "WaveFormTable.h"
#import "Content.h"
#import "freeverb.h"

@implementation AppBrain

@synthesize mWaveType;
@synthesize mCurrentMode;

- (void)setMode:(int)val {
	mCurrentMode = val;
	//NSLog(@"current val = %i",val);
	for (int i = 0; i < kNumberNotes; i++) mNotes[i].mFreq = [mModes[mCurrentMode] getNoteFreq:i];
}

- (void)setWaveType:(NSString *)waveType {
	mWaveType = waveType;
	[mWaveTable createWaveType:mWaveType];
}

- (void)startNote:(int)note_pos {	
	[mNotes[note_pos] noteOn];
}

- (void)stopNote:(int)note_pos {	
	[mNotes[note_pos] noteOff];
}

- (void)ampAdjust:(double)uiData {
}

- (id)init {
	[super init];
	
	mWaveTable = [[WaveFormTable alloc]init];
	mWaveType = [NSString new];
	
	for (int i = 0; i < kNumberNotes; i++) {
		mNotes[i] = [[Note alloc]init];
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
	
	/* here's where we initialize the reverb */
	
	Reverb_Init();
	Reverb_SetRoomSize(0,0.5);
	Reverb_SetDamp(0,0.5);
	Reverb_SetWet(0,0.5);
	Reverb_SetDry(0,0.5);
	
	[self setWaveType: @"SineWave"];
	[self setMode:0];
	return self;
}

- (void)dealloc {
	/* here's where we release the reverb*/
	Reverb_Release();
	
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
	revmodel_process(sampleBuffer,numFrames,1);
}

@end