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


@interface AQPlayer : NSObject {

	AudioQueueRef				mQueue;
	AudioQueueBufferRef			mBuffers[kNumberBuffers];
	AudioStreamBasicDescription	mDataFormat;
	
@public

	Float64		mSR;
	
	Sequencer	*mSequencer_Pri;
	Sequencer	*mSequencer_Sec;

	SInt32			mSeqNum;
	Sequence	*mSequences[53];
	
	SInt32			mPiece;
	SInt32			mPart;
	SInt32			mNumSequences;
	BOOL		mRit;
}

-(void)	New;

-(OSStatus)	Start;
-(OSStatus)	Stop;

-(void) SetSequence:(SInt32)seq_num;

-(void) ParseFile;

-(NSString*) GetModString;

@end
