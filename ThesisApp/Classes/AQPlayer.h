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
#import "Note.h"
#import "Mode.h"

#define kNumberBuffers 3

@interface AQPlayer : NSObject
{

	AudioStreamBasicDescription		mDataFormat;
	AudioQueueRef					mQueue;
	AudioQueueBufferRef				mBuffers[kNumberBuffers];
		

@private
	
	double mAmp;
	double mFreq;
	
	NSMutableArray *sampleBuffer;

	
@public
	
	int currentMode;

	Mode *mModes[kNumberModes];
	Note *mNotes[kNumberNotes];
	WaveFormTable *mWaveTable;
	
}

-(void) New;

-(OSStatus) start;
-(OSStatus) stop;

-(void) playNote:(int)note_pos;
-(void) setMAmp:(double)val withNotePos:(int)note_pos;
-(void) setMode:(int)val;

@end
