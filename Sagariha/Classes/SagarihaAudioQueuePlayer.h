//
//  SagarihaAudioQueuePlayer.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

#import "SagarihaWaveTable.h"

#define kNumberBuffers	3

@interface SagarihaAudioQueuePlayer : NSObject {

	AudioQueueRef				mQueue;
	AudioQueueBufferRef			mBuffers[kNumberBuffers];
	AudioStreamBasicDescription	mDataFormat;
	
	BOOL				mPlaying;
	
@public

	double				mSR;
	double				mFreq;
	double				mAmp;
	double				mTheta;
	SagarihaWaveTable*	mWaveTable;
}

-(void)		Init;

-(OSStatus)	Start;
-(OSStatus)	Stop;

-(double)	GetSample;
-(void)		SetSample:(UInt32)index:(double)value;

@end
