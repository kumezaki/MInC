//
//  Mode.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Note.h"

#define kNumberModes 4

@interface Mode : NSObject {
	
	double modeFreq[kNumberNotes];
	double mFreq;
	
}

-(double) getNoteFreq:(int)val;


@end
