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

#define kFileName		"audacity"
#define kFileExtension	"aif"

@interface SoundFile : NSObject {

	AudioFileID		mFileID;

	SInt16			mBuffer[kMaxIOBufferSamples];

	Float64			mPos;
	
	UInt64			mNumFileSamples;
	
	Float64			mPrevSpeed;
	
@public
	
}

-(void) GetSamples:(double*)buffer:(UInt32)num_buf_samples:(Float64)speed;
-(double) GetCurPos;

@end
