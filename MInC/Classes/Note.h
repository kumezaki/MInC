//
//  Note.h
//		
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Envelope.h"
#import "WaveFormTable.h"

@interface Note : NSObject {

	Float64 mDuration;

	WaveFormTable	*mWaveTable;
	Envelope		*mEnv;

@public
	Float64 mSR;

	Float64 mFreq;
	Float64 mAmp;

	SInt32 mSamplesPlayed;
	SInt32 mNumPlaySamples;
}

@property (readwrite, nonatomic) Float64 mFreq;
@property (readwrite, nonatomic) Float64 mAmp;

+(Float64) mtof:(Float64)midi_note;

-(void)	On:(WaveFormTable*)wavetable :(Envelope*)env;
-(void) Off;

-(Float64) AddSamples:(Float64*)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta;

-(Float64)	GetDuration;
-(void)		SetDuration:(Float64)duration;

-(void)		SetPercentOn:(Float64)percent;

-(void)     SetFrequency:(Float64)freq;

@end
