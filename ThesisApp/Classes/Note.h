//
//  Note.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WaveFormTable.h"

#define kNumberNotes 8

@interface Note : NSObject {
	
@public
	
	//CL: per your instructions I moved the ivars over to here. I'm not clear on whether I need them all over here though. mSR? mTheta?
	
	double mSR;
	double mFreq[kNumberNotes];
	double mAmp [kNumberNotes];
	double mTheta[kNumberNotes];
	
	//CL: if we're "getting a note" what are we getting? Do we need the mWaveFormTable?
	
	WaveFormTable *mWaveTable;

}

-(void) setFreq:(double)val withNotePos:(int)note_pos;
-(void) setAmp:(double)val withNotePos:(int)note_pos;

@end
