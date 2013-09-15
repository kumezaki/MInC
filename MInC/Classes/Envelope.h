//
//  Envelope.h
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Envelope : NSObject {

	Float64 SR;
	Float64 RampTime;
	
	Float64 Amp;
	Float64 Delta;

}

-(void)on;
-(void)off;
-(Float64)get;

@end
