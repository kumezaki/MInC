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
	for (int i = 0; i < kAudioDataByteSize; i++) {
		
		double mTheta = (double)i / kAudioDataByteSize;
		mTable[i] = 0;
		
		if ([mWaveType isEqual:@"E.Piano"]) {
			mTable[i] = MAX_AMP * sin(mTheta * 2. * M_PI);
		}
		else if ([mWaveType isEqual:@"Pad"]) {
			for (int j = 1; j <= 11; j += 2) {
				mTable[i] += sin(j * mTheta * 2. * M_PI)* MAX_AMP / j;
			}
			//mTable[i] = MAX_AMP * SIGN(sinf(mTheta * 2 * M_PI));
		}
		else if ([mWaveType isEqual:@"Brass"]) {
			for (int j = 1; j <= 10; j += 1) {
				mTable[i] += sin(j * mTheta * 2. * M_PI)* MAX_AMP / j;
			}	
			//mTable[i] = MAX_AMP * 2 * (mTheta - floor(mTheta + 0.5));
		}
		else if ([mWaveType isEqual:@"Flute"]) {
			for (int j = 1; j <= 11; j += 2) {
				mTable[i] += sin(j * mTheta * 2. * M_PI) * MAX_AMP / (j * j);
			}
			//mTable[i] = MAX_AMP * (fabs(2 * (mTheta - floor(mTheta + 0.5))) * 2 - 1.);
		}
		else if ([mWaveType isEqual:@"Organ"]) {
			for (int j = 1; j <= 2; j += 1) {
				mTable[i] += sin(j * mTheta * 2. * M_PI) * MAX_AMP;
			}
		}		
	}
}

-(double) get:(double)index {
	int i = index * kAudioDataByteSize;
	i %= kAudioDataByteSize;
	return mTable[i];
}

@end
