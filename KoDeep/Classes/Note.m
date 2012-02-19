//
//  Note.m
//  hoo
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
	mADSR = nil;
	
	mSR = 22050.;
	mFreq = 0.0;
	mAmp = 0.2;
	mTheta = 0.;

	mSamplesPlayed = 0;
	mNumPlaySamples = 0;
	
	return self;
}

-(void)dealloc
{
	[super dealloc];
}

+(double) mtof:(double)midi_note
{
	return 440. * pow(2., (midi_note - 69) / 12.);
}

-(void) On:(WaveFormTable*)wavetable:(ADSR*)adsr;
{
	mWaveTable = wavetable;
	mADSR = adsr;
	
	if (mADSR != nil) [mADSR On];

	mOn = true;

	mSamplesPlayed = 0;
}

-(void) Off
{
	if (mADSR != nil) [mADSR Off];
	
	mOn = false;
}

-(double) GetSample
{
	if (mWaveTable == nil) return 0.;
	
	if (mADSR == nil ? mOn : [mADSR IsOn])
	{
		double sample = [mWaveTable Get:mTheta] * (mADSR == nil ? 1. : [mADSR Get]) * mAmp;
		
		mTheta += mFreq / mSR;
		
		if (++mSamplesPlayed == mNumPlaySamples) [self Off];
		
		return sample;
	}
	
	return 0.;
}

-(double) GetDuration
{
	return mDuration;
}
	
-(void) SetDuration:(double)duration
{
	mDuration = duration;
	mNumPlaySamples = mDuration * mSR;
}

-(void)	SetPercentOn:(double)percent
{
	mNumPlaySamples = mDuration * mSR * percent;
}

@end
