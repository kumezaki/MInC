//
//  Note.m
//  Thumbafon
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"
#import "AQPlayer.h" //for kSR only
#import "Envelope.h"
#import "WaveFormTable.h"

@implementation Note

+(double) mtof:(double)midiNote {
	return 440. * pow(2., (midiNote - 69) / 12.);
}

@synthesize mTheta;

@synthesize mFreq;
-(void) setMFreq:(double)val;{	
	mFreq = val;
	mDeltaTheta = mFreq / kSR;	
}

-(id)init {
	mEnv = [[Envelope alloc] init];
	mAmp = MAX_AMP / kNumberNotes;
	return self;
}

-(void)dealloc {
	[mEnv release];	
	[super dealloc];
}

-(void)fillAudioBuffer:(double*)bufferPointer:(UInt32)numFrames {
	for (int i = 0; i < numFrames; i++) {
		//bufferPointer[i] += [mWaveTable get:mTheta] * [mEnv get];
		bufferPointer[i] += mAmp * [mWaveTable get:mTheta] * [mEnv get];
		mTheta += mDeltaTheta;
	}
}

-(void)setWaveTable:(WaveFormTable *)wave_table {
	mWaveTable = wave_table;
}

- (void)changeEnvelope:(NSString *)waveType {
	[mEnv setEnv:waveType];
}

-(void)noteOn {
	[mEnv on];
}

-(void)noteOff {
	[mEnv off];
}

@end