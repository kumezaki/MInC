//
//  Note.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WaveFormTable, Envelope, SoundFile, AQPlayer;

@interface Note : NSObject {
	
@private	
	WaveFormTable *mWaveTable;
	Envelope	*mEnv;
	
	SoundFile *mSoundFile;

	double mFreq;
	double mAmp;
	double mTheta;
	double mDeltaTheta;
}

@property double mFreq;
@property double mAmp;
@property double mTheta;

+(double) mtof:(double)midiNote;

-(void)fillAudioBuffer:(double*)bufferPointer:(UInt32)numFrames;
-(void)setWaveTable:(WaveFormTable *)wave_table;
-(void)setSoundFile:(SoundFile *)sound_file;

-(void)on;
-(void)off;


@end
