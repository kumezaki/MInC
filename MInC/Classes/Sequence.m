//
//  Sequence.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Sequence.h"
#import "BLITSaw.h"

@implementation Sequence

-(id)init
{
	[super init];
	
	for (SInt32 i = 0; i < kMaxNumNotes; i++)
	{
		mNotes[i] = [BLITSaw new];
	}
	
	mPos = -1;
	mNumNotes = 0;
	mRit = FALSE;
	
	return self;
}

-(void)dealloc
{
	for (SInt32 i = 0; i < kMaxNumNotes; i++)
		[mNotes[i] release];
	
	[super dealloc];
}

-(void)AssignNotes:(SInt32)num_notes :(Float64*)notes :(Float64*)durations
{
	mNumNotes = num_notes;
	for (SInt32 i = 0; i < mNumNotes; i++)
	{
		mNotes[i].Freq = [Note mtof:notes[i]];
		mNotes[i].Duration = durations[i];
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
