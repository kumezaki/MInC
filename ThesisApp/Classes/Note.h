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
#define mSR 22050

@interface Note : NSObject {

@private
	
	WaveFormTable *mWaveTable;
	
	double mFreq;
	double mAmp;
	double mTheta;
	double mDeltaTheta;


	

}

-(double)getSample;
-(void)setWaveTable:(WaveFormTable *)wave_table;

@property double mFreq;
@property double mAmp;
@property double mTheta;

@end
