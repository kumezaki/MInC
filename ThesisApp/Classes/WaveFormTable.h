//
//  WaveFormTable.h
//  Music 147
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
}


-(void) createWaveType:(NSString *)waveType;
-(double) getSamples:(double)index;

@end
