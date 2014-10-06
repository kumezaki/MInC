//
//  MInC_Player.m
//  MInC
//
//  Created by Kojiro Umezaki on 9/19/14.
//
//

#import "MInC_Player.h"

@implementation MInC_Player

@synthesize Missing;
@synthesize SeqPos_Cur;
@synthesize SeqPos_Next;
@synthesize SeqSpeed_Cur;
@synthesize SeqSpeed_Next;
@synthesize SeqOctave_Cur;
@synthesize SeqOctave_Next;
@synthesize SeqMute_Cur;
@synthesize SeqMute_Next;
@synthesize Like;
@synthesize Sequencer;
@synthesize BLITSaw;
@synthesize BiQuad;
@synthesize PanL;
@synthesize PanR;

-(id)init
{
    Missing = NO;
    SeqPos_Cur = 0;
    SeqPos_Next = 0;
    SeqSpeed_Cur = 0;
    SeqSpeed_Next = 0;
    SeqOctave_Cur = 0;
    SeqOctave_Next = 0;
    SeqMute_Cur = 0;
    SeqMute_Next = 0;
    Like = NO;
    Sequencer = nil;
    BLITSaw = nil;
    BiQuad = nil;
    PanL = 0.5;
    PanR = 0.5;
    
    return self;
}

-(id)initWithSequencer:(MInC_Sequencer*)_sequencer
{
    Missing = NO;
    SeqPos_Cur = 0;
    SeqPos_Next = 0;
    SeqSpeed_Cur = 0;
    SeqSpeed_Next = 0;
    SeqOctave_Cur = 0;
    SeqOctave_Next = 0;
    SeqMute_Cur = 0;
    SeqMute_Next = 0;
    Like = NO;
    Sequencer = _sequencer;
    BLITSaw = nil;
    BiQuad = nil;
    PanL = 0.5;
    PanR = 0.5;
    
    return self;
}

-(void)setPan:(Float64)pan
{
    PanL = cos(pan * M_PI_2);
    PanR = sin(pan * M_PI_2);
//    NSLog(@"%f-%f",PanL,PanR);
}

@end
