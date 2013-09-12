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
	
	mSR = 22050;
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

+(Float64) mtof:(Float64)midi_note
{
	return 440. * pow(2., (midi_note - 69) / 12.);
}

-(void)	On:(WaveFormTable*)wavetable :(Envelope*)env;
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

-(Float64) AddSamples:(Float64*)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta
{
	if (mFreq == 0.) return theta;
	
	Float64 delta_theta = mFreq / mSR;
	for (SInt32 i = 0; i < num_frames; i++)
	{
		buffer[i] += scale * mAmp * [mWaveTable Get:theta] * [mEnv get];
		theta += delta_theta;
		
		if (++mSamplesPlayed >= mNumPlaySamples) [self Off];
	}
	
	return theta;
}

-(Float64) GetDuration
{
	return mDuration;
}
	
-(void) SetDuration:(Float64)duration
{
	mDuration = duration;
}

-(void)	SetPercentOn:(Float64)percent
{
	mNumPlaySamples = mDuration * mSR * percent;
}

-(void) SetFrequency:(Float64)freq
{
    mFreq = freq;
}

@end
