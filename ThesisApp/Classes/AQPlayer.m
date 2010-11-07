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
	
	double delta_theta[kNumberNotes];
	for (int j = 0; j < kNumberNotes; j++)
		//I understand how this works.  I don't understand WHY it works. There are a lot of j's!
		//KU: delta_theta is essentially the same as frequecy; instead of cycles/second (Hz) it is radians/sample period
		delta_theta[j] = aqp->mFreq[j] / aqp->mSR;

	for (int i = 0; i < numFrames; i++)
	{	
		double sample = 0.;
		
		for (int j = 0; j < kNumberNotes; j++)
		{
			//I have a suspicion that the distortion is from the mAmp doubling (or more) with every added note. Could that be happening here?
			//KU: yes
			sample += aqp->mAmp * [aqp->mWaveTable get:aqp->mTheta[j]] * (SInt16)0x7FFF;			
			aqp->mTheta[j] += delta_theta[j]; 
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
-(void) setFreq:(double)val withNotePos:(int)note_pos;
{
		mFreq[note_pos]=val;
}

- (void)dealloc
{
	[mWaveTable release];
 	[super dealloc];
}

-(id)init
{
	[super init];

	mWaveTable = [WaveFormTable new];
	
	return self;
}

-(void) New{

	mTheta[0] = 0.; //there's probably a more elequent way of doing this? // KU: yes, a for loop
	mTheta[1] = 0.;
	mTheta[2] = 0.;
	mTheta[3] = 0.;
	mTheta[4] = 0.;
	mTheta[5] = 0.;
	mTheta[6] = 0.;
	mTheta[7] = 0.;
	
	mAmp = .2;
	
	mFreq[0] = 0.;
	mFreq[1] = 0.;
	mFreq[2] = 0.;
	mFreq[3] = 0.;
	mFreq[4] = 0.;
	mFreq[5] = 0.;
	mFreq[6] = 0.;
	mFreq[7] = 0.;
	
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
		result = AudioQueueAllocateBuffer(mQueue, 1024, &mBuffers[i]);
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
	
	// from MUS147: prime the queue with some data before starting
	for (int i = 0; i < kNumberBuffers; ++i)
		AQBufferCallback(self, mQueue, mBuffers[i]);
	
	result = AudioQueueStart(mQueue, nil);
	
	return result;
}


-(OSStatus) stop;
{
	mTheta[0] = 0.; //Seems like there should be a way to reinitilize the entire array all at once. // KU: for loop
	mTheta[1] = 0.;
	mTheta[2] = 0.;
	mTheta[3] = 0.;
	mTheta[4] = 0.;
	mTheta[5] = 0.;
	mTheta[6] = 0.;
	mTheta[7] = 0.;
	
	
	mFreq[0] = 0.;
	mFreq[1] = 0.;
	mFreq[2] = 0.;
	mFreq[3] = 0.;
	mFreq[4] = 0.;
	mFreq[5] = 0.;
	mFreq[6] = 0.;
	mFreq[7] = 0.;
	
	
	printf("stop\n");
	OSStatus result = noErr;
	
	result = AudioQueueStop(mQueue, true);
	
	return result;
}



@end
