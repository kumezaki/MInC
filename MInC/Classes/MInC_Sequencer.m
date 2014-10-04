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

-(id)init
{
	Playing = NO;
    SyncWithServer = NO;

    AmpMultiplier_Accel_Target = 1.;
    AmpMultiplier_Accel_Delta = 0.;
#if MINC_ACCELLEROMETER && 0
	AmpMultiplier_Accel = 0.;
#else
	AmpMultiplier_Accel = AmpMultiplier_Accel_Target;
#endif

    CutoffFreq_Accel_Target = (kSR/2.)*0.9;
    CutoffFreq_Accel_Delta = 0.;
#if MINC_ACCELLEROMETER && 0
    CutoffFreq_Accel = 0.;
#else
    CutoffFreq_Accel = CutoffFreq_Accel_Target;
#endif

//    NotePos = 0;
	NotePos = -1;

	Seq_Cur = nil;
	CurTime = 0.;
	NextEventTime = 0.;
	TempoMultiplier_Accel = 2.;
	TempoMultiplier_Control = 1.;
	AmpMultiplier_Control = 1.;
	DurMultiplier = 1.;
	
	TempoSensitivity = 0.0;

	WaveTable = [[MInC_WaveFormTable alloc] init];
	
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
        if (Seq_Cur.NumNotes > 0)
            NotePos = ++NotePos % Seq_Cur.NumNotes;
        
#if MINC_NETWORK_LOCAL
        if (Seq_Cur.Pos == 0 && SyncWithServer)
            [gViewController.networking sendOSCMsgWithIntValue:"/minc/beat\0\0":12:1];
#endif
        
		/* get the new note */
		MInC_Note* note = [Seq_Cur getNote:NotePos];
		[note setPercentOn:DurMultiplier];
        note.TransposeValue_Instr = TransposeValue_Instr;
        note.TransposeValue_Control = TransposeValue_Control;
		[note on:WaveTable:Env];

		/* recompute the next event time */
		NextEventTime += note.Duration;
    }
    
    /* update accelerometer amplitude */
    AmpMultiplier_Accel += (AmpMultiplier_Accel_Delta * (kSR * elapsed_time));
    if ((AmpMultiplier_Accel_Delta < 0. && AmpMultiplier_Accel <= AmpMultiplier_Accel_Target)
        || (AmpMultiplier_Accel_Delta > 0. && AmpMultiplier_Accel >= AmpMultiplier_Accel_Target))
    {
        AmpMultiplier_Accel = AmpMultiplier_Accel_Target;
        AmpMultiplier_Accel_Delta = 0.;
    }

    /* update accelerometer cutoff frequency */
    CutoffFreq_Accel += (CutoffFreq_Accel_Delta * (kSR * elapsed_time));
    if ((CutoffFreq_Accel_Delta < 0. && CutoffFreq_Accel <= CutoffFreq_Accel_Target)
        || (CutoffFreq_Accel_Delta > 0. && CutoffFreq_Accel >= CutoffFreq_Accel_Target))
    {
        CutoffFreq_Accel = CutoffFreq_Accel_Target;
        CutoffFreq_Accel_Delta = 0.;
    }
}

-(void)setNextSequence:(MInC_Sequence*)seq
{
	Seq_Next = seq;
}

-(MInC_Note*)getNote;
{
	if (!Playing) return nil;

	if (Seq_Cur == nil) return nil;
	
	return [Seq_Cur getNote:NotePos];
}

-(Float64)getAmp
{
//    NSLog(@"AmpMultiplier_Accel %f",AmpMultiplier_Accel);
    return AmpMultiplier_Control * AmpMultiplier_Accel;
}

-(void)setAmp_Accel:(Float64)amp
{
    AmpMultiplier_Accel_Target = amp;
    
    const Float64 val_dif = AmpMultiplier_Accel_Target - AmpMultiplier_Accel;
    const Float64 dur_seconds = 0.1;
    const Float64 dur_samples = kSR * dur_seconds;
    AmpMultiplier_Accel_Delta = val_dif / dur_samples;
    
//    NSLog(@"amp %f, target %f, delta %f",AmpMultiplier_Accel, AmpMultiplier_Accel_Target,AmpMultiplier_Accel_Delta);
}

-(Float64)getCutoffFreq
{
    return CutoffFreq_Accel;
}

-(void)setCutoffFreq_Accel:(Float64)cutoff_freq
{
    CutoffFreq_Accel_Target = cutoff_freq;
    
    const Float64 val_dif = CutoffFreq_Accel_Target - CutoffFreq_Accel;
    const Float64 dur_seconds = 0.1;
    const Float64 dur_samples = kSR * dur_seconds;
    CutoffFreq_Accel_Delta = val_dif / dur_samples;
}

@end
