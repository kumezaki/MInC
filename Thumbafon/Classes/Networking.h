//
//  Networking.h
//  Thumbafon
//
//  Created by Chris Lavender on 2/4/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AQPlayer;

@interface Networking : NSObject {
	
	UInt32		mSendIPAddress;
	SInt16		mSendPortNum;
	
	char		ip_add_buf[32];
	int			ip_add_size;
	
	char		mInBuffer[1024];
	ssize_t		mInBufferLength;

	char		mOutBuffer[1024];
	ssize_t		mOutBufferLength;

	SInt16		mReceivePortNum;
	SInt16		mReceiveIPPortNum;
	
	int			sockSend;
	int			sockReceive;
	int			sockIPReceive;

	NSThread	*mThread;
	NSString	*mInterstitialString;
	NSString	*mOffsetMsg;
	UIAlertView	*mAlert;
	NSTimer		*mTimer;
	
	BOOL		listenUDP;
	BOOL		listenIP;
	
	AQPlayer	*mAQPlayer;
	SInt16		mCurrentNetoworkOffset;
	BOOL		mGroupOffsetMode;
}
@property (readwrite, retain) AQPlayer	*mAQPlayer;
@property SInt16 mCurrentNetworkOffset;
@property BOOL mGroupOffsetMode;

- (NSString *)getIPAddress;
- (void)receiveServerIP;

- (void)sendUDP;
- (void)receiveUDP;
- (void)parseOSC;

- (void)quitNetworking;

- (void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length;
- (void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;
- (void)sendOSCMsgWith2IntValues:(const char*)osc_str:(int)osc_str_length:(int)val0:(int)val1; /* this is untested */

- (void)buttonpress:(NSString *)button;
- (void)buttonrelease:(NSString *)button;
- (void)requestHint;
- (void)setAQSynthOffset:(SInt16)Offset;

@end
