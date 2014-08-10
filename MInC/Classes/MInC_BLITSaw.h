//
//  MUS147Voice_BLITSaw.h
//  Music147_2013
//
//  Created by Kojiro Umezaki on 5/5/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MInC_BLIT.h"

@interface MInC_BLITSaw : MInC_BLIT {
    Float64 C2_;
    Float64 state_;
}

#warning this should be in a super class labeled MInC_Synth
@property (nonatomic,readwrite) Float64 Theta;

@end
