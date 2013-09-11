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

	Float64			mDuration;
	
	ADSR			*mADSR;
	
	SInt16			mOutBuffer[kIOBufferSize];

@public
	bool mOn;
	
	Float64 mSR;
	
	Float64 mSamplesPlayed;
	SInt32 mNumPlaySamples;
}

-(void)	On:(ADSR*)adsr;
-(void) Off;

-(Float64) GetSample;

-(Float64)	GetDuration;
-(void)		SetDuration:(Float64)duration;

-(void)		SetPercentOn:(Float64)percent;

@end
