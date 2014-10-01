//
//  MInC_Player.h
//  MInC
//
//  Created by Kojiro Umezaki on 9/19/14.
//
//

#import <Foundation/Foundation.h>

#import "MInC_Sequencer.h"

#import "MInC_Biquad.h"
#import "MInC_BLITSaw.h"

#define PLAYER_ID_STR(id) [NSString stringWithFormat: @"%d", (int)id]

@interface MInC_Player : NSObject {
    
}

@property (readwrite) BOOL      Missing;
@property (readwrite) NSInteger SeqPos_Cur;
@property (readwrite) NSInteger SeqPos_Next;

@property (nonatomic,retain) MInC_Sequencer* Sequencer;

@property (nonatomic,retain) MInC_BLITSaw*  BLITSaw;
@property (nonatomic,retain) MInC_Biquad*   BiQuad;

@property (readwrite) Float64      PanL;
@property (readwrite) Float64      PanR;

-(id)initWithSequencer:(MInC_Sequencer*)_sequencer;

-(void)setPan:(Float64)pan;

@end
