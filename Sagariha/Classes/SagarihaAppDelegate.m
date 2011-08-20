//
//  SagarihaAppDelegate.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 9/16/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SagarihaAppDelegate.h"

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

@implementation SagarihaAppDelegate

#define __VINNIE__	1

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

	mImageArray = [[NSArray alloc] initWithObjects:
				   [UIImage imageNamed:@"image_0.jpg"],
				   [UIImage imageNamed:@"image_1.jpg"],
				   nil
				   ];

	/* IP address */
	mSendIPAddress = 0x7F000001; /* IP address: 127.0.0.1 */
	mSendPortNum = 1337;
	mUDPReceivePortNum = 31337;
    mTCPReceivePortNum = 41337;
	    
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
	NSLog(@"%s\n",ip_add_buf);
	
	mOSCMsg_State = -1;
	mOSCMsg_RecProg = -1.;
	mOSCMsg_DownloadProg = -1.;
	mOSCMsg_DownloadEnd = NO;
	mOSCMsg_InterstitialMsgDur = 0;
	mOSCMsg_InterstitialMsg = nil;
	mOSCMsg_Cue = -1;
	mOSCMsg_Play = NO;
	mOSCMsg_Stop = NO;
	
    incomingDataBuffer = [[NSMutableData alloc]init];
    
	mUDPThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_udp) object:nil];
	[mUDPThread start];
    
    mTCPThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_tcp) object:nil];
	[mTCPThread start];
	
	[self checkIncomingMessages];
	
	mAudioQueuePlayer = [[SagarihaAudioQueuePlayer alloc] init];

	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[UIAccelerometer sharedAccelerometer].updateInterval = 0.1;
	
	return self;
}

- (void)dealloc {
	
	[incomingDataBuffer release];
    [mImageArray release];
	[mAudioQueuePlayer release];
	[mUDPThread release];
    [mTCPThread release];
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
//	NSLog(@"%f\n",[mVolumeServerSlider value]);
	[self SendOSCMsgWithIntValue:"/saga/vol_s\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeServerSlider value])];
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
		NSLog(@"IPAddressChanged to %08lx\n",appDelegate->mSendIPAddress);
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
	NSLog(@"PortNumChanged to %d\n",appDelegate->mSendPortNum);
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
        [self SendOSCMsgWithIntValue:"/saga/audio\0":12:mNextAudioIndex];
    }
    else return;
}

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

-(void)receive_udp
{
	int sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa; 
	socklen_t fromlen;
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
	sa.sin_port = htons(mUDPReceivePortNum);
	
	if (-1 == bind(sock,(struct sockaddr *)&sa, sizeof(struct sockaddr)))
	{
		perror("error bind failed");
		close(sock);
		exit(EXIT_FAILURE);
	} 
	
	for (;;) 
	{
		mUDPInBufferLength = recvfrom(sock, (void *)mUDPInBuffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);
		if (mUDPInBufferLength < 0)
			fprintf(stderr,"%s\n",strerror(errno));
        //NSLog(@"mInBuffer contents:%s\n", mInBuffer);
		[self parse_osc];
	}
	
	close(sock); /* close the socket */
}

- (void)parse_osc
{
    // printf("mUDPInBuffer: %s\n", mUDPInBuffer);

    ssize_t pos = 0;
    int msg_type = 0;
    int add_type = 0;

    while (pos < mUDPInBufferLength)
    {
        switch (msg_type)
        {
            case 0:
            {
                
#if 0
#define OSC_MSG_COMPARE(osc_add,add_type_val) if ([buf_str isEqualToString:@osc_add]) add_type = add_type_val;
#else
#define	OSC_MSG_COMPARE(osc_add,add_type_val) if (strcmp(mUDPInBuffer,osc_add)==0) add_type = add_type_val;
#endif
                // NSString* buf_str = [NSString stringWithCString:mUDPInBuffer+pos encoding:NSASCIIStringEncoding];

                OSC_MSG_COMPARE("/saga/state",1)
                else OSC_MSG_COMPARE("/saga/rec_prog",2)
                else OSC_MSG_COMPARE("/saga/interstitial",3)
                else OSC_MSG_COMPARE("/saga/audio",4)
                else OSC_MSG_COMPARE("/saga/audio_end",5)
                else OSC_MSG_COMPARE("/saga/cue",6)
				else OSC_MSG_COMPARE("/saga/play",7)
				else OSC_MSG_COMPARE("/saga/stop",8)
				else OSC_MSG_COMPARE("/saga/loop",9)

                // [buf_str release];
                // NSLog(@"add_type %d", add_type);
                break;
            }

            case 1:
            {
                switch (add_type)
                {
                    case 5:
                        {
                            // printf("audio_end received\n");
                            mOSCMsg_DownloadEnd = YES;
                            [self performSelectorOnMainThread:@selector(downloadEnd) 
                                                   withObject:nil 
                                                waitUntilDone:NO];
                            break;
					}
					case 7:
					{
						NSLog(@"play received");
						mOSCMsg_Play = YES;
						break;
					}
					case 8:
						NSLog(@"stop received");
						mOSCMsg_Stop = YES;
						break;
                }
                break;
            }

            case 2:
            {
                switch (add_type)
                {
                    case 1:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        //printf("state %d\n",u.int_val);
                        mOSCMsg_State = u.int_val;
                        break;
                    }
                    case 2:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        //printf("rec_prog %d\n",u.int_val);
                        mOSCMsg_RecProg = (float)u.int_val / 1000.;
                        break;
                    }
                    case 3:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        mOSCMsg_InterstitialMsgDur = u.int_val;
                        pos += 4;

                        //printf("hint %s\n",mUDPInBuffer+pos);
                        mOSCMsg_InterstitialMsg = [[NSString alloc] initWithCString:mUDPInBuffer+pos encoding:NSASCIIStringEncoding];
                        break;
                    }
                    case 4:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        int audio_index = u.int_val;
                        pos += 4;
                        
                        // NSLog(@"audio_index %i", audio_index);
                        
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        int size = u.int_val;
                        pos += 4;
                        
                        // NSLog(@"size %i", size);
                        
                        for (int i = 0; i < size; i++)
                        {
                            OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                            float audio_sample = u.flt_val;
                            [mAudioQueuePlayer SetSample:audio_index+i:audio_sample];
                            pos += 4;
                        }
                        
                        if (audio_index == mNextAudioIndex)
                        {
                            mOSCMsg_DownloadProg = audio_index / (22050 * 5.);
                            mNextAudioIndex = audio_index + size;
                            
                            [self performSelectorOnMainThread:@selector(RequestAudio) 
                                                   withObject:nil 
                                                waitUntilDone:NO];
                            
                            [self performSelectorOnMainThread:@selector(updateDownloadProg) 
                                                   withObject:nil 
                                                waitUntilDone:NO];
                        }
                        else
                            printf("missing audio index %d\n",audio_index);
                        
                        break;
                    }
                    case 6:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        // printf("cue %d\n",u.int_val);
                        mOSCMsg_Cue = u.int_val;
                        break;
                    }
					case 9:
					{
						OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
						float loop_start = u.int_val;
						pos += 4;

						OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
						float loop_end = u.int_val;
						pos += 4;
						
						if ((loop_start < loop_end)
							&& (loop_start >= 0 && loop_start <= 5000.)
							&& (loop_end >= 0 && loop_end <= 5000.))
						{
							mAudioQueuePlayer->mLoopStart = loop_start / 5000.;
							mAudioQueuePlayer->mLoopEnd = loop_end / 5000.;
						}
					}
                }
                break;
            }
            default:
                break;
        }
        
        //NSLog(@"msg_type %d", msg_type);
        const char* msg_type_str = "";
        switch (msg_type)
        {
            case 0: msg_type_str = "OSC Address Pattern"; msg_type = 1; break;
            case 1: msg_type_str = "OSC Type Tags"; msg_type = 2; break;
            default: msg_type_str = "OSC Data"; break;
        }
                    
        //printf("%s: %s\n",msg_type_str,mUDPInBuffer+pos);
        pos += ((strlen(mUDPInBuffer+pos) / 4) + 1)* 4;            
    }
}

-(void)receive_tcp
{
    int servSock, clntSock;
    struct sockaddr_in servAddr, clntAddr;
    
    servSock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
    
    if (servSock < 0)
        NSLog(@"ERROR opening TCP socket");
    
    memset(&servAddr, 0, sizeof(servAddr));
    servAddr.sin_family = AF_INET;    
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY);    
    servAddr.sin_port = htons(mTCPReceivePortNum);
    
    if (bind(servSock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0)
        NSLog(@"ERROR on TCP binding");
    
    if (listen(servSock,5) < 0)
        NSLog(@"listen() failed");
    
    socklen_t clntLen = sizeof(clntAddr);
    clntSock = accept(servSock,(struct sockaddr *) &clntAddr, &clntLen);
    /* will get here if a client connects, otherwise this process waits */
    
    if (clntSock < 0) NSLog(@"ERROR on TCP accept");

    char buffer[256];
    int bytesRcvd;
    int count = 0;
    BOOL done = NO;

    while (!done) {
        
        memset(buffer, 0, 256);
        
        bytesRcvd = recv(clntSock, buffer, sizeof(buffer)-1, 0);
        
        if (bytesRcvd < 0) NSLog(@"ERROR reading from TCP socket\n");
        
        if (bytesRcvd  > 0) {
			printf("bytesRead: %d; buffer contents: %s\n", bytesRcvd, buffer);
            [incomingDataBuffer appendBytes:buffer length:bytesRcvd];
            ++count;
            printf("receive packet count: %d\n",count);
        }
        if (bytesRcvd == 0) {
            NSLog(@"total bytes recieved: %u",[incomingDataBuffer length]);
            [self tcp_file];
            done = YES;
            break;
        }
    }
    
    NSRange resetRange = {0, [incomingDataBuffer length]};
    [incomingDataBuffer resetBytesInRange:resetRange];
    
    close(clntSock);	
    close(servSock);
}

- (void)tcp_file
{
    
    NSAutoreleasePool *tcpThreadPool = [[NSAutoreleasePool alloc] init];
    
    NSData* raw = [NSData dataWithBytes:[incomingDataBuffer bytes] length:[incomingDataBuffer length]];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"forZero.mp3"];
    mAudioQueuePlayer.theFile = filePath;
        //NSLog(@"filePath:%@", filePath);
    
    [raw writeToFile:filePath atomically:YES];
        
    [tcpThreadPool drain];
}

-(void)updateDownloadProg {
    
    if (mOSCMsg_DownloadProg >= 0.)
	{
		mDownloadProgView.progress = mOSCMsg_DownloadProg;
		mOSCMsg_DownloadProg = -1.;
	}
}

-(void)downloadEnd {
    if (mOSCMsg_DownloadEnd)
	{
		NSLog(@"Download ended");
#if __VINNIE__
		[mAudioQueuePlayer->mWaveTable->mArray writeToFile:@"SagarihaAudio.aif" atomically:YES];
        //[mAudioQueuePlayer->mWaveTable->mArray writeToFile:[SagarihaWaveTable dataFilePath] atomically:YES];
        //NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mAudioQueuePlayer->mWaveTable->mArray];
        //[data writeToFile:@"SagarihaAudio.aif" atomically:NO];
		mStateClientSegControl.selectedSegmentIndex = 0;
#else
		mStateClientSegControl.selectedSegmentIndex = 1;
		[mAudioQueuePlayer Start];
#endif
		mOSCMsg_DownloadEnd = NO;
	}
}

- (void)checkIncomingMessages
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
		
	if (mOSCMsg_InterstitialMsg != nil)
	{
		[self turnInterstitialMsgOn];
		
		int image_pos = -1;
		if ([mOSCMsg_InterstitialMsg isEqualToString:@"image_0"])
			image_pos = 0;
		else if ([mOSCMsg_InterstitialMsg isEqualToString:@"image_1"])
			image_pos = 1;
		if (image_pos == -1)
		{
			mInterstitialLabel.text = mOSCMsg_InterstitialMsg;
			mInterstitialView.image = nil;
		}
		else
		{
			mInterstitialLabel.text = @"";
			mInterstitialView.image = [mImageArray objectAtIndex:image_pos];
		}
		
		mOSCMsg_InterstitialMsg = nil;
	}
	
	if (mOSCMsg_Cue >= 0)
	{
		[self SetCue:mOSCMsg_Cue];
		mOSCMsg_Cue = -1;
	}
	
	if (mOSCMsg_Play)
	{
		mStateClientSegControl.selectedSegmentIndex = 1;
		mAudioQueuePlayer->mTheta = mAudioQueuePlayer->mLoopStart;
		[mAudioQueuePlayer Start];
		mOSCMsg_Play = NO;
	}
	
	if (mOSCMsg_Stop)
	{
		mStateClientSegControl.selectedSegmentIndex = 0;
		[mAudioQueuePlayer Stop];
		mOSCMsg_Stop = NO;
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

	[self SendOSCMsgWithFloatValue:"/saga/accelx\0\0\0\0":16:x];
	[self SendOSCMsgWithFloatValue:"/saga/accely\0\0\0\0":16:y];
//	[self SendOSCMsgWithFloatValue:"/saga/accelz\0\0\0\0":16:z];
	
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
