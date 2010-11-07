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
#define kNumNotes 8

#define kNumberNotes 2

@interface AQPlayer : NSObject
{

	AudioStreamBasicDescription		mDataFormat;
	AudioQueueRef					mQueue;
	AudioQueueBufferRef				mBuffers[kNumberBuffers];
	
	NSArray *noteArray;
	
@public
	
	double mSR;
<<<<<<< .mine
	double mFreq[kNumberNotes];
	double mAmp;
	double mTheta[kNumberNotes];
=======
>>>>>>> .r15
	
	Mode	*mNote_Pri;
	Mode	*mNote_Sec;
	
	Mode *mNotes[kNumNotes];
	
}

-(void) New;

-(OSStatus) start;
-(OSStatus) stop;


<<<<<<< .mine
-(void) setFreq:(double)val withNotePos:(int)note_pos;
//@property (readwrite, nonatomic) double mFreq;

=======
>>>>>>> .r15
@end
