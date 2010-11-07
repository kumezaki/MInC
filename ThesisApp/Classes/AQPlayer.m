//
//  AQPlayer.m
//  Music 147
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "AQPlayer.h"

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{	
	AQPlayer *aqp = (AQPlayer *)inUserData;
	
	int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
	
	double delta_theta = aqp->mFreq[0] / aqp->mSR; //don't I need to calculate in all the mFreq's?

	for (int i = 0; i < numFrames; i++)
	{	
		double sample = 0.;
		
		for (int j = 0; j < 2; j++)
		{
			sample += aqp->mAmp * [aqp->mWaveTable get:aqp->mTheta[j]] * (SInt16)0x7FFF;
			aqp->mTheta[j] += delta_theta;
		}
		
		((SInt16*)inAQBuffer->mAudioData)[i] = sample;
	}
	
	inAQBuffer->mAudioDataByteSize = 1024;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation AQPlayer

@synthesize mAmp;
//-(void) setAmp:(double)val
//	{
//		mAmp = val;
//	}

//@synthesize mFreq;
-(void) setFreq:(double)val
{
	for (int i = 0; i < 2; i++)
	{
		mFreq[i]=val;
	}	
}

- (void)dealoc
{
	[super dealloc];
	[mWaveTable release];
}

-(id)init
{
	[super init];
	
	mWaveTable = [WaveFormTable new];
	
	return self;
}

-(void) New{

	mTheta[0] = 0.;
	mTheta[1] = 0.;
	mAmp = .8;
	mFreq[0] = 0.;
	mFreq[1] = 0.;
	mSR = 22050.;
		
	mDataFormat.mSampleRate = mSR;
	mDataFormat.mFormatID = kAudioFormatLinearPCM;
	mDataFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger;
	mDataFormat.mBytesPerPacket = sizeof(SInt16);
	mDataFormat.mFramesPerPacket = 1;
	mDataFormat.mBytesPerFrame = sizeof(SInt16);
	mDataFormat.mChannelsPerFrame = 1;
	mDataFormat.mBitsPerChannel = 16;

	OSStatus result = AudioQueueNewOutput(&mDataFormat,
										  AQBufferCallback,
										  self,
										  nil,
										  nil,
										  0,
										  &mQueue);

	if (result != noErr)
		printf("AudioQueueNewOutput \n",result);
	
	for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue,
										  1024,
										  &mBuffers[i]);
		if (result != noErr)
			printf("AudioQueueAllocateBuffer \n",result);
	}
}



-(OSStatus) start;
{ 
	printf("start\n");
	OSStatus result = noErr;
	
	if (mQueue == nil)
		[self New];
	
	// MUS147: prime the queue with some data before starting
	for (int i = 0; i < kNumberBuffers; ++i)
		AQBufferCallback(self, mQueue, mBuffers[i]);
	
	result = AudioQueueStart(mQueue, nil);
	
	return result;
}


-(OSStatus) stop;
{
		
	printf("stop\n");
	OSStatus result = noErr;
	
	result = AudioQueueStop(mQueue, true);
	
	return result;
}



@end
