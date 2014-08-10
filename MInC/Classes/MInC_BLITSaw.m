//
//  MUS147Voice_BLITSaw.m
//  Music147_2013
//
//  Created by Kojiro Umezaki on 5/5/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MInC_BLITSaw.h"

@implementation MInC_BLITSaw

@synthesize Theta;

-(id)init
{
    self = [super init];
    
    state_ = -0.5 * a_;

	Theta = 0.;

    return self;
}

-(void)setFreq:(Float64)freq
{
    [super setFreq:freq];

    a_ = m_ / p_;
    C2_ = 1. / p_;
}

-(Float64)addSamples:(Float64 *)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta :(Float64)freq
{
    [self setFreq:freq];

    phase_ = theta;
    
    for (SInt32 i = 0; i < num_frames; i++)
    {
        Float64 s = 0.;
        
        // quick fix to make sure that the frequency is audible before
        // calculating the sample values
        if (freq > 20.)
        {
            Float64 denominator = sin( phase_ );
            
            if ( fabs(denominator) <= 1e-12 ) {
                s = a_;
            }
            else if (p_ != 0) {
                s =  sin( m_ * phase_ );
                s /= p_ * denominator;
            }
            
            s += state_ - C2_;
            state_ = s * 0.995;
            
            buffer[i] += scale * s;
            
            phase_ += rate_;
            if ( phase_ >= M_PI ) phase_ -= M_PI;
        }
        else
        {
            buffer[i] = 0;
        }
    }
    
    return phase_;
}

// old method for adding samples to the buffer
// AddSamples is the correct method of use for the MInC implementation
/*
-(void)addToAudioBuffer:(Float64*)buffer :(UInt32)num_samples
{
    // https://ccrma.stanford.edu/software/stk/classstk_1_1BlitSaw.html
    // http://www.music.mcgill.ca/~gary/courses/2013/307/week5/bandlimited.html#SECTION00027000000000000000

    for (UInt32 i = 0; i < num_samples; i++)
    {
        Float64 s = 0.;
        
        Float64 denominator = sin( phase_ );
        if ( fabs(denominator) <= 1e-12 ) {
            s = a_;
        } else {
            s =  sin( m_ * phase_ );
            s /= p_ * denominator;
        }
        s += state_ - C2_;
        state_ = s * 0.995;

        // update the envelope by one sample
        //[mEnv update:1];
        
        buffer[i] += Amp * [mEnv get] * s;

        phase_ += rate_;
        if ( phase_ >= M_PI ) phase_ -= M_PI;
    }
}
*/

@end
