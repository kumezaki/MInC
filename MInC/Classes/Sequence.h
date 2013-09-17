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

	Note    *Notes[kMaxNumNotes];
	
	SInt32  Pos;
	SInt32  NumNotes;

@public

	BOOL Rit;
}

-(void)assignNotes:(SInt32)num_notes :(Float64*)notes :(Float64*)durations;

-(Note*)getNote;

-(void)advancePos;

@end
