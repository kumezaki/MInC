//
//  AQPlayer.h
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>
#import "Sequencer.h"
#import "SoundFile.h"
#import "WaveFormTable.h"

#define kNumberBuffers	3

#define kNumSequences	53

@interface AQPlayer : NSObject {

	AudioQueueRef				mQueue;
	AudioQueueBufferRef			mBuffers[kNumberBuffers];
	AudioStreamBasicDescription	mDataFormat;
	
@public

	double		mSR;
	
	Sequencer	*mSequencer_Pri;
	Sequencer	*mSequencer_Sec;

	int			mSeqNum;
	Sequence	*mSequences[kNumSequences];
}

-(void)	New;

-(OSStatus)	Start;
-(OSStatus)	Stop;

-(void) SetSequence:(int)seq_num;

-(NSString*) GetModString;

@end
