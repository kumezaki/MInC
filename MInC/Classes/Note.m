//
//  Note.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Note.h"


@implementation Note
@synthesize mAmp;
@synthesize mFreq;

-(id)init
{
	[super init];

	mDuration = 0.;
	
	mWaveTable = nil;

	mEnv = nil;
	
	mSR = 22050.;
	mFreq = 0.0;
	mAmp = 1.0;

	mSamplesPlayed = 0;
	mNumPlaySamples = 0;
	
	return self;
}

-(void)dealloc
{
	[mEnv release];

	[super dealloc];
}

+(double) mtof:(double)midi_note
{
	return 440. * pow(2., (midi_note - 69) / 12.);
}

-(void)	On:(WaveFormTable*)wavetable:(Envelope*)env;
{
	mWaveTable = wavetable;
	mEnv = env;
	
	mSamplesPlayed = 0;
	
	[mEnv on];
}

-(void) Off
{
	[mEnv off];
}

-(double) AddSamples:(double*)buffer:(const int)num_frames:(double)scale:(double)theta
{
	if (mFreq == 0.) return theta;
	
	double delta_theta = mFreq / mSR;
	for (int i = 0; i < num_frames; i++)
	{
		buffer[i] += scale * mAmp * [mWaveTable Get:theta] * [mEnv get];
		theta += delta_theta;
		
		if (++mSamplesPlayed >= mNumPlaySamples) [self Off];
	}
	
	return theta;
}

-(double) GetDuration
{
	return mDuration;
}
	
-(void) SetDuration:(double)duration
{
	mDuration = duration;
}

-(void)	SetPercentOn:(double)percent
{
	mNumPlaySamples = mDuration * mSR * percent;
}

@end
