//
//  SoundFile.h
//  MInC
//
//  Created by Kojiro Umezaki on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#import "ADSR.h"

#define kIOBufferSize	512

@interface SoundFile : NSObject {

	AudioFileID		mFileID;

	double			mDuration;
	
	ADSR			*mADSR;
	
	SInt16			mOutBuffer[kIOBufferSize];

@public
	bool mOn;
	
	double mSR;
	
	double mSamplesPlayed;
	SInt32 mNumPlaySamples;
}

-(void)	On:(ADSR*)adsr;
-(void) Off;

-(double) GetSample;

-(double)	GetDuration;
-(void)		SetDuration:(double)duration;

-(void)		SetPercentOn:(double)percent;

@end
