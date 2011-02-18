//
//  Networking.h
//  Thumbafon
//
//  Created by Chris Lavender on 2/4/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AQPlayer, MainViewController, FlipsideViewController;

@interface Networking : NSObject <UIAlertViewDelegate> {
	
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

	NSString	*mInterstitialString;
	NSString	*mHints;
	NSString	*mOffsetMsg;
	NSString	*mModeMsg;
	NSString	*mModeLabelMsg;
	UIAlertView	*mAlert;
	NSTimer		*mTimer;
	
	NSThread	*mThread;
	NSString	*mThreadConversionString;
	
	BOOL		listenUDP;
	BOOL		listenIP;
	
	AQPlayer				*mAQPlayer;
	FlipsideViewController	*mFlipside;
	MainViewController		*mMainView;
	BOOL					mGroupOffsetState;
	SInt16					mCurrentNetworkOffset;
	UInt8					mCurrentNetworkMode;
	
}
@property (readwrite, retain) AQPlayer	*mAQPlayer;
@property (readwrite, retain) MainViewController *mMainView;
@property (readwrite, retain) FlipsideViewController *mFlipside;

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
- (void)setAQSynthOffset:(SInt16)offset;
- (void)setAQSynthMode:(UInt8)mode;

@end
