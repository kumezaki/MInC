//
//  Note.h
//  Thumbafon
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WaveFormTable, Envelope, AQPlayer;

@interface Note : NSObject {
	
@private	
	WaveFormTable *mWaveTable;
	Envelope	*mEnv;

	double mFreq;
	double mAmp;
	double mTheta;
	double mDeltaTheta;
}

@property double mFreq;
@property double mTheta;

+ (double) mtof:(double)midiNote;

- (void)fillAudioBuffer:(double*)bufferPointer:(UInt32)numFrames;
- (void)setWaveTable:(WaveFormTable *)wave_table;
- (void)changeEnvelope:(NSString *)envType;
 
- (void)noteOn;
- (void)noteOff;


@end
