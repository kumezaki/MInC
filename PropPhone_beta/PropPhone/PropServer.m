//
//  PropServer.m
//  PropPhone
//
//  Created by Chris Lavender on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PropServer.h"
#import "Connection.h"
#import "AppConfig.h"


// Private properties
@interface PropServer ()
@property(nonatomic,retain) Server *server;
// @property(nonatomic,retain) NSMutableSet *clients;
- (BOOL)start;
- (void)stop;

@end


@implementation PropServer

@synthesize currentConnection = _currentConnection;
@synthesize server;
// @synthesize clients;
@synthesize mHeartbeatTimer;
@synthesize isConnected = _isConnected;

- (void)setIsConnected:(BOOL)isConnected {
    _isConnected = isConnected;
    [self.delegate isConnected:isConnected];
}

// Initialization
- (id)init {
    // clients = [[NSMutableSet alloc] init];
    return self;
}


// Cleanup
- (void)dealloc {
    
    [super dealloc];
}

// Start the server and announce self
- (BOOL)start {
    
    //printf("PropServer START\n");
    
    self.isConnected = NO;
    
    // Create new instance of the server and start it up
    server = [[Server alloc] init];
    
    // We will be processing server events
    server.delegate = self;
    
    // Try to start it up
    if ( ! [server start] ) {
        self.server = nil;
        return NO;
    }
    
    return YES;
}


// Stop everything
- (void)stop {
    
    // Destroy server
    [server stop];
    [server release];
    
    // Close & release all connections
    // [clients makeObjectsPerformSelector:@selector(close)];
    [self.currentConnection performSelector:@selector(close)];
    [_currentConnection release];
}

#pragma mark ServerDelegate Method Implementations

// Server has failed. Stop the world.
- (void) serverFailed:(Server*)server reason:(NSString*)reason {
    // Stop everything and let our delegate know
    [self stop];
    [self.delegate connectionTerminated:self reason:reason];
}

- (void) serverDidPublish {
    //[serverBrowser stop];
    //printf("Server Published\n");
}

- (void)sendOSCHeartbeat {
    mHeartbeat = mHeartbeat == 0 ? 1 : mHeartbeat == 1 ? 0: -1;
    //printf("led %i\n", mHeartbeat);
    [self.currentConnection.processOSC packOSCMsgWithIntValue:"/prop/led\0\0\0":12:mHeartbeat];
        
    [self.delegate displayHeartbeat:mHeartbeat];
}

// New client connected to our server. Add it.
- (void) handleNewConnection:(Connection*)connection {
    
    self.currentConnection = connection;
    
    // Delegate everything to us
    connection.delegate = self;
    
    // Add to our list of clients
    // [clients addObject:connection];
    
    mHeartbeatTimer = [NSTimer scheduledTimerWithTimeInterval:.5 
                                                       target:self 
                                                     selector:@selector(sendOSCHeartbeat) 
                                                     userInfo:nil 
                                                      repeats:YES];
    self.isConnected = YES;
}

#pragma mark ConnectionDelegate Method Implementations

// We won't be initiating connections, so this is not important
- (void) connectionAttemptFailed:(Connection*)connection {
    printf("sorry... connection attempt failed\n");
}


// One of the clients disconnected, remove it from our list
- (void) connectionTerminated:(Connection*)connection {
    self.isConnected = NO;
    // [clients removeObject:connection];
    [self.delegate connectionTerminated:self reason:@"The control device has terminated it's connection."];
}

- (void)receivedNetworkPacket:(NSString *)inBuffer viaConnection:(Connection*)connection {
    // Display message locally
    //[self displayChatMessage:[packet objectForKey:@"message"] fromUser:[packet objectForKey:@"from"]];
    NSLog(@"The message is: %@", inBuffer);
}


- (void) didResolveService:(NSNetService *)service {
    [self.delegate didResolveService:service];
}

- (void)receivedTransportMessage:(NSString *)state {
    [self.delegate processMessage:state];
}

- (void)receivedLoopMsg:(UInt8)val {
    [self.delegate didReceiveLoopStateMsg:val];
}

@end
