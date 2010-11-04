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
//populate the table with a sine wave		mTable[i] = sin((double)i / kWaveformTableSize * 2. * 3.1415926353);
		if (i < (kWaveformTableSize / 2))
			mTable[i] = 1;
		else
			mTable[i] = -1;

		printf("%f\n",mTable[i]);
	}
	
	return self;
}

-(double) Get:(double)index
{
	int i = index * kWaveformTableSize;
	i %= kWaveformTableSize;
	return mTable[i];
}

@end
