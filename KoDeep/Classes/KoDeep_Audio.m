//
//  KoDeep_Audio.m
//  KoDeep
//
//  Created by Kojiro Umezaki on 8/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "KoDeep_Audio.h"

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{
    KoDeep_Audio *a = (KoDeep_Audio *)inUserData;
	
	int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);

	Note* note = a->mNote;

	if (note == nil)
		for (int i = 0; i < numFrames; i++)
			((SInt16 *)inAQBuffer->mAudioData)[i] = 0;
	else
		for (int i = 0; i < numFrames; i++)
			((SInt16 *)inAQBuffer->mAudioData)[i] = [note GetSample] * (SInt16)0x7FFF;

	{
		double elapsed_time = numFrames / a->mSR;
		a->mCurTime += (elapsed_time * a->mTempoMultiplier);
		if (a->mCurTime >= a->mNextEventTime)
		{
			UInt16 num_notes = a->mNumBeats + (a->mFraction == 0 ? 0 : 1);
			
			a->mCurBeatNum = ++a->mCurBeatNum % num_notes;
			
			note->mFreq = [Note mtof:(a->mBaseMIDINote + (a->mCurBeatNum == 0 ? 12 : 0))];
			[note Off];
			if ((a->mFraction != 0.) && (a->mCurBeatNum == (num_notes-1)))
				[note SetDuration:a->mFraction];
			else
				[note SetDuration:1.0];
			[note SetPercentOn:0.2];
			[note On:a->mWaveTable:a->mADSR];
			a->mNextEventTime += [note GetDuration];
			NSLog(@"%f",a->mCurTime);
		}
	}
	
	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation KoDeep_Audio

-(id)init
{
	[super init];

	mSR = 22050.;

	mCurTime = 0.;
	mNextEventTime = 0.;
	mTempoMultiplier = 0.5 * 2 + 1.;

	mWaveTable = [WaveFormTable new];
	mADSR = [[ADSR alloc] initWithADSR:22050. a:0.01 d:0.01 s:1.0 r:0.05];

	mNote = [Note new];
	[mNote SetDuration:1.0];
	
	mBaseMIDINote = 0.5 * 12. + 69.;
	
	[self SetNumBeats:1:0.];

	return self;
}

-(void)New
{
	mDataFormat.mFormatID = kAudioFormatLinearPCM;
	mDataFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger;
	mDataFormat.mChannelsPerFrame = 1;
	mDataFormat.mSampleRate = mSR;
	mDataFormat.mBitsPerChannel = 16;
	mDataFormat.mFramesPerPacket = 1;
	mDataFormat.mBytesPerPacket = sizeof(SInt16);
	mDataFormat.mBytesPerFrame = sizeof(SInt16);
	
    OSStatus result = AudioQueueNewOutput(&mDataFormat, AQBufferCallback, self, nil, nil, 0, &mQueue);
	
	if (result != noErr)
		NSLog(@"AudioQueueNewOutput %ld",result);
	
    for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		if (result != noErr)
			NSLog(@"AudioQueueAllocateBuffer %ld",result);
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

-(void)SetNumBeats:(UInt16)num_beats:(double)fraction
{
	mNumBeats = num_beats;
	mFraction = fraction;
	[self ResetBeatNum];
}

-(void)ResetBeatNum
{
	mCurBeatNum = mNumBeats - 1 + (mFraction == 0. ? 0 : 1);
}

-(void)SetBaseMIDINote:(double)midi_note
{
	mBaseMIDINote = midi_note;
}

@end