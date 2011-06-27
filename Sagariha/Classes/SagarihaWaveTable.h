//
//  SagarihaWaveTable.h
//  Sagariha
//
//  Created by Venky on 4/14/10.
//  Copyright 2010 Venkatramanan Krishnamani. All rights reserved.
//

#import <Foundation/Foundation.h>

#if 0
#define kWaveTableSize (512 * 64)
#else
#define kWaveTableSize (22050 * 5)
#endif

@interface SagarihaWaveTable : NSObject {
	
	double mTable[kWaveTableSize];

}

-(double) Get:(double)index;
-(void) Set:(UInt32)index:(double)value;

@end
