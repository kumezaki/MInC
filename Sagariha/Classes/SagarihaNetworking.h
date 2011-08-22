//
//  SagarihaNetworking.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SagarihaNetworking : NSObject {

	char			ip_add_buf[32];
	int				ip_add_size;
	
	char			mOutBuffer[1024];
	ssize_t			mOutBufferLength;

	NSThread		*mUDPThread;

	char			mUDPInBuffer[1024]; //8192
	ssize_t			mUDPInBufferLength;

    NSThread		*mTCPThread;

//	char			mTCPInBuffer[1024];
//	ssize_t			mTCPInBufferLength;
	
    NSMutableData	*incomingDataBuffer;

@public
	UInt32					mSendIPAddress;
	SInt16					mSendPortNum;

	SInt16					mUDPReceivePortNum;

    SInt16					mTCPReceivePortNum;
}

- (NSString *)getIPAddress;

-(void)SendOSCMsg:(const char*)osc_str:(int)osc_str_length;
-(void)SendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;
-(void)SendOSCMsgWithFloatValue:(const char*)osc_str:(int)osc_str_length:(float)val;
-(void)send_udp;

-(void)receive_udp;
-(void)parse_osc;

-(void)DoReceiveTCP;
-(void)receive_tcp;
-(void)tcp_file;

@end
