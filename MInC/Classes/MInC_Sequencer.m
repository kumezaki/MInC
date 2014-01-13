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

#import "MInC_ViewController.h"
extern MInC_ViewController *gViewController;

@implementation MInC_Sequencer

@synthesize Playing;
@synthesize SyncWithServer;
@synthesize AmpMultiplier_Accel;
@synthesize AmpMultiplier_Control;
@synthesize TempoMultiplier_Accel;
@synthesize TempoMultiplier_Control;
@synthesize TempoSensitivity;
@synthesize TransposeValue_Instr;
@synthesize TransposeValue_Control;
@synthesize DurMultiplier;
@synthesize Theta;

-(id)init
{
	Playing = NO;
    SyncWithServer = NO;
	
	Seq_Cur = nil;
	CurTime = 0.;
	NextEventTime = 0.;
	TempoMultiplier_Accel = 2.;
	TempoMultiplier_Control = 1.;
	AmpMultiplier_Accel = 1.;
	AmpMultiplier_Control = 1.;
	DurMultiplier = 1.;
	
	TempoSensitivity = 0.0;

	WaveTable = [[MInC_WaveFormTable alloc] init];
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

-(void)update:(Float64)elapsed_time
{
	if (!Playing) return;
	
	CurTime += elapsed_time * TempoMultiplier_Accel * TempoMultiplier_Control;
	
	if (Seq_Next != nil)
	{
		Seq_Cur = Seq_Next;
        [self rewind];
		Seq_Next = nil;
	}
	
	if (CurTime >= NextEventTime)
	{
		/* advance the sequencer postion */
		[Seq_Cur advancePos];
        
        if (Seq_Cur.Pos == 0 && SyncWithServer)
            [gViewController.networking sendOSCMsgWithIntValue:"/minc/beat\0\0":12:1];

		/* get the new note */
		MInC_Note* note = [Seq_Cur getNote];
		[note setPercentOn:DurMultiplier];
        note.TransposeValue_Instr = TransposeValue_Instr;
        note.TransposeValue_Control = TransposeValue_Control;
		[note on:WaveTable:Env];

		/* recompute the next event time */
		NextEventTime += note.Duration;
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