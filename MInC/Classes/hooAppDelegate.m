//
//  hooAppDelegate.m
//  hoo
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "hooAppDelegate.h"

#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <fcntl.h>

@implementation hooAppDelegate

@synthesize window;

@synthesize mSoundFileURLRef;
@synthesize mSoundFileObject;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
	
	mTouchView.multipleTouchEnabled = YES;
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

	mSendIPAddress = 0x0A000102; /* IP address: 10.0.1.2 */
	mSendPortNum = 7374;
	mReceivePortNum = 7375;

	mThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_udp) object:nil];
	[mThread start];
	
	CFBundleRef mainBundle = CFBundleGetMainBundle();
	mSoundFileURLRef = CFBundleCopyResourceURL(mainBundle,CFSTR("hoo"),CFSTR("aif"),NULL);
	AudioServicesCreateSystemSoundID(mSoundFileURLRef, &mSoundFileObject);
	
	return self;
}

- (void)dealloc {
	[mThread release];
	[mImageArray release];
	[mAQP release];
    [window release];
    [super dealloc];
}

-(IBAction)AudioStart
{
	[mAQP Start];
	[mAQP->mSequencer_Sec Start];
}

-(IBAction)AudioStop
{
	[mAQP Stop];
	[mAQP->mSequencer_Sec Stop];
}

-(IBAction)NextSequence;
{
	[mAQP NextSequence];
	[mNextButton setTitle:[mAQP GetModString] forState:UIControlStateNormal];
	mNotationView.image = [mImageArray objectAtIndex:mAQP->mSeqNum-1];
	
	int val = htonl(mAQP->mSeqNum);
	memcpy(mOutBuffer,"/hoo\0\0\0\0,i\0\0",12);
	memcpy(mOutBuffer+12,&val,4);
	mOutBufferLength = 16;
	
	[self send_udp];

#if 0
	AudioServicesPlaySystemSound(self.mSoundFileObject);
#endif
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
//	printf("%f, %f, %f\n", acceleration.x, acceleration.y, acceleration.z);
	[mAQP->mSequencer_Pri SetTempo:2.0*(1.0-(acceleration.x*0.5))];
}

-(void)send_udp
{
	int sock;
	struct sockaddr_in sa;
	int bytes_sent;
	
	sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	if (-1 == sock) /* if socket failed to initialize, exit */
    {
		printf("Error Creating Socket");
		exit(EXIT_FAILURE);
    }
	
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_addr.s_addr = htonl(mSendIPAddress);
	sa.sin_port = htons(mSendPortNum);
	
	bytes_sent = sendto(sock, mOutBuffer, mOutBufferLength, 0,(struct sockaddr*)&sa, sizeof (struct sockaddr_in));
	if (bytes_sent < 0)
		printf("Error sending packet: %s\n", strerror(errno));
	
	close(sock); /* close the socket */
}

- (void)receive_udp
{
	int sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
	struct sockaddr_in sa; 
	char buffer[1024];
	ssize_t recsize;
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
		printf ("recv test....\n");
		recsize = recvfrom(sock, (void *)buffer, 1024, 0, (struct sockaddr *)&sa, &fromlen);
		if (recsize < 0)
			fprintf(stderr, "%s\n", strerror(errno));
		printf("recsize: %d\n ",recsize);
		sleep(0);
		printf("datagram: %s\n",buffer);
	}

	close(sock); /* close the socket */
}

@end
