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

#import "FirstViewController.h"
extern FirstViewController *gViewController;

@implementation MInCAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize SecondView;

#define OSC_START OutBufferLength = 0;
#define OSC_END [self send_udp];
#define OSC_ADD(msg,num_msg_bytes) memcpy(OutBuffer+OutBufferLength,msg,num_msg_bytes); OutBufferLength+=num_msg_bytes;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
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
	[AQP release];
    [tabBarController release];
    [window release];
    [super dealloc];
}

-(id)init {
	[super init];
	
	AQP = [AQPlayer new];
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
//	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"] error:NULL];
	if (file_exists)
		[self readDataFile];

	[self sendHeartBeat];

	InterstitialString = nil;
	ServerIPAddString = nil;
	
	self.SecondView = nil;
	
	[self checkIncomingMessages];

	return self;
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
		gViewController.networking.SendIPAddress = ip_add;
		[self writeDataFile];
		NSLog(@"IPAddressChanged to %08lx\n",gViewController.networking.SendIPAddress);
	}
	
}

-(void)setServerPortNum:(NSString *)str
{
#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	gViewController.networking.SendPortNum = [str intValue];
	[self writeDataFile];
	NSLog(@"PortNumChanged to %d\n",gViewController.networking.SendPortNum);
}

-(void)checkIncomingMessages
{
	if (InterstitialString != nil)
	{
		[gFirstView.mStatusLabel setText:InterstitialString];
		[InterstitialString release];
		InterstitialString = nil;
	}
	
	if (gFirstView.NewMod == YES)
	{
		if (AQP->SeqNum >= 0 && AQP->SeqNum <= AQP->NumSequences)
			gFirstView.mNotationView.image = [gFirstView.ImageArray objectAtIndex:AQP->SeqNum-1];
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
	[gViewController.networking sendOSCMsg:"/minc/hb\0\0\0\0":12];

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
	gViewController.networking.SendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	gViewController.networking.SendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%ld %d",gViewController.networking.SendIPAddress,gViewController.networking.SendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:gViewController.networking.SendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:gViewController.networking.SendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[MInCAppDelegate dataFilePath] atomically:YES];
	[dict release];
}

@end
