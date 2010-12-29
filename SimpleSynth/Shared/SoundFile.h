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

#define kFileName_0		"audacity_0"
#define kFileName_1		"audacity_0"
#define kFileName_2		"audacity_1"
#define kFileName_3		"audacity_2"
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

-(void) GetSamples:(double*)buffer:(UInt32)num_buf_samples:(Float64)speed:(Float64)amp;
-(double) GetCurPos;

@end
