//
//  SagarihaSingleton.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SagarihaSingleton.h"

#import "SagarihaAppDelegate.h"
#import "SagarihaNetworking.h"

@implementation SagarihaSingleton

@synthesize nextAudioIndex;

-(id)init
{
	networking = [[SagarihaNetworking alloc] init];
    
	if ([self dataFileExists])
		[self readDataFile];

	mOSCMsg_State = -1;
	mOSCMsg_RecProg = -1.;
	mOSCMsg_DownloadProg = -1.;
	mOSCMsg_DownloadEnd = NO;
	mOSCMsg_InterstitialMsgDur = 0;
	mOSCMsg_InterstitialMsg = nil;
	mOSCMsg_Cue = -1;
	mOSCMsg_Play = NO;
	mOSCMsg_Stop = NO;
	mOSCMsg_ServerIPAddString = nil;
	
	mAudioQueuePlayer = [[SagarihaAudioQueuePlayer alloc] init];
	
	[self checkIncomingMessages];
	
	return self;
}

- (void)setNetworkingDelegate:(id)delegate {
    networking.delegate = delegate;
}

-(void)dealloc
{
	[networking release];

	[mAudioQueuePlayer release];

	[super dealloc];
}

+(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
	return [docDirectory stringByAppendingPathComponent:@"Sagariha.dat"];
#if 0
	/* to delete the file */
	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"] error:NULL];
#endif
}

-(BOOL)dataFileExists
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
	//	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"] error:NULL];
	return file_exists;
}

-(void)readDataFile
{
	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[SagarihaSingleton dataFilePath]];
	//	NSLog([SagarihaAppDelegate dataFilePath]);
	networking->mSendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	networking->mSendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%lu %d",networking->mSendIPAddress,networking->mSendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:networking->mSendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:networking->mSendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[SagarihaSingleton dataFilePath] atomically:YES];
	[dict release];
}

- (void)checkIncomingMessages
{
	SagarihaAppDelegate *appDelegate = (SagarihaAppDelegate*)[[UIApplication sharedApplication] delegate];

	if (mOSCMsg_State >= 0)
	{
		appDelegate->main_controls.mStateServerSegControl.selectedSegmentIndex = mOSCMsg_State;
		mOSCMsg_State = -1;
	}
	
	if (mOSCMsg_RecProg >= 0.)
	{
		appDelegate->main_controls.mRecProgView.progress = mOSCMsg_RecProg;
		mOSCMsg_RecProg = -1.;
	}
	
	if (mOSCMsg_InterstitialMsg != nil)
	{
		[appDelegate->interstial_controls displayMessage];
		
		mOSCMsg_InterstitialMsg = nil;
	}
	
	if (mOSCMsg_Cue >= 0)
	{
		[appDelegate->main_controls SetCue:mOSCMsg_Cue];
		mOSCMsg_Cue = -1;
	}
	
	if (mOSCMsg_Play)
	{
		appDelegate->main_controls.mStateClientSegControl.selectedSegmentIndex = 1;
		mAudioQueuePlayer->mTheta = mAudioQueuePlayer->mLoopStart;
		[mAudioQueuePlayer Start];
		mOSCMsg_Play = NO;
	}
	
	if (mOSCMsg_Stop)
	{
		appDelegate->main_controls.mStateClientSegControl.selectedSegmentIndex = 0;
		[mAudioQueuePlayer Stop];
		mOSCMsg_Stop = NO;
	}
	
	if (mOSCMsg_ServerIPAddString != nil)
	{
		[networking SetServerIPAddress:mOSCMsg_ServerIPAddString];
		
		if ((appDelegate->network_controls != nil) && (!appDelegate->network_controls.editing))
			[appDelegate->network_controls SetIPAddress];
		
		[mOSCMsg_ServerIPAddString release];
		mOSCMsg_ServerIPAddString = nil;
	}
	
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkIncomingMessages) userInfo:nil repeats:NO];  
}

@end
