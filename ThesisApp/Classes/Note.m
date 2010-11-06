//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/5/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"


@implementation Note

@synthesize mAmp;
@synthesize mFreq;

-(id)init
{
	[super init];
		
	mWaveTable = nil;
	
	mSR = 22050.;
	mFreq = 440.;
	mAmp = 1.;
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

-(void) on:(WaveFormTable*)wavetable;
{
	mWaveTable = wavetable;
		
	mOn = true;
	
	mSamplesPlayed = 0;
}

-(void) off
{	
	mOn = false;
}

-(double) getSample
{
	if (mWaveTable == nil) return 0.;
	
	//if (mADSR == nil ? mOn : [mADSR IsOn])
//	{
//		double sample = [mWaveTable get:mTheta] * (mADSR == nil ? 1. : [mADSR Get]) * mAmp;
//		
//		mTheta += mFreq / mSR;
//		
//		if (++mSamplesPlayed == mNumPlaySamples) [self off];
//		
//		return sample;
//	}
	
	return 0.;
}


@end
