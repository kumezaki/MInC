//
//  ControlClient.h
//  PropPhone
//
//  Created by Chris Lavender on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionLogic.h"

#import "Connection.h"
#import "ConnectionDelegate.h"

@interface ControlClient : ConnectionLogic <ConnectionDelegate>{
    
    // Our connection to the chat server
    Connection* connection;
}
@property(nonatomic,retain) Connection* connection;

// Initialize with host address and port
- (id)initWithHost:(NSString*)host andPort:(int)port;

// Initialize with a reference to a net service discovered via Bonjour
- (id)initWithNetService:(NSNetService*)netService;
@end

