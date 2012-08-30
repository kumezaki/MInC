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
- (void)downloadEnded:(NetworkMessages*)requestor;
- (void)downloadFailed:(NetworkMessages *)requestor;
- (void)displayInterstitialMessage:(NetworkMessages*)requestor;
- (void)displayServerRecordProgress:(NetworkMessages*)requestor:(NSNumber*)val;
- (void)displayServerPlayingMeterValue:(NetworkMessages*)requestor:(NSNumber*)val;
- (void)displayServerRecordingMeterValue:(NetworkMessages*)requestor:(NSNumber*)val;
- (void)enableServerRecordButton;
- (void)enableServerStopButton;
- (void)enableServerPlayButton;
- (void)enableServerDownloadButton;
- (void)enableServerVolumeSlider;
- (void)enableServerPanView;
@end

@interface NetworkMessages : NetworkConnections {

    int				mOSCMsg_State;
	int				mOSCMsg_InterstitialMsgDur;
    
    int				mOSCMsg_Cue;
	BOOL			mOSCMsg_Play;
	BOOL			mOSCMsg_Stop;

    float			mOSCMsg_DownloadProg;

    BOOL            recMeterValueReceived;
    BOOL            progressValueReceived;
}
@property (nonatomic, assign) id<NetworkMessagesDelegate> delegate;
@property (nonatomic, retain) SagarihaAudioQueuePlayer *aqPlayer;

@property (nonatomic, readonly, retain) NSString    *interstitialMsg;
@property (nonatomic, readonly, retain) NSString    *errorMsg;
@property (nonatomic, readonly, retain) NSNumber    *recProgress;
@property (nonatomic, readonly, retain) NSNumber    *playingMeterValue;
@property (nonatomic, readonly, retain) NSNumber    *recordingMeterValue;

-(void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length;
-(void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val;
-(void)sendOSCMsgWithFloatValue:(const char*)osc_str:(int)osc_str_length:(float)val;

- (void)udpParse;
- (void)tcpParse;

-(void)sendHeartBeat;

-(void)sendJoin;
-(void)sendLeave;

@end
