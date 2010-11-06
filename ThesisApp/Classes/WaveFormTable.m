//
//  WaveFormTable.m
//  Music 147
//
//  Created by Chris Lavender on 4/14/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "WaveFormTable.h"


@implementation WaveFormTable

-(id)init
{
	[super init];

	for (int i = 0; i < kWaveformTableSize; i++)
	{
#if 1
		mTable[i] = sin((double)i / kWaveformTableSize * 2. * 3.1415926353);
#else
		if (i < (kWaveformTableSize / 2))
			mTable[i] = 1;
		else
			mTable[i] = -1;
#endif
		printf("%f\n",mTable[i]);
	}
	
	return self;
}

-(double) get:(double)index
{
	int i = index * kWaveformTableSize;
	i %= kWaveformTableSize;
	return mTable[i];
}

@end
