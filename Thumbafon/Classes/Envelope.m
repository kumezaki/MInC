//
//  Envelope.m
//  Thumbafon
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Envelope.h"

#import "AQPlayer.h"//for kSR setting only
#define RAMP_TIME_ON	(kSR * 0.001)
#define RAMP_TIME_OFF	(kSR * 0.05)

@implementation Envelope

-(id)init {
	mAmp = 0.;
	mDelta = 0.;
	return self;
}

- (void)setEnv:(NSString *)waveType {
	NSLog(@"%@",waveType);
}

-(void)envelopeOn {
	mDelta = 1. / RAMP_TIME_ON;
}

-(void)envelopeOff {
	mDelta = -1. / RAMP_TIME_OFF;
}

-(double)envelopeGet {
	mAmp += mDelta;
	
	if (mAmp >= 1.0) {
		mAmp = 1.0; 
		mDelta = 0.;
	}
	else if (mAmp <= 0.0) {
		mAmp = 0.; 
		mDelta = 0.;
	}
	return mAmp;
}

@end
