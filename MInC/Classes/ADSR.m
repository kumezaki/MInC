//
//  ADSR.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ADSR.h"


@implementation ADSR

-(id)initWithADSR:(Float64)SR a:(Float64)a d:(Float64)d s:(Float64)s r:(Float64)r
{
	State = kADSR_Off;
	
	NumSamples_A = a == 0. ? 1 : a * SR;
	NumSamples_D = d == 0. ? 1 : d * SR;
	NumSamples_R = r == 0. ? 1 : r * SR;
	
	Delta_A = (1.0 - 0.0) / NumSamples_A;
	Delta_D = (s - 1.0) / NumSamples_D;
	Delta_R = (0.0 - s) / NumSamples_R;
	
	Level_S = s;

	SampleCount = 0;
	
	NowVal = 0.;
	
	return self;
}

-(void)on
{
	State = kADSR_A;
	SampleCount = 0;
	NowVal = 0.;
}

-(void)off
{
	State = kADSR_R;
	SampleCount = 0;
}

-(BOOL)isOn
{
	return State != kADSR_Off;
}

-(Float64)getNowVal
{

#define ADR_UPDATE(delta,num_samples,next_state) NowVal += delta; if (++SampleCount >= num_samples) { State = next_state; SampleCount = 0; }

	switch (State)
	{
		case kADSR_A: ADR_UPDATE(Delta_A,NumSamples_A,kADSR_D) break;
		case kADSR_D: ADR_UPDATE(Delta_D,NumSamples_D,kADSR_S) break;
		case kADSR_S: NowVal = Level_S; break;
		case kADSR_R: ADR_UPDATE(Delta_R,NumSamples_R,kADSR_Off) break;
		default: return 0.;
	}
	
	return NowVal > 1. ? 1. : NowVal < 0. ? 0. : NowVal;
}

@end
