//
//  Envelope.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SR	22050.
#define RAMP_TIME	(SR * 0.05)

@interface Envelope : NSObject {
	
	double mAmp;
	double mDelta;

}

-(void)on;
-(void)off;
-(double)get;

@end
