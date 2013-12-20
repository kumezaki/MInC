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
	
	BOOL	Playing;
	
@public

	MInC_Sequence		*Seq_Cur;
	MInC_Sequence		*Seq_Next;
	
	Float64             CurTime;
	Float64             NextEventTime;

	Float64             TempoMultiplier;
	Float64             AmpMultiplier;
	Float64             DurMultiplier;
	
	Float64             TempoSensitivity;
	
	MInC_WaveFormTable	*WaveTable;
	Float64             Theta;

	MInC_Envelope       *Env;
	
	NSSet               *NoteSet;
}

@property (nonatomic,readwrite) Float64 TempoMultiplier;
@property (nonatomic,readwrite) Float64 TransposeValue;

-(void)start;
-(void)stop;
-(void)rewind;

-(void)update:(Float64)elapsed_time;

-(MInC_Note*)getNote;

-(void)setNextSequence:(MInC_Sequence*)seq;

@end
