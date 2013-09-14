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

	AudioQueueRef				Queue;
	AudioQueueBufferRef			Buffers[kNumberBuffers];
	AudioStreamBasicDescription	DataFormat;
	
	Sequence	*Sequences[53];

@public

	Float64		SR;
	
	Sequencer	*Sequencer_Pri;
	Sequencer	*Sequencer_Sec;

	SInt32		SeqNum;
	
	SInt32		Piece;
	SInt32		Part;
	SInt32		NumSequences;

    // not sure if the following is needed
	BOOL		Rit;
}

-(void)	setup;

-(OSStatus)	start;
-(OSStatus)	stop;

-(void) setSequence:(SInt32)seq_num;

-(void) parseFile;

// not sure if the following is needed
-(NSString*) getModString;

@end
