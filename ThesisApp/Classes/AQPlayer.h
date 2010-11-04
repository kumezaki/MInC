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

@interface AQPlayer : NSObject {

@public
	AudioQueueRef mQueue;
	AudioQueueBufferRef mBuffers[kNumberBuffers];
	AudioStreamBasicDescription mDataFormat;

	double mSR;
	double mFreq;
	double mAmp;
	double mTheta;
	
	WaveFormTable *mWaveTable;
}

-(void) New;

-(OSStatus) Start;
-(OSStatus) Stop;

//-(void) SetAmp:(double)val;
//-(void) SetFreq:(double)val;//these 2 lines are replaced by the following...

@property (readwrite, nonatomic) double mAmp;//why nonatomic?
@property (readwrite, nonatomic) double mFreq;

@end
