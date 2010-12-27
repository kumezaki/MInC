//
//  SoundFile.h
//  MInC
//
//  Created by Kojiro Umezaki on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#define kIOBufferSamples	1024

@interface SoundFile : NSObject {

	AudioFileID		mFileID;

	SInt16			mOutBuffer[kIOBufferSamples];

@public
	bool mOn;
	
	double mSR;
	
	UInt32 mOutBufferPos;
}

-(void) GetSamples:(double*)buffer:(UInt32)num_buf_samples;

@end
