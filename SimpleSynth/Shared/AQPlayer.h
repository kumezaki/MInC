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

-(void)FillAudioBuffer:(double*)buffer:(const int)num_frames;

-(void)ReportMaxAmplitude:(double)max_amp;
-(void)ReportElapsedTime:(double)elapsed_time;

@end

#define kNumNotes	2
@interface AQPlayer_SimpleSynth : AQPlayer {

	double	mTheta[kNumNotes];
	double	mDeltaTheta[kNumNotes];
}

-(void)FillAudioBuffer:(double*)buffer:(const int)num_frames;

@end
