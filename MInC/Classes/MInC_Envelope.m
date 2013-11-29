//
//  Envelope.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "MInC_Envelope.h"

@implementation MInC_Envelope

-(id)init
{
	SR = 22050;
	Amp = 0.;
	Delta = 0.;
	RampTime = SR * 0.05;
	return self;
}

-(void)on
{
	Delta = 1. / RampTime;
}

-(void)off
{
	Delta = -1. / RampTime;
}

-(Float64)get
{
	Amp += Delta;
	
	if (Amp >= 1.0) { Amp = 1.; Delta = 0.; }
	else if (Amp <= 0.0) { Amp = 0.; Delta = 0.; }
    
//    NSLog(@"%f",Amp);
    
	return Amp;
}

@end
