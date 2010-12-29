//
//  AQPlayer.m
//  Music 147
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "AQPlayer.h"
#import "Content.h"


void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) {	
	
	AQPlayer *aqp = (AQPlayer *)inUserData;
	
	const int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
	
	double sampleBuffer[numFrames];
	
	// KU: initialize all sampleBuffer elements to 0. here.
	for (int i = 0; i < numFrames; i++) { //CL: Like this?
		sampleBuffer[i] = 0;
	}
		
	for (int i = 0; i < kNumberNotes; i++) {
		[aqp->mNotes[i] FillAudioBuffer:sampleBuffer :numFrames];
	}
	
	// KU: now that the buffer is filled with samples with all notes, apply limiter and scale to 16-bit linear PCM
	
	double sample = 0.;	
	for (int i = 0; i < numFrames; i++) {	
		sample = sampleBuffer[i];
		sample = sample > MAX_AMP ? MAX_AMP : sample < -MAX_AMP ? -MAX_AMP : sample;
		((SInt16*)inAQBuffer->mAudioData)[i] = sample * (SInt16)0x7FFF;
	}

	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	

	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}



@implementation AQPlayer

@synthesize mWaveType;
@synthesize mCurrentMode;


-(void) setMode:(int)val {
	mCurrentMode = val;
	for (int i = 0; i < kNumberNotes; i++) mNotes[i].mFreq = [mModes[mCurrentMode] getNoteFreq:i];
}

-(void) setWaveType:(NSString *)waveType {
	mWaveType = waveType;
	[mWaveTable createWaveType:mWaveType];
}

-(void) startNote:(int)note_pos {	
	[mNotes[note_pos] on];
}

-(void) stopNote:(int)note_pos {	
	[mNotes[note_pos] off];
}


-(id)init {
	[super init];
	
	mWaveTable = [WaveFormTable new];
	mWaveType = [NSString new];
	
	for (int i = 0; i < kNumberNotes; i++) {
		mNotes[i] = [Note new];
		[mNotes[i] setWaveTable:mWaveTable];
	}
	
	for (int j = 0; j < kNumberModes; j++) {
		mModes[j] = [Mode new];
		switch (j) {
			case 0: [mModes[j] assignMode:pitchSet01]; break;
			case 1: [mModes[j] assignMode:pitchSet02]; break;
			case 2: [mModes[j] assignMode:pitchSet03]; break;
			case 3: [mModes[j] assignMode:pitchSet04]; break;
			case 4: [mModes[j] assignMode:pitchSet05]; break;
			case 5: [mModes[j] assignMode:pitchSet06]; break;
			default: break;
		}
	}
	[self setWaveType: @"sine wave"];
	[self setMode:0];
	return self;
}


- (void)dealloc {
	for (int i = 0; i < kNumberNotes; i++) [mNotes[i] release];
	for (int j = 0; j < kNumberModes; j++) [mModes[j] release];	
	[mWaveType release];
	[mWaveTable release];
	[super dealloc];
}


-(void) New {
	mDataFormat.mSampleRate = kSR;
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
	
	for (int i = 0; i < kNumberBuffers; ++i) {
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		if (result != noErr)
			printf("AudioQueueAllocateBuffer \n",result);
	}
}

-(OSStatus) start; { 
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


-(OSStatus) stop; {
	OSStatus result = noErr;
	
	result = AudioQueueStop(mQueue, true);
	
	return result;
}



@end
