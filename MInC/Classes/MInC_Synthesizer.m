//
//  MInC_Synthesizer.m
//  MInC
//
//  Created by Kojiro Umezaki on 8/10/14.
//
//

#import "MInC_Synthesizer.h"

@implementation MInC_Synthesizer

@synthesize Theta;

-(id)init
{
    self = [super init];
    
	Theta = 0.;
    
    return self;
}

-(Float64)addSamples:(Float64 *)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta :(Float64)freq
{
    return 0.;
}

-(void)setFreq:(Float64)freq
{
}

@end
