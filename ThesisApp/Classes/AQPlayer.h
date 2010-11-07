//
//  AQPlayer.h
//  Music 147
//
//  Created by Chris Lavender on 4/7/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#import "Mode.h"
#import "WaveFormTable.h"

#define kNumberBuffers 3
#define kNumberNotes 8

@interface AQPlayer : NSObject
{

	AudioStreamBasicDescription		mDataFormat;
	AudioQueueRef					mQueue;
	AudioQueueBufferRef				mBuffers[kNumberBuffers];
	
	NSArray *noteArray;
	
@public
	
	double mSR;
	double mFreq[kNumberNotes];
	double mAmp;
	double mTheta[kNumberNotes];
	
	Mode	*mNote_Pri;
	Mode	*mNote_Sec;
	
	WaveFormTable *mWaveTable;
	
}

-(void) New;

-(OSStatus) start;
-(OSStatus) stop;


-(void) setFreq:(double)val withNotePos:(int)note_pos;
@property (readwrite, nonatomic) double mAmp;

@end
