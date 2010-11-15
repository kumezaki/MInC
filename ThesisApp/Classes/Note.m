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
@synthesize mAmp;
@synthesize mTheta;

-(double)getSample
{
	//CL: Just an FYI... I have absolutey no idea if this is right or wrong or why it would be right or wrong. It builds though.
	//KU: no need for creating arrays here...you should now be dealing with arrays of Notes.
	//KU: do only the delta_theta computation for this note based on the mFreq and mSR values
	
	double delta_theta[kNumberNotes];
	double sample = 0.;
	
	// KU: for loop is unnecessary here
	for (int j = 0; j < kNumberNotes; j++)  
	{
		delta_theta[j] = mFreq / mSR;
		sample = mAmp * [mWaveTable get:mTheta];
		mTheta += delta_theta[j];
	}
	
	return sample;
}

-(void)setWaveTable:(WaveFormTable *)wave_table
{
	mWaveTable = wave_table; //CL: again... how is this referencing the WaveFromTable init from AQPlayer?
}

@end
