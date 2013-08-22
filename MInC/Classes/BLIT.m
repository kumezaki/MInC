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

-(void) SetFrequency:(double)freq
{
    [super SetFrequency:freq];
    
    p_ = 22050 / mFreq;
    rate_ = M_PI / p_;
    UInt32 maxHarmonics = (UInt32) floor( 0.5 * p_ );
    m_ = 2 * maxHarmonics + 1;
}

-(double) AddSamples:(double *)buffer :(const int)num_frames :(double)scale :(double)theta
{
    // was addToAudioBuffer
    // removed old method body
    // BLITSaw implements its own method to add samples to the audio buffer,
    // and it's reasonable to expect that other BLIT implementations would do
    // the same
    
    for (int i = 0; i < num_frames; i++) {
        buffer[i] = 0;
    }
    
    return theta;
}

@end
