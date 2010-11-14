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
	for (int j = 0; j < kNumberNotes; j++)  delta_theta[j] = aqp->mNotes[j].mFreq / aqp->mSR;

	for (int i = 0; i < numFrames; i++)
	{	
		double sample = 0.;
		((SInt16*)inAQBuffer->mAudioData)[i] = sample * (SInt16)0x7FFF;	}
	
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
	mNotes[note_pos].mFreq=val;
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

	for (int h = 0; h < kNumberNotes; h++) mNotes[h].mTheta = 0.;
	
	for (int i = 0; i < kNumberNotes; i++) mNotes[i].mAmp = 0.;
	
	for (int j = 0; j < kNumberNotes; j++) mNotes[j].mFreq = 0.;
		
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
	for (int j = 0; j < kNumberNotes; j++) mNotes[j].mAmp = 0.;
	for (int k = 0; k < kNumberNotes; k++) mNotes[k].mFreq = 0.;
	for (int l = 0; l < kNumberNotes; l++) mNotes[l].mTheta = 0.;
	
	// KU: I suggest that you don't set frequencies to 0. (unlike what we've been talking about) and set mAmp[n] to 0. instead.
	// CL: If I don't reset the mFreq & mTheta arrays than previously loaded values persist.
	// CL: I'm thinking that the (OSStatus) start/stop should be tied to the start and stop of the App. So the buttons are actually
	// CL: simply turning the amplitude up and down. This would help with latency... no?
	// KU: I'm not sure what you're getting at here, but I'd still suggest not using these start and stop methods to turn notes on and off
	// KU: Instead, do it with the setFreq method
	// CL: orginally in addition to setFreq (& now setAmp), when you push a button [mAQPlayer start] was also called. When a button was released [mAQPlayer stop] was called.
	// CL: I now changed this so mAQPlayer is started during viewDidLoad and stopped during the dealoc
	// CL: this seems to have had a very positive effect ;-)
		
	printf("stop\n");
	OSStatus result = noErr;
	
	result = AudioQueueStop(mQueue, true);
	
	return result;
}



@end
