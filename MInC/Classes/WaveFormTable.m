//
//  WaveFormTable.m
//  MInC
//
//  Created by Venky on 4/14/10.
//  Copyright 2010 Venkatramanan Krishnamani. All rights reserved.
//

#import "WaveFormTable.h"

#define SIGN(x) (x < 0. ? -1. : x > 0. ? 1. : 0.)

@implementation WaveFormTable

-(id)init
{
	[super init];
	
	for (int i = 0; i < kWaveFormTableSize; i++)
	{
		const Float64 t = (Float64)i / kWaveFormTableSize;

#if 1
		mTable[i] = sinf(t * 2 * M_PI);			/* sinusoid */
#elif 0
		mTable[i] = 2 * (t - floor(t + 0.5));	/* sawtooth */
#elif 0
		mTable[i] = SIGN(sinf(t * 2 * M_PI));	/* square */
#endif
	}

	return self;
}

-(Float64) Get:(Float64)index
{	
	SInt32 i0 = (SInt32)(index * kWaveFormTableSize + 0.5) % kWaveFormTableSize;
	SInt32 i1 = (i0 + 1) % kWaveFormTableSize;
	Float64 k = index - (SInt32)index;
	Float64 s0 = mTable[i0];
	Float64 s1 = mTable[i1];
	return s0 + (s1 - s0) * k;
}
@end
