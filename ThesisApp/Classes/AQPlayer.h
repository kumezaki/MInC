//
//  AQPlayer.h
//  Music 147
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#define kNumberBuffers 3
#define kSR 22050.
#define kAudioDataByteSize 512
#define MAX_AMP	1.

@interface AQPlayer : NSObject {

	AudioStreamBasicDescription		mDataFormat;
	AudioQueueRef					mQueue;
	AudioQueueBufferRef				mBuffers[kNumberBuffers];

}

@property int numTouches;

- (void) newAQ;

- (OSStatus) start;
- (OSStatus) stop;

- (void)fillAudioBuffer:(double*)sampleBuffer:(UInt32)numFrames;

- (void)ReportMaxAmplitude:(double)mMaxAmp;
- (void)ReportElapsedTime:(double)elapsedTime;

@end
