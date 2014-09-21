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

#define MINC_SECONDARY_SEQUENCER    0

#define kNumberBuffers	3

#define kSR 22050.

@interface MInC_AQPlayer : NSObject {

	AudioQueueRef				Queue;
	AudioQueueBufferRef			Buffers[kNumberBuffers];
	AudioStreamBasicDescription	DataFormat;
	
	MInC_Sequence	*Sequences[53];
    
    SInt32 AvgSeqPos;
    
    NSMutableArray* SynthArray;
    NSMutableArray* BiquadArray;

@public

    NSMutableArray* SequencerArray;

#if MINC_SECONDARY_SEQUENCER
	MInC_Sequencer	*Sequencer_Sec;
#endif
}

@property (readwrite, nonatomic) SInt32 NumSequences;

@property (readwrite, nonatomic) NSInteger PlayerID;

//@property (readwrite, nonatomic, retain) NSMutableArray* SeqNumArray;

@property (readwrite, nonatomic, retain) NSMutableDictionary* PlayerDictionary;

-(void)	setup;

-(OSStatus)	start;
-(OSStatus)	stop;

-(void) setSeqFileData:(NSData*) data;
-(void) loadSeqFile;

-(void) setSequence:(SInt32)seq_num;
-(void) setSequence:(SInt32)seq_num :(MInC_Sequence*)seq;

-(void) setOtherPlayersSequence:(NSMutableArray*)pos_array;

-(void) setSeqPos:(NSNumber*)num;
-(void) setAvgSeqPos:(NSNumber*)num;

-(void) addPlayerWithID:(NSString*)player_id;

-(void) parseFile;

-(void) fillAudioBuffer:(Float64*)buffer :(const SInt32)num_frames;

-(void) reportElapsedTime:(Float64)elapsed_time;

@end
