//
//  Mode.h
//  Thumbaphone
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AQPlayer.h" //for kNumberNotes only

@interface Mode : NSObject {
	
	double modeNotes[kNumberNotes];
	int mNumNotes;
	
}

-(double) getNoteFreq:(int)val;

-(void) assignMode:(double*)notes;


@end
