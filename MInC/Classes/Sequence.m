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
		Notes[i] = [BLITSaw new];
	}
	
	NumNotes = -1;
	NumNotes = 0;
	Rit = FALSE;
	
	return self;
}

-(void)dealloc
{
	for (SInt32 i = 0; i < kMaxNumNotes; i++)
		[Notes[i] release];
	
	[super dealloc];
}

-(void)assignNotes:(SInt32)num_notes :(Float64*)notes :(Float64*)durations
{
	NumNotes = num_notes;
	for (SInt32 i = 0; i < NumNotes; i++)
	{
		Notes[i].Freq = [Note mtof:notes[i]];
		Notes[i].Duration = durations[i];
	}
}

-(Note*)getNote
{
	if (NumNotes < 0) return nil;
	
	return Notes[NumNotes];
}

-(void)advancePos
{
	if (NumNotes > 0)
		NumNotes = ++NumNotes % NumNotes;
}

@end
