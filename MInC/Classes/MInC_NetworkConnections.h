//
//  SagarihaNetworking.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MInC_NetworkConnections : NSObject {

	char			IPAddBuf[32];
	unsigned long	IPAddSize;
	
	char			OutBuffer[1024];
	ssize_t			OutBufferLength;

	NSThread		*UDPThread;
	char			UDPInBuffer[1024];
	ssize_t			UDPInBufferLength;

    NSThread		*TCPThread;
    NSMutableData	*IncomingDataBuffer;
    
    int ServSock, ClntSock;// tcp sockets
}

@property (nonatomic, retain)   NSString    *DevIP;
@property (nonatomic)           UInt32      SendIPAddress;
@property (nonatomic)           UInt16      SendPortNum;
@property (nonatomic)           UInt16      UDPReceivePortNum;
@property (nonatomic)           UInt16      TCPReceivePortNum;
@property (nonatomic, retain)   NSTimer     *TCPTimer;

- (NSString *)  getIPAddress;
- (void)        newServerIPAddress:(NSString *)str;

- (void)        send_udp;
- (void)        receive_udp;

- (void)        startReceiveTCP;
- (void)        stopReceiveTCP;
- (void)        receive_tcp;

- (void)        udpParse;
- (void)        tcpParse;

+ (NSString *)  dataFilePath;

- (BOOL)        dataFileExists;
- (void)        readDataFile;
- (void)        writeDataFile;

@end