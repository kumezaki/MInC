//
//  WaveFormTable.m
//  Thumbafon
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
	if ([mWaveType isEqual:@"SineWave"]) {
		for (int i = 0; i < kAudioDataByteSize; i++) {
			mTable[i] = sinf((double)i / kAudioDataByteSize * 2. * M_PI);
		}
	}
	else if ([mWaveType isEqual:@"SquareWave"]) {
		for (int i = 0; i < kAudioDataByteSize; i++) {
			double mTheta = (double)i / kAudioDataByteSize;
			mTable[i] = SIGN(sinf(mTheta * 2 * M_PI));
		}
	}
	else if ([mWaveType isEqual:@"SawtoothWave"]) {
		for (int i = 0; i < kAudioDataByteSize; i++) {
			double mTheta = (double)i / kAudioDataByteSize;
			mTable[i] = 2 * (mTheta - floor(mTheta + 0.5));
		}
	}
	else if ([mWaveType isEqual:@"TriangleWave"]) {
		for (int i = 0; i < kAudioDataByteSize; i++) {
			double mTheta = (double)i / kAudioDataByteSize;
			mTable[i] = (fabs(2 * (mTheta - floor(mTheta + 0.5))) * 2 - 1.);
		}
	}
}

-(double) get:(double)index {
	int i = index * kAudioDataByteSize;
	i %= kAudioDataByteSize;
	return mTable[i];
}

@end
