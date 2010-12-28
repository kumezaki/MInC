//
//  Mode.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

#define kNumberModes 6

@interface Mode : NSObject {
	
	double modeNotes[kNumberNotes];
	int mNumNotes;
	
}

-(double) getNoteFreq:(int)val;

-(void) assignMode:(double*)notes;


@end
