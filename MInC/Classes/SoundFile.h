//
//  SoundFile.h
//  MInC
//
//  Created by Kojiro Umezaki on 6/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

#import "ADSR.h"

#define kIOBufferSize	512

@interface SoundFile : NSObject {

	AudioFileID		FileID;

	Float64			Duration;
	
	ADSR			*ADSR;
	
	SInt16			OutBuffer[kIOBufferSize];

@public

	bool On;
	
	Float64 SR;
	
	Float64 SamplesPlayed;
	SInt32 NumPlaySamples;
}

-(void)	on:(ADSR*)adsr;
-(void) off;

-(Float64) getSample;

-(Float64)	getDuration;
-(void)		setDuration:(Float64)duration;

-(void)		setPercentOn:(Float64)percent;

@end
