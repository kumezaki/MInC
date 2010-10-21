//
//  WaveFormTable.h
//  MInC
//
//  Created by Venky on 4/14/10.
//  Copyright 2010 Venkatramanan Krishnamani. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kwaveFormTableSize (512 * 16)

@interface WaveFormTable : NSObject {
	
	double mTable[kwaveFormTableSize];

}

-(double) Get:(double)index;

@end
