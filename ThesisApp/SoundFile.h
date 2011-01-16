//
//  SoundFile.h
//  MInC
//
//  Created by Kojiro Umezaki on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#define kMaxIOBufferSamples	1024

#define kFileName_0		"ePiano"
#define kFileName_1		"flute"
#define kFileName_2		"marimba"
#define kFileName_3		"trumpet"
#define kFileExtension	"aif"

@interface SoundFile : NSObject {

	AudioFileID		mFileID;
	SInt16			mBuffer[kMaxIOBufferSamples];
	Float64			mPos;	
	UInt64			mNumFileSamples;	
	Float64			mPrevSpeed;	
	int				mSFID;

@public
	
}

-(id) initWithSFID:(int)sf_id;

-(void) getSamples:(double*)buffer:(UInt32)num_buf_samples:(Float64)speed:(Float64)amp;
-(double) getCurPos;

@end


@interface SoundFile_Simple : SoundFile {
}

-(void) getSamples:(double*)buffer:(UInt32)num_buf_samples:(Float64)speed:(Float64)amp;

@end