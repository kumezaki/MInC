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
	
	BOOL	mPlaying;
	
@public
	Sequence		*mSeq_Cur;
	Sequence		*mSeq_Next;
	
	Float64	mCurTime;
	Float64	mNextEventTime;

	Float64	mTempoMultiplier;
	Float64	mRitMultiplier;
	Float64	mAmpMultiplier;
	Float64	mDurMultiplier;
	
	Float64	mTempoSensitivity;
	
	WaveFormTable	*WaveTable;
	Float64			mTheta;

	Envelope		*mEnv;
	
	NSSet			*mNoteSet;
}

-(void)Start;
-(void)Stop;
-(void)Rewind;

-(void)SetTempo:(Float64)multiplier;
-(void)MoltoRit;
-(void)ResetRit;

-(void)Update:(Float64)elapsed_time;

-(Note*)getNote;

-(void)SetNextSequence:(Sequence*)seq;

@end
