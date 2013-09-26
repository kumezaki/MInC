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

#import "FirstView.h"
extern FirstView *gFirstView;

@implementation MInCAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize SecondView;

#define OSC_START OutBufferLength = 0;
#define OSC_END [self send_udp];
#define OSC_ADD(msg,num_msg_bytes) memcpy(OutBuffer+OutBufferLength,msg,num_msg_bytes); OutBufferLength+=num_msg_bytes;

#define FLOAT_TO_MRMR_INT(v) (SInt32)(v * 1000. + 0.5)

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
	[Thread release];
	[ImageArray release];
	[AQP release];
    [tabBarController release];
    [window release];
    [super dealloc];
}

-(id)init {
	[super init];
	
	AQP = [AQPlayer new];
	
	[self createImageArray];
	/*
	ImageArray = [[NSArray alloc] initWithObjects:
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
	
	SendIPAddress = 0x7F000001; /* IP address: 127.0.0.1 */
	SendPortNum = 1337;
	ReceivePortNum = 31337;
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
//	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"] error:NULL];
	if (file_exists)
		[self readDataFile];

//	WithServer = YES;
	
	memset(IPAddBuf,0,32);
	[[self getIPAddress] getCString:IPAddBuf maxLength:32 encoding:NSASCIIStringEncoding];
	IPAddSize = (strlen(IPAddBuf) / 4 + 1) * 4;
	NSLog(@"%s\n",IPAddBuf);
	
	[self sendHeartBeat];

	Thread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_udp) object:nil];
	[Thread start];

	InterstitialString = nil;
//	NewMod = NO;
	ServerIPAddString = nil;
	
	self.SecondView = nil;
	
	[self checkIncomingMessages];

	return self;
}

-(void)sendOSCMsg:(const char*)osc_str :(SInt32)osc_str_length
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",s\0\0",4);

	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(IPAddBuf,IPAddSize)
	OSC_END
}

-(void)sendOSCMsgWithIntValue:(const char*)osc_str :(SInt32)osc_str_length :(SInt32)val
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",si\0",4);
	val = htonl(val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(IPAddBuf,IPAddSize);
	OSC_ADD(&val,4);
	OSC_END
}

-(IBAction)SetSpeaker:(id)sender
{
	NSLog(@"SetSpeaker %d\n",mSpeakerSegControl.selectedSegmentIndex);

	[self sendOSCMsgWithIntValue:"/minc/speak\0":12:mSpeakerSegControl.selectedSegmentIndex];
}

-(IBAction)SetInstrument:(id)sender
{
	NSLog(@"SetInstrument %d\n",mInstrSegControl.selectedSegmentIndex);

	[self sendOSCMsgWithIntValue:"/minc/instr\0":12:mInstrSegControl.selectedSegmentIndex];
}

-(IBAction)Set8vbDown:(id)sender
{
	[self send8vb:true];
}

-(IBAction)Set8vbUp:(id)sender
{
	[self send8vb:false];
}

-(void)send8vb:(BOOL)direction
{
	[self sendOSCMsgWithIntValue:"/minc/8vb\0\0\0":12:direction?1:0];
}

-(IBAction)Set8vaDown:(id)sender
{
	[self send8va:true];
}

-(IBAction)Set8vaUp:(id)sender
{
	[self send8va:false];
}

-(void)send8va:(BOOL)direction
{
	[self sendOSCMsgWithIntValue:"/minc/8va\0\0\0":12:direction?1:0];
}

-(IBAction)Set2xSlowDown:(id)sender
{
	[self send2xSlow:true];
}

-(IBAction)Set2xSlowUp:(id)sender
{
	[self send2xSlow:false];
}

-(void)send2xSlow:(BOOL)direction
{
	[self sendOSCMsgWithIntValue:"/minc/2xslow\0\0\0\0":16:direction?1:0];
}

-(IBAction)Set2xFastDown:(id)sender
{
	[self send2xFast:true];
}

-(IBAction)Set2xFastUp:(id)sender
{
	[self send2xFast:false];
}

-(void)send2xFast:(BOOL)direction
{
	[self sendOSCMsgWithIntValue:"/minc/2xfast\0\0\0\0":16:direction?1:0];
}

-(IBAction)SetNoteDuration:(id)sender
{
	Sequencer* q = AQP->Sequencer_Pri;
	if (q != nil)
		q->DurMultiplier = [mNoteDurationSlider value];

	[self sendOSCMsgWithIntValue:"/minc/dur\0\0\0":12:FLOAT_TO_MRMR_INT([mNoteDurationSlider value])];
}

-(IBAction)Hint:(id)sender
{
	[self sendOSCMsg:"/minc/hint\0\0":12];
}

-(IBAction)Status:(id)sender
{
	[self sendOSCMsg:"/minc/status\0\0\0\0":16];
}

-(void)sendOSC_Filter:(Float64)val
{
	[self sendOSCMsgWithIntValue:"/minc/filt\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

-(void)sendOSC_Volume:(Float64)val
{
	[self sendOSCMsgWithIntValue:"/minc/vol\0\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

-(void)sendOSC_Waveform:(Float64)val
{
	[self sendOSCMsgWithIntValue:"/minc/wave\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

-(void)send_udp
{
	SInt32 sock;
	struct sockaddr_in sa;
	SInt32 bytes_sent;
	
	sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (-1 == sock) /* if socket failed to initialize, exit */
    {
		fprintf(stderr,"Error creating socket: %s\n",strerror(errno));
		exit(EXIT_FAILURE);
    }
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = htonl(SendIPAddress);
	sa.sin_port = htons(SendPortNum);
	
	bytes_sent = sendto(sock, OutBuffer, OutBufferLength, 0,(struct sockaddr*)&sa, sizeof (struct sockaddr_in));
	if (bytes_sent < 0)
		fprintf(stderr,"Error sending packet: %s\n",strerror(errno));
	
	close(sock); /* close the socket */
}

- (void)receive_udp
{
	SInt32 sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa; 
	socklen_t fromlen;
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = INADDR_ANY;
	sa.sin_port = htons(ReceivePortNum);
	
	if (-1 == bind(sock,(struct sockaddr *)&sa, sizeof(struct sockaddr)))
	{
		perror("error bind failed");
		close(sock);
		exit(EXIT_FAILURE);
	} 
	
	for (;;) 
	{
		InBufferLength = recvfrom(sock, (void *)InBuffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);
		if (InBufferLength < 0)
			fprintf(stderr,"%s\n",strerror(errno));
		[self parse_osc];
	}
	
	close(sock); /* close the socket */
}

- (void)parse_osc
{
	NSLog(@"InBufferLength: %ld\n",InBufferLength);

	ssize_t pos = 0;
	SInt32 msg_type = 0;
	SInt32 add_type = 0;
	while (pos < InBufferLength)
	{
		switch (msg_type)
		{
			case 0:
			{
				NSString* buf_str = [NSString stringWithCString:InBuffer+pos encoding:NSASCIIStringEncoding];
				if ([buf_str isEqualToString:@"/minc/interstitial"]) add_type = 1;
				else if ([buf_str isEqualToString:@"/minc/mod"]) add_type = 2;
				else if ([buf_str isEqualToString:@"/minc/hb"]) add_type = 3;
				[buf_str release];
				break;
			}
			case 2:
			{
				switch (add_type)
				{
					case 1:
						InterstitialString = [[NSString alloc] initWithCString:InBuffer+pos encoding:NSASCIIStringEncoding];
						break;
					case 2:
					{
						SInt32 int_val;
						memcpy(&int_val,InBuffer+pos,4);
						int_val = htonl(int_val);
						NSLog(@"mod number %ld\n",int_val);
						[AQP setSequence:int_val];
						gFirstView.NewMod = YES;
						break;
					}
					case 3:
					{
						ServerIPAddString = [[NSString alloc] initWithCString:InBuffer+pos encoding:NSASCIIStringEncoding];
//						char buf[32];
//						strcpy(buf,InBuffer+pos);
//						NSLog(@"server heartbeat IP address %s\n",buf);
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

		NSLog(@"%s: %s\n",msg_type_str,InBuffer+pos);

		pos += ((strlen(InBuffer+pos) / 4) + 1) * 4;
	}
}

- (NSString *)getIPAddress
{
	NSString *address = @"0.0.0.0";
	struct ifaddrs *interfaces = NULL;
	struct ifaddrs *temp_addr = NULL;
	SInt32 success = 0;
	
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

-(void)setServerIPAddress:(NSString *)str
{
	NSArray* ip_add_array = [str componentsSeparatedByString:@"."];
	
	if ([ip_add_array count] != 4)
	{
		NSLog(@"IP address must have 4 components");
		return;
	}
	else
	{
		SInt32 i = 0;
		UInt32 ip_add = 0;
		for (NSString* s in ip_add_array)
		{
#if 0
			NSLog([NSString stringWithFormat:@"s=%@", s]);
#endif
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		SendIPAddress = ip_add;
		[self writeDataFile];
		NSLog(@"IPAddressChanged to %08lx\n",SendIPAddress);
	}
	
}

-(void)setServerPortNum:(NSString *)str
{
#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	SendPortNum = [str intValue];
	[self writeDataFile];
	NSLog(@"PortNumChanged to %d\n",SendPortNum);
}

-(void)checkIncomingMessages
{
	if (InterstitialString != nil)
	{
		[mStatusLabel setText:InterstitialString];
		[InterstitialString release];
		InterstitialString = nil;
	}
	
	if (gFirstView.NewMod == YES)
	{
		if (AQP->SeqNum >= 0 && AQP->SeqNum <= AQP->NumSequences)
			mNotationView.image = [ImageArray objectAtIndex:AQP->SeqNum-1];
		gFirstView.NewMod = NO;
	}

	if (ServerIPAddString != nil)
	{
		[self setServerIPAddress:ServerIPAddString];
		
		if ((self.SecondView != nil) && ![self.SecondView IsEditing])
			[self.SecondView SetIPAddress];
		
		[ServerIPAddString release];
		ServerIPAddString = nil;
	}
	
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkIncomingMessages) userInfo:nil repeats:NO];  
}

-(void)sendHeartBeat
{
	[self sendOSCMsg:"/minc/hb\0\0\0\0":12];

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
	SendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	SendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%ld %d",SendIPAddress,SendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:SendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:SendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[MInCAppDelegate dataFilePath] atomically:YES];
	[dict release];
}

-(void) createImageArray
{
	if (AQP->Piece == 1)
	{
		UIImage *image = [UIImage imageNamed:@"InCCover.jpg"];
		[mNotationView setImage:image];
		ImageArray = [[NSArray alloc] initWithObjects:
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
	else if (AQP->Piece == 2) {
		UIImage *image = [UIImage imageNamed:@"PPCover.jpg"];
		[mNotationView setImage:image];
		ImageArray = [[NSArray alloc] initWithObjects:
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
	else if (AQP->Piece == 3) {
		UIImage *image = [UIImage imageNamed:@"TrafficCover.jpg"];
		[mNotationView setImage:image];
		ImageArray = [[NSArray alloc] initWithObjects:
					   [UIImage imageNamed:@"Traffic1.jpg"],
					   [UIImage imageNamed:@"Traffic2.jpg"],
					   [UIImage imageNamed:@"Traffic3.jpg"],
					   [UIImage imageNamed:@"Traffic4.jpg"],
					   [UIImage imageNamed:@"Traffic5.jpg"],
					   [UIImage imageNamed:@"Traffic6.jpg"],
					   [UIImage imageNamed:@"Traffic7.jpg"],
					   [UIImage imageNamed:@"Traffic8.jpg"],
					   [UIImage imageNamed:@"Traffic9.jpg"],
					   [UIImage imageNamed:@"Traffic10.jpg"],
					   [UIImage imageNamed:@"Traffic11.jpg"],
					   [UIImage imageNamed:@"Traffic12.jpg"],
					   [UIImage imageNamed:@"Traffic13.jpg"],
					   [UIImage imageNamed:@"Traffic14.jpg"],
					   [UIImage imageNamed:@"Traffic15.jpg"],
					   [UIImage imageNamed:@"Traffic16.jpg"],
					   [UIImage imageNamed:@"Traffic17.jpg"],
					   [UIImage imageNamed:@"Traffic18.jpg"],
					   [UIImage imageNamed:@"Traffic19.jpg"],
					   [UIImage imageNamed:@"Traffic20.jpg"],
					   [UIImage imageNamed:@"Traffic21.jpg"],
					   [UIImage imageNamed:@"Traffic22.jpg"],
					   [UIImage imageNamed:@"Traffic23.jpg"],
					   [UIImage imageNamed:@"Traffic24.jpg"],
					   [UIImage imageNamed:@"Traffic25.jpg"],
					   [UIImage imageNamed:@"Traffic26.jpg"],
					   [UIImage imageNamed:@"Traffic27.jpg"],
					   [UIImage imageNamed:@"Traffic28.jpg"],
					   [UIImage imageNamed:@"Traffic29.jpg"],
					   [UIImage imageNamed:@"Traffic30.jpg"],
					   [UIImage imageNamed:@"Traffic31.jpg"],
					   [UIImage imageNamed:@"Traffic32.jpg"],
					   [UIImage imageNamed:@"Traffic33.jpg"],
					   [UIImage imageNamed:@"Traffic34.jpg"],
					   [UIImage imageNamed:@"Traffic35.jpg"],
					   [UIImage imageNamed:@"Traffic36.jpg"],
					   nil
					   ];
		
	}
}

@end
