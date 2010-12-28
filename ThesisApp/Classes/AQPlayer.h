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
	
	NSString *mWaveType;
	
	double mFreq;
	int mCurrentMode;

@public
	
	Mode *mModes[kNumberModes];
	Note *mNotes[kNumberNotes];
	WaveFormTable *mWaveTable;		
}

@property int mCurrentMode;
@property (nonatomic, retain) NSString *mWaveType;

-(void) New;

-(OSStatus) start;
-(OSStatus) stop;

-(void) startNote:(int)note_pos;
-(void) stopNote:(int)note_pos;

-(void) setMode:(int)val;
-(void) setWaveType:(NSString *)waveType;


@end
