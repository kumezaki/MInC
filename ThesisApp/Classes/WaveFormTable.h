//
//  WaveFormTable.h
//  Music 147
//
//  Created by Chris Lavender on 4/14/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kWaveformTableSize 512

@interface WaveFormTable : NSObject
{
	double mTable[kWaveformTableSize];
}

-(double) get:(double)index;

@end
