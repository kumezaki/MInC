//
//  AQPlayer.h
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>
#import "MInC_Biquad.h"
#import "MInC_Sequencer.h"
#import "MInC_SoundFile.h"
#import "MInC_WaveFormTable.h"

#define kNumberBuffers	3

#define kSR 22050.

@interface MInC_AQPlayer : NSObject {

	AudioQueueRef				Queue;
	AudioQueueBufferRef			Buffers[kNumberBuffers];
	AudioStreamBasicDescription	DataFormat;
	
	MInC_Sequence	*Sequences[53];
    
@public

	MInC_Sequencer	*Sequencer_Pri;
	MInC_Sequencer	*Sequencer_Sec;
}

@property (readwrite, nonatomic) SInt32 SeqNum;
@property (readwrite, nonatomic) SInt32 NumSequences;

@property (readonly, nonatomic, retain) MInC_Biquad *Biquad;

-(void)	setup;

-(OSStatus)	start;
-(OSStatus)	stop;

-(void) setSequence:(SInt32)seq_num;

-(void) parseFile;

-(void) fillAudioBuffer:(Float64*)buffer :(const SInt32)num_frames;

-(void) reportElapsedTime:(Float64)elapsed_time;

@end
