//
//  AQPlayer.m
//  Music 147
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "AQPlayer.h"
#import "WaveFormTable.h"

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{	
	AQPlayer *aqp = (AQPlayer *)inUserData;
	
	int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
	
	double delta_theta = aqp->mFreq / aqp->mSR; //!!!not sure how to deal with mFreq here now that it is an array.
	
	for (int i = 0; i < numFrames; i++)
	{	
		double sample = 0.;
		
		for (int j = 0; j < 2; j++)
		{
			sample += aqp->mAmp * [aqp->mWaveTable get:aqp->mTheta[j]] * (SInt16)0x7FFF;
		}
		
		((SInt16*)inAQBuffer->mAudioData)[i] = sample;
		
		aqp->mTheta += delta_theta;
	}
	
	inAQBuffer->mAudioDataByteSize = 512;
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
-(void) setFreq:(double)mFreq[]
	{
		for (int i = 0; i < 2; ++i) //loading the array via the setter? I'm not sure where the optimum place would be to load the array.
		{
		mFreq[i] = val;
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

-(void) New
{
	mTheta[0] = 0.;//I'm guessing here.
	mAmp = 1.;
	mFreq[0] = 440.;//I'm also guessing here.
	mSR = 22050.;
		
	mDataFormat.mSampleRate = mSR;
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
	
	for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		
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
