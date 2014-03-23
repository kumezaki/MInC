//
//  Note.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_Note.h"

#import "MInC_AQPlayer.h"

@implementation MInC_Note
@synthesize Duration;
@synthesize MIDINote;
@synthesize Amp;
@synthesize TransposeValue_Instr;
@synthesize TransposeValue_Control;

-(id)init
{
	self = [super init];

	self.Duration = 0.;
	
	WaveTable = nil;

	Env = nil;
	
	Amp = 1.0;
    TransposeValue_Instr = 0;
    TransposeValue_Control = 0;
    
	SamplesPlayed = 0;
	NumPlaySamples = 0;
    
	return self;
}

-(void)dealloc
{
//	[Env release];

//	[super dealloc];
}

+(Float64) mtof:(Float64)midi_note
{
	return 440. * pow(2., (midi_note - 69) / 12.);
}

-(Float64) getFreqWithTransposition
{
    return MIDINote < 0 ? 0. : [MInC_Note mtof:(MIDINote+TransposeValue_Instr+TransposeValue_Control)]; // note number of -1 means rest
}

-(void)	on:(MInC_WaveFormTable*)wavetable :(MInC_Envelope*)env;
{
	WaveTable = wavetable;

	Env = env;
	
	SamplesPlayed = 0;
	
	[Env on];
}

-(void) off
{
	[Env off];
}

-(Float64) addSamples:(Float64*)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta
{
    Float64 freq = [self getFreqWithTransposition];

	if (freq == 0.) return theta;
	
	Float64 delta_theta = freq / kSR;
	for (SInt32 i = 0; i < num_frames; i++)
	{
		buffer[i] += scale * Amp * [WaveTable get:theta] * [Env get];
		theta += delta_theta;
		
		if (++SamplesPlayed >= NumPlaySamples) { /* NSLog(@"Envelope off"); */ [self off]; }
	}
	
	return theta;
}

-(void)	setPercentOn:(Float64)percent
{
	NumPlaySamples = Duration * kSR * percent;
//    NSLog(@"%ld %f %f",NumPlaySamples,Duration,percent);
}

@end
