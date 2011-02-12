//
//  Networking.m
//  Thumbafon
//
//  Created by Chris Lavender on 2/4/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import "Networking.h"

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <unistd.h>

#include <ifaddrs.h>
#include <arpa/inet.h>

#define OSC_START mOutBufferLength = 0;
#define OSC_END [self sendUDP];
#define OSC_ADD(msg,num_msg_bytes) memcpy(mOutBuffer+mOutBufferLength,msg,num_msg_bytes); mOutBufferLength+=num_msg_bytes;

Networking *gNetwork = nil;

@implementation Networking

@synthesize mInterstitialString;
@synthesize listenOSC;

-(id)init {
	[super init];
	
	gNetwork = self;
	
	mSendIPAddress = 0x7F000001; /* IP address: 127.0.0.1 (0xa00010d) */
	mSendPortNum = 1337;
	mReceivePortNum = 31337;
	
	memset(ip_add_buf,0,32);
	[[self getIPAddress] getCString:ip_add_buf maxLength:32 encoding:NSASCIIStringEncoding];
	ip_add_size = (strlen(ip_add_buf) / 4 + 1) * 4;
	printf("ip_add_buf:%s\n",ip_add_buf);

	mThread = [[NSThread alloc] initWithTarget:self selector:@selector(receiveUDP) object:nil];
	[mThread start];
	self.listenOSC = YES;
	return self;
}

- (void)dealloc {
	[mThread release];
	gNetwork = nil;
	[super dealloc];
}

- (NSString *)getIPAddress {
	NSString *address = @"0.0.0.0";
	struct ifaddrs *interfaces = NULL;
	struct ifaddrs *temp_addr = NULL;
	int success = 0;
	
	// retrieve the current interfaces - returns 0 on success
	success = getifaddrs(&interfaces);
	if (success == 0) {
		
		// Loop through linked list of interfaces
		temp_addr = interfaces;
		while (temp_addr != NULL) {
			
			if (temp_addr->ifa_addr->sa_family == AF_INET) {
				
				// Check if interface is en0 which is the wifi connection on the iPhone
				if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en1"]) {	/* on device it's en0, on simulator it's en1 */
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

-(void)sendUDP {
	
	struct sockaddr_in sa;
	int bytes_sent;
	
	sockSend = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (-1 == sockSend) /* if socket failed to initialize, exit */ {
		
		fprintf(stderr,"Error creating socket: %s\n",strerror(errno));
		exit(EXIT_FAILURE);
    }
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = htonl(mSendIPAddress);
	sa.sin_port = htons(mSendPortNum);
	
	bytes_sent = sendto(sockSend, mOutBuffer, mOutBufferLength, 0,(struct sockaddr*)&sa, sizeof (struct sockaddr_in));
	if (bytes_sent < 0)
		fprintf(stderr,"Error sending packet: %s\n",strerror(errno));
	
	close(sockSend); /* close the socket */
}

- (void)receiveUDP {
	
	sockReceive = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa;
	socklen_t fromlen;
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
	sa.sin_port = htons(mReceivePortNum);
	
	if (-1 == bind(sockReceive,(struct sockaddr *)&sa, sizeof(struct sockaddr)))
	{
		perror("error bind failed");
		close(sockReceive);
		exit(EXIT_FAILURE);
	} 
	
	for (;;) {		
		mInBufferLength = recvfrom(sockReceive, (void *)mInBuffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);
		if (mInBufferLength < 0) fprintf(stderr,"%s\n",strerror(errno));
		[self parseOSC];
		if (self.listenOSC == NO) break;
	}
	
	close(sockReceive); /* close the socket */
}

- (void)parseOSC
{
	printf("mInBufferLength: %ld\n",mInBufferLength);
	
	ssize_t pos = 0;
	int msg_type = 0;
	int add_type = 0;

	while (pos < mInBufferLength)
	{
		switch (msg_type)
		{
			case 0: /* OSC Address Pattern */
			{
				NSString* buf_str = [[NSString alloc] initWithCString:mInBuffer+pos encoding:NSASCIIStringEncoding];
				if ([buf_str isEqualToString:@"/thum/interstitial"]) add_type = 1;
				[buf_str release];
				break;
			}
			case 1: /* OSC Type Tags */
			{
				/* do nothing for now */
				break;
			}
			case 2: /* OSC Data */
			{
				switch (add_type)
				{
					case 1:
						mInterstitialString = [[NSString alloc] initWithCString:mInBuffer+pos encoding:NSASCIIStringEncoding];
						break;
				}
				break;
			}
			default:
				break;
		}
		
		const char* msg_type_str = "";
		switch (msg_type)
		{
			case 0: msg_type_str = "OSC Address Pattern"; msg_type = 1; break;
			case 1: msg_type_str = "OSC Type Tags"; msg_type = 2; break;
			default: msg_type_str = "OSC Data"; break;
		}
		
		printf("%s: %s\n",msg_type_str,mInBuffer+pos);
		
		pos += ((strlen(mInBuffer+pos) / 4) + 1) * 4;
	}
}

- (void)closeReceiveSock
{
	close(sockReceive); /* close the socket */
}

-(void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length {
	
	char buf[1024]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",s\0\0",4);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size)
	OSC_END
}

-(void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val {
	
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",si\0",4);
	val = htonl(val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(&val,4);
	OSC_END
}

-(void)sendOSCMsgWith2IntValues:(const char*)osc_str:(int)osc_str_length:(int)val0:(int)val1 {
	
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",sii\0\0\0\0",8);
	val0 = htonl(val0);
	val1 = htonl(val1);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+8);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(&val0,4);
	OSC_ADD(&val1,4);
	OSC_END
}

- (void)buttonpress:(NSString *)button {
	
	UInt8 buttonNum = [button intValue];
#if 0
	switch (buttonNum) {
		case 0: [self sendOSCMsg:"/thum/butt1/on\0":16];break;
		case 1: [self sendOSCMsg:"/thum/butt2/on\0":16];break;
		case 2: [self sendOSCMsg:"/thum/butt3/on\0":16];break;
		case 3: [self sendOSCMsg:"/thum/butt4/on\0":16];break;
		case 4: [self sendOSCMsg:"/thum/butt5/on\0":16];break;
		case 5: [self sendOSCMsg:"/thum/butt6/on\0":16];break;
		case 6: [self sendOSCMsg:"/thum/butt7/on\0":16];break;
		case 7: [self sendOSCMsg:"/thum/butt8/on\0":16];break;
		default:break;
	}
#else	
	[self sendOSCMsgWith2IntValues:"/thum/butt\0\0":12:buttonNum:1];
#endif
	
	//[self sendOSCMsgWithIntValue:"/thumb/button\0":16:button];
}

- (void)buttonrelease:(NSString *)button {
	
	UInt8 buttonNum = [button intValue];
#if 0
	switch (buttonNum) {
		case 0: [self sendOSCMsg:"/thum/butt1/off\0":16];break;
		case 1: [self sendOSCMsg:"/thum/butt2/off\0":16];break;
		case 2: [self sendOSCMsg:"/thum/butt3/off\0":16];break;
		case 3: [self sendOSCMsg:"/thum/butt4/off\0":16];break;
		case 4: [self sendOSCMsg:"/thum/butt5/off\0":16];break;
		case 5: [self sendOSCMsg:"/thum/butt6/off\0":16];break;
		case 6: [self sendOSCMsg:"/thum/butt7/off\0":16];break;
		case 7: [self sendOSCMsg:"/thum/butt8/off\0":16];break;
		default:break;
	}
#else
	[self sendOSCMsgWith2IntValues:"/thum/butt\0\0":12:buttonNum:0];
#endif
}

-(void)requestHint {
	
	[self sendOSCMsg:"/thum/hint\0":12];
	self.listenOSC = NO;
	NSLog(@"test");
}

@end
