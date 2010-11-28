//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize mFreq;
-(void) setMFreq:(double)val;{	
	mFreq = val;					
	mDeltaTheta = mFreq / mSR;	
}

@synthesize mAmp;
@synthesize mTheta;
@synthesize mBuffer;

+(double) mtof:(double)midiNote
{
	return 440. * pow(2., (midiNote - 69) / 12.);
}


-(double)getSample
{
	// KU: I'm thinking that delta_theta can become a member variable.
	// KU: It's basically the same as frequency (mFreq scaled by mSR), so it only needs to be computed when mFreq changes.
	// KU: To do this, you might create a new method called SetFreq.  In that method you set mFreq but also compute mDeltaTheta.

	double sample = 0.;
	sample = mAmp * [mWaveTable get:mTheta];
	mTheta += mDeltaTheta;
	return sample;
}

-(double)getSamples:(double*)buffer:(int)num_samples;
{
	for (int i = 0; i < num_samples; i++)
		mBuffer += (buffer[i] = self.getSample);
	return mBuffer;
}

-(void)setWaveTable:(WaveFormTable *)wave_table
{
	mWaveTable = wave_table;
}


@end
