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
@synthesize mAmp;
@synthesize mTheta;

-(double)getSample:(double)sample
{
	// KU: you don't need the for-loop here, it should stay in the callback routine
	// you nolonger need to aqp->mNotes[j]. becaue mAmp, mFreq, mTheta are all member variables
	// you don't need the sample argument for this method, just make it a local variable in the method
	// you need to return something in the method, e.g. return sample;
	
	double noteSample = 0.;
		noteSample = mAmp * [mWaveTable get:mTheta]; //CL: I'm not clear on the specifics of what is suppose to happen here. More an issue of synthesis than programming.
	
	return noteSample;
}

@end
