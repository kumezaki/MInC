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
	
	for (int i = 0; i < numFrames; i++)
	{	
		double sample = 0.;
		
		for (int j = 0; j < kNumberNotes; j++)
			sample += [aqp->mNotes[j] getSample];
		
		((SInt16*)inAQBuffer->mAudioData)[i] = sample * (SInt16)0x7FFF;
	}
	
	inAQBuffer->mAudioDataByteSize = 1024;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}



@implementation AQPlayer

-(void) setAmp:(double)val withNotePos:(int)note_pos;
{
	mNotes[note_pos].mAmp=val;
}


-(void) setFreq:(double)val withNotePos:(int)note_pos;
{
	mNotes[note_pos].mFreq=val;	//KU: the idea would be to call the Note class setFreq here, no?
}

-(id)init
{
	[super init];
	
	// KU: you might allocate this before the for-loop above.
	// KU: then, after you allocate a note, call setWaveTable on the note with mWaveTable as the argument
	mWaveTable = [WaveFormTable new];
	
	for (int i = 0; i < kNumberNotes; i++)
	{
		mNotes[i] = [Note new];
		[mNotes[i] setWaveTable:mWaveTable];
	}
	
	
	
	return self;
}


- (void)dealloc
{
	for (int i = 0; i < kNumberNotes; i++)
	{
		[mNotes[i] release];
	}
	
	
	[mWaveTable release];
	
	 	[super dealloc];
}

-(void) New{
	
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
		
	printf("stop\n");
	OSStatus result = noErr;
	
	result = AudioQueueStop(mQueue, true);
	
	return result;
}



@end
