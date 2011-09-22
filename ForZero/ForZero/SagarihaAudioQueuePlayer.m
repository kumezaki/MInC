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
@synthesize mAmp, isPlaying=_isPlaying;

- (void)setIsPlaying:(BOOL)isPlaying
{
    // NSLog(@"%@", isPlaying == YES ? @"isPlaying YES" : @"isPlaying NO");
    if (isPlaying != _isPlaying) {
        _isPlaying = isPlaying;
        [self.delegate audioQueuePlayingState:self];
    }
}

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

- (void)dealloc {
    
	[_theFile release];
    self.theFile = nil;
    [self stop];

	[super dealloc];
}

- (id)init
{
	[super init];

    mIsDone = false;
    mIsLooping = true;
    
    self.isPlaying = NO;
    
	return self;
}

-(void)createAQ
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

- (OSStatus)start
{
	OSStatus result = noErr;
    
    [self readAudioFile];
    //NSLog(@"File Loaded: %@",[[NSBundle mainBundle] URLForResource:@"SagarihaAudio" withExtension:@"aif"]);
    
    // if we have no queue, create one now
    if (mQueue == nil)
        [self createAQ];
    
    if (mPaused) 
    {
        AudioQueueStart(mQueue, nil);
        self.isPlaying = YES;
        mPaused = NO;
    }
	
    else if (!self.isPlaying && self.theFile != nil)
	{
        mCurrentPacket = 0;
		// prime the queue with some data before starting
		for (int i = 0; i < kNumberBuffers; ++i)
			AQBufferCallback(self, mQueue, mBuffers[i]);         
        
		result = AudioQueueStart(mQueue, nil);
        
		self.isPlaying = YES;
	}
	
    return result;
}

-(OSStatus)stop
{
	OSStatus result = noErr;
    
	if (self.isPlaying)
	{
        result = AudioQueueFlush(mQueue); // redundant if AudioQueueStop inImmediate = false          
		//NSLog(@"AudioQueueFlush %ld",result);
		
		result = AudioQueueStop(mQueue, true);
		//NSLog(@"AudioQueueStop %ld",result);
        /*
        result = AudioQueueDispose(mQueue, true);
        mQueue = nil;
        */
		self.isPlaying = NO;
	}
    
	return result;
}

-(OSStatus)pause
{
	OSStatus result = noErr;
    
	if (!mPaused)
	{
		result = AudioQueuePause(mQueue);
		//NSLog(@"AudioQueuePause %ld",result);
        
        self.isPlaying = NO;
		mPaused = YES;
	}
    
	return result;
}

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

@end
