//
//  Mode.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/6/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Mode.h"


@implementation Mode

-(id)init
{
	[super init];
	
	for (int i = 0; i < kMaxNumNotes; i++)
	{
		mNotes[i] = [Note new];
	}
	
	mNotePos = -1;
	mNumNotes = 0;
	
	return self;
}

-(void)dealloc
{
	for (int i = 0; i < kMaxNumNotes; i++)
		[mNotes[i] release];
	
	[super dealloc];
}

-(void)assignNotes:(int)num_notes:(double*)notes:(double*)durations
{
	mNumNotes = num_notes;
	for (int i = 0; i < mNumNotes; i++)
	{
		mNotes[i]->mFreq = [Note mtof:notes[i]];
		[mNotes[i] SetDuration:durations[i]];
	}
}

-(Note*)getNote //can I set up an Array of pitches to be referenced by the button text labels?
{
	if (mNotePos < 0) return nil;
	else {
		mNotes[0]=262;//C4
		mNotes[1]=330;//E4
		mNotes[2]=349;//F4
		mNotes[3]=392;//G4
		mNotes[4]=466;//Bb4
		mNotes[5]=523;//C5
		mNotes[6]=659;//E5
		mNotes[7]=699;//F5
		
	}
	
	
	return mNotes[mNotePos];
}


@end
