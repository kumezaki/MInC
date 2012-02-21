//
//  KoDeep_Audio.h
//  KoDeep
//
//  Created by Kojiro Umezaki on 8/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

#import "ADSR.h"
#import "Note.h"
#import "WaveFormTable.h"

#define kNumberBuffers	3

@interface KoDeep_Audio : NSObject {

	AudioQueueRef				mQueue;
	AudioQueueBufferRef			mBuffers[kNumberBuffers];
	AudioStreamBasicDescription	mDataFormat;

@public

	double						mCurTime;
	double						mNextEventTime;
	
	double						mTempoMultiplier;

	WaveFormTable				*mWaveTable;
	ADSR						*mADSR;
	
	double						mSR;
	Note*						mNote;
	
	UInt16						mNumBeats;
	UInt16						mBeatNum;

	double						mFraction;
    UInt16                      mCurFractNum;
	
	double						mBaseMIDINote;
}

-(void)New;

-(OSStatus)Start;
-(OSStatus)Stop;

-(void)SetNumBeats:(UInt16)num_beats:(double)fraction;
-(void)ResetBeatNum;

-(double)GetBaseMIDINote;
-(void)SetBaseMIDINote:(double)midi_note;

-(void)UpdateScheduler:(Float64)elapsed_time;

@end
