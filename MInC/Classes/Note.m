//
//  Note.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Note.h"


@implementation Note
@synthesize Duration;
@synthesize Amp;
@synthesize Freq;

-(id)init
{
	[super init];

	self.Duration = 0.;
	
	WaveTable = nil;

	Env = nil;
	
	SR = 22050;
	Freq = 0.0;
	Amp = 1.0;

	SamplesPlayed = 0;
	NumPlaySamples = 0;
	
	return self;
}

-(void)dealloc
{
	[Env release];

	[super dealloc];
}

+(Float64) mtof:(Float64)midi_note
{
	return 440. * pow(2., (midi_note - 69) / 12.);
}

-(void)	on:(WaveFormTable*)wavetable :(Envelope*)env;
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
	if (Freq == 0.) return theta;
	
	Float64 delta_theta = Freq / SR;
	for (SInt32 i = 0; i < num_frames; i++)
	{
		buffer[i] += scale * Amp * [WaveTable get:theta] * [Env get];
		theta += delta_theta;
		
		if (++SamplesPlayed >= NumPlaySamples) [self off];
	}
	
	return theta;
}

-(void)	setPercentOn:(Float64)percent
{
	NumPlaySamples = Duration * SR * percent;
}

@end
