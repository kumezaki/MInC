//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"

@implementation Note

//CL: using @synthesize for the getter and setMFreq for the setter
@synthesize mFreq;

// KU: I don't think you declared this in the .h file
// CL: as I understand it @property in .h set's the getter and setter
// CL: but you can still implement one or the other in the .m
-(void) setMFreq:(double)val;{	
	mFreq = val;					
	mDeltaTheta = mFreq / mSR;	
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
