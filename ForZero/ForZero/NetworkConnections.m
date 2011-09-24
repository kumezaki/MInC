//
//  SagarihaNetworking.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NetworkConnections.h"

#include <arpa/inet.h>
#include <fcntl.h>
#include <ifaddrs.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>

@implementation NetworkConnections

@synthesize mSendIPAddress;
@synthesize mSendPortNum;
@synthesize mUDPReceivePortNum;
@synthesize mTCPReceivePortNum;
@synthesize devIP=_devIP;

- (id)init
{
	[super init];
	
	self.mSendIPAddress = 0x7F000001; /* IP address: 127.0.0.1 */
	self.mSendPortNum = 1337;

	memset(ip_add_buf,0,32);
    self.devIP = [self getIPAddress];//self.devIP is simply for storing the device IP 4 others to access. 
	[self.devIP getCString:ip_add_buf maxLength:32 encoding:NSASCIIStringEncoding];
	ip_add_size = (strlen(ip_add_buf) / 4 + 1) * 4;
	NSLog(@"%s\n",ip_add_buf);

	mUDPReceivePortNum = 31337;
    mTCPReceivePortNum = 41337;

	if ([self dataFileExists]) [self readDataFile];
    
    incomingDataBuffer = [[NSMutableData alloc]init];
    
    mUDPThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_udp) object:nil];
	[mUDPThread start];

    //mTCPThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_tcp) object:nil];
	//[mTCPThread start];

	return self;
}

-(void)dealloc
{    
	[incomingDataBuffer release];

    //    [mTCPThread release];
	[mUDPThread release];
    [_devIP release];
    
	[super dealloc];
}
	
- (NSString *)getIPAddress
{
	NSString *address = @"0.0.0.0";
	struct ifaddrs *interfaces = NULL;
	struct ifaddrs *temp_addr = NULL;
	int success = 0;
	
	// retrieve the current interfaces - returns 0 on success
	success = getifaddrs(&interfaces);
	if (success == 0)
	{
		// Loop through linked list of interfaces
		temp_addr = interfaces;
		while (temp_addr != NULL)
		{
			if (temp_addr->ifa_addr->sa_family == AF_INET)
			{
				// Check if interface is en0 which is the wifi connection on the iPhone
				if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
				{
					// Get NSString from C String
					address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
				}
			}
			temp_addr = temp_addr->ifa_next;
		}
	}
	
	// Free memory
	freeifaddrs(interfaces);
	return address;
}

-(void)newServerIPAddress:(NSString *)str
{
	NSArray* ip_add_array = [str componentsSeparatedByString:@"."];
	
	if ([ip_add_array count] != 4)
	{
		NSLog(@"IP address must have 4 components");
		return;
	}
	else
	{
		int i = 0;
		UInt32 ip_add = 0;
		for (NSString* s in ip_add_array)
		{
#if 0
			NSLog([NSString stringWithFormat:@"s=%@", s]);
#endif
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		self.mSendIPAddress = ip_add;
		[self writeDataFile];
		printf("IPAddressChanged to %08lx\n",self.mSendIPAddress);
	}
	
}

-(void)send_udp
{
	int sock;
	struct sockaddr_in sa;
	int bytes_sent;
	
	sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (-1 == sock) /* if socket failed to initialize, exit */
    {
		fprintf(stderr,"Error creating socket: %s\n",strerror(errno));
		exit(EXIT_FAILURE);
    }
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = htonl(self.mSendIPAddress);
	sa.sin_port = htons(self.mSendPortNum);
	
	bytes_sent = sendto(sock, mOutBuffer, mOutBufferLength, 0,(struct sockaddr*)&sa, sizeof (struct sockaddr_in));
	if (bytes_sent < 0)
		fprintf(stderr,"Error sending packet: %s\n",strerror(errno));
	
	close(sock); /* close the socket */
}

-(void)receive_udp
{
	int sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa; 
	socklen_t fromlen;
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
	sa.sin_port = htons(mUDPReceivePortNum);
	
	if (-1 == bind(sock,(struct sockaddr *)&sa, sizeof(struct sockaddr)))
	{
		perror("error bind failed");
		close(sock);
		exit(EXIT_FAILURE);
	} 
	
	for (;;) 
	{
		mUDPInBufferLength = recvfrom(sock, (void *)mUDPInBuffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);
		if (mUDPInBufferLength < 0)
			fprintf(stderr,"%s\n",strerror(errno));
        //NSLog(@"mInBuffer contents:%s\n", mInBuffer);
		[self udpParse];
	}
	
	close(sock); /* close the socket */
}

-(void)startReceiveTCP
{
    mTCPThread = [[NSThread alloc] initWithTarget:self 
                                          selector:@selector(receive_tcp) 
                                            object:nil];
    [mTCPThread start];
}

-(void)receive_tcp
{
    int servSock, clntSock;
    
    struct sockaddr_in servAddr, clntAddr;
    
    servSock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    
    if (servSock < 0)
        NSLog(@"ERROR opening TCP socket");
    
    memset(&servAddr, 0, sizeof(servAddr));
    servAddr.sin_family = AF_INET;    
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY);    
    servAddr.sin_port = htons(mTCPReceivePortNum);
    
    if (bind(servSock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0)
        NSLog(@"ERROR on TCP binding");
    
    if (listen(servSock,5) < 0)
        NSLog(@"listen() failed");
    
    socklen_t clntLen = sizeof(clntAddr);
    clntSock = accept(servSock,(struct sockaddr *) &clntAddr, &clntLen);
    /* will get here if a client connects, otherwise this process waits */
    
    if (clntSock < 0) NSLog(@"ERROR on TCP accept");
	
    char buffer[256];
    int bytesRcvd;
    int count = 0;
	BOOL done = NO;
    
    while (!done) {
        
        memset(buffer, 0, 256);
        
        bytesRcvd = recv(clntSock, buffer, sizeof(buffer)-1, 0);
        
        if (bytesRcvd < 0) NSLog(@"ERROR reading from TCP socket\n");
        
        if (bytesRcvd  > 0) {
            //printf("bytesRead: %d; buffer contents: %s\n", bytesRcvd, buffer);
            [incomingDataBuffer appendBytes:buffer length:bytesRcvd];
            ++count;
            //printf("receive packet count: %d\n",count);
        }
        if (bytesRcvd == 0) {
            //NSLog(@"total bytes recieved: %u",[incomingDataBuffer length]);
            [self performSelectorOnMainThread:@selector(tcpParse) withObject:nil waitUntilDone:YES];
            
            [mTCPThread release];
            done = YES;
            break;
        }
    }
    NSRange resetRange = {0, [incomingDataBuffer length]};
    [incomingDataBuffer replaceBytesInRange:resetRange withBytes:NULL length:0];
    close(clntSock);	
    close(servSock);
}

- (void)tcpParse{
}

- (void)udpParse {
}


#pragma mark - Temporary File Handling

// all of the below can probably be replace by NSUserDefaults.
+(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
	return [docDirectory stringByAppendingPathComponent:@"Sagariha.dat"];
#if 0
	/* to delete the file */
	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"] error:NULL];
#endif
}

-(BOOL)dataFileExists
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"]];
	// NSLog(file_exists?@"exists":@"does not exist");
	//	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"] error:NULL];
	return file_exists;
}

-(void)readDataFile
{
	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[NetworkConnections dataFilePath]];
    // NSLog(@"%@",[self dataFilePath]);
	self.mSendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	self.mSendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%lu %d",self.mSendIPAddress,self.mSendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:self.mSendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:self.mSendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[NetworkConnections dataFilePath] atomically:YES];
	[dict release];
}


@end
