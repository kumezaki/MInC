//
//  Sequence.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_Sequence.h"
#import "MInC_BLITSaw.h"

@implementation MInC_Sequence

-(id)init
{
	[super init];
	
	for (SInt32 i = 0; i < kMaxNumNotes; i++)
	{
		Notes[i] = [[MInC_BLITSaw alloc] init];
	}
	
//	Pos = 0;
	Pos = -1;
	NumNotes = 0;
	
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
//		Notes[i].Freq = notes[i] < 0 ? 0. : [MInC_Note mtof:notes[i]]; // note number of -1 means rest
        Notes[i].MIDINote = notes[i]; // note number of -1 means rest
		Notes[i].Duration = durations[i];
        NSLog(@"%f %f",Notes[i].MIDINote,Notes[i].Duration);
	}
}

-(MInC_Note*)getNote
{
	if (NumNotes < 0) return nil;
	
	return Notes[Pos];
}

-(void)advancePos
{
	if (NumNotes > 0)
		Pos = ++Pos % NumNotes;
//    NSLog(@"%ld",Pos);
}

@end
