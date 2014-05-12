//
//  Sequencer.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MInC_Envelope.h"
#import "MInC_Sequence.h"
#import "MInC_WaveFormTable.h"

@interface MInC_Sequencer : NSObject {
	
	Float64             CurTime;
	Float64             NextEventTime;
    
	Float64             Theta;

	NSSet               *NoteSet;
    
    Float64             AmpMultiplier_Accel;
    Float64             AmpMultiplier_Accel_Target;
    Float64             AmpMultiplier_Accel_Delta;

    Float64             CutoffFreq_Accel;
    Float64             CutoffFreq_Accel_Target;
    Float64             CutoffFreq_Accel_Delta;

@public

	MInC_Sequence		*Seq_Cur;
	MInC_Sequence		*Seq_Next;
	
	MInC_WaveFormTable	*WaveTable;
	MInC_Envelope       *Env;
}

@property (readonly)    BOOL    Playing;
@property (readwrite)   BOOL    SyncWithServer;

@property (nonatomic,readwrite) Float64 AmpMultiplier_Control;
@property (nonatomic,readwrite) Float64 TempoMultiplier_Accel;
@property (nonatomic,readwrite) Float64 TempoMultiplier_Control;
@property (nonatomic,readwrite) Float64 TempoSensitivity;
@property (nonatomic,readwrite) Float64 TransposeValue_Instr;
@property (nonatomic,readwrite) Float64 TransposeValue_Control;
@property (nonatomic,readwrite) Float64 DurMultiplier;
@property (nonatomic,readwrite) Float64 Theta;

-(void)start;
-(void)stop;
-(void)rewind;

-(void)update:(Float64)elapsed_time;

-(void)setNextSequence:(MInC_Sequence*)seq;

-(MInC_Note*)getNote;

-(Float64)getAmp;
-(void)setAmp_Accel:(Float64)amp;

-(Float64)getCutoffFreq;
-(void)setCutoffFreq_Accel:(Float64)cutoff_freq;

@end
