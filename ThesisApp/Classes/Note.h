//
//  Note.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WaveFormTable.h"

#define kNumberNotes 8

@interface Note : NSObject {

@private
	
	WaveFormTable *mWaveTable;
	
	double sample;
	
	double mFreq;
	double mAmp;
	double mTheta;

	

}

// KU: you might want a method here to assign the mWaveTable member variable to the WaveFormTable object created in AQPlayer
// CL: I'm totally guessing on how to do this. I have no idea.

-(double)getSample:(double)sample;
-(void) [mWaveTable] = AQPlayer.mWaveTable;

@property double mFreq;
@property double mAmp;
@property double mTheta;

@end
