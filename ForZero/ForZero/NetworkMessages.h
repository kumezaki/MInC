//
//  NetworkMessages.h
//  ForZero
//
//  Created by Chris Lavender on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkConnections.h"
#import "SagarihaAudioQueuePlayer.h"

@class NetworkMessages;

@protocol NetworkMessagesDelegate
- (void)downloadEnded;
@end

@interface NetworkMessages : NetworkConnections {

@public
    int				mOSCMsg_State;
	float			mOSCMsg_RecProg;
	float			mOSCMsg_DownloadProg;
	int				mOSCMsg_InterstitialMsgDur;
	
    NSString        *mOSCMsg_InterstitialMsg;
	
    int				mOSCMsg_Cue;
	BOOL			mOSCMsg_Play;
	BOOL			mOSCMsg_Stop;
}
@property(nonatomic,assign) id<NetworkMessagesDelegate> delegate;
@property(nonatomic,assign) SagarihaAudioQueuePlayer *aqPlayer;

-(void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length;
-(void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;
-(void)sendOSCMsgWithFloatValue:(const char*)osc_str:(int)osc_str_length:(float)val;

- (void)udpParse;
- (void)tcpParse;

@end
