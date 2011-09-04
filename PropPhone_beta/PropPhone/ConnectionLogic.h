//
//  ConnectionLogic.h
//  PropPhone
//
//  Created by Chris Lavender on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionLogicDelegate.h"

@interface ConnectionLogic : NSObject {
    
}
@property(nonatomic,assign) id<ConnectionLogicDelegate> delegate;

- (BOOL)start;
- (void)stop;
- (void)broadcastChatMessage:(NSString*)message fromUser:(NSString*)name;

@end
