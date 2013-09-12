//
//  MUS147Voice_BLIT.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 5/3/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "BLIT.h"

@implementation BLIT

-(id)init
{
    self = [super init];
    
    return self;
}

-(void) SetFrequency:(Float64)freq
{
    [super SetFrequency:freq];
    
    p_ = 22050 / mFreq;
    rate_ = M_PI / p_;
    UInt32 maxHarmonics = (UInt32) floor( 0.5 * p_ );
    m_ = 2 * maxHarmonics + 1;
}

-(Float64) AddSamples:(Float64 *)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta
{
    // was addToAudioBuffer
    // removed old method body
    // BLITSaw implements its own method to add samples to the audio buffer,
    // and it's reasonable to expect that other BLIT implementations would do
    // the same
    
    for (SInt32 i = 0; i < num_frames; i++) {
        buffer[i] = 0;
    }
    
    return theta;
}

@end
