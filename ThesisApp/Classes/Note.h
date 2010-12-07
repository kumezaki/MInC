//
//  Note.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Envelope.h"
#import "WaveFormTable.h"

#define kNumberNotes 8

@interface Note : NSObject {
	
@private	
	WaveFormTable *mWaveTable;
	Envelope	*mEnv;

	int mTableOffset;
	double mFreq;
	double mAmp;
	double mTheta;
	double mDeltaTheta;
}

@property int mTableOffset;
@property double mFreq;
@property double mAmp;
@property double mTheta;

+(double) mtof:(double)midiNote;

-(double)getSample;
-(void)getSamples:(double *)bufferPointer:(int)numFrames;
-(void)setWaveTable:(WaveFormTable *)wave_table;

-(void)on;
-(void)off;


@end
