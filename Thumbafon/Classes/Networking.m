//
//  Networking.m
//  Thumbafon
//
//  Created by Chris Lavender on 2/4/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import "Networking.h"
#import "AQSynth.h"
#import "MainViewController.h"
#import "FlipsideViewController.h"

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <fcntl.h>
#include <unistd.h>

#include <ifaddrs.h>
#include <arpa/inet.h>

#define OSC_START mOutBufferLength = 0;
#define OSC_END [self sendUDP];
#define OSC_ADD(msg,num_msg_bytes) memcpy(mOutBuffer+mOutBufferLength,msg,num_msg_bytes); mOutBufferLength+=num_msg_bytes;

Networking *gNetwork = nil;

@interface Networking ()
@property (readwrite, retain) NSString	*mInterstitialString;
@property (readwrite, retain) NSString	*mHints;
@property (readwrite, retain) NSString	*mMarqueeMsg;
@property UInt32 mSendIPAddress;
@property BOOL listenUDP;
@property BOOL listenIP;
@property BOOL groupOffsetState;
@property SInt16 mNewNetworkOffset;
@property SInt16 mCurrentNetworkOffset;
@property UInt16 mNewNetworkMode;
@property UInt16 mCurrentNetworkMode;

@end

@implementation Networking

@synthesize listenUDP;
@synthesize listenIP;
@synthesize groupOffsetState;
@synthesize mNewNetworkOffset;
@synthesize mCurrentNetworkOffset;
@synthesize mNewNetworkMode;
@synthesize mCurrentNetworkMode;
@synthesize mInterstitialString;
@synthesize mHints;
@synthesize mMarqueeMsg;
@synthesize mSendIPAddress;

//*** available for outside access ***///
@synthesize mAQPlayer;
@synthesize mMainView;
@synthesize mFlipside;

#pragma mark -
#pragma mark init / dealloc

-(id)init {
	[super init];
	
	gNetwork = self;
	
	mSendIPAddress = 0; //htonl(0x7F000001); /* local testing IP address: 127.0.0.1 */
	mSendPortNum = 1337;
	mReceivePortNum = 31337;
	mReceiveIPPortNum = 41337;
	
	groupOffsetState = NO;
	listenIP = YES;
	listenUDP = NO;
	
	mCurrentNetworkOffset = 0;
	
	memset(ip_add_buf,0,32);
	[[self getIPAddress] getCString:ip_add_buf maxLength:32 encoding:NSASCIIStringEncoding];
	ip_add_size = (strlen(ip_add_buf) / 4 + 1) * 4;
	printf("ip_add_buf:%s\n",ip_add_buf);
	
	UIDevice *thisDevice = [UIDevice currentDevice];
	NSString * devNameNoPunk = [[thisDevice.name componentsSeparatedByCharactersInSet: [NSCharacterSet punctuationCharacterSet]] componentsJoinedByString: @""];

	memset(dev_name_buf,0,32);
	[devNameNoPunk getCString:dev_name_buf maxLength:32 encoding:NSASCIIStringEncoding];
	dev_name_size = (strlen(dev_name_buf) / 4 + 1) * 4;
	printf("dev_name_buf:%s\n",dev_name_buf);
	printf("dev_name_size:%i\n",dev_name_size);	

	mThread = [[NSThread alloc] initWithTarget:self 
									  selector:@selector(receiveServerIP) 
										object:nil];
	[mThread start];
	
	mTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 
											  target:self 
											selector:@selector(checkIncomingMessages) 
											userInfo:nil 
											 repeats:YES];
	return self;
}

- (NSString *)getIPAddress {
	
	NSString *address = @"0.0.0.0";
	struct ifaddrs *interfaces = NULL;
	struct ifaddrs *temp_addr = NULL;
	int success = 0;
	
	// retrieve the current interfaces - returns 0 on success
	success = getifaddrs(&interfaces);
	if (success == 0) {
		
		// Loop through linked list of interfaces
		temp_addr = interfaces;
		while (temp_addr != NULL) {
			
			if (temp_addr->ifa_addr->sa_family == AF_INET) {
				
				// Check if interface is en0 which is the wifi connection on the iPhone
				if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {	/* on device it's en0, on simulator it's en1 */
					// Get NSString from C String
					address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
				}
			}
			temp_addr = temp_addr->ifa_next;
		}
	}
	NSLog(@"Test Address: %@",address);
	
	// Free memory
	freeifaddrs(interfaces);
	return address;
}

- (void)dealloc {
	
	[mThread release];
	[mAQPlayer release];
	gNetwork = nil;
	[super dealloc];
}

#pragma mark -
#pragma mark receive methods on 2nd thread

- (void)receiveServerIP {
	
	sockIPReceive = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa;
	socklen_t fromlen;
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
	sa.sin_port = htons(mReceiveIPPortNum);
	
	if (-1 == bind(sockIPReceive,(struct sockaddr *)&sa, sizeof(struct sockaddr))) {
		perror("error bind to 41337 failed");
		close(sockIPReceive);
		exit(EXIT_FAILURE);
	} 
	
	for (;;) {		
		mInBufferLength = recvfrom(sockIPReceive, (void *)mInBuffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);		
		if (self.listenIP) {
			//NSLog(@"receiveServerIP is running");
			if (mInBufferLength < 0) fprintf(stderr,"%s\n",strerror(errno));
			[self parseOSC];
		}
		else break;
	}

	close(sockIPReceive);
	self.listenUDP = YES;
	if (mSendIPAddress != 0) [self receiveUDP];
}


- (void)receiveUDP {
	
	sockReceive = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa;
	socklen_t fromlen;
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
	sa.sin_port = htons(mReceivePortNum);
	
	if (-1 == bind(sockReceive,(struct sockaddr *)&sa, sizeof(struct sockaddr))) {
		perror("error bind to 31337 failed");
		close(sockReceive);
		exit(EXIT_FAILURE);
	} 
	
	for (;;) {
		/*** KU:I think there is an infinite loop in the following, so the if (self.listenUDP) conditional ***/
		/*** won't be called until recvfrom gets something.                                                ***/
		mInBufferLength = recvfrom(sockReceive, (void *)mInBuffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);		
		if (self.listenUDP) {
			//NSLog(@"receiveUDP is running");
			if (mInBufferLength < 0) fprintf(stderr,"%s\n",strerror(errno));
			[self parseOSC];
		}
		else break;
		}
	
	close(sockReceive);
}

- (void)parseOSC
{
	//NSLog(@"mInBufferLength: %ld\n",mInBufferLength);
	
	ssize_t pos = 0;
	int msg_type = 0;
	int add_type = 0;
	
	while (pos < mInBufferLength)
	{
		switch (msg_type)
		{
			case 0: /* OSC Address Pattern */
			{
				NSString *buf_str = [[NSString alloc] initWithCString:mInBuffer+pos 
															 encoding:NSASCIIStringEncoding];
				if ([buf_str isEqualToString:@"/thum/interstitial"])		add_type = 1;
				else if ([buf_str isEqualToString:@"/thum/hints"])			add_type = 2;
				else if ([buf_str isEqualToString:@"/thum/keyoffset"])		add_type = 3;
				else if ([buf_str isEqualToString:@"/thum/keyoffset/group"])add_type = 4;
				else if ([buf_str isEqualToString:@"/thum/mode"])			add_type = 5;
				else if ([buf_str isEqualToString:@"/thum/labelmsg"])		add_type = 6;
				else if (self.mSendIPAddress == 0 && [buf_str isEqualToString:@"/thum/serverip"]) add_type = 7;
				[buf_str release];
				break;
			}
			case 1: /* OSC Type Tags */
			{
				/* do nothing for now */
				break;
			}
			case 2: /* OSC Data */
			{
				switch (add_type)
				{
					case 1: {
						NSString *interstitialString = [[NSString alloc] initWithCString:mInBuffer+pos 
																			encoding:NSASCIIStringEncoding];
						self.mInterstitialString = interstitialString;
						[interstitialString release];
						break;
					}
					case 2: {
						NSString *hintsString = [[NSString alloc] initWithCString:mInBuffer+pos 
															   encoding:NSASCIIStringEncoding];
						self.mHints = hintsString;
						[hintsString release];
						break;
					}
					case 3: {
						int offset = atoi(mInBuffer+pos);
						self.mNewNetworkOffset = offset;
						break;
					}
					case 4: {
						if (strcmp(mInBuffer+pos,"0")) self.groupOffsetState = YES; //NSLog(@"successYES!"); }
						else self.groupOffsetState = NO; //NSLog(@"successNO!"); }
						break;
					}
					case 5: {
						int mode = atoi(mInBuffer+pos);
						self.mNewNetworkMode = mode;
						break;
					}
					case 6: {
						NSString *newMarqueeMsg = [[NSString alloc] initWithCString:mInBuffer+pos
																	  encoding:NSASCIIStringEncoding];
						self.mMarqueeMsg = newMarqueeMsg;
						[modeLabelMsg release];
						break;
					}
					case 7: {
						self.mSendIPAddress = inet_addr(mInBuffer+pos);
						[self sendOSCMsg:"/thum/join\0\0":12];
						self.listenIP = NO;
						break;
					}
				}
				break;
			}
			default:
				break;
		}
		const char* msg_type_str = "";
		switch (msg_type) {
			case 0: msg_type_str = "OSC Address Pattern"; msg_type = 1; break;
			case 1: msg_type_str = "OSC Type Tags"; msg_type = 2; break;
			default: msg_type_str = "OSC Data"; break;
		}
		//printf("%s: %s\n",msg_type_str,mInBuffer+pos);
		
		pos += ((strlen(mInBuffer+pos) / 4) + 1) * 4;
	}
}

#pragma mark -
#pragma mark receive related on main thread

- (void)quitNetworking {
	
	self.listenIP = NO;
	self.listenUDP = NO;
	close(sockIPReceive);
	close(sockReceive); 
	[self sendOSCMsg:"/thum/leave\0":12];
	[mTimer invalidate];
}

-(void)checkIncomingMessages {
	
	if (self.mCurrentNetworkOffset != self.mNewNetworkOffset) {
		self.mCurrentNetworkOffset = self.mNewNetworkOffset;
		[self setAQSynthOffset];
	}
	
	if (self.mCurrentNetworkMode != self.mNewNetworkMode) {
		self.mCurrentNetworkMode = self.mNewNetworkMode;
		[self setAQSynthMode];
	}
	
	
	if (self.mMarqueeMsg != nil) {
		
		mMainView.mLabelText = self.mMarqueeMsg;
		[mMainView setMsgLabel];
		//[self.mMarqueeMsg release];
		self.mMarqueeMsg = nil;
	}		
	
	if (self.mInterstitialString != nil) {
		mAlert = [[UIAlertView alloc] initWithTitle:nil 
											message:self.mInterstitialString 
										   delegate:self 
								  cancelButtonTitle:@"Return" 
								  otherButtonTitles: nil];
		NSArray *subViewArray = mAlert.subviews;
		
		for(int i = 0;i < [subViewArray count]; i++) {
			
			if([[[subViewArray objectAtIndex:i] class] isSubclassOfClass:[UILabel class]]) {
				UILabel *label = [subViewArray objectAtIndex:i];
				label.textAlignment = UITextAlignmentLeft;
			}
		}
		[mAlert show];
		[mAlert release];
		//[self.mInterstitialString release];
		self.mInterstitialString = nil;
	}

	if (self.mHints != nil) {
		mAlert = [[UIAlertView alloc] initWithTitle:nil 
											message:self.mHints 
										   delegate:self 
								  cancelButtonTitle:@"Previous" 
								  otherButtonTitles:@"Return",nil];
		
		NSArray *subViewArray = mAlert.subviews;
		
		for(int i = 0;i < [subViewArray count]; i++) {
			
			if([[[subViewArray objectAtIndex:i] class] isSubclassOfClass:[UILabel class]]) {
				UILabel *label = [subViewArray objectAtIndex:i];
				label.textAlignment = UITextAlignmentLeft;
			}
		}
		[mAlert show];
		[mAlert release];
		//[self.mHints release];
		self.mHints = nil;
	}
}

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {

	if ([[actionSheet buttonTitleAtIndex:0] isEqual:@"Previous"] && buttonIndex == 0) {
		[self sendOSCMsg:"/thum/prevhint\0\0":16];
	}
	else {
		NSLog(@"cancel");
	}
}


#pragma mark -
#pragma mark sendUDP

-(void)sendUDP {
	
	struct sockaddr_in sa;
	int bytes_sent;
	
	sockSend = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (-1 == sockSend) /* if socket failed to initialize, exit */ {
		
		fprintf(stderr,"Error creating socket: %s\n",strerror(errno));
		exit(EXIT_FAILURE);
    }
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = mSendIPAddress;
	sa.sin_port = htons(mSendPortNum);
	
	bytes_sent = sendto(sockSend, mOutBuffer, mOutBufferLength, 0,(struct sockaddr*)&sa, sizeof (struct sockaddr_in));
	if (bytes_sent < 0)
		fprintf(stderr,"Error sending packet: %s\n",strerror(errno));
	
	close(sockSend); /* close the socket */
}

-(void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length {
	
	char buf[1024]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",ss\0",4);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(dev_name_buf,dev_name_size);
	OSC_END
}

-(void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val {
	
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",si\0",4);
	val = htonl(val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(&val,4);
	OSC_END
}

-(void)sendOSCMsgWith2IntValues:(const char*)osc_str:(int)osc_str_length:(int)val0:(int)val1 {
	
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",sii\0\0\0\0",8);
	val0 = htonl(val0);
	val1 = htonl(val1);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+8);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(&val0,4);
	OSC_ADD(&val1,4);
	OSC_END
}

#pragma mark -
#pragma mark device actions to/from

- (void)buttonpress:(NSString *)button {
	
	UInt8 buttonNum = [button intValue];
	[self sendOSCMsgWith2IntValues:"/thum/butt\0\0":12:buttonNum:1];
}

- (void)buttonrelease:(NSString *)button {
	
	UInt8 buttonNum = [button intValue];
	[self sendOSCMsgWith2IntValues:"/thum/butt\0\0":12:buttonNum:0];
}

- (void)requestHint {
	
	[self sendOSCMsg:"/thum/hints\0":12];
}

- (void)setAQSynthOffset {
	((AQSynth *)mAQPlayer).noteOffset = self.mCurrentNetworkOffset;
	[(AQSynth *)mAQPlayer setMode];
}

- (void)setAQSynthMode {
	
	if (mCurrentNetworkMode < 6) {
		((AQSynth *)mAQPlayer).currentMode = self.mCurrentNetworkMode;
		[(AQSynth *)mAQPlayer setMode];
		[mMainView setModeLabel];
		[mFlipside changeFlipModeLabel];
	}
}

@end