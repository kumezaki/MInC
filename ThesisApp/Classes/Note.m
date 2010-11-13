//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"



@implementation Note

//CL: Implementation of setAmp and setFreq methods

-(void) setAmp:(double)val withNotePos:(int)note_pos;
{
	mAmp[note_pos]=val;
}


-(void) setFreq:(double)val withNotePos:(int)note_pos;
{
	mFreq[note_pos]=val;
}

//CL: if we indeed do use the mWaveFormTable we'll need the init and dealloc methods no?

- (void)dealloc
{
	[mWaveTable release];
 	[super dealloc];
}


-(id)init
{
	[super init];
	
	mWaveTable = [WaveFormTable new];
	
	return self;
}


@end
