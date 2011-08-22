//
//  SagarihaAppDelegate.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 9/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SagarihaAppDelegate.h"

#import "SagarihaNetworking.h"
#import "SagarihaSingleton.h"

#include <arpa/inet.h>
#include <fcntl.h>
#include <ifaddrs.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>

SagarihaNetworking* networking = nil;
SagarihaSingleton* singleton = nil;

@implementation SagarihaAppDelegate

#define __VINNIE__	0

#define FLOAT_TO_MRMR_INT(v) (int)(v * 1000. + 0.5)

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Add the tab bar controller's current view as a subview of the window
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
	
	mIPAddressTextField.delegate = self;
	mPortNumTextField.delegate = self;

	mIPAddressTextField.text = [NSString stringWithFormat:@"%d.%d.%d.%d",(networking->mSendIPAddress&0xFF000000)>>24
								,(networking->mSendIPAddress&0x00FF0000)>>16
								,(networking->mSendIPAddress&0x0000FF00)>>8
								,(networking->mSendIPAddress&0x000000FF)>>0];
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",networking->mSendPortNum];
}

/*
 // Optional UITabBarControllerDelegate method
 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
 }
 */

/*
 // Optional UITabBarControllerDelegate method
 - (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
 }
 */

- (id)init
{
	[super init];

	mImageArray = [[NSArray alloc] initWithObjects:
				   [UIImage imageNamed:@"image_0.jpg"],
				   [UIImage imageNamed:@"image_1.jpg"],
				   nil
				   ];

	networking = [[SagarihaNetworking alloc] init];
	
	singleton = [[SagarihaSingleton alloc] init];
	
#if 0
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
//	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"] error:NULL];
	if (file_exists)
		[self readDataFile];
#endif
	
	[self checkIncomingMessages];
	
	mAudioQueuePlayer = [[SagarihaAudioQueuePlayer alloc] init];

	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[UIAccelerometer sharedAccelerometer].updateInterval = 0.1;
	
	return self;
}

- (void)dealloc {

	[mAudioQueuePlayer release];
    [singleton release];
	[networking release];
    [mImageArray release];
    [tabBarController release];
    [window release];
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	return YES;
}

-(IBAction)SetStateServer:(id)sender
{
	[networking SendOSCMsgWithIntValue:"/saga/state\0":12:mStateServerSegControl.selectedSegmentIndex];
}

-(IBAction)SetStateClient:(id)sender
{
	switch (mStateClientSegControl.selectedSegmentIndex)
	{
		case 0: /* stop */
			[mAudioQueuePlayer Stop];
			break;
		case 1: /* play */
			[mAudioQueuePlayer Start];
			break;
		case 2:	/* download */
			mNextAudioIndex = 0;
#if 0
			[self RequestAudio];
#else
			[networking SendOSCMsg:"/saga/download\0\0":16];
			[networking DoReceiveTCP]; /* Question: hasn't the TCP thread already started? What call this here? */
#endif
			break;
	}
}

-(IBAction)SetEnvPeriod:(id)sender
{
	[networking SendOSCMsgWithIntValue:"/saga/period\0\0\0\0":16:FLOAT_TO_MRMR_INT([mEnvPeriodSlider value])];
}

-(IBAction)SetDelayLevel:(id)sender
{
	[networking SendOSCMsgWithIntValue:"/saga/delay\0":12:FLOAT_TO_MRMR_INT([mDelayLevelSlider value])];
}

-(IBAction)SetPan:(id)sender
{
	[networking SendOSCMsgWithIntValue:"/saga/pan\0\0\0":12:FLOAT_TO_MRMR_INT([mPanSlider value])];
}

-(IBAction)SetVolumeServer:(id)sender
{
//	NSLog(@"%f\n",[mVolumeServerSlider value]);
	[networking SendOSCMsgWithIntValue:"/saga/vol_s\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeServerSlider value])];
}

-(IBAction)SetVolumeClient:(id)sender
{
//	NSLog(@"%f\n",[mVolumeClientSlider value]);
//	[self SendOSCMsgWithIntValue:"/saga/vol_c\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeClientSlider value])];
	mAudioQueuePlayer->mAmp = [mVolumeClientSlider value];
}

-(IBAction)InterstitialMsgDone:(id)sender
{
//	NSLog(@"InterstitialMsgDone\n");
	[self turnInterstitialMsgOff];
}

-(IBAction)IPAddressChanged:(id)sender
{
	NSArray* ip_add_array = [mIPAddressTextField.text componentsSeparatedByString:@"."];
	
	if ([ip_add_array count] != 4)
	{
		NSLog(@"IP address must have 4 components");
		mIPAddressTextField.text = @"";
	}
	else
	{
		int i = 0;
		UInt32 ip_add = 0;
		for (NSString* s in ip_add_array)
		{
#if 0
			NSLog([NSString stringWithFormat:@"s=%@", s]);
#endif
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		networking->mSendIPAddress = ip_add;
		[singleton writeDataFile];
		NSLog(@"IPAddressChanged to %08lx\n",networking->mSendIPAddress);
	}
}

-(IBAction)PortNumChanged:(id)sender
{
#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	networking->mSendPortNum = [mPortNumTextField.text intValue];
	[singleton writeDataFile];
	NSLog(@"PortNumChanged to %d\n",networking->mSendPortNum);
}

-(IBAction)RequestHint
{
	[networking SendOSCMsg:"/saga/hint\0\0":12];
}

-(void)turnInterstitialMsgOn
{
	mInterstitialView.alpha = 1.0;
	
	if (singleton->mOSCMsg_InterstitialMsgDur != -1)
	{
#if 0
		double dur = mOSCMsg_InterstitialMsgDur / 1000.;
		[NSTimer scheduledTimerWithTimeInterval:dur target:self selector:@selector(turnInterstitialMsgOff) userInfo:nil repeats:NO];
#endif
	}
	mOKButton.hidden = singleton->mOSCMsg_InterstitialMsgDur == -1 ? YES : NO;
	
	[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];

	[tabBarController.tabBar setHidden:YES];
	
	window.backgroundColor = [UIColor blackColor];
	
//	UITabBarItem *tabBarItem = [[tabBarController.tabBar items] objectAtIndex:1];
//	[tabBarItem setEnabled:NO];
}

-(void)turnInterstitialMsgOff
{
	if (mInterstitialView.alpha < 0.0)
		mInterstitialView.alpha = 0.0;
	else if (mInterstitialView.alpha > 0.0)
		mInterstitialView.alpha -= 0.05;

	if (mInterstitialView.alpha > 0.0)
		[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(turnInterstitialMsgOff) userInfo:nil repeats:NO];

	mOKButton.hidden = YES;

	[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
	
	[tabBarController.tabBar setHidden:NO];

	window.backgroundColor = [UIColor whiteColor];
	
//	UITabBarItem *tabBarItem = [[tabBarController.tabBar items] objectAtIndex:1];
//	[tabBarItem setEnabled:YES];
}

-(void)RequestAudio
{
	if (mStateClientSegControl.selectedSegmentIndex == 2)
    {
        //printf("RequestAudio %d\n",mNextAudioIndex);
        [networking SendOSCMsgWithIntValue:"/saga/audio\0":12:mNextAudioIndex];
    }
    else return;
}

-(void)updateDownloadProg {
    
    if (singleton->mOSCMsg_DownloadProg >= 0.)
	{
		mDownloadProgView.progress = singleton->mOSCMsg_DownloadProg;
		singleton->mOSCMsg_DownloadProg = -1.;
	}
}

-(void)downloadEnd {
    if (singleton->mOSCMsg_DownloadEnd)
	{
		NSLog(@"Download ended");
#if __VINNIE__
		[mAudioQueuePlayer->mWaveTable->mArray writeToFile:@"SagarihaAudio.aif" atomically:YES];
        mStateClientSegControl.selectedSegmentIndex = 0;
#else
		mStateClientSegControl.selectedSegmentIndex = 1;
		[mAudioQueuePlayer Start];
#endif
		singleton->mOSCMsg_DownloadEnd = NO;
	}
}

- (void)checkIncomingMessages
{
	if (singleton->mOSCMsg_State >= 0)
	{
		mStateServerSegControl.selectedSegmentIndex = singleton->mOSCMsg_State;
		singleton->mOSCMsg_State = -1;
	}
	
	if (singleton->mOSCMsg_RecProg >= 0.)
	{
		mRecProgView.progress = singleton->mOSCMsg_RecProg;
		singleton->mOSCMsg_RecProg = -1.;
	}
		
	if (singleton->mOSCMsg_InterstitialMsg != nil)
	{
		[self turnInterstitialMsgOn];
		
		int image_pos = -1;
		if ([singleton->mOSCMsg_InterstitialMsg isEqualToString:@"image_0"])
			image_pos = 0;
		else if ([singleton->mOSCMsg_InterstitialMsg isEqualToString:@"image_1"])
			image_pos = 1;
		if (image_pos == -1)
		{
			mInterstitialLabel.text = singleton->mOSCMsg_InterstitialMsg;
			mInterstitialView.image = nil;
		}
		else
		{
			mInterstitialLabel.text = @"";
			mInterstitialView.image = [mImageArray objectAtIndex:image_pos];
		}
		
		singleton->mOSCMsg_InterstitialMsg = nil;
	}
	
	if (singleton->mOSCMsg_Cue >= 0)
	{
		[self SetCue:singleton->mOSCMsg_Cue];
		singleton->mOSCMsg_Cue = -1;
	}
	
	if (singleton->mOSCMsg_Play)
	{
		mStateClientSegControl.selectedSegmentIndex = 1;
		mAudioQueuePlayer->mTheta = mAudioQueuePlayer->mLoopStart;
		[mAudioQueuePlayer Start];
		singleton->mOSCMsg_Play = NO;
	}
	
	if (singleton->mOSCMsg_Stop)
	{
		mStateClientSegControl.selectedSegmentIndex = 0;
		[mAudioQueuePlayer Stop];
		singleton->mOSCMsg_Stop = NO;
	}

	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkIncomingMessages) userInfo:nil repeats:NO];  
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
#if 0
	NSLog(@"%f, %f, %f\n", acceleration.x, acceleration.y, acceleration.z);
#endif
	
#define LIMIT_ACC_VAL(n)	n < -1. ? -1. : n > 1. ? 1. : n
	
	float x = LIMIT_ACC_VAL(acceleration.x);
	float y = LIMIT_ACC_VAL(acceleration.y+0.35);
//	float z = LIMIT_ACC_VAL(acceleration.z);
	
	//	[mPanView Set:(x+1.)/2:1.-((y+1.)/2)];
	[mPanView SetVelocity:x:-y];
	[mPanView setNeedsDisplay];
	
	x = [mPanView GetX] * 2. - 1.;
	y = (1. - [mPanView GetY]) * 2. - 1.;

	[networking SendOSCMsgWithFloatValue:"/saga/accelx\0\0\0\0":16:x];
	[networking SendOSCMsgWithFloatValue:"/saga/accely\0\0\0\0":16:y];
//	[networking SendOSCMsgWithFloatValue:"/saga/accelz\0\0\0\0":16:z];
	
#if 0
	NSLog(@"%f, %f, %f\n",x,y,z);
#endif
}

-(void) SetCue:(int)cue_num
{
	mStateServerSegControl.hidden = cue_num < 2;
	mRecProgView.hidden = cue_num < 2;
	
	mEnvPeriodSlider.hidden = cue_num < 3;
	mEnvPeriodLabel.hidden = cue_num < 3;
	
	//mPanView.hidden = NO; cue_num < 4;
	//mPanLabel.hidden = NO; cue_num < 4;

	mDelayLevelSlider.hidden = cue_num < 5;
	mDelayLevelLabel.hidden = cue_num < 5;

	mStateClientSegControl.hidden = YES;
	mDownloadProgView.hidden = YES;
	
	mVolumeServerSlider.hidden = cue_num < 7;
	mVolumeServerLabel.hidden = cue_num < 7;
	
	mVolumeClientSlider.hidden = YES;
	mVolumeClientLabel.hidden = YES;

//	NSLog(@"setting cue number to %d\n",cue_num);
}

-(IBAction)ForZero_Start:(id)sender
{
    [networking SendOSCMsg:"/saga/fz_start\0\0":16];    
}

-(IBAction)ForZero_Subtract:(id)sender
{
	[networking SendOSCMsg:"/saga/fz_sub\0\0\0\0":16];
}

-(IBAction)ForZero_Stop:(id)sender
{    
	[networking SendOSCMsg:"/saga/fz_stop\0\0\0":16];
}

-(IBAction)ForZero_Panic:(id)sender
{
	[networking SendOSCMsg:"/saga/fz_panic\0\0":16];
}

@end
