//
//  Note.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/5/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WaveFormTable.h"

@interface Note : NSObject {

	WaveFormTable	*mWaveTable;

/*the plan is to load an Array with possible freq's which are referenced by each button
 so button 1 would play NSArray location 1 so on and so fourth.  This way different notes
 could be loaded into the array as needed? Thoughts? */
	
@public
	
	NSArray *noteArray;
	
	bool mOn;
	
	double mSR;
	
	double mFreq;
	double mAmp;
	
	double mTheta;
	
	SInt32 mSamplesPlayed;
	SInt32 mNumPlaySamples;
	
}

@property (readwrite, nonatomic) double mFreq;
@property (readwrite, nonatomic) double mAmp;

+(double) mtof:(double)midi_note;

-(void)	on:(WaveFormTable*)wavetable;
-(void) off;


-(double) getSample;


@end
