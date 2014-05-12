//
//  Constants.h
//  ForZero
//
//  Created by Chris Lavender on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define _AlphaInterstitial_ 1
#define kCrossfadeDuration 0.75 //for animated crossfade transitions (ie Server & Client flipsides)
#define kCornerRadius 20

@interface Constants : NSObject

+ (NSDictionary*)messageDictionary;
@end