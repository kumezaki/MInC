//
//  Note.h
//		
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Envelope.h"
#import "WaveFormTable.h"

@interface Note : NSObject {

	Float64         Duration;

	Float64         Freq;
	Float64         Amp;
    
	WaveFormTable	*WaveTable;
	Envelope		*Env;

@public

	Float64 SR;

	SInt32 SamplesPlayed;
	SInt32 NumPlaySamples;
}

@property (readwrite, nonatomic) Float64 Duration;
@property (readwrite, nonatomic) Float64 Freq;
@property (readwrite, nonatomic) Float64 Amp;

+(Float64) mtof:(Float64)midi_note;

-(void)	on:(WaveFormTable*)wavetable :(Envelope*)env;
-(void) off;

-(Float64) addSamples:(Float64*)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta;

-(void) setPercentOn:(Float64)percent;

@end
