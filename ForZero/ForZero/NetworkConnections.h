//
//  SagarihaNetworking.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkConnections : NSObject {

	char			ip_add_buf[32];
	int				ip_add_size;
	
	char			mOutBuffer[1024];
	ssize_t			mOutBufferLength;

	NSThread		*mUDPThread;
	char			mUDPInBuffer[1024];
	ssize_t			mUDPInBufferLength;

    NSThread		*mTCPThread;
    NSMutableData	*incomingDataBuffer;
    
    int servSock, clntSock;// tcp sockets
}

@property (nonatomic, retain)   NSString    *devIP;
@property (nonatomic)           UInt32      mSendIPAddress;
@property (nonatomic)           SInt16      mSendPortNum;
@property (nonatomic)           SInt16      mUDPReceivePortNum;
@property (nonatomic)           SInt16      mTCPReceivePortNum;
@property (nonatomic, retain)   NSTimer     *tcpTimer;

- (NSString *)  getIPAddress;
- (void)        newServerIPAddress:(NSString *)str;

- (void)        send_udp;
- (void)        receive_udp;

- (void)        startReceiveTCP;
- (void)        receive_tcp;

- (void)        udpParse;
- (void)        tcpParse;

+ (NSString *)  dataFilePath;

- (BOOL)        dataFileExists;
- (void)        readDataFile;
- (void)        writeDataFile;

@end