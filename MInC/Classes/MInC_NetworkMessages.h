//
//  MInC_NetworkMessages.h
//  ForZero
//
//  Created by Chris Lavender on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MInC_NetworkConnections.h"
//#import "SagarihaAudioQueuePlayer.h"

@class MInC_NetworkMessages;

@protocol NetworkMessagesDelegate
- (void)downloadEnded:(MInC_NetworkMessages*)requestor;
- (void)downloadFailed:(MInC_NetworkMessages *)requestor;
- (void)displayInterstitialMessage:(MInC_NetworkMessages*)requestor;
- (void)displayServerRecordProgress:(MInC_NetworkMessages*)requestor :(NSNumber*)val;
- (void)displayServerPlayingMeterValue:(MInC_NetworkMessages*)requestor :(NSNumber*)val;
- (void)displayServerRecordingMeterValue:(MInC_NetworkMessages*)requestor :(NSNumber*)val;
- (void)enableServerRecordButton;
- (void)enableServerStopButton;
- (void)enableServerPlayButton;
- (void)enableServerDownloadButton;
- (void)enableServerVolumeSlider;
- (void)enableServerPanView;
@end

@interface MInC_NetworkMessages : MInC_NetworkConnections {

    int				mOSCMsg_State;
	int				mOSCMsg_InterstitialMsgDur;
    
    int				mOSCMsg_Cue;
	BOOL			mOSCMsg_Play;
	BOOL			mOSCMsg_Stop;

    float			mOSCMsg_DownloadProg;

    BOOL            recMeterValueReceived;
    BOOL            progressValueReceived;
    
    BOOL            FirstHeartBeat;
}
@property (nonatomic, assign) id<NetworkMessagesDelegate> delegate;
//@property (nonatomic, retain) SagarihaAudioQueuePlayer *aqPlayer;

@property (nonatomic, readonly, retain) NSString    *interstitialMsg;
@property (nonatomic, readonly, retain) NSString    *errorMsg;
@property (nonatomic, readonly, retain) NSNumber    *recProgress;
@property (nonatomic, readonly, retain) NSNumber    *playingMeterValue;
@property (nonatomic, readonly, retain) NSNumber    *recordingMeterValue;

@property (readonly) BOOL ReceivingHeartBeat;

-(void)sendOSCMsg:(const char*)osc_str :(int)osc_str_length;
-(void)sendOSCMsgWithIntValue:(const char*)osc_str :(int)osc_str_length :(int)val;
-(void)sendOSCMsgWithFloatValue:(const char*)osc_str :(int)osc_str_length :(float)val;

- (void)udpParse;
- (void)tcpParse;

-(void)sendHeartBeat;

-(void)sendJoin;
-(void)sendLeave;

@end
