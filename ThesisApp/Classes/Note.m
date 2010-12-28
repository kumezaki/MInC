//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"


@implementation Note

+(double) mtof:(double)midiNote
{
	return 440. * pow(2., (midiNote - 69) / 12.);
}

@synthesize mAmp;
@synthesize mTheta;
@synthesize mFreq;
-(void) setMFreq:(double)val;{	
	mFreq = val;					
	mDeltaTheta = mFreq / kSR;	
}


-(id)init
{
	mAmp = MAX_AMP;
	mEnv = [[Envelope alloc] init];
	return self;
}

-(void)dealloc
{
	[mEnv release];	
	[super dealloc];
}

-(void)FillAudioBuffer:(double*)bufferPointer:(const int)numFrames
{
	for (int i = 0; i < numFrames; i++) {
		bufferPointer[i] += mAmp * [mWaveTable get:mTheta] * [mEnv get];
		mTheta += mDeltaTheta;
	}
}

-(void)setWaveTable:(WaveFormTable *)wave_table
{
	mWaveTable = wave_table;
}

-(void)on
{
	[mEnv on];
}

-(void)off
{
	[mEnv off];
}

@end
