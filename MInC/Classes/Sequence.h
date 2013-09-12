//
//  Sequence.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Note.h"

#define kMaxNumNotes 32

@interface Sequence : NSObject {

	Note *mNotes[kMaxNumNotes];
	
	SInt32 mPos;
	SInt32 mNumNotes;
@public
	BOOL mRit;
}

-(void)AssignNotes:(SInt32)num_notes :(Float64*)notes :(Float64*)durations;

-(Note*)GetNote;

-(void)AdvancePos;

@end
