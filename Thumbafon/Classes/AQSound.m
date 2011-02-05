//
//  AQSound.m
//  Thumbafon
//
//  Created by Chris Lavender on 2/4/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import "AQSound.h"
#import "SinePiano.h"
#import "PulseOrgan.h"
#import "SquarePad.h"
#import "SawBrass.h"
#import "TriangleFlute.h"

@implementation AQSound
@synthesize soundType;

-(id)init {
    
	[super init];
	
	for (UInt8 i = 0; i < kNumberVoices; i++) {
        voice[i] = [[PulseOrgan alloc] init];
    }
	
	self.soundType = @"Organ";
	[self setMode:0];
	return self;
}

-(void)dealloc {
	for (UInt8 i = 0; i < kNumberVoices; i++) [voice[i] release];	
    
	[super dealloc];
}

- (void)setSound:(NSString*)sound_type {
	soundType = sound_type;
	
	if ([soundType isEqual:@"Organ"]) {
		for (UInt8 i = 0; i < kNumberVoices; i++)
		{
			if (voice[i] != nil) [voice[i] release];
			voice[i] = [[PulseOrgan alloc] init];
		}
	}
	else if ([soundType isEqual:@"Brass"]) {
		for (UInt8 i = 0; i < kNumberVoices; i++)
		{
			if (voice[i] != nil) [voice[i] release];
			voice[i] = [[SawBrass alloc] init];
		}
	}
	else if ([soundType isEqual:@"Pad"]) {
		for (UInt8 i = 0; i < kNumberVoices; i++)
		{
			if (voice[i] != nil) [voice[i] release];
			voice[i] = [[SquarePad alloc] init];
		}
	}
	else if ([soundType isEqual:@"Flute"]) {
		for (UInt8 i = 0; i < kNumberVoices; i++)
		{
			if (voice[i] != nil) [voice[i] release];
			voice[i] = [[TriangleFlute alloc] init];
		}
	}
	else {
		for (UInt8 i = 0; i < kNumberVoices; i++)
		{
			if (voice[i] != nil) [voice[i] release];
			voice[i] = [[SinePiano alloc] init];
		}
	}
	[self setMode:currentMode];
}

@end
