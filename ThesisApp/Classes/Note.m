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
	double sample = 0.;

#if 1
	for (NSNumber *bufferElement in buffer) {//CL: I'm trying to use "Fast Enumeration" which is reccomended by the dev docs.
		sample = [bufferElement doubleValue] + self.getSample;//CL: extracting the current value and adding this Note's sample value to it
		bufferElement = [aSample initWithDouble:sample]; //CL: reassigning the array element to the new value
	}

#else
	for (int i = 0; i < num_samples; i++){		
		[buffer insertObject:[aSample initWithDouble:self.getSample] atIndex:i];	// KU: you need to add to the buffer, not replace
	}
#endif
}

-(void)setWaveTable:(WaveFormTable *)wave_table
{
	mWaveTable = wave_table;
}

@end
