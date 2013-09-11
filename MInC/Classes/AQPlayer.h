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

	int			mSeqNum;
	Sequence	*mSequences[53];
	
	int			mPiece;
	int			mPart;
	int			mNumSequences;
	BOOL		mRit;
}

-(void)	New;

-(OSStatus)	Start;
-(OSStatus)	Stop;

-(void) SetSequence:(int)seq_num;

-(void) ParseFile;

-(NSString*) GetModString;

@end
