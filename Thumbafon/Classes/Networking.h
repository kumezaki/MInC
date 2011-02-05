//
//  Networking.h
//  Thumbafon
//
//  Created by Chris Lavender on 2/4/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Networking : NSObject {
	
	UInt32					mSendIPAddress;
	SInt16					mSendPortNum;
	
	char					ip_add_buf[32];
	int						ip_add_size;
	
	char					mOutBuffer[1024];
	int						mOutBufferLength;
}

- (NSString *)getIPAddress;

-(void)sendUDP;

-(void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length;
-(void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;
-(void)sendOSCMsgWith2IntValues:(const char*)osc_str:(int)osc_str_length:(int)val0:(int)val1; /* this is untested */

-(void)testSend;


@end
