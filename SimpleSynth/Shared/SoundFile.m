//
//  SoundFile.m
//  MInC
//
//  Created by Kojiro Umezaki on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SoundFile.h"

@implementation SoundFile

-(id)init
{
	[super init];
	
	CFURLRef mSoundFileURLRef = CFBundleCopyResourceURL(CFBundleGetMainBundle(),CFSTR("audacity"),CFSTR("aif"),NULL);
	
	OSStatus result = noErr;
	result = AudioFileOpenURL(mSoundFileURLRef,kAudioFileReadPermission,0,&mFileID);
	printf("AudioFileOpenURL %ld\n",result);
	
	mOutBufferPos = 0;
	
	return self;
}

-(void)dealloc
{
	OSStatus result = noErr;
	result = AudioFileClose(mFileID);
	printf("AudioFileClose %ld\n",result);
	
	[super dealloc];
}

-(void) GetSamples:(double*)buffer:(UInt32)num_buf_samples;
{
	UInt32 numSamplesRead = 0;

	while (numSamplesRead < num_buf_samples)
	{
		SInt64 inStartingPacket = mOutBufferPos;

		UInt32 ioNumPackets = num_buf_samples - numSamplesRead;
		
		UInt32 outNumBytes = 0;

		OSStatus result = AudioFileReadPackets(mFileID,NO,&outNumBytes,NULL,inStartingPacket,&ioNumPackets,mOutBuffer);
		if (result != noErr)
			NSLog(@"AudioFileReadPackets exception %ld",result);

		UInt32 outNumSamples = outNumBytes / sizeof(SInt16);

		numSamplesRead += outNumSamples;

		if (outNumSamples == num_buf_samples)
		{
			mOutBufferPos += numSamplesRead;
			break;
		}

		mOutBufferPos = 0;
	}

	for (int i = 0; i < num_buf_samples; i++)
		buffer[i] = (double)CFSwapInt16BigToHost(mOutBuffer[i]) / (SInt16)0x7FFF;
}

@end
