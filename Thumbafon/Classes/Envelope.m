//
//  Envelope.m
//  Thumbafon
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Envelope.h"

#import "AQPlayer.h"//for kSR setting only
#define RAMP_TIME (kSR * 0.05)

@implementation Envelope

-(id)init {
	mAmp = 0.;
	mDelta = 0.;
	return self;
}

- (void)setEnv:(NSString *)waveType {
	if ([waveType isEqual:@"E.Piano"]) {
		mAttack = kSR * 0.001;
		mRelease = kSR * 0.01;
		mSustainAmp = 0.9;
	}
	else if ([waveType isEqual:@"Pad"]) {
		mAttack = kSR * 0.5;
		mRelease = kSR * 0.5;
		mSustainAmp = 1.0;
	}
	else if ([waveType isEqual:@"Brass"]) {
		mAttack = kSR * 0.009;
		mRelease = kSR * 0.01;
		mSustainAmp = 0.6;
	}
	else if ([waveType isEqual:@"Organ"]) {
		mAttack = kSR * 0.01;
		mRelease = kSR * 0.05;
		mSustainAmp = 1.0;
	}
	else if ([waveType isEqual:@"Flute"]) {
		mAttack = kSR * 0.05;
		mRelease = kSR * 0.05;
		mSustainAmp = 1.0;
	}
	else {
		mAttack = kSR * 0.05;
		mRelease = kSR * 0.05;
		mSustainAmp = 0.9;
	}
	
}

-(void)on {
	mDelta = 1. / mAttack;
}

-(void)off {
	mDelta = -1. / mRelease;
}

-(double)get {
	mAmp += mDelta;
	
	if (mAmp >= 1.0) {
		mAmp = mSustainAmp; 
		mDelta = 0.;
	}
	else if (mAmp <= 0.0) {
		mAmp = 0.; 
		mDelta = 0.;
	}
	return mAmp;
}

@end
