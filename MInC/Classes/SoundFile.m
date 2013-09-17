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
	result = AudioFileOpenURL(mSoundFileURLRef,kAudioFileReadPermission,0,&FileID);
	NSLog(@"AudioFileOpenURL %ld\n",result);
	
	return self;
}

-(void)dealloc
{
	OSStatus result = noErr;
	result = AudioFileClose(FileID);
	NSLog(@"AudioFileClose %ld\n",result);
	
	[super dealloc];
}

-(void)	on:(ADSR*)adsr
{
}

-(void) off
{
}

-(Float64) getSample
{
	if (((SInt32)SamplesPlayed % kIOBufferSize) == 0)
	{
		OSStatus result = noErr;
		UInt32 outNumBytes = 0;
		UInt32 ioNumPackets = kIOBufferSize;
		SInt64 inStartingPacket = SamplesPlayed;
		result = AudioFileReadPackets(FileID,NO,&outNumBytes,NULL,inStartingPacket,&ioNumPackets,OutBuffer);
#if 0
		NSLog(@"AudioFileReadPackets %d %d\n",result,ioNumPackets);
#endif
		if (outNumBytes < kIOBufferSize) SamplesPlayed = 0;
	}
	SInt16 sample = CFSwapInt16BigToHost(OutBuffer[((SInt32)SamplesPlayed % kIOBufferSize)]);
	
	SamplesPlayed += 2.5;
	
	return (Float64)sample / (SInt16)0x7FFF;
}

-(Float64)	getDuration
{
	return Duration;
}

-(void)		setDuration:(Float64)duration
{
}

-(void)		setPercentOn:(Float64)percent
{
}

@end
