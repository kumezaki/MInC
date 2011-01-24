//
//  Mode.m
//  Thumbaphone
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Mode.h"
#import "Note.h"

@implementation Mode

-(void) assignMode:(double*)notes {
	
	for (int i = 0; i < kNumberNotes; i++) modeNotes[i] = [Note mtof:notes[i]];
}

-(double) getNoteFreq:(int)val {
	
	return modeNotes[val];	
}

@end
