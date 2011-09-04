//
//  ControlClient.m
//  PropPhone
//
//  Created by Chris Lavender on 8/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ControlClient.h"

// Private properties
@interface ControlClient ()
@end


@implementation ControlClient

@synthesize connection;

// Setup connection but don't connect yet
- (id)initWithHost:(NSString*)host andPort:(int)port {
    connection = [[Connection alloc] initWithHostAddress:host andPort:port];
    return self;
}


// Initialize and connect to a net service
- (id)initWithNetService:(NSNetService*)netService {
    connection = [[Connection alloc] initWithNetService:netService];
    return self;
}


// Cleanup
- (void)dealloc {
    [connection release];
    self.connection = nil;
    [super dealloc];
}


// Start everything up, connect to server
- (BOOL)start {
    
    if ( connection == nil ) {
        return NO;
    }
    
    // We are the delegate
    connection.delegate = self;

    return [connection connect];
}


// Stop everything, disconnect from server
- (void)stop {
    
    if ( connection == nil ) {
        return;
    }
    [connection close];
    self.connection = nil;
}

/*
// Send chat message to the server
- (void)broadcastChatMessage:(NSString*)message fromUser:(NSString*)name {
    // Create network packet to be sent to all clients
    NSDictionary* packet = [NSDictionary dictionaryWithObjectsAndKeys:message, @"message", name, @"from", nil];
    
    // Send it out
    [connection sendNetworkPacket:packet];
}
*/

#pragma mark -
#pragma mark ConnectionDelegate Method Implementations

- (void)connectionAttemptFailed:(Connection*)connection {
    [self stop];
    [self.delegate connectionTerminated:self reason:@"Unable to connect to the selected device. Please check your network settings and try again."];
}


- (void)connectionTerminated:(Connection*)connection {
    [self stop];
    [self.delegate connectionTerminated:self reason:@"Prop device has disconnected."];
}


- (void)receivedNetworkPacket:(NSString *)inBuffer viaConnection:(Connection*)connection {
    // Display message locally
    //[self displayChatMessage:[packet objectForKey:@"message"] fromUser:[packet objectForKey:@"from"]];
    //NSLog(@"The message is: %@", inBuffer);
}

- (void)receivedHeartbeat:(UInt8)val
{
    [self.delegate displayHeartbeat:val];
}

- (void) receivedTransportMessage:(NSString *)state {
    [self.delegate processMessage:state];
}

- (void) didResolveService:(NSNetService *)service {
    [self.delegate didResolveService:service];
}

@end