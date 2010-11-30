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

	// KU: this is just a pointer to an array.  Where is the memory actually allocated?
	// CL: I currently have "sampleBuffer = [NSMutableArray new];" in the init metod thinking that it would allocate the memory
	// CL: I then tried moving that here to AQBuffer Callback and also no go.
	// CL: Then I tried the above
	// CL: Where/how should the memory be allocated?
	// KU: I think it can be allocated in this routine, yes.
	// KU: However, it needs to be deallocated in this routine as well.
	// KU: Otherwise, you'll have a huge memory leak.
	// KU: I have to admit that I don't use the NS*Array structures. Does initWithCapacity allocate new memory?
	// KU: More importantly, look at the following to see what is wrong with the statement above.  Below is more correct.

	NSMutableArray *sampleBuffer = [aqp->sampleBuffer initWithCapacity:numFrames];
	
	for (int i = 0; i < kNumberNotes; i++) {
		[aqp->mNotes[i] getSamples:sampleBuffer:numFrames];
	}
	
	// KU: now that the buffer is filled with samples with all notes, apply limiter and scale to 16-bit linear PCM
	
	double sample = 0.;	
	for (int i = 0; i < numFrames; i++)
	{	
		sample = [[sampleBuffer objectAtIndex:i]doubleValue];
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
	[sampleBuffer release];
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
