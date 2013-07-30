//
//  Sequence.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Sequence.h"

@implementation Sequence

-(id)init
{
	[super init];
	
	for (int i = 0; i < kMaxNumNotes; i++)
	{
		mNotes[i] = [Note new];
	}
	
	mPos = -1;
	mNumNotes = 0;
	mRit = FALSE;
	
	return self;
}

-(void)dealloc
{
	for (int i = 0; i < kMaxNumNotes; i++)
		[mNotes[i] release];
	
	[super dealloc];
}

-(void)AssignNotes:(int)num_notes :(double*)notes :(double*)durations
{
	mNumNotes = num_notes;
	for (int i = 0; i < mNumNotes; i++)
	{
		mNotes[i]->mFreq = [Note mtof:notes[i]];
		[mNotes[i] SetDuration:durations[i]];
	}
}

-(Note*)GetNote
{
	if (mPos < 0) return nil;
	
	return mNotes[mPos];
}

-(void)AdvancePos
{
	if (mNumNotes > 0)
		mPos = ++mPos % mNumNotes;
}

@end
