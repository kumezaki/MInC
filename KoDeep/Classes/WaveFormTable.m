//
//  WaveFormTable.m
//  goo
//
//  Created by Venky on 4/14/10.
//  Copyright 2010 Venkatramanan Krishnamani. All rights reserved.
//

#import "WaveFormTable.h"


@implementation WaveFormTable

-(id)init
{
	[super init];
	for (int i = 0; i < kwaveFormTableSize; i++)
	{
		mTable[i] = sinf((double)i/kwaveFormTableSize * 2 * 3.1415);
	}

	return self;
}

-(double) Get:(double)index
{
	int i0 = (int)(index * kwaveFormTableSize) % kwaveFormTableSize;
	int i1 = (i0 + 1) % kwaveFormTableSize;
	double k = index - (int)index;
	double s0 = mTable[i0];
	double s1 = mTable[i1];
	return s0 + (s1 - s0) * k;
}
@end
