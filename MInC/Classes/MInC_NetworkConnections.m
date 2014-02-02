 //
//  SagarihaNetworking.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MInC_NetworkConnections.h"

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

@implementation MInC_NetworkConnections

@synthesize SendIPAddress;
@synthesize SendPortNum;
@synthesize UDPReceivePortNum;
@synthesize TCPReceivePortNum;
@synthesize DevIP   =_devIP;
@synthesize TCPTimer=_tcpTimer;

- (id)init
{
	[super init];

    if ([self dataFileExists]) {
        [self readDataFile];
    }
    else {
        self.SendIPAddress = 0x7F000001; /* IP address: 127.0.0.1 */
        self.SendPortNum = 1337;
    }

	memset(IPAddBuf,0,32);
    self.DevIP = [self getIPAddress];//self.DevIP is simply for storing the device IP 4 others to access. 
	[self.DevIP getCString:IPAddBuf maxLength:32 encoding:NSASCIIStringEncoding];
	IPAddSize = (strlen(IPAddBuf) / 4 + 1) * 4;
	NSLog(@"%s\n",IPAddBuf);

	UDPReceivePortNum = 31337;
    TCPReceivePortNum = 41337;

    IncomingDataBuffer = [[NSMutableData alloc]init];
    
    UDPThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_udp) object:nil];
	[UDPThread start];

    //TCPThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_tcp) object:nil];
	//[TCPThread start];

	return self;
}

-(void)dealloc
{    
    if ([self.TCPTimer isValid]) {
        [self.TCPTimer invalidate];
    }
    [IncomingDataBuffer release];

    //    [TCPThread release];
	[UDPThread release];
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
		SInt32 i = 0;
		UInt32 ip_add = 0;
		for (NSString* s in ip_add_array)
		{
#if 0
			NSLog([NSString stringWithFormat:@"s=%@", s]);
#endif
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		self.SendIPAddress = ip_add;
		[self writeDataFile];
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
	sa.sin_addr.s_addr = htonl(self.SendIPAddress);
	sa.sin_port = htons(self.SendPortNum);
	
	bytes_sent = sendto(sock, OutBuffer, OutBufferLength, 0,(struct sockaddr*)&sa, sizeof (struct sockaddr_in));
	if (bytes_sent < 0)
		fprintf(stderr,"Error sending packet: %s\n",strerror(errno));
	
	close(sock); /* close the socket */
}

-(void)receive_udp
{
    printf("receive_udp started\n");
	int sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa; 
	socklen_t fromlen;
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
	sa.sin_port = htons(UDPReceivePortNum);
	
	if (-1 == bind(sock,(struct sockaddr *)&sa, sizeof(struct sockaddr)))
	{
		perror("error bind failed");
		close(sock);
		exit(EXIT_FAILURE);
	} 
	
	for (;;) 
	{
        // recvfrom blocks the thread
		UDPInBufferLength = recvfrom(sock, (void *)UDPInBuffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);
		if (UDPInBufferLength < 0)
			fprintf(stderr,"%s\n",strerror(errno));
		[self udpParse];
	}
	
	close(sock); /* close the socket */
}

- (void)downloadFailed:(NSTimer*)timer
{
    NSLog(@"MInC_NetworkConnections downloadFailed called.");
}

- (void)startReceiveTCP
{
    if (TCPThread == nil) {
        TCPThread = [[NSThread alloc] initWithTarget:self 
                                             selector:@selector(receive_tcp) 
                                               object:nil];
        [TCPThread start];
    }
    self.TCPTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 
                                                     target:self 
                                                   selector:@selector (downloadFailed:) 
                                                   userInfo:nil 
                                                    repeats:NO]; 
}  

- (void)receive_tcp
{    
    struct sockaddr_in servAddr, clntAddr;
    
    ServSock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
        
    if (ServSock < 0)
        NSLog(@"ERROR opening TCP socket");
    
    memset(&servAddr, 0, sizeof(servAddr));
    servAddr.sin_family = AF_INET;    
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY);    
    servAddr.sin_port = htons(TCPReceivePortNum);
    
    if (bind(ServSock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0)
        NSLog(@"ERROR on TCP binding");
    
    if (listen(ServSock,5) < 0)
        NSLog(@"listen() failed");
    
    socklen_t clntLen = sizeof(clntAddr);
    ClntSock = accept(ServSock,(struct sockaddr *) &clntAddr, &clntLen);
    /* will get here if a client connects, otherwise this process waits */
    
    if (ClntSock < 0) NSLog(@"ERROR on TCP accept");
	
    char buffer[256];
    int bytesRcvd;
    int count = 0;
	BOOL done = NO;
    
    while (!done) {
        
        memset(buffer, 0, 256);
        
        bytesRcvd = recv(ClntSock, buffer, sizeof(buffer)-1, 0);
        [self.TCPTimer invalidate];
        
        if (bytesRcvd < 0) {
            NSLog(@"ERROR reading from TCP socket\n");
            done = YES;
        }
        
        if (bytesRcvd  > 0) {
            [IncomingDataBuffer appendBytes:buffer length:bytesRcvd];
            ++count;
            //printf("receive packet count: %d\n",count);
        }
        if (bytesRcvd == 0) {
            [self performSelectorOnMainThread:@selector(tcpParse) withObject:nil waitUntilDone:YES];
            done = YES;
            break;
        }
    }
    NSRange resetRange = {0, [IncomingDataBuffer length]};
    [IncomingDataBuffer replaceBytesInRange:resetRange withBytes:NULL length:0];
    
    if (!(ClntSock < 0)) {
        close(ClntSock);
        printf("close ClntSock\n");
    }
    if (!(ServSock < 0)) {
        close(ServSock);
        printf("close ServSock\n");
    }
    
    [TCPThread cancel];
    [TCPThread release];
    TCPThread = nil;
}

- (void)tcpParse {
    NSLog(@"MInC_NetworkConnections tcpParse called.");
}

- (void)udpParse {
    NSLog(@"MInC_NetworkConnections udpParse called.");
}


#pragma mark - save user data

// all of the below can probably be replace by NSUserDefaults.
+(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
	return [docDirectory stringByAppendingPathComponent:@"MInC.dat"];
#if 0
	/* to delete the file */
	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"] error:NULL];
#endif
}

-(BOOL)dataFileExists
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
#if 0
	if ([fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"] error:NULL])
        NSLog(@"Sagariha.dat removed!!!");
    else
        NSLog(@"Sagariha.dat NOT removed!!!");
#endif
	return file_exists;
}

-(void)readDataFile
{
	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[MInC_NetworkConnections dataFilePath]];
    // NSLog(@"%@",[self dataFilePath]);
	self.SendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	self.SendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%lu %d",self.SendIPAddress,self.SendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:self.SendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:self.SendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[MInC_NetworkConnections dataFilePath] atomically:YES];
	[dict release];
}


@end
