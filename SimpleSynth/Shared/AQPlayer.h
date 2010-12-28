//
//  AQPlayer.h
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

#define kNumberBuffers	3

#define kSR				22050.

@interface AQPlayer : NSObject {

	AudioQueueRef				mQueue;
	AudioQueueBufferRef			mBuffers[kNumberBuffers];
	AudioStreamBasicDescription	mDataFormat;
	
@public
}

-(void)	New;

-(OSStatus)	Start;
-(OSStatus)	Stop;

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples;

-(void)ReportMaxAmplitude:(double)max_amp;
-(void)ReportElapsedTime:(double)elapsed_time;

@end

#define kNumNotes	1
@interface AQPlayer_SimpleSynth : AQPlayer {

	double	mTheta[kNumNotes];
	double	mDeltaTheta[kNumNotes];
}

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples;

@end

#import "SoundFile.h"

#define kNumSFs		4
@interface AQPlayer_SimpleSF : AQPlayer {
	
	SoundFile*	mSoundFile[kNumSFs];
	Float64		mSpeed[kNumSFs];
}

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples;

-(void)SetSpeed:(UInt16)sf_pos:(Float64)speed;

-(Float64)GetSFPos:(UInt16)sf_pos;

@end
