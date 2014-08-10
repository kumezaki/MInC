//
//  Sequence.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MInC_Note.h"

#define kMaxNumNotes 32

@interface MInC_Sequence : NSObject {

	MInC_Note   *Notes[kMaxNumNotes];
}

#if 0
@property (readwrite) SInt32 Pos;
#endif

@property (readwrite) SInt32    NumNotes;

-(void)assignNotes:(SInt32)num_notes :(Float64*)notes :(Float64*)durations;

#if 0
-(MInC_Note*)getNote;

-(void)advancePos;
#endif

-(MInC_Note*)getNote:(SInt32)note_pos;

@end
