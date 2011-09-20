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

#define _old_AQ_ 0

#define kNumberBuffers	3
#define kBufferDurationSeconds .5

@class SagarihaAudioQueuePlayer;

@protocol SagarihaAudioQueuePlayerDelegate
- (void) audioQueueError:(NSString*)msg;
- (void) audioQueuePlayingState:(BOOL)state;
@end

@interface SagarihaAudioQueuePlayer : NSObject {
    
    AudioStreamBasicDescription	mDataFormat;
    AudioQueueRef				mQueue;
	AudioQueueBufferRef			mBuffers[kNumberBuffers];

    AudioFileID     mAudioFile;
    CFStringRef     mFilePath;
    UInt32          mNumPacketsToRead;
    SInt64          mCurrentPacket;
        
    bool            mIsDone; // C99 boolean inherited from exampl code
    bool            mIsLooping;
    
@public
    
	BOOL                mPaused;
	double				mSR;
	double				mFreq;
	double				mAmp;
	double				mTheta;
	SagarihaWaveTable   *mWaveTable;
	
	double				mLoopStart;
	double				mLoopEnd;
}
@property (nonatomic, assign) id<SagarihaAudioQueuePlayerDelegate> delegate;
@property (nonatomic, retain) NSString *theFile;
@property (nonatomic) double mAmp;
@property (nonatomic) BOOL isPlaying;

-(void)		createAQ;
-(void)     readAudioFile;

-(OSStatus)	Start;
-(OSStatus)	Stop;
-(OSStatus) Pause;

-(double)	GetSample;
-(void)		SetSample:(UInt32)index:(double)value;

#if _old_AQ_
#else
-(void)    CalculateBytesForTime:(AudioStreamBasicDescription)inDesc
                                :(UInt32)inMaxPacketSize
                                :(Float64)inSeconds
                                :(UInt32*)outBufferSize
                                :(UInt32*)outNumPackets;
#endif
@end
