//
//  ADSR.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum { kADSR_Off, kADSR_A, kADSR_D, kADSR_S, kADSR_R } ADSR_State;

@interface MInC_ADSR : NSObject {
	
	ADSR_State	State;

	Float64	NumSamples_A;
	Float64	NumSamples_D;
	Float64	NumSamples_R;
	
	Float64	Delta_A;
	Float64	Delta_D;
	Float64	Delta_R;
	
	Float64	Level_S;

	SInt32	SampleCount;

	Float64	NowVal;

@public
}

-(id)initWithADSR:(Float64)SR a:(Float64)a d:(Float64)d s:(Float64)s r:(Float64)r;

-(void)on;
-(void)off;

-(BOOL)isOn;

-(Float64)getNowVal;

@end
