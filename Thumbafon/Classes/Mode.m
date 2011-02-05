//
//  Mode.m
//  Thumbafon
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Mode.h"

#import "VoiceSynth.h"

@implementation Mode

-(void) assignMode:(Float64*)notes {
	
	for (UInt8 i = 0; i < kNumberVoices; i++) modeFreq[i] = [VoiceSynth noteNumToFreq:notes[i]];
}

-(Float64) getNoteFreq:(UInt8)val {
	
	return modeFreq[val];	
}

@end
