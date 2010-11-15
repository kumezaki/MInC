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
	
	double mSR;
	double mFreq;
	double mAmp;
	double mTheta;

	

}

-(double)getSample;

-(void)setWaveTable:(WaveFormTable *)wave_table;
//CL: how does this point to the WaveFormTable created by AQPlayer?
//KU: see my comments in the init method for AQPlayer

@property double mSR;
@property double mFreq;
@property double mAmp;
@property double mTheta;

@end
