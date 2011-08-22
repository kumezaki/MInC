//
//  SagarihaSingleton.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SagarihaAudioQueuePlayer.h"
#import "SagarihaForZeroControls.h"

@interface SagarihaSingleton : NSObject <UIAccelerometerDelegate> {
	
	int				nextAudioIndex;

@public
	SagarihaAudioQueuePlayer    *mAudioQueuePlayer;
	
	int				mOSCMsg_State;
	float			mOSCMsg_RecProg;
	float			mOSCMsg_DownloadProg;
	BOOL			mOSCMsg_DownloadEnd;
	int				mOSCMsg_InterstitialMsgDur;
	NSString        *mOSCMsg_InterstitialMsg;
	int				mOSCMsg_Cue;
	BOOL			mOSCMsg_Play;
	BOOL			mOSCMsg_Stop;
}

@property(readwrite) int nextAudioIndex;

+(NSString *)dataFilePath;
-(BOOL) dataFileExists;
-(void) readDataFile;
-(void) writeDataFile;

-(void)checkIncomingMessages;

@end
