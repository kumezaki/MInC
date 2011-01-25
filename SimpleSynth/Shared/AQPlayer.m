//
//  AQPlayer.m
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AQPlayer.h"

#import "freeverb.h"

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
		buffer[i] = buffer[i] > 1.0 ? 1.0 : buffer[i] < -1.0 ? -1.0 : buffer[i];
	}
	
	double elapsed_time = numFrames / kSR;
	
	[aqp ReportMaxAmplitude:max_amp];
	[aqp ReportElapsedTime:elapsed_time];
	
	for (int i = 0; i < numFrames; i++)
		((SInt16 *)inAQBuffer->mAudioData)[i] = buffer[i] * (SInt16)0x7FFF;
	
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
	
	for (int i = 0; i < kNumVoices; i++)
		mMute[i] = YES;

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
	if (max_amp > 1.0)
		NSLog(@"AQPlayer ReportMaxAmplitude %lf",max_amp);
}

-(void)ReportElapsedTime:(double)elapsed_time
{
//	NSLog(@"AQPlayer ReportElapsedTime %lf",elapsed_time);
}

-(BOOL)GetMute:(UInt16)pos
{
	return mMute[pos];
}

-(void)SetMute:(UInt16)pos:(BOOL)enable
{
	if (pos < kNumVoices)
		mMute[pos] = enable;
}

@end

@implementation AQPlayer_SimpleSynth

- (void)dealloc {
	
	/* here's where we release the reverb */
	Reverb_Release();

	[super dealloc];
}

-(id)init
{
	[super init];
	
	for (int i = 0; i < kNumVoices; i++)
	{
		mTheta[i] = 0.;

		double ratio = 1.;
		switch (i)
		{
			case 0: ratio = (1. / 1.); break;
			case 1: ratio = (9. / 8.); break;
			case 2: ratio = (5. / 4.); break;
			case 3: ratio = (3. / 2.); break;
		}
		mDeltaTheta[i] = (ratio) * 440. / kSR;
	}
	
	/* here's where we initialize the reverb */
	Reverb_Init();
	Reverb_SetRoomSize(0,0.5);
	Reverb_SetDamp(0,0.5);
	Reverb_SetWet(0,0.5);
	Reverb_SetDry(0,0.5);
	
	return self;
}

#define SIGN(x)	(x < 0. ? -1. : x > 0. ? +1. : 0.)

-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples
{
	double amp = 1. / kNumVoices;

	for (int j = 0; j < kNumVoices; j++)
		if (!mMute[j])
			for (int i = 0; i < num_samples; i++)
			{
#if 1
				for (int k = 1; k <= 1; k += 1)	/* in case we want to implement additive synthesis */
					buffer[i] += amp / k * sin(k * mTheta[j] * 2 * M_PI);						/* sine */
#elif 0
				buffer[i] += amp * 2 * (mTheta[j] - floor(mTheta[j] + 0.5));					/* sawtooth */
#elif 0
				buffer[i] += amp * SIGN(sin(mTheta[j] * 2 * M_PI));								/* square */
#elif 0
				buffer[i] += amp * (fabs(2 * (mTheta[j] - floor(mTheta[j] + 0.5))) * 2 - 1.);	/* triangle */
#endif
				mTheta[j] += mDeltaTheta[j];

#if 0
				if (j == kNumVoices - 1)
					printf("%d%s",(SInt16)(buffer[i] * (SInt16)0x7FFF),i<num_samples-1?" ":"\n\n");
#endif
			}

	/* here's where we call the reverb (the 1 in the third argument is for 1 channel, i.e. mono) */
	revmodel_process(buffer,num_samples,1);
}

@end

@implementation AQPlayer_SimpleSF

- (void)dealloc {
	
	for (int i = 0; i < kNumVoices; i++)
		[mSoundFile[i] release];
	
	[super dealloc];
}

-(id)init
{
	[super init];
	
	for (int i = 0; i < kNumVoices; i++)
	{
		mSoundFile[i] = [[SoundFile_Simple alloc] initWithSFID:i];
		mSpeed[i] = 1.0;
	}
	
	return self;
}


-(void)FillAudioBuffer:(double*)buffer:(UInt32)num_samples
{
	for (int i = 0; i < kNumVoices; i++)
		if (mSpeed[i] > 0.)
			[mSoundFile[i] GetSamples:buffer:num_samples:mSpeed[i]:mMute[i]?0.:1.];

	for (int i = 0; i < num_samples; i++)
		buffer[i] *= 1. / kNumVoices;
}

-(void)SetSpeed:(UInt16)pos:(Float64)speed
{
	if (pos < kNumVoices)
		mSpeed[pos] = speed;
}

-(Float64)GetSFPos:(UInt16)pos
{
	if (pos < kNumVoices)
		return [mSoundFile[pos] GetCurPos];
	
	return 0.;
}

@end