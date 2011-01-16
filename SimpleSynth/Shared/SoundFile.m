//
//  SoundFile.m
//  MInC
//
//  Created by Kojiro Umezaki on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SoundFile.h"

@implementation SoundFile

-(id) initWithSFID:(int)sf_id
{
	mSFID = sf_id;
	return [self init];
}

-(id)init
{
	[super init];
	
	mPos = 0.;
	
	CFStringRef filename;
	switch (mSFID)
	{
		case 0: filename = CFSTR(kFileName_0); break;
		case 1: filename = CFSTR(kFileName_1); break;
		case 2: filename = CFSTR(kFileName_2); break;
		case 3: filename = CFSTR(kFileName_3); break;
		default: filename = CFSTR(kFileName_0); break;
	}
	NSLog(@"%d",mSFID);
	
	CFURLRef mSoundFileURLRef = CFBundleCopyResourceURL(CFBundleGetMainBundle(),filename,CFSTR(kFileExtension),NULL);
	
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
	//CL: What is the difference between speed_end, speed_avg, & speed_delta?
	const Float64 speed_end = speed;
	const Float64 speed_avg = (speed + mPrevSpeed) / 2.;
	const Float64 speed_delta = (speed - mPrevSpeed) / num_buf_samples;
	
	//CL: what is the difference between num_buf_samples, f_num_read_samples, & i_num_read_samples?
	Float64 f_num_read_samples = num_buf_samples * speed_avg;
	UInt32 i_num_read_samples = (UInt32)f_num_read_samples + 1;
	
	//CL: I know we talked about this formula but just so I'm really clear, what is the TWEEN_OFFSET?
	Float64 f = TWEEN_OFFSET(mPos);	
	
	UInt32 file_buf_pos = (UInt32)mPos;
	UInt32 read_buf_pos = 0;
	
	//CL: I think this loop is reading through the sample file. I don't understand how it's doing it. 
	while (read_buf_pos < i_num_read_samples)
	{
		
		UInt32 ioNumPackets = i_num_read_samples - read_buf_pos;//CL: ?
		SInt64 inStartingPacket = file_buf_pos;//CL: ?
		UInt32 outNumBytes = 0;//CL: ?
		
		OSStatus result = AudioFileReadPackets(mFileID,NO,&outNumBytes,NULL,inStartingPacket,&ioNumPackets,&mBuffer[read_buf_pos]);
		if (result != noErr)
			NSLog(@"AudioFileReadPackets exception %ld speed:%lf num_buf_samples:%ld ioNumPackets:%ld",result,speed,num_buf_samples,ioNumPackets);

		read_buf_pos += ioNumPackets;//CL: ?
		
		file_buf_pos += read_buf_pos < i_num_read_samples ? - file_buf_pos : ioNumPackets;//CL: ?
	}
	
//	NSLog(@"%ld %ld",num_buf_samples,i_num_read_samples);
	
		//CL: is the below calculating the speed acceleration/deacceleration?
	speed = mPrevSpeed;
	for (int buf_pos = 0; buf_pos < num_buf_samples; buf_pos++, f += (speed += speed_delta))//CL: f += (speed += speed_delta)?
	{
		Float64 s0 = (SInt16)CFSwapInt16BigToHost(mBuffer[(UInt32)f]);
		Float64 s1 = (SInt16)CFSwapInt16BigToHost(mBuffer[(UInt32)f+1]);
		
		/* these calculations are correct Chris */
		Float64 k = f - floor(f);
		Float64 s = (s1 - s0) * k + s0;
		
		buffer[buf_pos] += amp * s / (SInt16)0x7FFF;

//		NSLog(@"%lf %lf %lf %lf",s,s0,s1,buffer[buf_pos]);
	}
	
	//CL: presumably if I had a better understanding of everything prior I would probably understand the rest of this...
	mPos += f_num_read_samples;
	mPos -= mPos > mNumFileSamples ? mNumFileSamples : 0;
	
	mPrevSpeed = speed_end;
}

-(double) GetCurPos
{
	return mPos / mNumFileSamples;
}

@end

@implementation SoundFile_Simple

-(void) GetSamples:(double*)buffer:(UInt32)num_buf_samples:(Float64)speed:(Float64)amp
{
	//KU: assume speed is always 1.0 for this class (force it to be so)
	speed = 1.;
		
	UInt32 file_buf_pos = (UInt32)mPos;//mPos "position in file"
	UInt32 read_buf_pos = 0;//where in the buffer
	
	//KU: This loop reads data from the sound file.
	//KU: When reaching the end of the file, we may not get a full buffer of samples, so we will loop.
	while (read_buf_pos < num_buf_samples)
	{
		UInt32 ioNumPackets = num_buf_samples - read_buf_pos;//KU: computes how many packets (samples) to read
		SInt64 inStartingPacket = file_buf_pos;//KU: sets the read position into the file
		UInt32 outNumBytes = 0;//KU: where the number of bytes actually read will go
		
		OSStatus result = AudioFileReadPackets(mFileID,NO,&outNumBytes,NULL,inStartingPacket,&ioNumPackets,&mBuffer[read_buf_pos]);
		if (result != noErr)
			NSLog(@"AudioFileReadPackets exception %ld speed:%lf num_buf_samples:%ld ioNumPackets:%ld",result,speed,num_buf_samples,ioNumPackets);
		
		read_buf_pos += ioNumPackets;//KU: advance the read position into the file
		
		file_buf_pos += read_buf_pos < num_buf_samples ? - file_buf_pos : ioNumPackets;//KU: if we didn't read a full buffer of samples, we've reached the end so rewind if necessary
	}
	
	//NSLog(@"%ld %ld",num_buf_samples,i_num_read_samples);
	
	//KU: speed is 1.0 so no need to calculate interpolation of samples
	speed = mPrevSpeed;
	for (int buf_pos = 0; buf_pos < num_buf_samples; buf_pos++)
	{
		Float64 s = (SInt16)CFSwapInt16BigToHost(mBuffer[buf_pos]);
		buffer[buf_pos] += amp * s / (SInt16)0x7FFF;
		
		//NSLog(@"%lf %lf %lf %lf",s,s0,s1,buffer[buf_pos]);
	}
	
	//KU: advance mPos by the number of buffer samples requested and rewind if necessary
	mPos += num_buf_samples;
	mPos -= mPos > mNumFileSamples ? mNumFileSamples : 0;
	
	mPrevSpeed = speed;
}

@end
