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
                                @"1" , @"/minc/interstitial",
                                @"2" , @"/minc/mod",
                                @"3" , @"/minc/hb",
                                nil];
    return messageDict;
}
@end
