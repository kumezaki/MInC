//
//  AQPlayer.m
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AQPlayer.h"

AQPlayer *gAQP = nil;

@implementation AQPlayer

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{
    AQPlayer *aqp = (AQPlayer *)inUserData;
	
	const int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
	
	double buffer[numFrames];
	memset(buffer,0,sizeof(double)*numFrames);
	
	[aqp FillAudioBuffer:buffer:numFrames];
	
	double max_amp = 0.;
	for (int i = 0; i < numFrames; i++)
	{
		max_amp = fabs(buffer[i]) > max_amp ? fabs(buffer[i]) : max_amp;
		((SInt16 *)inAQBuffer->mAudioData)[i] = buffer[i] * (SInt16)0x7FFF;
	}
	
	double elapsed_time = numFrames / kSR;
	
	[aqp ReportMaxAmplitude:max_amp];
	[aqp ReportElapsedTime:elapsed_time];
	
	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

- (void)dealloc {

	[self Stop];
	
	[super dealloc];
}

- (id)init
{
	[super init];
	
	[self Start];

	return self;
}

-(void) New
{
	mDataFormat.mFormatID = kAudioFormatLinearPCM;
	mDataFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger;
	mDataFormat.mChannelsPerFrame = 1;
	mDataFormat.mSampleRate = kSR;
	mDataFormat.mBitsPerChannel = 16;
	mDataFormat.mFramesPerPacket = 1;
	mDataFormat.mBytesPerPacket = sizeof(SInt16);
	mDataFormat.mBytesPerFrame = sizeof(SInt16);

    OSStatus result = AudioQueueNewOutput(&mDataFormat, AQBufferCallback, self, nil, nil, 0, &mQueue);
	
	if (result != noErr)
		printf("AudioQueueNewOutput %ld\n",result);
	
    for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		if (result != noErr)
			printf("AudioQueueAllocateBuffer %ld\n",result);
	}
}

-(OSStatus)Start
{
	OSStatus result = noErr;

    // if we have no queue, create one now
    if (mQueue == nil)
        [self New];
    
    // prime the queue with some data before starting
    for (int i = 0; i < kNumberBuffers; ++i)
        AQBufferCallback(self, mQueue, mBuffers[i]);            
	
    result = AudioQueueStart(mQueue, nil);
		
	return result;
}

-(OSStatus)Stop
{
	OSStatus result = noErr;

    result = AudioQueueStop(mQueue, true);
	
	return result;
}

-(void)FillAudioBuffer:(double*)buffer:(const int)num_frames
{
//	NSLog(@"AQPlayer FillAudioBuffer %d",num_frames);
}

-(void)ReportMaxAmplitude:(double)max_amp
{
//	NSLog(@"AQPlayer ReportMaxAmplitude %lf",max_amp);
}

-(void)ReportElapsedTime:(double)elapsed_time
{
//	NSLog(@"AQPlayer ReportElapsedTime %lf",elapsed_time);
}

@end

@implementation AQPlayer_SimpleSynth

-(id)init
{
	[super init];
	
	for (int i = 0; i < kNumNotes; i++)
	{
		mTheta[i] = 0.;

		double ratio = 1.;
		switch (i)
		{
			case 1: ratio = (3. / 2.);
		}
		mDeltaTheta[i] = (ratio) * 440. / kSR;
	}
	
	return self;
}

#define SIGN(x)	(x < 0. ? -1. : x > 0. ? +1. : 0.)

-(void)FillAudioBuffer:(double*)buffer:(const int)num_frames
{
	memset(buffer,0,num_frames*sizeof(double));	/* sets buffer to all zeros */

	double amp = 0.5;

	for (int j = 0; j < kNumNotes; j++)
		for (int i = 0; i < num_frames; i++)
		{
#if 1
			buffer[i] += amp * sinf(mTheta[j] * 2 * M_PI);					/* sine */
#elif 0
			buffer[i] += amp * 2 * (mTheta[j] - floor(mTheta[j] + 0.5));	/* sawtooth */
#elif 0
			buffer[i] += amp * SIGN(sinf(mTheta[j] * 2 * M_PI));			/* square */
#endif
			mTheta[j] += mDeltaTheta[j];

#if 0
			if (j == kNumNotes - 1)
				printf("%d%s",(SInt16)(buffer[i] * (SInt16)0x7FFF),i<num_frames-1?" ":"\n\n");
#endif
		}
}

@end
