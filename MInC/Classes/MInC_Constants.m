//
//  Constants.m
//  ForZero
//
//  Created by Chris Lavender on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MInC_Constants.h"

@implementation MInC_Constants

+ (NSDictionary*)messageDictionary {
    NSDictionary*messageDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"1" , @"/fz/state",        // not sure what this is for
                                @"2" , @"/fz/rec_prog",     // server record progress
                                @"3" , @"/fz/audio_out",    // data to drive server play meter display
                                @"4" , @"/fz/audio_in",     // data to driver server record meter display
                                @"5" , @"/fz/interstitial", // interstitial messages
                                @"6" , @"/fz/hb",           // fz heartbeat message
                                @"7" , @"/fz/play",         // device play from server
                                @"8" , @"/fz/stop",         // device stop from server
                                @"9" , @"/fz/cue",          // formerly used to cue UI "scenes"
                                @"10", @"/fz/loop",         // too loop device playback?
                                nil];
    return messageDict;
}
@end



/*                
 #if 0
 #define OSC_MSG_COMPARE(osc_add,add_type_val) if ([buf_str isEqualToString:@osc_add]) add_type = add_type_val;
 #else
 #define	OSC_MSG_COMPARE(osc_add,add_type_val) if (strcmp(self->UDPInBuffer,osc_add)==0) add_type = add_type_val;
 #endif
 
 OSC_MSG_COMPARE("/fz/state",1)
 else OSC_MSG_COMPARE("/fz/rec_prog",2)
 else OSC_MSG_COMPARE("/fz/interstitial",3)
 else OSC_MSG_COMPARE("/fz/hb",4)
 else OSC_MSG_COMPARE("/fz/play",5)
 else OSC_MSG_COMPARE("/fz/stop",6)
 else OSC_MSG_COMPARE("/fz/cue",7)
 else OSC_MSG_COMPARE("/fz/loop",8)
 // NSLog(@"add_type %d", add_type);
 break;*/