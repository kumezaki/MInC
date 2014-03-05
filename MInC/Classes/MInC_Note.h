//
//  Note.h
//		
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MInC_Envelope.h"
#import "MInC_WaveFormTable.h"

@interface MInC_Note : NSObject {

	MInC_WaveFormTable	*WaveTable;
	MInC_Envelope		*Env;
    
    Float64     PrevScale;

@public

	SInt32 SamplesPlayed;
	SInt32 NumPlaySamples;
}

@property (readwrite, nonatomic) Float64 Duration;
@property (readwrite, nonatomic) Float64 MIDINote;
@property (readwrite, nonatomic) Float64 Amp;
@property (nonatomic,readwrite) Float64 TransposeValue_Instr;
@property (nonatomic,readwrite) Float64 TransposeValue_Control;

+(Float64) mtof:(Float64)midi_note;

-(Float64) getFreqWithTransposition;

-(void)	on:(MInC_WaveFormTable*)wavetable :(MInC_Envelope*)env;
-(void) off;

-(Float64) addSamples:(Float64*)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta;

-(void) setPercentOn:(Float64)percent;

@end
