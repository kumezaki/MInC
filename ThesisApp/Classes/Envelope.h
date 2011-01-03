//
//  Envelope.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AQPlayer.h"//for kSR setting only

#define MAX_AMP	0.95
#define RAMP_TIME	(kSR * 0.05)

@interface Envelope : NSObject {
	
	double mAmp;
	double mDelta;

}

-(void)on;
-(void)off;
-(double)get;

@end
