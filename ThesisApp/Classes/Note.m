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

-(void)getSamples:(NSMutableArray *)bufferPointer:(int)numFrames
{
	double sample = 0.;

#if 0 // CL: the below doesn't work. I need to work on my understanding of Fast Enumeration.
	for (NSNumber *bufferElement in bufferPointer) {//CL: I'm trying to use "Fast Enumeration" which is reccomended by the dev docs.
		sample = [bufferElement doubleValue] + self.getSample;//CL: extracting the current value and adding this Note's sample value to it
		bufferElement = [aSample initWithDouble:sample]; //CL: reassigning the array element to the new value
	}
#endif

#if 0
	for (int i = 0; i < numFrames; i++){
		sample = self getSample + [[bufferPointer objectAtIndex:i]doubleValue];	// KU: you need to add to the buffer, not replace
		[bufferPointer insertObject:[aSample initWithDouble:sample]atIndex:i];
	}
#endif

#if 1
	for (int i = 0; i < numFrames; i++)
	{
		sample = [self getSample] + [[bufferPointer objectAtIndex:i]doubleValue];	// KU: the array is still empty at this point, perhaps you need to populate the array with objects when you create the array in AQPlayer
		[bufferPointer replaceObjectAtIndex:i withObject:[aSample initWithDouble:sample]];
	}
#endif
}

-(void)setWaveTable:(WaveFormTable *)wave_table
{
	mWaveTable = wave_table;
}

@end
