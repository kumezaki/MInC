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
@synthesize SeqPos;
@synthesize Sequencer;

-(id)init
{
    Missing = NO;
    SeqPos = 0;
    Sequencer = nil;
    
    return self;
}

-(id)initWithSequencer:(MInC_Sequencer*)_sequencer
{
    Missing = NO;
    SeqPos = 0;
    Sequencer = _sequencer;
    
    return self;
}

@end
