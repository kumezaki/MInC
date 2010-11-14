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

#define kNumberBuffers 3
#define kNumberNotes 8


@interface AQPlayer : NSObject
{

	AudioStreamBasicDescription		mDataFormat;
	AudioQueueRef					mQueue;
	AudioQueueBufferRef				mBuffers[kNumberBuffers];
		
@public

	
	double mSR;
	
	//CL: turns out that if mNotes is NOT a pointer it produces a build error. I guess no static allocating of objects?
	
	Note *mNotes[kNumberNotes];
	
	
//	double mFreq[kNumberNotes];
//	double mAmp [kNumberNotes];
//	double mTheta[kNumberNotes];
	
	WaveFormTable *mWaveTable;
	
}


-(void) New;

-(OSStatus) start;
-(OSStatus) stop;


-(void) setFreq:(double)val withNotePos:(int)note_pos;
-(void) setAmp:(double)val withNotePos:(int)note_pos;

@end
