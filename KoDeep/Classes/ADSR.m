//
//  ADSR.m
//  hoo
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ADSR.h"


@implementation ADSR

-(id)initWithADSR:(double)SR a:(double)a d:(double)d s:(double)s r:(double)r
{
	mState = kADSR_Off;
	
	mSR = SR;
	
	mNumSamples_A = a == 0. ? 1 : a * mSR;
	mNumSamples_D = d == 0. ? 1 : d * mSR;
	mNumSamples_R = r == 0. ? 1 : r * mSR;
	
	mDelta_A = (1.0 - 0.0) / mNumSamples_A;
	mDelta_D = (s - 1.0) / mNumSamples_D;
	mDelta_R = (0.0 - s) / mNumSamples_R;
	
	mLevel_S = s;

	mSampleCount = 0;
	
	mVal = 0.;
	
	return self;
}

-(void)On
{
	mState = kADSR_A;
	mSampleCount = 0;
	mVal = 0.;
}

-(void)Off
{
	mState = kADSR_R;
	mSampleCount = 0;
}

-(BOOL)IsOn
{
	return mState != kADSR_Off;
}

-(double)Get
{

#define ADR_UPDATE(delta,num_samples,next_state) mVal += delta; if (++mSampleCount >= num_samples) { mState = next_state; mSampleCount = 0; }

	switch (mState)
	{
		case kADSR_A: ADR_UPDATE(mDelta_A,mNumSamples_A,kADSR_D) break;
		case kADSR_D: ADR_UPDATE(mDelta_D,mNumSamples_D,kADSR_S) break;
		case kADSR_S: mVal = mLevel_S; break;
		case kADSR_R: ADR_UPDATE(mDelta_R,mNumSamples_R,kADSR_Off) break;
		default: return 0.;
	}
	
	return mVal;
}

@end
