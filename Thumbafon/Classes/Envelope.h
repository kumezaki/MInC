//
//  Envelope.h
//  Thumbafon
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AQPlayer;

@interface Envelope : NSObject {
	
	double mAmp;
	double mDelta;
	
	double mSustainAmp;
	double mAttack;
	double mRelease;
}

- (void)setEnv:(NSString *)waveType;

- (void)on;
- (void)off;
- (double)get;

@end
