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
	
	mPos = 0.;
	
	CFURLRef mSoundFileURLRef = CFBundleCopyResourceURL(CFBundleGetMainBundle(),CFSTR(kFileName),CFSTR(kFileExtension),NULL);
	
	OSStatus result = noErr;
	result = AudioFileOpenURL(mSoundFileURLRef,kAudioFileReadPermission,0,&mFileID);
	if (result != noErr)
		NSLog(@"AudioFileOpenURL exception %ld",result);
	
	UInt32 outDataSize = 0;
	UInt32 isWritable = 0;
	result = AudioFileGetPropertyInfo(mFileID,kAudioFilePropertyAudioDataPacketCount,&outDataSize,&isWritable);
	NSLog(@"%ld %ld %ld",result,outDataSize,isWritable);

	
	UInt32 ioDataSize = 8;
	UInt64 outPropertyType = 0;
	result = AudioFileGetProperty(mFileID,kAudioFilePropertyAudioDataPacketCount,&ioDataSize,&outPropertyType);
	NSLog(@"%ld %ld %ld",result,ioDataSize,outPropertyType);

	mNumFileSamples = outPropertyType;
	
	mPrevSpeed = 1.0;
	
	return self;
}

-(void)dealloc
{
	OSStatus result = noErr;
	result = AudioFileClose(mFileID);
	NSLog(@"AudioFileClose %ld",result);
	
	[super dealloc];
}

#define TWEEN_OFFSET(f) (f - floor(f))

-(void) GetSamples:(double*)buffer:(UInt32)num_buf_samples:(Float64)speed:(Float64)amp
{
	const Float64 speed_end = speed;
	const Float64 speed_avg = (speed + mPrevSpeed) / 2.;
	const Float64 speed_delta = (speed - mPrevSpeed) / num_buf_samples;

	Float64 f_num_read_samples = num_buf_samples * speed_avg;
	UInt32 i_num_read_samples = (UInt32)f_num_read_samples + 1;
	
	Float64 f = TWEEN_OFFSET(mPos);	
	
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
		
		file_buf_pos += read_buf_pos < i_num_read_samples ? - file_buf_pos : ioNumPackets;
	}
	
//	NSLog(@"%ld %ld",num_buf_samples,i_num_read_samples);
	speed = mPrevSpeed;
	for (int buf_pos = 0; buf_pos < num_buf_samples; buf_pos++, f += (speed += speed_delta))
	{
		Float64 s0 = (SInt16)CFSwapInt16BigToHost(mBuffer[(UInt32)f]);
		Float64 s1 = (SInt16)CFSwapInt16BigToHost(mBuffer[(UInt32)f+1]);
		
		Float64 k = f - floor(f);
		Float64 s = (s1 - s0) * k + s0;
		
		buffer[buf_pos] += amp * s / (SInt16)0x7FFF;

//		NSLog(@"%lf %lf %lf %lf",s,s0,s1,buffer[buf_pos]);
	}
	
	mPos += f_num_read_samples;
	mPos -= mPos > mNumFileSamples ? mNumFileSamples : 0;
	
	mPrevSpeed = speed_end;
}

-(double) GetCurPos
{
	return mPos / mNumFileSamples;
}

@end
