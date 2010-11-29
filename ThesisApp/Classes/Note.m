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

+(double) mtof:(double)midiNote
{
	return 440. * pow(2., (midiNote - 69) / 12.);
}

-(double)getSample
{
	double sample = 0.;
	sample = mAmp * [mWaveTable get:mTheta];
	mTheta += mDeltaTheta;
	
	return sample;
}

-(void)getSamples:(NSMutableArray *)buffer:(int)num_samples
{
	for (int i = 0; i < num_samples; i++){		
		[buffer replaceObjectAtIndex:i withObject:[aSample initWithDouble:self.getSample]];
	}
}

-(void)setWaveTable:(WaveFormTable *)wave_table
{
	mWaveTable = wave_table;
}

@end
