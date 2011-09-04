//
//  ConnectionLogic.m
//  PropPhone
//
//  Created by Chris Lavender on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ConnectionLogicDelegate.h"
#import "ConnectionLogic.h"

@implementation ConnectionLogic

@synthesize delegate = _delegate;

// Cleanup
- (void)dealloc {
    [super dealloc];
}


// "Abstract" methods
- (BOOL)start {
    // Crude way to emulate "abstract" class
    [self doesNotRecognizeSelector:_cmd];
    return NO;
}

- (void)stop {
    // Crude way to emulate "abstract" class
    [self doesNotRecognizeSelector:_cmd];
}

- (void)broadcastChatMessage:(NSString*)message fromUser:(NSString*)name {
    // Crude way to emulate "abstract" class
    [self doesNotRecognizeSelector:_cmd];
}

@end
