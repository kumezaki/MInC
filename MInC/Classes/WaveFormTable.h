//
//  WaveFormTable.h
//  MInC
//
//  Created by Venky on 4/14/10.
//  Copyright 2010 Venkatramanan Krishnamani. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kWaveFormTableSize (512 * 1)

@interface WaveFormTable : NSObject {
	
	double mTable[kWaveFormTableSize];

}

-(double) Get:(double)index;

@end
