//
//  WaveFormTable.m
//  Thumbafon
//
//  Created by Chris Lavender on 4/14/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "WaveFormTable.h"

@implementation WaveFormTable

@synthesize mAmp;

-(id)init {
	[super init];
	mAmp = MAX_AMP*.25;
	return self;
}

#define SIGN(x)	(x < 0. ? -1. : x > 0. ? +1. : 0.)

-(void) createWaveType:(NSString *)waveType {
	mWaveType = waveType;	
	for (int i = 0; i < kAudioDataByteSize; i++) {
		double mTheta = (double)i / kAudioDataByteSize;
		if ([mWaveType isEqual:@"SineWave"]) mTable[i] = mAmp * sinf(mTheta * 2. * M_PI);
		else if ([mWaveType isEqual:@"SquareWave"]) mTable[i] = mAmp * SIGN(sinf(mTheta * 2 * M_PI));
		else if ([mWaveType isEqual:@"SawtoothWave"]) mTable[i] = mAmp * 2 * (mTheta - floor(mTheta + 0.5));
		else if ([mWaveType isEqual:@"TriangleWave"]) mTable[i] = mAmp * (fabs(2 * (mTheta - floor(mTheta + 0.5))) * 2 - 1.);
	}
}

-(double) get:(double)index {
	int i = index * kAudioDataByteSize;
	i %= kAudioDataByteSize;
	return mTable[i];
}

@end
