//
//  AQPlayer.m
//  Music 147
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "AQPlayer.h"

AQPlayer *gAQP = nil;

@implementation AQPlayer

@synthesize numTouches;//temp

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) {	
	
	AQPlayer *aqp = (AQPlayer *)inUserData;
	
	const int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
	
	double sampleBuffer[numFrames];
	memset(sampleBuffer,0,sizeof(double)*numFrames); // KU: initialize all sampleBuffer elements to 0. here.
	
	[aqp fillAudioBuffer:sampleBuffer:numFrames];
	
	// KU: now that the buffer is filled with samples with all notes, apply limiter and scale to 16-bit linear PCM	
	double mMaxAmp = 0.;
	double sample = 0.;	
	for (int i = 0; i < numFrames; i++) {	
		//raw mMaxAmp
		//mMaxAmp = fabs(sampleBuffer[i]) > mMaxAmp ? fabs(sampleBuffer[i]) : mMaxAmp;
		
		sample = sampleBuffer[i];
		//sample = sample/aqp.numTouches;
		
		((SInt16*)inAQBuffer->mAudioData)[i] = sample * (SInt16)0x7FFF;
	}
	
	double elapsedTime = numFrames / kSR;
	
	[aqp ReportMaxAmplitude:mMaxAmp];
	[aqp ReportElapsedTime:elapsedTime];
	
	inAQBuffer->mAudioDataByteSize = kAudioDataByteSize;
	inAQBuffer->mPacketDescriptionCount = 0;
		
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}


-(id)init {
	[self start];
	return self;
}


- (void)dealloc {
	[self stop];
	[super dealloc];
}


-(void) newAQ {
	mDataFormat.mSampleRate = kSR;
	mDataFormat.mFormatID = kAudioFormatLinearPCM;
	mDataFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger;
	mDataFormat.mBytesPerPacket = sizeof(SInt16);
	mDataFormat.mFramesPerPacket = 1;
	mDataFormat.mBytesPerFrame = sizeof(SInt16);
	mDataFormat.mChannelsPerFrame = 1;
	mDataFormat.mBitsPerChannel = 16;

	OSStatus result = AudioQueueNewOutput(&mDataFormat, AQBufferCallback, self, nil, nil, 0, &mQueue);

	if (result != noErr)
		printf("AudioQueueNewOutput \n",result);
	
	for (int i = 0; i < kNumberBuffers; ++i) {
		result = AudioQueueAllocateBuffer(mQueue, kAudioDataByteSize, &mBuffers[i]);
		if (result != noErr)
			printf("AudioQueueAllocateBuffer \n",result);
	}
}

-(OSStatus) start; { 
	OSStatus result = noErr;
    
	// if we have no queue, create one now
	if (mQueue == nil)
		[self newAQ];
	
	// prime the queue with some data before starting
	for (int i = 0; i < kNumberBuffers; ++i)
		AQBufferCallback(self, mQueue, mBuffers[i]);
	
	result = AudioQueueStart(mQueue, nil);
	
	return result;
}


-(OSStatus) stop; {
	OSStatus result = noErr;
	
	result = AudioQueueStop(mQueue, true);
	
	return result;
}

- (void)fillAudioBuffer:(double*)buffer:(UInt32)numFrames {
}

-(void)ReportMaxAmplitude:(double)mMaxAmp
{
	if (mMaxAmp > 0) {
		//NSLog(@"AQPlayer ReportmMaxAmplitude %lf",mMaxAmp);
	}
}

-(void)ReportElapsedTime:(double)elapsedTime
{
	//NSLog(@"AQPlayer ReportElapsedTime %lf",elapsedTime);
}

@end
