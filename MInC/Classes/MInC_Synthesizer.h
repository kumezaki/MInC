//
//  MInC_Synthesizer.h
//  MInC
//
//  Created by Kojiro Umezaki on 8/10/14.
//
//

#import <Foundation/Foundation.h>

@interface MInC_Synthesizer : NSObject

@property (nonatomic,readwrite) Float64 Theta;

-(Float64)addSamples:(Float64 *)buffer :(const SInt32)num_frames :(Float64)scale :(Float64)theta :(Float64)freq;

-(void)setFreq:(Float64)freq;

@end


