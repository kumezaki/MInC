//
//  AQPlayer.m
//  Music 147
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "AQPlayer.h"

#import "Content.h"

#define MAX_AMP	0.95

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{	
	AQPlayer *aqp = (AQPlayer *)inUserData;
	
	int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
	double buffer[numFrames];
	
	for (int i = 0; i < numFrames; i++){ // KU: this outer loop is no longer needed
		for (int j = 0; j < kNumberNotes; j++){			
			buffer[i] += [aqp->mNotes[j] getSamples:(double*)buffer:numFrames];
			//CL: clearly I'm confused on what is suppose to happen here
			//CL: Why send a "buffer" arguement to getSamples? What is that argument suppose to be?
			//KU: buffer contains the entire...well...buffer of samples
			//CL: the two arguements for getSamples are from your sample code the last time we met but I can't remember their purpose.
			//KU: buffer I just explained, numFrames is the number of samples in the buffer (at least for mono audio streams)
			//CL: the way numFrames is defined is taken from your original code. Will it still work?
			//KU: not sure but we can try
			//CL: originally getSamples was a void method but I changed it to return a double. Yes/No?
			//KU: no need for returning a type, because the getSamples method will populate the buffer directly
			//CL: If the buffer is preloaded with sample info for all the notes, should button pushes only increase the amplitude?
			//KU: the idea behind getSamples is to call a method once to get a group of samples, not just one
		}
	}
	
	// KU: now that the buffer is filled with samples with all notes, apply limiter and scale to 16-bit linear PCM
	
	double sample = 0.;
	for (int i = 0; i < numFrames; i++)
	{	
		sample = buffer[i];
		sample = sample > MAX_AMP ? MAX_AMP : sample < -MAX_AMP ? -MAX_AMP : sample;
		((SInt16*)inAQBuffer->mAudioData)[i] = sample * (SInt16)0x7FFF;
	}
	
	inAQBuffer->mAudioDataByteSize = 1024;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}



@implementation AQPlayer


-(void) setMode:(int)val{
	
	for (int i = 0; i < kNumberNotes; i++) mNotes[i].mFreq = [mModes[val] getNoteFreq:i];
}


-(void) setMAmp:(double)val withNotePos:(int)note_pos{
	
	mNotes[note_pos].mAmp=val;
}


-(void) playNote:(int)note_pos{
	
	mNotes[note_pos].mFreq;
}


-(id)init
{
	[super init];
	mWaveTable = [WaveFormTable new];	
	
	for (int i = 0; i < kNumberNotes; i++){
		mNotes[i] = [Note new];
		[mNotes[i] setWaveTable:mWaveTable];
	}
	
	for (int j = 0; j < kNumberModes; j++){
		mModes[j] = [Mode new];
		switch (j)
		{
			case 0: [mModes[j] assignMode:pitchSet01]; break;
			case 1: [mModes[j] assignMode:pitchSet02]; break;
			case 2: [mModes[j] assignMode:pitchSet03]; break;
			case 3: [mModes[j] assignMode:pitchSet04]; break;
			case 4: [mModes[j] assignMode:pitchSet05]; break;
			case 5: [mModes[j] assignMode:pitchSet06]; break;
			default: break;
		}
	}
	return self;
}


- (void)dealloc
{
	for (int i = 0; i < kNumberNotes; i++) [mNotes[i] release];
	for (int j = 0; j < kNumberModes; j++) [mModes[j] release];	
	[mWaveTable release];
	[super dealloc];
}


-(void) New{
		
	
	
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
