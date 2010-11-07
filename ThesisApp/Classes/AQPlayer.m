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
		
		//CL: I understand how this works.  I don't understand WHY it works. There are a lot of j's!
		//KU: delta_theta is essentially the same as frequecy; instead of cycles/second (Hz) it is radians/sample period
		//CL: so in the below are we essentially connecting each instance of mFreq data w/ it's corresponding mTheta?		
		delta_theta[j] = aqp->mFreq[j] / aqp->mSR;

	for (int i = 0; i < numFrames; i++)
	{	
		double sample = 0.;
		double sampleAmp = 0.;
		
		for (int j = 0; j < kNumberNotes; j++)
		{
			sample += [aqp->mWaveTable get:aqp->mTheta[j]] * (SInt16)0x7FFF;
			
			aqp->mTheta[j] += delta_theta[j]; 
		}
		
		//CL: this is markedly better but I'm still getting an increase in amplitude when adding notes.
		//CL: I feel like the solution is to use an if else to decrease mAmp accordingly... maybe I can test to see
		//CL: if delta_theta is 0. or not? If delta_theta is not zero than that means a note is being played. If two notes
		//CL: than mAmp/2. If three notes than mAmp/3. So on an so forth...				
		sampleAmp += aqp->mAmp * sample; 
		
		((SInt16*)inAQBuffer->mAudioData)[i] = sampleAmp;
	}
	
	inAQBuffer->mAudioDataByteSize = 1024;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation AQPlayer

@synthesize mAmp;

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
	mTheta[0] = 0.; //CL:I'm going to implement for loops where I can but this process may move to MainViewController.
	mTheta[1] = 0.; //CL: Problem is that if two notes are held and one is lifted, currently all are turned off.
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
