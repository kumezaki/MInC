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
	return self;
}

-(void) createWaveType:(NSString *)waveType
{
	mWaveType = waveType;
	if ([mWaveType isEqual:@"sine wave"]) {
		for (int i = 0; i < kWaveformTableSize; i++)
		{
			mTable[i] = sin((double)i / kWaveformTableSize * 2. * 3.1415926353);
		}
	}
	else if ([mWaveType isEqual:@"square wave"]){
		for (int i = 0; i < kWaveformTableSize; i++)
		{
			if (i < (kWaveformTableSize / 2)) mTable[i] = 1;
			else mTable[i] = -1;
		}
	}
	else if ([mWaveType isEqual:@"sawtooth wave"]){
		for (int i = 0; i < kWaveformTableSize; i++)
		{
			double mTheta = (double)i / kWaveformTableSize;
			mTable[i] = mTheta - floor(mTheta + 0.5);
		}
	}		
	
}

-(double) get:(double)index
{
	int i = index * kWaveformTableSize;
	i %= kWaveformTableSize;
	return mTable[i];
}

@end
