//
//  MUS147Effect_BiQuad.h
//  Music147_2013
//
//  Created by Kojiro Umezaki on 5/19/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

/* filter types */
enum {
    LPF, /* low pass filter */
    HPF, /* high pass filter */
    BPF, /* band pass filter */
    NOTCH, /* notch filter */
    PEQ, /* peaking band EQ filter */
    LSH, /* low shelf filter */
    HSH /* high shelf filter */
};

/* whatever sample type you want */
typedef Float64 smp_type;

/* this holds the data required to update samples thru a filter */
typedef struct {
    Float64 a0, a1, a2, a3, a4;
    Float64 x1, x2, y1, y2;
}
biquad;

@interface MInC_Biquad : NSObject {
    biquad* b;
    
    Float64 PrevFreq;
}

@property (readwrite) int     Type;
@property (readwrite) Float64 DBGain;
@property (readwrite) Float64 Freq;
@property (readwrite) Float64 SRate;
@property (readwrite) Float64 Bandwidth;

-(smp_type) biquad:(smp_type)sample;

-(void) updateCoeffs:(int)type :(Float64)dbGain :(Float64)freq :(Float64)srate :(Float64)bandwidth;

-(void)processAudioBuffer:(Float64*)buffer :(UInt32)num_samples;

@end
