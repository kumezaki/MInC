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
	NSLog(@"AudioFileOpenURL exception %ld",result);
	
	mPos = 0.;
	
	mNumFileSamples = 0;
	
	return self;
}

-(void)dealloc
{
	OSStatus result = noErr;
	result = AudioFileClose(mFileID);
	NSLog(@"AudioFileClose %ld",result);
	
	[super dealloc];
}

#define FLOAT_OFFSET(f) (f - floor(f))

-(void) GetSamples:(double*)buffer:(UInt32)num_buf_samples:(Float64)speed
{
	Float64 f_num_read_samples = num_buf_samples * speed;
	UInt32 i_num_read_samples = (UInt32)f_num_read_samples + 1;
	
	Float64 f0 = FLOAT_OFFSET(mPos);	
	Float64 f1 = FLOAT_OFFSET(mPos + f_num_read_samples);
	
	UInt32 file_buf_pos = (UInt32)mPos;
	UInt32 read_buf_pos = 0;
	while (read_buf_pos < i_num_read_samples)
	{
		UInt32 ioNumPackets = i_num_read_samples - read_buf_pos;
		SInt64 inStartingPacket = file_buf_pos;
		UInt32 outNumBytes = 0;
		
		OSStatus result = AudioFileReadPackets(mFileID,NO,&outNumBytes,NULL,inStartingPacket,&ioNumPackets,&mBuffer[read_buf_pos]);
		if (result != noErr)
			NSLog(@"AudioFileReadPackets exception %ld speed:%lf num_buf_samples:%ld ioNumPackets:%ld",result,speed,num_buf_samples,ioNumPackets);

		read_buf_pos += ioNumPackets;
		
		if (read_buf_pos < i_num_read_samples)
			file_buf_pos = 0;
		else
			file_buf_pos += ioNumPackets;
	}
	
	for (int buf_pos = 0; buf_pos < num_buf_samples; buf_pos++, f0 += speed)
		buffer[buf_pos] = (double)CFSwapInt16BigToHost(mBuffer[(UInt32)(f0+0.5)]) / (SInt16)0x7FFF;
	
	mPos = f1 + (file_buf_pos - 1);
}

@end
