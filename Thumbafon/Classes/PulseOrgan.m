//
//  PulseOrgan.m
//  Thumbafon
//
//  Created by Chris Lavender on 2/4/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import "PulseOrgan.h"
#import "AQPlayer.h"

@implementation PulseOrgan

- (id)init {
	[super init];

	//Create WaveTable
	for (UInt32 i = 0; i < kAudioDataByteSize; i++) {

		mTheta = (Float64)i / kAudioDataByteSize;
		mTable[i] = 0;
		
		for (UInt8 j = 1; j <= 2; j += 1) {
			mTable[i] += sin(j * mTheta * 2. * M_PI) * MAX_AMP;
		}
	}		
	
	//Set Envelope Settings
	mAttack = kSR * 0.01;
	mRelease = kSR * 0.05;
	mSustain = 1.0;
	
	return self;
}

- (void)dealloc {
	[super dealloc];
}

@end
