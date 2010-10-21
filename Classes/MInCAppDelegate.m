//
//  MInCAppDelegate.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MInCAppDelegate.h"

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <fcntl.h>

#include <ifaddrs.h>
#include <arpa/inet.h>

@implementation MInCAppDelegate

@synthesize window;
@synthesize tabBarController;

#define OSC_START mOutBufferLength = 0;
#define OSC_END [self send_udp];
#define OSC_ADD(msg,num_msg_bytes) memcpy(mOutBuffer+mOutBufferLength,msg,num_msg_bytes); mOutBufferLength+=num_msg_bytes;

#define FLOAT_TO_MRMR_INT(v) (int)(v * 1000. + 0.5)

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];

	mTouchView.multipleTouchEnabled = YES;
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


- (void)dealloc {
	[mThread release];
	[mImageArray release];
	[mAQP release];
    [tabBarController release];
    [window release];
    [super dealloc];
}

-(id)init {
	[super init];
	
	mAQP = [AQPlayer new];
	
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	
	mImageArray = [[NSArray alloc] initWithObjects:
				   [UIImage imageNamed:@"InC01.jpg"],
				   [UIImage imageNamed:@"InC02.jpg"],
				   [UIImage imageNamed:@"InC03.jpg"],
				   [UIImage imageNamed:@"InC04.jpg"],
				   [UIImage imageNamed:@"InC05.jpg"],
				   [UIImage imageNamed:@"InC06.jpg"],
				   nil
				   ];
	
	mSendIPAddress = 0x7F000001; /* IP address: 127.0.0.1 */
	mSendPortNum = 1337;
	mReceivePortNum = 31337;
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
//	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"] error:NULL];
	if (file_exists)
		[self readDataFile];

	mWithServer = NO;
	
	memset(ip_add_buf,0,32);
	[[self getIPAddress] getCString:ip_add_buf maxLength:32 encoding:NSASCIIStringEncoding];
	ip_add_size = (strlen(ip_add_buf) / 4 + 1) * 4;
	printf("%s\n",ip_add_buf);
	
	[self sendHeartBeat];

	mThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_udp) object:nil];
	[mThread start];

	mInterstitialString = nil;
	mNewMod = NO;
	
	[self checkIncomingMessages];

	return self;
}

-(void)SetWithServer:(BOOL)on
{
	mWithServer = on;
	printf("SetWithServer %s\n",mWithServer?"ON":"OFF");
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

-(IBAction)SetSequence
{
	if (mWithServer)
		[self SendOSCMsg:"/MInC/mod\0\0\0":12];
	else
	{
		[mAQP SetSequence:(++mAQP->mSeqNum)];
		mNewMod = YES;
	}
}

-(IBAction)SetSpeaker:(id)sender
{
	printf("SetSpeaker %d\n",mSpeakerSegControl.selectedSegmentIndex);

	[self SendOSCMsgWithIntValue:"/MInC/speak\0":12:mSpeakerSegControl.selectedSegmentIndex];
}

-(IBAction)SetInstrument:(id)sender
{
	printf("SetInstrument %d\n",mInstrSegControl.selectedSegmentIndex);

	[self SendOSCMsgWithIntValue:"/MInC/instr\0":12:mInstrSegControl.selectedSegmentIndex];
}

-(IBAction)Set8vbDown:(id)sender
{
	[self Send8vb:true];
}

-(IBAction)Set8vbUp:(id)sender
{
	[self Send8vb:false];
}

-(IBAction)Send8vb:(BOOL)direction
{
	[self SendOSCMsgWithIntValue:"/MInC/8vb\0\0\0":12:direction?1:0];
}

-(IBAction)Set8vaDown:(id)sender
{
	[self Send8va:true];
}

-(IBAction)Set8vaUp:(id)sender
{
	[self Send8va:false];
}

-(IBAction)Send8va:(BOOL)direction
{
	[self SendOSCMsgWithIntValue:"/MInC/8va\0\0\0":12:direction?1:0];
}

-(IBAction)Set2xSlowDown:(id)sender
{
	[self Send2xSlow:true];
}

-(IBAction)Set2xSlowUp:(id)sender
{
	[self Send2xSlow:false];
}

-(void)Send2xSlow:(BOOL)direction
{
	[self SendOSCMsgWithIntValue:"/MInC/2xslow\0\0\0\0":16:direction?1:0];
}

-(IBAction)Set2xFastDown:(id)sender
{
	[self Send2xFast:true];
}

-(IBAction)Set2xFastUp:(id)sender
{
	[self Send2xFast:false];
}

-(void)Send2xFast:(BOOL)direction
{
	[self SendOSCMsgWithIntValue:"/MInC/2xfast\0\0\0\0":16:direction?1:0];
}

-(IBAction)SetNoteDuration:(id)sender
{
	Sequencer* q = mAQP->mSequencer_Pri;
	if (q != nil)
		q->mDurMultiplier = [mNoteDurationSlider value];

	[self SendOSCMsgWithIntValue:"/MInC/dur\0\0\0":12:FLOAT_TO_MRMR_INT([mNoteDurationSlider value])];
}

-(IBAction)Hint:(id)sender
{
	[self SendOSCMsg:"/MInC/hint\0\0":12];
}

-(IBAction)Status:(id)sender
{
	[self SendOSCMsg:"/MInC/status\0\0\0\0":16];
}

-(void)SendOSC_Filter:(double)val
{
	[self SendOSCMsgWithIntValue:"/MInC/filt\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

-(void)SendOSC_Volume:(double)val
{
	[self SendOSCMsgWithIntValue:"/MInC/vol\0\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

-(void)SendOSC_Waveform:(double)val
{
	[self SendOSCMsgWithIntValue:"/MInC/wave\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
#if 0
	printf("%f, %f, %f\n", acceleration.x, acceleration.y, acceleration.z);
#endif

#define LIMIT_ACC_VAL(n)	n < -1. ? -1. : n > 1. ? 1. : n

	double x = LIMIT_ACC_VAL(acceleration.x);
	double y = LIMIT_ACC_VAL(acceleration.y);
	double z = LIMIT_ACC_VAL(acceleration.z);

	[self SendOSCMsgWithIntValue:"/MInC/accX\0\0":12:FLOAT_TO_MRMR_INT(x)];
	[self SendOSCMsgWithIntValue:"/MInC/accY\0\0":12:FLOAT_TO_MRMR_INT(y)];
	[self SendOSCMsgWithIntValue:"/MInC/accZ\0\0":12:FLOAT_TO_MRMR_INT(z)];

	x *= mAQP->mSequencer_Pri->mTempoSensitivity;
	x = 1.0 - x;
	x *= 2.;
	[mAQP->mSequencer_Pri SetTempo:x];

#if 0
	printf("%f\n",x);
#endif
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

- (void)receive_udp
{
	int sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa; 
	socklen_t fromlen;
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
	sa.sin_port = htons(mReceivePortNum);
	
	if (-1 == bind(sock,(struct sockaddr *)&sa, sizeof(struct sockaddr)))
	{
		perror("error bind failed");
		close(sock);
		exit(EXIT_FAILURE);
	} 
	
	for (;;) 
	{
		mInBufferLength = recvfrom(sock, (void *)mInBuffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);
		if (mInBufferLength < 0)
			fprintf(stderr,"%s\n",strerror(errno));
		[self parse_osc];
	}
	
	close(sock); /* close the socket */
}

- (void)parse_osc
{
	printf("mInBufferLength: %d\n",mInBufferLength);

	ssize_t pos = 0;
	int msg_type = 0;
	int add_type = 0;
	while (pos < mInBufferLength)
	{
		switch (msg_type)
		{
			case 0:
			{
				NSString* buf_str = [NSString stringWithCString:mInBuffer+pos];
				if ([buf_str isEqualToString:@"/MInC/interstitial"]) add_type = 1;
				else if ([buf_str isEqualToString:@"/MInC/mod"]) add_type = 2;
				[buf_str release];
				break;
			}
			case 2:
			{
				switch (add_type)
				{
					case 1:
						mInterstitialString = [[NSString alloc] initWithCString:mInBuffer+pos encoding:NSASCIIStringEncoding];
						break;
					case 2:
					{
						int int_val;
						memcpy(&int_val,mInBuffer+pos,4);
						int_val = htonl(int_val);
						printf("mod number %d\n",int_val);
						[mAQP SetSequence:int_val];
						mNewMod = YES;
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

		printf("%s: %s\n",msg_type_str,mInBuffer+pos);

		pos += ((strlen(mInBuffer+pos) / 4) + 1) * 4;
	}
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

-(void)checkIncomingMessages
{
	if (mInterstitialString != nil)
	{
		[mStatusLabel setText:mInterstitialString];
		[mInterstitialString release];
		mInterstitialString = nil;
	}
	
	if (mNewMod == YES)
	{
		mNotationView.image = [mImageArray objectAtIndex:mAQP->mSeqNum-1];
		mNewMod = NO;
	}

	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkIncomingMessages) userInfo:nil repeats:NO];  
}

-(void)sendHeartBeat
{
	[self SendOSCMsg:"/MInC/hb\0\0\0\0":12];

	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(sendHeartBeat) userInfo:nil repeats:NO];  
}

+(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
	return [docDirectory stringByAppendingPathComponent:@"MInC.dat"];
#if 0
	/* to delete the file */
	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"] error:NULL];
#endif
}

-(void)readDataFile
{
	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[MInCAppDelegate dataFilePath]];
	NSLog([MInCAppDelegate dataFilePath]);
	mSendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	mSendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%d %d",mSendIPAddress,mSendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:mSendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:mSendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[MInCAppDelegate dataFilePath] atomically:YES];
	[dict release];
}

@end
