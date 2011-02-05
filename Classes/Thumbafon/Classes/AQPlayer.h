//
//  AQPlayer.h
//  Thumbafon
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>


#define kNumberBuffers 3
#define kNumberModes 6
#define kNumberVoices 8

#define kSR 22050.
#define kAudioDataByteSize 512 //used for buffer size
#define MAX_AMP	1.0 //used for limiter as well as base amp info

@interface AQPlayer : NSObject {

	AudioStreamBasicDescription		mDataFormat;
	AudioQueueRef					mQueue;
	AudioQueueBufferRef				mBuffers[kNumberBuffers];
	
	
}

- (void)newAQ;

- (OSStatus)start;
- (OSStatus)stop;

- (void)fillAudioBuffer:(Float64*)sampleBuffer:(UInt32)numFrames;

@end