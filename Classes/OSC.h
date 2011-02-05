//
//  OSC.h
//  Music147
//
//  Created by Kojiro Umezaki on 2/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OSC : NSObject {

	UInt32					mSendIPAddress;
	SInt16					mSendPortNum;
	
	char					ip_add_buf[32];
	int						ip_add_size;

	char					mOutBuffer[1024];
	int						mOutBufferLength;
}

- (NSString *)getIPAddress;

-(void)send_udp;

-(void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length;
-(void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;
-(void)sendOSCMsgWith2IntValues:(const char*)osc_str:(int)osc_str_length:(int)val0:(int)val1; /* this is untested */

-(void)testSend;

@end
