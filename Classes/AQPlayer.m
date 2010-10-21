//
//  AQPlayer.m
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AQPlayer.h"

#import "Content.h"

AQPlayer *gAQP = nil;

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{
    AQPlayer *aqp = (AQPlayer *)inUserData;
	
	int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
	
	Note* note_pri = [aqp->mSequencer_Pri GetNote];
	Note* note_sec = [aqp->mSequencer_Sec GetNote];
	if ((note_pri == nil) && (note_sec == nil))
		for (int i = 0; i < numFrames; i++)
			((SInt16 *)inAQBuffer->mAudioData)[i] = 0;
	else
		for (int i = 0; i < numFrames; i++)
			((SInt16 *)inAQBuffer->mAudioData)[i] = (
													 [note_pri GetSample] * aqp->mSequencer_Pri->mAmpMultiplier +
													 [note_sec GetSample] * aqp->mSequencer_Sec->mAmpMultiplier
													)
													* (SInt16)0x7FFF;
	
	double elapsed_time = numFrames / aqp->mSR;
	[aqp->mSequencer_Pri Update:elapsed_time];
	[aqp->mSequencer_Sec Update:elapsed_time];

	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation AQPlayer

- (void)dealloc {

	[mSequencer_Pri Stop];
	[self Stop];
	
	for (int i = 0; i < kNumSequences; i++)
		[mSequences[i] release];
	
	[mSequencer_Pri release];
		
	[super dealloc];
}

- (id)init
{
	[super init];
	
	gAQP = self;
	
	mSequencer_Pri = [Sequencer new];
	for (int i = 0; i < kNumSequences; i++)
	{
		mSequences[i] = [Sequence new];
		switch (i)
		{
			case 0: [mSequences[i] AssignNotes:num_notes_01:note_sequence_01:dur_sequence_01]; break;
			case 1: [mSequences[i] AssignNotes:num_notes_02:note_sequence_02:dur_sequence_02]; break;
			case 2: [mSequences[i] AssignNotes:num_notes_03:note_sequence_03:dur_sequence_03]; break;
			case 3: [mSequences[i] AssignNotes:num_notes_04:note_sequence_04:dur_sequence_04]; break;
			case 4: [mSequences[i] AssignNotes:num_notes_05:note_sequence_05:dur_sequence_05]; break;
			case 5: [mSequences[i] AssignNotes:num_notes_06:note_sequence_06:dur_sequence_06]; break;
			default: break;
		}
	}
	mSequencer_Pri->mAmpMultiplier = 0.2;
	mSequencer_Pri->mDurMultiplier = 0.5;
	
	mSequencer_Sec = [Sequencer new];
	mSequencer_Sec->mSequence = [Sequence new];
	[mSequencer_Sec->mSequence AssignNotes:num_notes_pulse:note_sequence_pulse:dur_sequence_pulse];
	mSequencer_Sec->mAmpMultiplier = 0.2;
	mSequencer_Sec->mDurMultiplier = 0.5;

	mSR = 22050.;
	
	mSeqNum = 0;
	
	[self Start];

	[mSequencer_Pri Start];

	return self;
}

-(void) New
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
		printf("AudioQueueNewOutput %d\n",result);
	
    for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		if (result != noErr)
			printf("AudioQueueAllocateBuffer %d\n",result);
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

-(void) SetSequence:(int)seq_num;
{
	if (seq_num >= 0 && seq_num <= kNumSequences)
	{
		[mSequencer_Pri Rewind];
		mSeqNum = seq_num;
		mSequencer_Pri->mSequence = mSequences[mSeqNum-1];
	}
}

-(NSString*) GetModString;
{
	return [NSString stringWithFormat:@"%d",mSeqNum];
}

@end
