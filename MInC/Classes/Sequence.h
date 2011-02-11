//
//  Sequence.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Note.h"

#define kMaxNumNotes	32

@interface Sequence : NSObject {

	Note *mNotes[kMaxNumNotes];
	
	int mPos;
	int mNumNotes;
}

-(void)AssignNotes:(int)num_notes:(double*)notes:(double*)durations;

-(Note*)GetNote;

-(void)AdvancePos;

@end
