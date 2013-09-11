//
//  ADSR.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { kADSR_Off, kADSR_A, kADSR_D, kADSR_S, kADSR_R } ADSR_State;

@interface ADSR : NSObject {
	
	ADSR_State	mState;

	Float64	mSR;
	
	Float64	mNumSamples_A;
	Float64	mNumSamples_D;
	Float64	mNumSamples_R;
	
	Float64	mDelta_A;
	Float64	mDelta_D;
	Float64	mDelta_R;
	
	Float64	mLevel_S;

	SInt32	mSampleCount;

	Float64	mVal;

@public
}

-(id)initWithADSR:(Float64)SR a:(Float64)a d:(Float64)d s:(Float64)s r:(Float64)r;

-(void)On;
-(void)Off;

-(BOOL)IsOn;

-(Float64)Get;

@end
