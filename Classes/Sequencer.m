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
	
	mSequence = nil;
	mCurTime = 0.;
	mNextEventTime = 0.;
	mTempoMultiplier = 1.;
	mAmpMultiplier = 1.;
	mDurMultiplier = 1.;
	
	mTempoSensitivity = 0.5;

	mWaveTable = [WaveFormTable new];
	mADSR = [[ADSR alloc] initWithADSR:22050. a:0.01 d:0.01 s:1.0 r:0.1];
	
	mNoteSet = [NSSet new];

	return self;
}

- (void) dealloc
{
 	[mWaveTable release];
	[mADSR release];
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

-(void)SetTempo:(double)multiplier
{
	mTempoMultiplier = multiplier;
}

-(void)Update:(double)elapsed_time
{
	if (!mPlaying) return;
	
	mCurTime += (elapsed_time * mTempoMultiplier);
	if (mCurTime >= mNextEventTime)
	{
		[[mSequence GetNote] Off];
		[mSequence AdvancePos];
		[[mSequence GetNote] SetPercentOn:mDurMultiplier];
		[[mSequence GetNote] On:mWaveTable:mADSR];
		mNextEventTime += [[mSequence GetNote] GetDuration];
	}
}

-(Note*)GetNote;
{
	if (!mPlaying) return nil;

	if (mSequence == nil) return nil;
	
	return [mSequence GetNote];
}

@end
