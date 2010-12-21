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

	double mDuration;

	WaveFormTable	*mWaveTable;
	Envelope		*mEnv;

@public
	double mSR;

	double mFreq;
	double mAmp;

	SInt32 mSamplesPlayed;
	SInt32 mNumPlaySamples;
}

@property (readwrite, nonatomic) double mFreq;
@property (readwrite, nonatomic) double mAmp;

+(double) mtof:(double)midi_note;

-(void)	On:(WaveFormTable*)wavetable:(Envelope*)env;
-(void) Off;

-(double) AddSamples:(double*)buffer:(const int)num_frames:(double)scale:(double)theta;

-(double)	GetDuration;
-(void)		SetDuration:(double)duration;

-(void)		SetPercentOn:(double)percent;

@end
