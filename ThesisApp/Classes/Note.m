//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"



@implementation Note

@synthesize mSR;

@synthesize mFreq;
-(void) setFreq:(double)val;
{
	if (mFreq > 0.) mDeltaTheta = mFreq / mSR;
}

@synthesize mAmp;
@synthesize mTheta;


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

-(void)setWaveTable:(WaveFormTable *)wave_table
{
	mWaveTable = wave_table;
}


@end
