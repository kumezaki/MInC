//
//  WaveFormTable.m
//  Music 147
//
//  Created by Chris Lavender on 4/14/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "WaveFormTable.h"

@implementation WaveFormTable


-(id)init {
	[super init];
	return self;
}

#define SIGN(x)	(x < 0. ? -1. : x > 0. ? +1. : 0.)

-(void) createWaveType:(NSString *)waveType {
	mWaveType = waveType;
	if ([mWaveType isEqual:@"sine wave"]) {
		for (int i = 0; i < kWaveformTableSize; i++) {
			mTable[i] = sinf((double)i / kWaveformTableSize * 2. * M_PI);
		}
	}
	else if ([mWaveType isEqual:@"square wave"]) {
		for (int i = 0; i < kWaveformTableSize; i++) {
			double mTheta = (double)i / kWaveformTableSize;
			mTable[i] = SIGN(sinf(mTheta * 2 * M_PI));
		}
	}
	else if ([mWaveType isEqual:@"sawtooth wave"]) {
		for (int i = 0; i < kWaveformTableSize; i++) {
			double mTheta = (double)i / kWaveformTableSize;
			mTable[i] = 2 * (mTheta - floor(mTheta + 0.5));
		}
	}
	else if ([mWaveType isEqual:@"triangle wave"]) {
		for (int i = 0; i < kWaveformTableSize; i++) {
			double mTheta = (double)i / kWaveformTableSize;
			mTable[i] = (fabs(2 * (mTheta - floor(mTheta + 0.5))) * 2 - 1.);
		}
	}
}

-(double) get:(double)index {
	int i = index * kWaveformTableSize;
	i %= kWaveformTableSize;
	return mTable[i];
}

@end
