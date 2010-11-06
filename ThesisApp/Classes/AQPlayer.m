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
	
	double delta_theta = aqp->mFreq / aqp->mSR;
	
	for (int i = 0; i < numFrames; i++)
	{	
		((SInt16*)inAQBuffer->mAudioData)[i] = aqp->mAmp * [aqp->mWaveTable get:aqp->mTheta] * (SInt16)0x7FFF;
		aqp->mTheta += delta_theta;
	}
	
	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation AQPlayer

@synthesize mAmp;
@synthesize mFreq;
//the following is no longer needed since we're using @property & @synthesize
//-(void) SetAmp:(double)val
//{
//mAmp = val;
//}

//-(void) SetFreq:(double)val
//{
//mFreq = val;
//}

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
	mTheta = 0.;
	mAmp = 1.;
	mFreq = 440.;
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

	if (result != noErr) //the following two "if-print"s produce 2 warnings
		printf("AudioQueueNewOutput \n",result);
	
	for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		
		if (result != noErr)
			printf("AudioQueueAllocateBuffer \n",result);
	}
	
	
}



-(OSStatus) Start;
{ 
	printf("start\n");
	OSStatus result = noErr;
	
	if (mQueue == nil)
		[self New];
	
	// prime the queue with some data before starting
	for (int i = 0; i < kNumberBuffers; ++i)
		AQBufferCallback(self, mQueue, mBuffers[i]);
	
	result = AudioQueueStart(mQueue, nil);
	
	return result;
}


-(OSStatus) Stop;
{
	printf("stop\n");
	OSStatus result = noErr;
	
	result = AudioQueueStop(mQueue, true);
	
	return result;
}



@end
