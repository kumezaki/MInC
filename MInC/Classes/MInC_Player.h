//
//  MInC_Player.h
//  MInC
//
//  Created by Kojiro Umezaki on 9/19/14.
//
//

#import <Foundation/Foundation.h>

#import "MInC_Sequencer.h"

#define PLAYER_ID_STR(id) [NSString stringWithFormat: @"%d", (int)id]

@interface MInC_Player : NSObject {
    
}

@property (readwrite) BOOL      Missing;
@property (readwrite) NSInteger SeqPos;

@property (nonatomic,retain) MInC_Sequencer* Sequencer;

-(id)initWithSequencer:(MInC_Sequencer*)_sequencer;

@end
