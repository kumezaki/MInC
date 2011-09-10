//
//  SagarihaAudioQueuePlayer.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SagarihaAudioQueuePlayer.h"


@implementation SagarihaAudioQueuePlayer
@synthesize delegate;
@synthesize theFile = _theFile;
@synthesize mAmp;

#if _old_AQ_
void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{
    SagarihaAudioQueuePlayer *aqp = (SagarihaAudioQueuePlayer *)inUserData;
	
	int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
    
	for (int i = 0; i < numFrames; i++)
		((SInt16 *)inAQBuffer->mAudioData)[i] = 0.5 * [aqp GetSample] * (SInt16)0x7FFF;
	
	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}


#else
void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inCompleteAQBuffer) 
{
	SagarihaAudioQueuePlayer *THIS = (SagarihaAudioQueuePlayer *)inUserData;
    
	if (THIS->mIsDone) return;
    
	UInt32 numBytes;
	UInt32 nPackets = THIS->mNumPacketsToRead;
	OSStatus result = AudioFileReadPackets(THIS->mAudioFile, 
                                           false, 
                                           &numBytes, 
                                           inCompleteAQBuffer->mPacketDescriptions, 
                                           THIS->mCurrentPacket, 
                                           &nPackets, 
										   inCompleteAQBuffer->mAudioData);
	if (result) {
		printf("AudioFileReadPackets failed: %ld\n", result);
        return;
    }
    //printf("AQ is running\n");
    
	if (nPackets > 0) {
		inCompleteAQBuffer->mAudioDataByteSize = numBytes;		
		inCompleteAQBuffer->mPacketDescriptionCount = nPackets;		
		AudioQueueEnqueueBuffer(inAQ, inCompleteAQBuffer, 0, NULL);
		THIS->mCurrentPacket = (THIS->mCurrentPacket + nPackets);
	} 
	
	else 
	{
		if (THIS->mIsLooping)
		{
			THIS->mCurrentPacket = 0;
			AQBufferCallback(inUserData, inAQ, inCompleteAQBuffer);
		}
		else
		{
			// stop
			THIS->mIsDone = true;
			AudioQueueStop(inAQ, false);
		}
	}
}
#endif



- (void)dealloc {
    
	[_theFile release];
    self.theFile = nil;
    [self Stop];
	[mWaveTable dealloc];
    
	[super dealloc];
}

- (id)init
{
	[super init];

#if _old_AQ_	
	//gAQP = self;
	mSR = 22050.;
	mFreq = 880.;
	mAmp = 1.0;
	mTheta = 0.;
    
	mLoopStart = 0.;
	mLoopEnd = 1.;

#else    
    mIsDone = NO;
    mIsLooping = YES;
    
#endif
    mIsPlaying = NO;
	mWaveTable = [[SagarihaWaveTable alloc] init];
    
	return self;
}

-(void)createAQ
#if _old_AQ_
{
	mDataFormat.mFormatID = kAudioFormatLinearPCM;
	mDataFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger;
	mDataFormat.mChannelsPerFrame = 1;
	mDataFormat.mSampleRate = mSR;
	mDataFormat.mBitsPerChannel = 16;
	mDataFormat.mFramesPerPacket = 1;
	mDataFormat.mBytesPerPacket = sizeof(SInt16);
	mDataFormat.mBytesPerFrame = sizeof(SInt16);
    
    OSStatus result = AudioQueueNewOutput(&mDataFormat,
                                          AQBufferCallback,
                                          self,
                                          nil,
                                          nil,
                                          0,
                                          &mQueue);
	
	if (result != noErr)
		NSLog(@"AudioQueueNewOutput %ld\n",result);
	
    for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		if (result != noErr)
			NSLog(@"AudioQueueAllocateBuffer %ld\n",result);
	}
}

#else
{
    
    OSStatus result = AudioQueueNewOutput(&mDataFormat,
                                          AQBufferCallback, 
                                          self, 
                                          nil, 
                                          nil, 
                                          0, 
                                          &mQueue);
    
	if (result != noErr) {
		printf("AudioQueueNewOutput failed: %ld\n",result);
        self.theFile = nil;
        return;
    }

    
    UInt32 bufferByteSize;		
	UInt32 maxPacketSize;
    UInt32 size = sizeof(maxPacketSize);
    
    result = AudioFileGetProperty(mAudioFile,                    
                                  kAudioFilePropertyPacketSizeUpperBound,  
                                  &size,               
                                  &maxPacketSize); 
    
    if (result != noErr) {
        NSLog(@"couldn't get file's max packet size: %ld\n",result);
        self.theFile = nil;
        return;
    }

    [self CalculateBytesForTime:mDataFormat
                               :maxPacketSize
                               :kBufferDurationSeconds
                               :&bufferByteSize
                               :&mNumPacketsToRead];
    
    //printf ("Buffer Byte Size: %d, Num Packets to Read: %d\n", (int)bufferByteSize, (int)mNumPacketsToRead);
    
    // channel layout?
	result = AudioFileGetPropertyInfo(mAudioFile, kAudioFilePropertyChannelLayout, &size, NULL);
	
    if (result == noErr && size > 0) {
		
        AudioChannelLayout *acl = (AudioChannelLayout *)malloc(size);
		
        result = (AudioFileGetProperty(mAudioFile, kAudioFilePropertyChannelLayout, &size, acl));
        if (result != noErr)
            NSLog(@"get audio file's channel layout: %ld\n",result);          
        
		result = (AudioQueueSetProperty(mQueue, kAudioQueueProperty_ChannelLayout, acl, size));
        if (result != noErr)
            NSLog(@"set channel layout on queue: %ld\n",result);          
        
		free(acl);
	}
    
    bool isFormatVBR = (mDataFormat.mBytesPerPacket == 0 || mDataFormat.mFramesPerPacket == 0);
	for (int i = 0; i < kNumberBuffers; ++i) {
		result = (AudioQueueAllocateBufferWithPacketDescriptions(mQueue, bufferByteSize, (isFormatVBR ? mNumPacketsToRead : 0), &mBuffers[i]));
        if (result)
            NSLog(@"AudioQueueAllocateBuffer failed: %ld\n",result);
	}	
    
	// set the volume of the queue
	result = (AudioQueueSetParameter(mQueue, kAudioQueueParam_Volume, 1.0));
    
    if (result != noErr)
        NSLog(@"set queue volume: %ld\n",result);
    
	printf("new AQ created.\n");
}
#endif

- (void)readAudioFile {
    
    CFURLRef audioFileURL = (CFURLRef) [NSURL URLWithString:self.theFile];
    //NSLog(@"filePath:%@",(NSString*)audioFileURL);
    
    OSStatus result = AudioFileOpenURL (audioFileURL, 
                                        kAudioFileReadPermission,
                                        0,
                                        &mAudioFile);
    if (result != noErr) {
		NSLog(@"AudioFileOpenURL %ld\n",result);
        [self.delegate audioQueueError:@"Unable to read the audio file.\nHas one been downloaded yet?"];
        self.theFile = nil;
        return;
    }
    
    UInt32 dataFormatSize = sizeof(mDataFormat);
    
    result = AudioFileGetProperty(mAudioFile, 
                                  kAudioFilePropertyDataFormat, 
                                  &dataFormatSize, 
                                  &mDataFormat);
    if (result != noErr) {
        NSLog(@"couldn't get file's data format: %ld\n",result);
        self.theFile = nil;
        return;
    }

}

- (OSStatus)Start
{
	OSStatus result = noErr;
    
    [self readAudioFile];
    //NSLog(@"File Loaded: %@",[[NSBundle mainBundle] URLForResource:@"SagarihaAudio" withExtension:@"aif"]);
    
    // if we have no queue, create one now
    if (mQueue == nil)
        [self createAQ];
    
	if (!mIsPlaying && self.theFile != nil)
	{
		// prime the queue with some data before starting
		for (int i = 0; i < kNumberBuffers; ++i)
			AQBufferCallback(self, mQueue, mBuffers[i]);            
        
		result = AudioQueueStart(mQueue, nil);
        
		mIsPlaying = YES;
	}

#if _old_AQ_
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.mp3"]];
    
	NSLog(file_exists?@"audio file downloaded":@"audio file did NOT download");
#else
#endif    
	
    return result;
}

-(OSStatus)Stop
{
	OSStatus result = noErr;
    
	if (mIsPlaying)
	{
		result = AudioQueueFlush(mQueue);            
		//NSLog(@"AudioQueueFlush %ld",result);
		
		result = AudioQueueStop(mQueue, true);
		//NSLog(@"AudioQueueStop %ld",result);
        
		mIsPlaying = NO;
	}
    
	return result;
}

-(double)GetSample
{
	double sample = [mWaveTable Get:mTheta] * mAmp;
#if 0
	mTheta += mFreq / mSR;
#else
	mTheta += 1. / kWaveTableSize;
	if (mTheta > mLoopEnd) mTheta = mLoopStart + (mTheta - mLoopEnd);
#endif
	return sample;
}

-(void)SetSample:(UInt32)index:(double)value
{
	[mWaveTable Set:index:value];
}

#if _old_AQ_

#else
- (void)CalculateBytesForTime:(AudioStreamBasicDescription)inDesc
                             :(UInt32)inMaxPacketSize
                             :(Float64)inSeconds
                             :(UInt32*)outBufferSize
                             :(UInt32*)outNumPackets {
    
	// we only use time here as a guideline
	// we're really trying to get somewhere between 16K and 64K buffers, but not allocate too much if we don't need it
	static const int maxBufferSize = 0x10000; // limit size to 64K
	static const int minBufferSize = 0x4000; // limit size to 16K
	
	if (inDesc.mFramesPerPacket) {
		Float64 numPacketsForTime = inDesc.mSampleRate / inDesc.mFramesPerPacket * inSeconds;
		*outBufferSize = numPacketsForTime * inMaxPacketSize;
	} else {
		// if frames per packet is zero, then the codec has no predictable packet == time
		// so we can't tailor this (we don't know how many Packets represent a time period
		// we'll just return a default buffer size
		*outBufferSize = maxBufferSize > inMaxPacketSize ? maxBufferSize : inMaxPacketSize;
	}
	
	// we're going to limit our size to our default
	if (*outBufferSize > maxBufferSize && *outBufferSize > inMaxPacketSize)
		*outBufferSize = maxBufferSize;
	else {
		// also make sure we're not too small - we don't want to go the disk for too small chunks
		if (*outBufferSize < minBufferSize)
			*outBufferSize = minBufferSize;
	}
	*outNumPackets = *outBufferSize / inMaxPacketSize;
}
#endif

@end
