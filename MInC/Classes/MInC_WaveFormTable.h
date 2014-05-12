//
//  WaveFormTable.h
//  MInC
//
//  Created by Venky on 4/14/10.
//  Copyright 2010 Venkatramanan Krishnamani. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kWaveFormTableSize (512 * 1)

@interface MInC_WaveFormTable : NSObject {
	
	Float64 Table[kWaveFormTableSize];

}

-(Float64) get:(Float64)index;

@end
