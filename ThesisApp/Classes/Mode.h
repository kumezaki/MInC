//
//  Mode.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/6/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Note.h"

#define kMaxNumNotes	8

@interface Mode : NSObject {

	Note *mNotes[kMaxNumNotes];
	
	int mNotePos;
	int mNumNotes;
}

-(void)assignNotes:(int)num_notes:(double*)notes:(double*)durations;

-(Note *)getNote;

-(void)advancePos;

@end
