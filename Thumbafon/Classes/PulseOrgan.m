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
	Float32 mMaxAmp = MAX_AMP * .75;
	//Create WaveTable
	for (UInt32 i = 0; i < kAudioDataByteSize; i++) {

		mTable[i] = 0;
		mTheta = (Float64)i / kAudioDataByteSize;
		
		for (UInt8 j = 1; j <= 2; j += 1) {
			mTable[i] += sin(j * mTheta * 2. * M_PI) * mMaxAmp;
		}
	}		
	//Set Envelope Settings
	mAttack = kSR * 0.01;
	mRelease = kSR * 0.05;
	mSustain = 1.0;
	
	self.mVoiceReg = 0;

	return self;
}

- (void)dealloc {
	[super dealloc];
}

@end
