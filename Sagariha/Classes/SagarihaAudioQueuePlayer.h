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
#define kBufferDurationSeconds .5

@interface SagarihaAudioQueuePlayer : NSObject {
    
    AudioStreamBasicDescription	mDataFormat;
    AudioQueueRef				mQueue;
	AudioQueueBufferRef			mBuffers[kNumberBuffers];
	
    AudioFileID						mAudioFile;
    CFStringRef						mFilePath;
    UInt32							mNumPacketsToRead;
    SInt64							mCurrentPacket;
    
    BOOL							mIsDone;
    BOOL                            mIsLooping;

    
@public
    
	BOOL				mIsPlaying;
	
	double				mSR;
	double				mFreq;
	double				mAmp;
	double				mTheta;
	SagarihaWaveTable*	mWaveTable;
	
	double				mLoopStart;
	double				mLoopEnd;
}

-(void)		createAQ;

-(OSStatus)	Start;
-(OSStatus)	Stop;

-(double)	GetSample;
-(void)		SetSample:(UInt32)index:(double)value;

-(void)    CalculateBytesForTime:(AudioStreamBasicDescription)inDesc
                                :(UInt32)inMaxPacketSize
                                :(Float64)inSeconds
                                :(UInt32*)outBufferSize
                                :(UInt32*)outNumPackets;

@end
