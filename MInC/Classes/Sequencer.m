//
//  Sequencer.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Sequencer.h"

@implementation Sequencer

-(id)init
{
	mPlaying = NO;
	
	mSeq_Cur = nil;
	mCurTime = 0.;
	mNextEventTime = 0.;
	mTempoMultiplier = 1.;
	mRitMultiplier = 1.;
	mAmpMultiplier = 1.;
	mDurMultiplier = 1.;
	
	mTempoSensitivity = 0.5;

	mWaveTable = [WaveFormTable new];
	mTheta = 0.;
	
	mEnv = [[Envelope alloc] init];
	
	mNoteSet = [NSSet new];
	
	mSeq_Next = nil;

	return self;
}

- (void) dealloc
{
 	[mWaveTable release];
	[mNoteSet release];

	[super dealloc];
}


-(void)Start
{
	mPlaying = YES;
}

-(void)Stop
{
	mPlaying = NO;
}

-(void)Rewind
{
	mCurTime = 0.;
	mNextEventTime = 0.;
}

-(void)SetTempo:(Float64)multiplier
{
	mTempoMultiplier = multiplier;
}

-(void)MoltoRit
{
	mRitMultiplier = mRitMultiplier * 0.95;
}

-(void)ResetRit
{
	mRitMultiplier = 1.;
}

-(void)Update:(Float64)elapsed_time
{
	if (!mPlaying) return;
	
	mCurTime += (elapsed_time * mTempoMultiplier * mRitMultiplier);
	
	if (mSeq_Next != nil)
	{
		mSeq_Cur = mSeq_Next;
		
		/*if (mSeq_Cur->mRit) {
			[self MoltoRit];
			NSLog(@"rit");
		}
		else {
			[self ResetRit];
			NSLog(@"resetrit");
		}*/

		[self Rewind];
		mSeq_Next = nil;
	}
	
	if (mCurTime >= mNextEventTime)
	{
		/* advance the sequencer postion */
		[mSeq_Cur AdvancePos];

		/* get the new note */
		Note* note = [mSeq_Cur GetNote];
		[note SetPercentOn:mDurMultiplier];
		[note On:mWaveTable:mEnv];

		/* recompute the next event time */
		mNextEventTime += [note GetDuration];
		
		if (mSeq_Cur != nil)
		{
			if (mSeq_Cur->mRit) {
				[self MoltoRit];
			}
			else {
				[self ResetRit];
			}
			
		}
		
	}
}

-(Note*)GetNote;
{
	if (!mPlaying) return nil;

	if (mSeq_Cur == nil) return nil;
	
	return [mSeq_Cur GetNote];
}

-(void)SetNextSequence:(Sequence*)seq
{
	mSeq_Next = seq;
}

@end