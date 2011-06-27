//
//  SagarihaWaveTable.m
//  Sagariha
//
//  Created by Venky on 4/14/10.
//  Copyright 2010 Venkatramanan Krishnamani. All rights reserved.
//

#import "SagarihaWaveTable.h"


@implementation SagarihaWaveTable

-(id)init
{
	[super init];

	for (int i = 0; i < kWaveTableSize; i++)
	{
#if 0
		mTable[i] = sinf((double)i/kWaveTableSize * 2 * 3.1415);
#else
		mTable[i] = 0.;
#endif
	}

	return self;
}

-(double) Get:(double)index
{
	int i0 = (int)(index * kWaveTableSize) % kWaveTableSize;
	int i1 = (i0 + 1) % kWaveTableSize;
	double k = index - (int)index;
	double s0 = mTable[i0];
	double s1 = mTable[i1];
	return s0 + (s1 - s0) * k;
}

-(void) Set:(UInt32)index:(double)value
{
	if ((index >= 0) && (index < kWaveTableSize))
		mTable[index] = value;
}

@end
