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
#include <unistd.h>

#include <ifaddrs.h>
#include <arpa/inet.h>

@implementation MInCAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize mSecondView;

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
	
	[self CreateImageArray];
	/*
	mImageArray = [[NSArray alloc] initWithObjects:
				   [UIImage imageNamed:@"InC01.jpg"],
				   [UIImage imageNamed:@"InC02.jpg"],
				   [UIImage imageNamed:@"InC03.jpg"],
				   [UIImage imageNamed:@"InC04.jpg"],
				   [UIImage imageNamed:@"InC05.jpg"],
				   [UIImage imageNamed:@"InC06.jpg"],
				   [UIImage imageNamed:@"InC07.jpg"],
				   [UIImage imageNamed:@"InC08.jpg"],
				   [UIImage imageNamed:@"InC09.jpg"],
				   [UIImage imageNamed:@"InC10.jpg"],
				   [UIImage imageNamed:@"InC11.jpg"],
				   [UIImage imageNamed:@"InC12.jpg"],
				   [UIImage imageNamed:@"InC13.jpg"],
				   [UIImage imageNamed:@"InC14.jpg"],
				   [UIImage imageNamed:@"InC15.jpg"],
				   [UIImage imageNamed:@"InC16.jpg"],
				   [UIImage imageNamed:@"InC17.jpg"],
				   [UIImage imageNamed:@"InC18.jpg"],
				   [UIImage imageNamed:@"InC19.jpg"],
				   [UIImage imageNamed:@"InC20.jpg"],
				   [UIImage imageNamed:@"InC21.jpg"],
				   [UIImage imageNamed:@"InC22.jpg"],
				   [UIImage imageNamed:@"InC23.jpg"],
				   [UIImage imageNamed:@"InC24.jpg"],
				   [UIImage imageNamed:@"InC25.jpg"],
				   [UIImage imageNamed:@"InC26.jpg"],
				   [UIImage imageNamed:@"InC27.jpg"],
				   [UIImage imageNamed:@"InC28.jpg"],
				   [UIImage imageNamed:@"InC29.jpg"],
				   [UIImage imageNamed:@"InC30.jpg"],
				   [UIImage imageNamed:@"InC31.jpg"],
				   [UIImage imageNamed:@"InC32.jpg"],
				   [UIImage imageNamed:@"InC33.jpg"],
				   [UIImage imageNamed:@"InC34.jpg"],
				   [UIImage imageNamed:@"InC35.jpg"],
				   [UIImage imageNamed:@"InC36.jpg"],
				   [UIImage imageNamed:@"InC37.jpg"],
				   [UIImage imageNamed:@"InC38.jpg"],
				   [UIImage imageNamed:@"InC39.jpg"],
				   [UIImage imageNamed:@"InC40.jpg"],
				   [UIImage imageNamed:@"InC41.jpg"],
				   [UIImage imageNamed:@"InC42.jpg"],
				   [UIImage imageNamed:@"InC43.jpg"],
				   [UIImage imageNamed:@"InC44.jpg"],
				   [UIImage imageNamed:@"InC45.jpg"],
				   [UIImage imageNamed:@"InC46.jpg"],
				   [UIImage imageNamed:@"InC47.jpg"],
				   [UIImage imageNamed:@"InC48.jpg"],
				   [UIImage imageNamed:@"InC49.jpg"],
				   [UIImage imageNamed:@"InC50.jpg"],
				   [UIImage imageNamed:@"InC51.jpg"],
				   [UIImage imageNamed:@"InC52.jpg"],
				   [UIImage imageNamed:@"InC53.jpg"],
				   nil
				   ];*/
	
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

	mWithServer = YES;
	
	memset(ip_add_buf,0,32);
	[[self getIPAddress] getCString:ip_add_buf maxLength:32 encoding:NSASCIIStringEncoding];
	ip_add_size = (strlen(ip_add_buf) / 4 + 1) * 4;
	printf("%s\n",ip_add_buf);
	
	[self sendHeartBeat];

	mThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_udp) object:nil];
	[mThread start];

	mInterstitialString = nil;
	mNewMod = NO;
	mServerIPAddString = nil;
	
	mSecondView = nil;
	
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
	printf("mInBufferLength: %ld\n",mInBufferLength);

	ssize_t pos = 0;
	int msg_type = 0;
	int add_type = 0;
	while (pos < mInBufferLength)
	{
		switch (msg_type)
		{
			case 0:
			{
				NSString* buf_str = [NSString stringWithCString:mInBuffer+pos encoding:NSASCIIStringEncoding];
				if ([buf_str isEqualToString:@"/MInC/interstitial"]) add_type = 1;
				else if ([buf_str isEqualToString:@"/MInC/mod"]) add_type = 2;
				else if ([buf_str isEqualToString:@"/MInC/hb"]) add_type = 3;
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
					case 3:
					{
						mServerIPAddString = [[NSString alloc] initWithCString:mInBuffer+pos encoding:NSASCIIStringEncoding];
//						char buf[32];
//						strcpy(buf,mInBuffer+pos);
//						printf("server heartbeat IP address %s\n",buf);
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

-(void)SetServerIPAddress:(NSString *)str
{
	NSArray* ip_add_array = [str componentsSeparatedByString:@"."];
	
	if ([ip_add_array count] != 4)
	{
		NSLog(@"IP address must have 4 components");
		return;
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
		mSendIPAddress = ip_add;
		[self writeDataFile];
		printf("IPAddressChanged to %08lx\n",mSendIPAddress);
	}
	
}

-(void)SetServerPortNum:(NSString *)str
{
#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	mSendPortNum = [str intValue];
	[self writeDataFile];
	printf("PortNumChanged to %d\n",mSendPortNum);
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
		if (mAQP->mSeqNum >= 0 && mAQP->mSeqNum <= mAQP->mNumSequences)
			mNotationView.image = [mImageArray objectAtIndex:mAQP->mSeqNum-1];
		mNewMod = NO;
	}

	if (mServerIPAddString != nil)
	{
		[self SetServerIPAddress:mServerIPAddString];
		
		if ((mSecondView != nil) && ![mSecondView IsEditing])
			[mSecondView SetIPAddress];
		
		[mServerIPAddString release];
		mServerIPAddString = nil;
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
	NSLog(@"%@",[MInCAppDelegate dataFilePath]);
	mSendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	mSendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%ld %d",mSendIPAddress,mSendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:mSendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:mSendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[MInCAppDelegate dataFilePath] atomically:YES];
	[dict release];
}

-(void) CreateImageArray
{
	if (mAQP->mPiece == 1)
	{
		UIImage *image = [UIImage imageNamed:@"InCCover.jpg"];
		[mNotationView setImage:image];
		mImageArray = [[NSArray alloc] initWithObjects:
					   [UIImage imageNamed:@"InC01.jpg"],
					   [UIImage imageNamed:@"InC02.jpg"],
					   [UIImage imageNamed:@"InC03.jpg"],
					   [UIImage imageNamed:@"InC04.jpg"],
					   [UIImage imageNamed:@"InC05.jpg"],
					   [UIImage imageNamed:@"InC06.jpg"],
					   [UIImage imageNamed:@"InC07.jpg"],
					   [UIImage imageNamed:@"InC08.jpg"],
					   [UIImage imageNamed:@"InC09.jpg"],
					   [UIImage imageNamed:@"InC10.jpg"],
					   [UIImage imageNamed:@"InC11.jpg"],
					   [UIImage imageNamed:@"InC12.jpg"],
					   [UIImage imageNamed:@"InC13.jpg"],
					   [UIImage imageNamed:@"InC14.jpg"],
					   [UIImage imageNamed:@"InC15.jpg"],
					   [UIImage imageNamed:@"InC16.jpg"],
					   [UIImage imageNamed:@"InC17.jpg"],
					   [UIImage imageNamed:@"InC18.jpg"],
					   [UIImage imageNamed:@"InC19.jpg"],
					   [UIImage imageNamed:@"InC20.jpg"],
					   [UIImage imageNamed:@"InC21.jpg"],
					   [UIImage imageNamed:@"InC22.jpg"],
					   [UIImage imageNamed:@"InC23.jpg"],
					   [UIImage imageNamed:@"InC24.jpg"],
					   [UIImage imageNamed:@"InC25.jpg"],
					   [UIImage imageNamed:@"InC26.jpg"],
					   [UIImage imageNamed:@"InC27.jpg"],
					   [UIImage imageNamed:@"InC28.jpg"],
					   [UIImage imageNamed:@"InC29.jpg"],
					   [UIImage imageNamed:@"InC30.jpg"],
					   [UIImage imageNamed:@"InC31.jpg"],
					   [UIImage imageNamed:@"InC32.jpg"],
					   [UIImage imageNamed:@"InC33.jpg"],
					   [UIImage imageNamed:@"InC34.jpg"],
					   [UIImage imageNamed:@"InC35.jpg"],
					   [UIImage imageNamed:@"InC36.jpg"],
					   [UIImage imageNamed:@"InC37.jpg"],
					   [UIImage imageNamed:@"InC38.jpg"],
					   [UIImage imageNamed:@"InC39.jpg"],
					   [UIImage imageNamed:@"InC40.jpg"],
					   [UIImage imageNamed:@"InC41.jpg"],
					   [UIImage imageNamed:@"InC42.jpg"],
					   [UIImage imageNamed:@"InC43.jpg"],
					   [UIImage imageNamed:@"InC44.jpg"],
					   [UIImage imageNamed:@"InC45.jpg"],
					   [UIImage imageNamed:@"InC46.jpg"],
					   [UIImage imageNamed:@"InC47.jpg"],
					   [UIImage imageNamed:@"InC48.jpg"],
					   [UIImage imageNamed:@"InC49.jpg"],
					   [UIImage imageNamed:@"InC50.jpg"],
					   [UIImage imageNamed:@"InC51.jpg"],
					   [UIImage imageNamed:@"InC52.jpg"],
					   [UIImage imageNamed:@"InC53.jpg"],
					   nil
					   ];
	}
	else {
		UIImage *image = [UIImage imageNamed:@"PPCover.jpg"];
		[mNotationView setImage:image];
		mImageArray = [[NSArray alloc] initWithObjects:
					   [UIImage imageNamed:@"PP1.jpg"],
					   [UIImage imageNamed:@"PP2.jpg"],
					   [UIImage imageNamed:@"PP3.jpg"],
					   [UIImage imageNamed:@"PP4.jpg"],
					   [UIImage imageNamed:@"PP5.jpg"],
					   [UIImage imageNamed:@"PP6.jpg"],
					   [UIImage imageNamed:@"PP7.jpg"],
					   [UIImage imageNamed:@"PP8.jpg"],
					   [UIImage imageNamed:@"PP9.jpg"],
					   [UIImage imageNamed:@"PP10.jpg"],
					   [UIImage imageNamed:@"PP11.jpg"],
					   [UIImage imageNamed:@"PP12.jpg"],
					   [UIImage imageNamed:@"PP13.jpg"],
					   [UIImage imageNamed:@"PP14.jpg"],
					   [UIImage imageNamed:@"PP15.jpg"],
					   [UIImage imageNamed:@"PP16.jpg"],
					   [UIImage imageNamed:@"PP17.jpg"],
					   [UIImage imageNamed:@"PP18.jpg"],
					   [UIImage imageNamed:@"PP19.jpg"],
					   [UIImage imageNamed:@"PP20.jpg"],
					   [UIImage imageNamed:@"PP21.jpg"],
					   [UIImage imageNamed:@"PP22.jpg"],
					   [UIImage imageNamed:@"PP23.jpg"],
					   [UIImage imageNamed:@"PP24.jpg"],
					   [UIImage imageNamed:@"PP25.jpg"],
					   [UIImage imageNamed:@"PP26.jpg"],
					   [UIImage imageNamed:@"PP27.jpg"],
					   [UIImage imageNamed:@"PP28.jpg"],
					   [UIImage imageNamed:@"PP29.jpg"],
					   [UIImage imageNamed:@"PP30.jpg"],
					   [UIImage imageNamed:@"PP31.jpg"],
					   [UIImage imageNamed:@"PP32.jpg"],
					   nil
					   ];
	}
}

@end
