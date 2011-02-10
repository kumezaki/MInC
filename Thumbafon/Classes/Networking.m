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

-(id)init {
	[super init];
	
	gNetwork = self;
	
	mSendIPAddress = 0xa00010d;	//0x7F000001; /* IP address: 127.0.0.1 */
	mSendPortNum = 1337;
	
	memset(ip_add_buf,0,32);
	[[self getIPAddress] getCString:ip_add_buf maxLength:32 encoding:NSASCIIStringEncoding];
	ip_add_size = (strlen(ip_add_buf) / 4 + 1) * 4;
	printf("ip_add_buf:%s\n",ip_add_buf);
	
	return self;
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
				if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {	/* on device it's en0, on simulator it's en1 */
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
	
	int sock;
	struct sockaddr_in sa;
	int bytes_sent;
	
	sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (-1 == sock) /* if socket failed to initialize, exit */ {
		
		fprintf(stderr,"Error creating socket: %s\n",strerror(errno));
		exit(EXIT_FAILURE);
    }
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = htonl(mSendIPAddress);
	sa.sin_port = htons(mSendPortNum);
	
	bytes_sent = sendto(sock, mOutBuffer, mOutBufferLength, 0,(struct sockaddr*)&sa, sizeof (struct sockaddr_in));
	if (bytes_sent < 0)
		fprintf(stderr,"Error sending packet: %s\n",strerror(errno));
	
	close(sock); /* close the socket */
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
	switch (buttonNum) {
		case 0: [self sendOSCMsg:"/thumb/button/1\0":16];break;
		case 1: [self sendOSCMsg:"/thumb/button/2\0":16];break;
		case 2: [self sendOSCMsg:"/thumb/button/3\0":16];break;
		case 3: [self sendOSCMsg:"/thumb/button/4\0":16];break;
		case 4: [self sendOSCMsg:"/thumb/button/5\0":16];break;
		case 5: [self sendOSCMsg:"/thumb/button/6\0":16];break;
		case 6: [self sendOSCMsg:"/thumb/button/7\0":16];break;
		case 7: [self sendOSCMsg:"/thumb/button/8\0":16];break;
		default:break;
	}
	//[self sendOSCMsgWithIntValue:"/thumb/button\0":16:button];
}

- (void)buttonrelease:(NSString *)button {
}

-(void)requestHint {
	
	[self sendOSCMsg:"/thumb/hint\0":12];

}

@end
