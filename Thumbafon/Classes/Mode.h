//
//  Mode.h
//  Thumbafon
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AQPlayer.h"

@interface Mode : NSObject {
	
	Float64 modeFreq[kNumberVoices];
	UInt16 mNumNotes;
	
}

- (void) assignMode:(Float64*)notes; //pulls note numbers from Content and sets Freq data in array
- (Float64) getNoteFreq:(UInt8)val; //pulls Freq data from array

@end
