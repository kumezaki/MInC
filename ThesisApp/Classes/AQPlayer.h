//
//  AQPlayer.h
//  Music 147
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#import "WaveFormTable.h"

#define kNumberBuffers 3

@interface AQPlayer : NSObject
{

	AudioStreamBasicDescription		mDataFormat;
	AudioQueueRef					mQueue;
	AudioQueueBufferRef				mBuffers[kNumberBuffers];
	
	NSArray *noteArray;
	
@public
	
	double mSR;
	double mFreq[2];
	double mAmp;
	double mTheta[2];
	
	WaveFormTable *mWaveTable;
}

-(void) New;

-(OSStatus) start;
-(OSStatus) stop;

//-(void) setAmp:(double)val;
@property (readwrite, nonatomic) double mAmp;//why nonatomic?

-(void) setFreq:(double)val;
//@property (readwrite, nonatomic) double mFreq;

@end
