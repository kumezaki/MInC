//
//  SagarihaAudioQueuePlayer.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SagarihaAudioQueuePlayer.h"

SagarihaAudioQueuePlayer *gAQP = nil;

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{
    SagarihaAudioQueuePlayer *aqp = (SagarihaAudioQueuePlayer *)inUserData;
	
	int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);

	for (int i = 0; i < numFrames; i++)
		((SInt16 *)inAQBuffer->mAudioData)[i] = 0.5 * [aqp GetSample] * (SInt16)0x7FFF;
	
	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation SagarihaAudioQueuePlayer

- (void)dealloc {

	[self Stop];
	
	[mWaveTable dealloc];
			
	[super dealloc];
}

- (id)init
{
	[super init];
	
	gAQP = self;
	
	mPlaying = NO;
	
	mSR = 22050.;
	mFreq = 880.;
	mAmp = 1.0;
	mTheta = 0.;
	mWaveTable = [[SagarihaWaveTable alloc] init];

	mLoopStart = 0.;
	mLoopEnd = 1.;

	return self;
}

-(void)Init
{
	mDataFormat.mFormatID = kAudioFormatLinearPCM;
	mDataFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger;
	mDataFormat.mChannelsPerFrame = 1;
	mDataFormat.mSampleRate = mSR;
	mDataFormat.mBitsPerChannel = 16;
	mDataFormat.mFramesPerPacket = 1;
	mDataFormat.mBytesPerPacket = sizeof(SInt16);
	mDataFormat.mBytesPerFrame = sizeof(SInt16);

    OSStatus result = AudioQueueNewOutput(&mDataFormat, AQBufferCallback, self, nil, nil, 0, &mQueue);
	
	if (result != noErr)
		NSLog(@"AudioQueueNewOutput %ld\n",result);
	
    for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		if (result != noErr)
			NSLog(@"AudioQueueAllocateBuffer %ld\n",result);
	}
}

-(OSStatus)Start
{
	OSStatus result = noErr;

    // if we have no queue, create one now
    if (mQueue == nil)
        [self Init];
    
	if (!mPlaying)
	{
		// prime the queue with some data before starting
		for (int i = 0; i < kNumberBuffers; ++i)
			AQBufferCallback(self, mQueue, mBuffers[i]);            
	
		result = AudioQueueStart(mQueue, nil);

		mPlaying = YES;
	}
		
	return result;
}

-(OSStatus)Stop
{
	OSStatus result = noErr;

	if (mPlaying)
	{
		result = AudioQueueFlush(mQueue);            
		NSLog(@"AudioQueueFlush %d",result);
		
		result = AudioQueueStop(mQueue, true);
		NSLog(@"AudioQueueStop %d",result);
	
		mPlaying = NO;
	}

	return result;
}

-(double)GetSample
{
	double sample = [mWaveTable Get:mTheta] * mAmp;
#if 0
	mTheta += mFreq / mSR;
#else
	mTheta += 1. / kWaveTableSize;
	if (mTheta > mLoopEnd) mTheta = mLoopStart + (mTheta - mLoopEnd);
#endif
	return sample;
}

-(void)SetSample:(UInt32)index:(double)value
{
	[mWaveTable Set:index:value];
}

@end
