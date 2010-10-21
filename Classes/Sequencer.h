//
//  Sequencer.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Sequence.h"
#import "WaveFormTable.h"

@interface Sequencer : NSObject {
	
	BOOL	mPlaying;
	
@public
	Sequence *mSequence;
	
	double	mCurTime;
	double	mNextEventTime;

	double	mTempoMultiplier;
	double	mAmpMultiplier;
	double	mDurMultiplier;
	
	double	mTempoSensitivity;
	
	WaveFormTable	*mWaveTable;
	ADSR			*mADSR;
	
	NSSet*	mNoteSet;
}

-(void)Start;
-(void)Stop;
-(void)Rewind;

-(void)SetTempo:(double)multiplier;

-(void)Update:(double)elapsed_time;

-(Note*)GetNote;

@end
