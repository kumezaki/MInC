//
//  Envelope.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Envelope.h"

@implementation Envelope

-(id)init
{
	mSR = 22050.;
	mAmp = 0.;
	mDelta = 0.;
	mRampTime = mSR * 0.05;
	return self;
}

-(void)on
{
	mDelta = 1. / mRampTime;
}

-(void)off
{
	mDelta = -1. / mRampTime;
}

-(double)get
{
	mAmp += mDelta;
	
	if (mAmp >= 1.0) { mAmp = 1.; mDelta = 0.; }
	else if (mAmp <= 0.0) { mAmp = 0.; mDelta = 0.; }
	return mAmp;
}

@end
