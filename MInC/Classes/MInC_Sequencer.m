//
//  Sequencer.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_Sequencer.h"

#import "MInC_ADSR.h"
#import "MInC_AQPlayer.h"

@implementation MInC_Sequencer

@synthesize TempoMultiplier;

-(id)init
{
	Playing = NO;
	
	Seq_Cur = nil;
	CurTime = 0.;
	NextEventTime = 0.;
	TempoMultiplier = 2.;
	RitMultiplier = 1.;
	AmpMultiplier = 1.;
	DurMultiplier = 1.;
	
	TempoSensitivity = 0.5;

	WaveTable = [MInC_WaveFormTable new];
	Theta = 0.;
	
	Env = [[MInC_ADSR alloc] initWithADSR:kSR a:0.01 d:0.05 s:0.5 r:0.2];
	
	NoteSet = [NSSet new];
	
	Seq_Next = nil;

	return self;
}

- (void) dealloc
{
 	[WaveTable release];
	[NoteSet release];

	[super dealloc];
}


-(void)start
{
	Playing = YES;
}

-(void)stop
{
	Playing = NO;
}

-(void)rewind
{
	CurTime = 0.;
	NextEventTime = 0.;
}

-(void)moltoRit
{
	RitMultiplier = RitMultiplier * 0.95;
}

-(void)resetRit
{
	RitMultiplier = 1.;
}

-(void)update:(Float64)elapsed_time
{
	if (!Playing) return;
	
	CurTime += (elapsed_time * TempoMultiplier * RitMultiplier);
	
	if (Seq_Next != nil)
	{
		Seq_Cur = Seq_Next;
		
		/*if (Seq_Cur->Rit) {
			[self moltoRit];
			NSLog(@"rit");
		}
		else {
			[self resetRit];
			NSLog(@"resetrit");
		}*/

		[self rewind];
		Seq_Next = nil;
	}
	
	if (CurTime >= NextEventTime)
	{
		/* advance the sequencer postion */
		[Seq_Cur advancePos];

		/* get the new note */
		MInC_Note* note = [Seq_Cur getNote];
		[note setPercentOn:DurMultiplier];
		[note on:WaveTable:Env];
//        NSLog(@"%f",note.Freq);

		/* recompute the next event time */
		NextEventTime += note.Duration;
		
		if (Seq_Cur != nil)
		{
			if (Seq_Cur->Rit)
				[self moltoRit];
			else
				[self resetRit];
		}
	}
}

-(MInC_Note*)getNote;
{
	if (!Playing) return nil;

	if (Seq_Cur == nil) return nil;
	
	return [Seq_Cur getNote];
}

-(void)setNextSequence:(MInC_Sequence*)seq
{
	Seq_Next = seq;
}

@end