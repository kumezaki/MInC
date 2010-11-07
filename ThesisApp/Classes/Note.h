//
//  Note.h
//		
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ADSR.h"
#import "WaveFormTable.h"

@interface Note : NSObject {

	double mDuration;

	WaveFormTable	*mWaveTable;
	ADSR			*mADSR;

@public
	bool mOn;

	double mSR;

	double mFreq;
	double mAmp;

	double mTheta;

	SInt32 mSamplesPlayed;
	SInt32 mNumPlaySamples;
}

@property (readwrite, nonatomic) double mFreq;
@property (readwrite, nonatomic) double mAmp;

+(double) mtof:(double)midi_note;

-(void)	On:(WaveFormTable*)wavetable:(ADSR*)adsr;
-(void) Off;

-(double) GetSample;

-(double)	GetDuration;
-(void)		SetDuration:(double)duration;

-(void)		SetPercentOn:(double)percent;

@end
