//
//  SagarihaAppDelegate.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 9/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SagarihaAppDelegate.h"

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <unistd.h>

#include <ifaddrs.h>
#include <arpa/inet.h>

//for tcp connection
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <netinet/in.h>

@implementation SagarihaAppDelegate

#define OSC_START mOutBufferLength = 0;
#define OSC_END [self send_udp];
#define OSC_ADD(msg,num_msg_bytes) memcpy(mOutBuffer+mOutBufferLength,msg,num_msg_bytes); mOutBufferLength+=num_msg_bytes;

#define FLOAT_TO_MRMR_INT(v) (int)(v * 1000. + 0.5)

#define OSC_VAL_BYTE_SWAP(val_ptr) memcpy(&u.int_val,val_ptr,4); u.int_val = htonl(u.int_val);
union {
	float	flt_val;
	int		int_val;
} u;

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Add the tab bar controller's current view as a subview of the window
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];

	mIPAddressTextField.delegate = self;
	mPortNumTextField.delegate = self;
	
	SagarihaAppDelegate *appDelegate = (SagarihaAppDelegate*)[[UIApplication sharedApplication] delegate];
	mIPAddressTextField.text = [NSString stringWithFormat:@"%d.%d.%d.%d",(appDelegate->mSendIPAddress&0xFF000000)>>24
								,(appDelegate->mSendIPAddress&0x00FF0000)>>16
								,(appDelegate->mSendIPAddress&0x0000FF00)>>8
								,(appDelegate->mSendIPAddress&0x000000FF)>>0];
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",appDelegate->mSendPortNum];
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

	/* IP address */
	mSendIPAddress = 0x7F000001; /* IP address: 127.0.0.1 */
	mSendPortNum = 1337;
	mReceivePortNum = 31337;
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
//	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"Sagariha.dat"] error:NULL];
	if (file_exists)
		[self readDataFile];

	memset(ip_add_buf,0,32);
	[[self getIPAddress] getCString:ip_add_buf maxLength:32 encoding:NSASCIIStringEncoding];
	ip_add_size = (strlen(ip_add_buf) / 4 + 1) * 4;
	printf("%s\n",ip_add_buf);
	
	mOSCMsg_State = -1;
	mOSCMsg_RecProg = -1.;
	mOSCMsg_DownloadProg = -1.;
	mOSCMsg_DownloadEnd = NO;
	mOSCMsg_InterstitialMsgDur = 0;
	mOSCMsg_InterstitialMsg = nil;
	mOSCMsg_Cue = -1;
	
	mThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_tcp) object:nil];
	[mThread start];
	
	[self checkIncomingMessages];
	
	mAudioQueuePlayer = [[SagarihaAudioQueuePlayer alloc] init];

	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[UIAccelerometer sharedAccelerometer].updateInterval = 0.1;
	
	return self;
}

- (void)dealloc {
	
	[mAudioQueuePlayer release];
	[mThread release];
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
	[self SendOSCMsgWithIntValue:"/saga/state\0":12:mStateServerSegControl.selectedSegmentIndex];
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
#if 1
			[self RequestAudio];
#else
			[self SendOSCMsg:"/saga/audio\0":12];
#endif
			break;
	}
}

-(IBAction)SetEnvPeriod:(id)sender
{
	[self SendOSCMsgWithIntValue:"/saga/period\0\0\0\0":16:FLOAT_TO_MRMR_INT([mEnvPeriodSlider value])];
}

-(IBAction)SetDelayLevel:(id)sender
{
	[self SendOSCMsgWithIntValue:"/saga/delay\0":12:FLOAT_TO_MRMR_INT([mDelayLevelSlider value])];
}

-(IBAction)SetPan:(id)sender
{
	[self SendOSCMsgWithIntValue:"/saga/pan\0\0\0":12:FLOAT_TO_MRMR_INT([mPanSlider value])];
}

-(IBAction)SetVolumeServer:(id)sender
{
//	printf("%f\n",[mVolumeServerSlider value]);
	[self SendOSCMsgWithIntValue:"/saga/vol_s\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeServerSlider value])];
}

-(IBAction)SetVolumeClient:(id)sender
{
//	printf("%f\n",[mVolumeClientSlider value]);
//	[self SendOSCMsgWithIntValue:"/saga/vol_c\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeClientSlider value])];
	mAudioQueuePlayer->mAmp = [mVolumeClientSlider value];
}

-(IBAction)InterstitialMsgDone:(id)sender
{
//	printf("InterstitialMsgDone\n");
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
		SagarihaAppDelegate *appDelegate = (SagarihaAppDelegate*)[[UIApplication sharedApplication] delegate];
		
		int i = 0;
		UInt32 ip_add = 0;
		for (NSString* s in ip_add_array)
		{
#if 0
			NSLog([NSString stringWithFormat:@"s=%@", s]);
#endif
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		appDelegate->mSendIPAddress = ip_add;
		[appDelegate writeDataFile];
		printf("IPAddressChanged to %08lx\n",appDelegate->mSendIPAddress);
	}
}

-(IBAction)PortNumChanged:(id)sender
{
	SagarihaAppDelegate *appDelegate = (SagarihaAppDelegate*)[[UIApplication sharedApplication] delegate];
	
#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	appDelegate->mSendPortNum = [mPortNumTextField.text intValue];
	[appDelegate writeDataFile];
	printf("PortNumChanged to %d\n",appDelegate->mSendPortNum);
}

-(IBAction)RequestHint
{
	[self SendOSCMsg:"/saga/hint\0\0":12];
}

-(void)turnInterstitialMsgOn
{
	mInterstitialView.alpha = 1.0;
	
	if (mOSCMsg_InterstitialMsgDur != -1)
	{
#if 0
		double dur = mOSCMsg_InterstitialMsgDur / 1000.;
		[NSTimer scheduledTimerWithTimeInterval:dur target:self selector:@selector(turnInterstitialMsgOff) userInfo:nil repeats:NO];
#endif
	}
	mOKButton.hidden = mOSCMsg_InterstitialMsgDur == -1 ? YES : NO;
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
}

-(void)RequestAudio
{
	if (mStateClientSegControl.selectedSegmentIndex != 2) return;

	printf("RequestAudio %d\n",mNextAudioIndex);

	[self SendOSCMsgWithIntValue:"/saga/audio\0":12:mNextAudioIndex];

	[self ResetAudioTimer];
}

-(void)ResetAudioTimer
{
	mAudioTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(RequestAudio) userInfo:nil repeats:NO];
}

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <fcntl.h>

#include <ifaddrs.h>
#include <arpa/inet.h>

-(void)SendOSCMsg:(const char*)osc_str:(int)osc_str_length
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",s\0\0",4);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size)
	OSC_END
}

-(void)SendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",si\0",4);
	val = htonl(val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(&val,4);
	OSC_END
}

-(void)SendOSCMsgWithFloatValue:(const char*)osc_str:(int)osc_str_length:(float)val
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",sf\0",4);
	
	OSC_VAL_BYTE_SWAP(&val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(&u.flt_val,4);
	OSC_END
}

-(void)send_udp
{
	int sock;
	struct sockaddr_in sa;
	int bytes_sent;
	
	sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (-1 == sock) /* if socket failed to initialize, exit */
    {
		fprintf(stderr,"Error creating socket: %s\n",strerror(errno));
		exit(EXIT_FAILURE);
    }
    
   	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = htonl(mSendIPAddress);
	sa.sin_port = htons(mSendPortNum);
	
	bytes_sent = sendto(sock, mOutBuffer, mOutBufferLength, 0,(struct sockaddr*)&sa, sizeof (struct sockaddr_in));
	if (bytes_sent < 0)
		fprintf(stderr,"Error sending packet: %s\n",strerror(errno));
	
	close(sock); /* close the socket */
}

-(void)receive_tcp
{
    int sockfd, newsockfd;
    socklen_t clilen;
    
    char buffer[256];
    
    struct sockaddr_in serv_addr, cli_addr;
    
    int n;
    
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    
    if (sockfd < 0)
        NSLog(@"ERROR opening socket");
    
    bzero((char *) &serv_addr, sizeof(serv_addr));
        
    serv_addr.sin_family = AF_INET;
    
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    
    serv_addr.sin_port = htons(mReceivePortNum);
    
    if (bind(sockfd, (struct sockaddr *) &serv_addr, 
             sizeof(serv_addr)) < 0)
        NSLog(@"ERROR on binding");
    
    listen(sockfd,5);
    
    clilen = sizeof(cli_addr);
    
	int done = 0;
	
    while (!done)
	{	
        printf("enter accept\n");
        newsockfd = accept(sockfd, 
                           (struct sockaddr *) &cli_addr, 
                           &clilen);
        printf("exit accept\n"); /* will get here if a client connects, otherwise this process waits */
        
        if (newsockfd < 0) 
            NSLog(@"ERROR on accept");
        
        bzero(buffer,256);
        n = read(newsockfd,buffer,255);
        if (n < 0) NSLog(@"ERROR reading from socket");
        if (n > 0)
            printf("Here is the message: %s\n",buffer);
        
		/* exit if the first 4 characters match */
		if (strncmp(buffer,"exit",4)==0) done = 1;
        
        close(newsockfd);
	}
	
    close(sockfd);
}

- (void)parse_osc
{
//	printf("mInBufferLength: %d\n",mInBufferLength);
	
	ssize_t pos = 0;
	int msg_type = 0;
	int add_type = 0;
	while (pos < mInBufferLength)
	{
		switch (msg_type)
		{
			case 0:
			{

#if 0
#define OSC_MSG_COMPARE(osc_add,add_type_val) if ([buf_str isEqualToString:@osc_add]) add_type = add_type_val;
#else
#define	OSC_MSG_COMPARE(osc_add,add_type_val) if (strcmp(mInBuffer+pos,osc_add)==0) add_type = add_type_val;
#endif
				
//				NSString* buf_str = [NSString stringWithCString:mInBuffer+pos];

				OSC_MSG_COMPARE("/saga/state",1)
				else OSC_MSG_COMPARE("/saga/rec_prog",2)
				else OSC_MSG_COMPARE("/saga/interstitial",3)
				else OSC_MSG_COMPARE("/saga/audio",4)
				else OSC_MSG_COMPARE("/saga/audio_end",5)
				else OSC_MSG_COMPARE("/saga/cue",6)

//				[buf_str release];
				break;
			}

			case 1:
			{
				switch (add_type)
				{
					case 5:
						{
//							printf("audio_end received\n");
							mOSCMsg_DownloadEnd = YES;
							break;
						}
				}
				break;
			}

			case 2:
			{
				switch (add_type)
				{
					case 1:
					{
						OSC_VAL_BYTE_SWAP(mInBuffer+pos)
//						printf("state %d\n",u.int_val);
						mOSCMsg_State = u.int_val;
						break;
					}
					case 2:
					{
						OSC_VAL_BYTE_SWAP(mInBuffer+pos)
//						printf("rec_prog %d\n",u.int_val);
						mOSCMsg_RecProg = (float)u.int_val / 1000.;
						break;
					}
					case 3:
					{
						OSC_VAL_BYTE_SWAP(mInBuffer+pos)
						mOSCMsg_InterstitialMsgDur = u.int_val;
						pos += 4;

//						printf("hint %s\n",mInBuffer+pos);
						mOSCMsg_InterstitialMsg = [[NSString alloc] initWithCString:mInBuffer+pos encoding:NSASCIIStringEncoding];
						break;
					}
					case 4:
					{
						OSC_VAL_BYTE_SWAP(mInBuffer+pos)
						int audio_index = u.int_val;
						pos += 4;
						
						OSC_VAL_BYTE_SWAP(mInBuffer+pos)
						int size = u.int_val;
						pos += 4;
						
						for (int i = 0; i < size; i++)
						{
							OSC_VAL_BYTE_SWAP(mInBuffer+pos)
							float audio_sample = u.flt_val;
							[mAudioQueuePlayer SetSample:audio_index+i:audio_sample];
							pos += 4;
						}
						
						if (audio_index == mNextAudioIndex)
						{
							mOSCMsg_DownloadProg = audio_index / (22050 * 5.);
							mNextAudioIndex = audio_index + size;
							[self SendOSCMsgWithIntValue:"/saga/audio\0":12:mNextAudioIndex];
						}
						else
							printf("missing audio index %d\n",audio_index);
						
						break;
					}
					case 6:
					{
						OSC_VAL_BYTE_SWAP(mInBuffer+pos)
//						printf("cue %d\n",u.int_val);
						mOSCMsg_Cue = u.int_val;
						break;
					}
				}
				break;
			}
			default:
				break;
		}
		
		const char* msg_type_str = "";
		switch (msg_type)
		{
			case 0: msg_type_str = "OSC Address Pattern"; msg_type = 1; break;
			case 1: msg_type_str = "OSC Type Tags"; msg_type = 2; break;
			default: msg_type_str = "OSC Data"; break;
		}
		
//		printf("%s: %s\n",msg_type_str,mInBuffer+pos);
		
		pos += ((strlen(mInBuffer+pos) / 4) + 1) * 4;
	}
}

-(void)checkIncomingMessages
{
	if (mOSCMsg_State >= 0)
	{
		mStateServerSegControl.selectedSegmentIndex = mOSCMsg_State;
		mOSCMsg_State = -1;
	}
	
	if (mOSCMsg_RecProg >= 0.)
	{
		mRecProgView.progress = mOSCMsg_RecProg;
		mOSCMsg_RecProg = -1.;
	}

	if (mOSCMsg_DownloadProg >= 0.)
	{
		mDownloadProgView.progress = mOSCMsg_DownloadProg;
		[mAudioTimer invalidate];
		[self ResetAudioTimer];
		mOSCMsg_DownloadProg = -1.;
	}
	
	if (mOSCMsg_DownloadEnd)
	{
		mStateClientSegControl.selectedSegmentIndex = 1;
		[mAudioQueuePlayer Start];
		mOSCMsg_DownloadEnd = NO;
	}
	
	if (mOSCMsg_InterstitialMsg != nil)
	{
		[self turnInterstitialMsgOn];
		mInterstitialLabel.text = mOSCMsg_InterstitialMsg;
		
//		UITabBarItem *tabBarItem = [[tabBarController.tabBar items] objectAtIndex:1];
//		[tabBarItem setEnabled:NO];
		
		mOSCMsg_InterstitialMsg = nil;
	}
	
	if (mOSCMsg_Cue >= 0)
	{
		[self SetCue:mOSCMsg_Cue];
		mOSCMsg_Cue = -1;
	}
	
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkIncomingMessages) userInfo:nil repeats:NO];  
}

- (NSString *)getIPAddress
{
	NSString *address = @"0.0.0.0";
	struct ifaddrs *interfaces = NULL;
	struct ifaddrs *temp_addr = NULL;
	int success = 0;
	
	// retrieve the current interfaces - returns 0 on success
	success = getifaddrs(&interfaces);
	if (success == 0)
	{
		// Loop through linked list of interfaces
		temp_addr = interfaces;
		while (temp_addr != NULL)
		{
			if (temp_addr->ifa_addr->sa_family == AF_INET)
			{
				// Check if interface is en0 which is the wifi connection on the iPhone
				if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
				{
					// Get NSString from C String
					address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
				}
			}
			temp_addr = temp_addr->ifa_next;
		}
	}
	
	// Free memory
	freeifaddrs(interfaces);
	return address;
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

-(void)readDataFile
{
	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[SagarihaAppDelegate dataFilePath]];
//	NSLog([SagarihaAppDelegate dataFilePath]);
	mSendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	mSendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%lu %d",mSendIPAddress,mSendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:mSendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:mSendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[SagarihaAppDelegate dataFilePath] atomically:YES];
	[dict release];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
#if 0
	printf("%f, %f, %f\n", acceleration.x, acceleration.y, acceleration.z);
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

	[self SendOSCMsgWithFloatValue:"/saga/accelx\0\0\0\0":16:x];
	[self SendOSCMsgWithFloatValue:"/saga/accely\0\0\0\0":16:y];
//	[self SendOSCMsgWithFloatValue:"/saga/accelz\0\0\0\0":16:z];
	
#if 0
	printf("%f, %f, %f\n",x,y,z);
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

//	printf("setting cue number to %d\n",cue_num);
}

-(IBAction)ForZero_Start:(id)sender
{
	[self SendOSCMsg:"/saga/fz_start\0\0":16];
}

-(IBAction)ForZero_Subtract:(id)sender
{
	[self SendOSCMsg:"/saga/fz_sub\0\0\0\0":16];
}

-(IBAction)ForZero_Stop:(id)sender
{
	[self SendOSCMsg:"/saga/fz_stop\0\0\0":16];
}

-(IBAction)ForZero_Panic:(id)sender
{
	[self SendOSCMsg:"/saga/fz_panic\0\0":16];
}

@end
