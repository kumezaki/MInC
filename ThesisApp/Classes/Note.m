//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"
#import "AQPlayer.h" //for kSR only
#import "Envelope.h"
#import "WaveFormTable.h"
#import "SoundFile.h"

@implementation Note

+(double) mtof:(double)midiNote {
	return 440. * pow(2., (midiNote - 69) / 12.);
}

@synthesize mAmp;
@synthesize mTheta;

@synthesize mFreq;
-(void) setMFreq:(double)val;{	
	mFreq = val;					
	mDeltaTheta = mFreq / kSR;	
}

-(id)init {
	mAmp = MAX_AMP / kNumberNotes;
	mEnv = [[Envelope alloc] init];
	return self;
}

-(void)dealloc {
	[mEnv release];	
	[super dealloc];
}

-(void)fillAudioBuffer:(double*)bufferPointer:(UInt32)numFrames {
	//for (int i = 0; i < numFrames; i++) {
//		bufferPointer[i] += mAmp * [mWaveTable getSamples:mTheta] * [mEnv get];
//		mTheta += mDeltaTheta;
//	}
	[mSoundFile getSamples:bufferPointer :numFrames :mDeltaTheta :mAmp];
}

-(void)setWaveTable:(WaveFormTable *)wave_table {
	mWaveTable = wave_table;
}

-(void)setSoundFile:(SoundFile *)sound_file {
	mSoundFile = sound_file;
}

-(void)on {
	[mEnv on];
}

-(void)off {
	[mEnv off];
}

@end