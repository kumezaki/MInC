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

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples
{
//	NSLog(@"AQPlayer FillAudioBuffer %d",num_samples);
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

- (void)dealloc {
	
	[super dealloc];
}

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

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples
{
	double amp = 1. / kNumNotes;

	for (int j = 0; j < kNumNotes; j++)
		for (int i = 0; i < num_samples; i++)
		{
#if 1
			buffer[i] += amp * sinf(mTheta[j] * 2 * M_PI);									/* sine */
#elif 0
			buffer[i] += amp * 2 * (mTheta[j] - floor(mTheta[j] + 0.5));					/* sawtooth */
#elif 0
			buffer[i] += amp * SIGN(sinf(mTheta[j] * 2 * M_PI));							/* square */
#elif 0
			buffer[i] += amp * (fabs(2 * (mTheta[j] - floor(mTheta[j] + 0.5))) * 2 - 1.);	/* triangle */
#endif
			mTheta[j] += mDeltaTheta[j];

#if 0
			if (j == kNumNotes - 1)
				printf("%d%s",(SInt16)(buffer[i] * (SInt16)0x7FFF),i<num_samples-1?" ":"\n\n");
#endif
		}
}

@end

@implementation AQPlayer_SimpleSF

- (void)dealloc {
	
	for (int i = 0; i < kNumSFs; i++)
		[mSoundFile[i] release];
	
	[super dealloc];
}

-(id)init
{
	[super init];
	
	for (int i = 0; i < kNumSFs; i++)
	{
		mSoundFile[i] = [[SoundFile alloc] initWithSFID:i];
		mSpeed[i] = 1.0;
		mMute[i] = YES;
	}
	
	return self;
}

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples
{
	for (int i = 0; i < kNumSFs; i++)
		if (mSpeed[i] > 0.)
			[mSoundFile[i] GetSamples:buffer:num_samples:mSpeed[i]:mMute[i]?0.:1.];

	for (int i = 0; i < num_samples; i++)
		buffer[i] *= 1. / kNumSFs;
}

-(void)SetSpeed:(UInt16)sf_pos:(Float64)speed
{
	if (sf_pos < kNumSFs)
		mSpeed[sf_pos] = speed;
}

-(BOOL)GetMute:(UInt16)sf_pos
{
	return mMute[sf_pos];
}

-(void)SetMute:(UInt16)sf_pos:(BOOL)enable
{
	if (sf_pos < kNumSFs)
		mMute[sf_pos] = enable;
}

-(Float64)GetSFPos:(UInt16)sf_pos
{
	if (sf_pos < kNumSFs)
		return [mSoundFile[sf_pos] GetCurPos];
	
	return 0.;
}

@end