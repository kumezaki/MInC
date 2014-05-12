//
//  MUS147Voice_BLIT.h
//  Music147_2013
//
//  Created by Kojiro Umezaki on 5/3/13.
//  Copyright (c) 2013 Kojiro Umezaki. All rights reserved.
//

#import "MInC_Note.h"

@interface MInC_BLIT : MInC_Note {
    Float64 p_;
    Float64 rate_;
    Float64 m_;
    Float64 a_;
    Float64 phase_;
}

-(void)setFreq:(Float64)freq;

@end
