//
//  ConnectionLogicDelegate.h
//  PropPhone
//
//  Created by Chris Lavender on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ConnectionLogic;

@protocol ConnectionLogicDelegate
- (void) connectionTerminated:(id)sender reason:(NSString*)reason;

@optional
- (void) processMessage:(NSString*)message;
- (void) didResolveService:(NSNetService*)service;
- (void) isConnected:(BOOL)state;
- (void) displayHeartbeat:(UInt8)val;
- (void) didReceiveLoopStateMsg:(UInt8)val;
@end
