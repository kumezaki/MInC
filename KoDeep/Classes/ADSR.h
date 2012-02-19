//
//  ADSR.h
//  hoo
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { kADSR_Off, kADSR_A, kADSR_D, kADSR_S, kADSR_R } ADSR_State;

@interface ADSR : NSObject {
	
	ADSR_State	mState;

	double	mSR;
	
	double	mNumSamples_A;
	double	mNumSamples_D;
	double	mNumSamples_R;
	
	double	mDelta_A;
	double	mDelta_D;
	double	mDelta_R;
	
	double	mLevel_S;

	SInt32	mSampleCount;

	double	mVal;

@public
}

-(id)initWithADSR:(double)SR a:(double)a d:(double)d s:(double)s r:(double)r;

-(void)On;
-(void)Off;

-(BOOL)IsOn;

-(double)Get;

@end
