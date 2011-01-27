//
//  WaveFormTable.h
//  Thumbafon
//
//  Created by Chris Lavender on 4/14/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AQPlayer.h"

@interface WaveFormTable : NSObject {
	@private
	
	NSString *mWaveType;
	double mTable[kAudioDataByteSize];
	
	double mAmp;
}
@property double mAmp;

-(void) createWaveType:(NSString *)waveType;
-(double) get:(double)index;

@end
