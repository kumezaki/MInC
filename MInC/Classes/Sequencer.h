//
//  Sequencer.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Envelope.h"
#import "Sequence.h"
#import "WaveFormTable.h"

@interface Sequencer : NSObject {
	
	BOOL	Playing;
	
@public

	Sequence		*Seq_Cur;
	Sequence		*Seq_Next;
	
	Float64         CurTime;
	Float64         NextEventTime;

	Float64         TempoMultiplier;
	Float64         RitMultiplier;
	Float64         AmpMultiplier;
	Float64         DurMultiplier;
	
	Float64         TempoSensitivity;
	
	WaveFormTable	*WaveTable;
	Float64			Theta;

	Envelope		*Env;
	
	NSSet			*NoteSet;
}

@property (nonatomic,readwrite) Float64 TempoMultiplier;

-(void)start;
-(void)stop;
-(void)rewind;

-(void)moltoRit;
-(void)resetRit;

-(void)update:(Float64)elapsed_time;

-(Note*)getNote;

-(void)setNextSequence:(Sequence*)seq;

@end
