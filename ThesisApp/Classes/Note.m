//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize mTableOffset;

@synthesize mFreq;
-(void) setMFreq:(double)val;{	
	mFreq = val;					
	mDeltaTheta = mFreq / kSR;	
}

@synthesize mAmp;
@synthesize mTheta;

+(double) mtof:(double)midiNote
{
	return 440. * pow(2., (midiNote - 69) / 12.);
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

-(double)getSample
{
	double sample = 0.;
	sample = mAmp * [mWaveTable get:mTheta];
	mTheta += mDeltaTheta;
	
	return sample;
}

-(void)getSamples:(double *)bufferPointer:(int)numFrames
{
	for (int i = 0; i < numFrames; i++) {
		bufferPointer[i] += mAmp * [mWaveTable get:mTheta+mTableOffset] * [mEnv get];//CL: trying to read the table from an offset Theta position
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
