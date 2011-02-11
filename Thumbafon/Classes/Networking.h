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
	
	char					mInBuffer[1024];
	ssize_t					mInBufferLength;

	char					mOutBuffer[1024];
	ssize_t					mOutBufferLength;

	SInt16					mReceivePortNum;

	NSThread				*mThread;

	NSString				*mInterstitialString;
}

@property (assign,readwrite) NSString	*mInterstitialString;

- (NSString *)getIPAddress;

- (void)sendUDP;
- (void)receiveUDP;
- (void)parseOSC;

- (void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length;
- (void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;
- (void)sendOSCMsgWith2IntValues:(const char*)osc_str:(int)osc_str_length:(int)val0:(int)val1; /* this is untested */

- (void)buttonpress:(NSString *)button;
- (void)buttonrelease:(NSString *)button;
- (void)requestHint;


@end
