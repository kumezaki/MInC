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

extern SagarihaNetworking* networking;

@implementation SagarihaSingleton

-(id)init
{
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
	
	return self;
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

@end
