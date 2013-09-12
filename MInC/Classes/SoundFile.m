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
	
	CFURLRef mSoundFileURLRef = CFBundleCopyResourceURL(CFBundleGetMainBundle(),CFSTR("getout"),CFSTR("aif"),NULL);
	
	OSStatus result = noErr;
	result = AudioFileOpenURL(mSoundFileURLRef,kAudioFileReadPermission,0,&mFileID);
	NSLog(@"AudioFileOpenURL %ld\n",result);
	
	return self;
}

-(void)dealloc
{
	OSStatus result = noErr;
	result = AudioFileClose(mFileID);
	NSLog(@"AudioFileClose %ld\n",result);
	
	[super dealloc];
}

-(void)	On:(ADSR*)adsr
{
}

-(void) Off
{
}

-(Float64) GetSample
{
	if (((SInt32)mSamplesPlayed % kIOBufferSize) == 0)
	{
		OSStatus result = noErr;
		UInt32 outNumBytes = 0;
		UInt32 ioNumPackets = kIOBufferSize;
		SInt64 inStartingPacket = mSamplesPlayed;
		result = AudioFileReadPackets(mFileID,NO,&outNumBytes,NULL,inStartingPacket,&ioNumPackets,mOutBuffer);
#if 0
		NSLog(@"AudioFileReadPackets %d %d\n",result,ioNumPackets);
#endif
		if (outNumBytes < kIOBufferSize) mSamplesPlayed = 0;
	}
	SInt16 sample = CFSwapInt16BigToHost(mOutBuffer[((SInt32)mSamplesPlayed % kIOBufferSize)]);
	
	mSamplesPlayed += 2.5;
	
	return (Float64)sample / (SInt16)0x7FFF;
}

-(Float64)	GetDuration
{
	return mDuration;
}

-(void)		SetDuration:(Float64)duration
{
}

-(void)		SetPercentOn:(Float64)percent
{
}

@end
