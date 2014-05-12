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

#define kNumVoices		4
@interface AQPlayer : NSObject {

	AudioQueueRef				mQueue;
	AudioQueueBufferRef			mBuffers[kNumberBuffers];
	AudioStreamBasicDescription	mDataFormat;
	
	UInt16		mMute[kNumVoices];
}

-(void)	New;

-(OSStatus)	Start;
-(OSStatus)	Stop;

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples;

-(void)ReportMaxAmplitude:(double)max_amp;
-(void)ReportElapsedTime:(double)elapsed_time;

-(BOOL)GetMute:(UInt16)pos;
-(void)SetMute:(UInt16)pos:(BOOL)enable;

@end

@interface AQPlayer_SimpleSynth : AQPlayer {

	double	mTheta[kNumVoices];
	double	mDeltaTheta[kNumVoices];
}

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples;

@end

#import "SoundFile.h"

@interface AQPlayer_SimpleSF : AQPlayer {
	
	SoundFile*	mSoundFile[kNumVoices];
	Float64		mSpeed[kNumVoices];
}

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples;

-(void)SetSpeed:(UInt16)pos:(Float64)speed;

-(Float64)GetSFPos:(UInt16)pos;

@end
