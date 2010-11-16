//
//  Mode.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Note.h"

@interface Mode : NSObject {
	
	double modeFreqs[kNumberNotes];
	
}

@property int noteNums;

@end
