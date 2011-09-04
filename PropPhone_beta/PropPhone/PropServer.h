//
//  PropServer.h
//  PropPhone
//
//  Created by Chris Lavender on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionLogic.h"

#import "Server.h"

#import "ServerDelegate.h"
#import "ConnectionDelegate.h"

@interface PropServer : ConnectionLogic <ServerDelegate, ConnectionDelegate> {
    
    // We accept connections from other clients using an instance of the Server class
    Server          *server;
    
    // Container for all connected clients
    // NSMutableSet    *clients;
    Connection      *client;
    
    int             mHeartbeat;
    NSTimer         *mHeartbeatTimer;
}
@property(nonatomic, retain) Connection *currentConnection;
@property (nonatomic,retain) NSTimer *mHeartbeatTimer;
@property (nonatomic) BOOL isConnected;

// Initialize everything
- (id)init;

- (void)sendOSCHeartbeat;

@end
