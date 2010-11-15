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
	
	double delta_theta;
	double sample = 0.;
		 
	delta_theta = mFreq / mSR;
	sample = mAmp * [mWaveTable get:mTheta];
	mTheta += delta_theta;

	
	return sample;
}

-(void)setWaveTable:(WaveFormTable *)wave_table
{
	mWaveTable = wave_table; //CL: again... how is this referencing the WaveFromTable init from AQPlayer?
}

@end
