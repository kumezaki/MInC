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
@synthesize Sequencer;
@synthesize BLITSaw;
@synthesize BiQuad;

-(id)init
{
    Missing = NO;
    SeqPos_Cur = 0;
    SeqPos_Next = 0;
    Sequencer = nil;
    BLITSaw = nil;
    BiQuad = nil;
    
    return self;
}

-(id)initWithSequencer:(MInC_Sequencer*)_sequencer
{
    Missing = NO;
    SeqPos_Cur = 0;
    SeqPos_Next = 0;
    Sequencer = _sequencer;
    BLITSaw = nil;
    BiQuad = nil;
    
    return self;
}

@end
