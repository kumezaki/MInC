//
//  MUS147Voice_BLIT.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 5/3/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MInC_BLIT.h"

#import "MInC_AQPlayer.h"

@implementation MInC_BLIT

-(id)init
{
    self = [super init];
    
    return self;
}

-(void)setFreq:(Float64)freq
{
    p_ = kSR / freq;
    rate_ = M_PI / p_;
    UInt32 maxHarmonics = (UInt32) floor( 0.5 * p_ );
    m_ = 2 * maxHarmonics + 1;
}

-(Float64)addSamples:(Float64 *)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta
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
