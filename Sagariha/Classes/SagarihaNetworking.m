//
//  SagarihaNetworking.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SagarihaNetworking.h"

#import "SagarihaAppDelegate.h"
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

extern SagarihaSingleton* singleton;

@implementation SagarihaNetworking
@synthesize delegate = _delegate;

#define OSC_START mOutBufferLength = 0;
#define OSC_END [self send_udp];
#define OSC_ADD(msg,num_msg_bytes) memcpy(mOutBuffer+mOutBufferLength,msg,num_msg_bytes); mOutBufferLength+=num_msg_bytes;

#define OSC_VAL_BYTE_SWAP(val_ptr) memcpy(&u.int_val,val_ptr,4); u.int_val = htonl(u.int_val);
union {
	float	flt_val;
	int		int_val;
} u;

- (id)init
{
	[super init];
	
	mSendIPAddress = 0x7F000001; /* IP address: 127.0.0.1 */
	mSendPortNum = 1337;

	memset(ip_add_buf,0,32);
	[[self getIPAddress] getCString:ip_add_buf maxLength:32 encoding:NSASCIIStringEncoding];
	ip_add_size = (strlen(ip_add_buf) / 4 + 1) * 4;
	NSLog(@"%s\n",ip_add_buf);

	mUDPReceivePortNum = 31337;

	mUDPThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_udp) object:nil];
	[mUDPThread start];

    mTCPReceivePortNum = 41337;

    incomingDataBuffer = [[NSMutableData alloc]init];

    //mTCPThread = [[NSThread alloc] initWithTarget:self selector:@selector(receive_tcp) object:nil];
	//[mTCPThread start];

	return self;
}

-(void)dealloc
{    
	[incomingDataBuffer release];

    [mTCPThread release];

	[mUDPThread release];

	[super dealloc];
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
	if (singleton == nil) return;
	
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
						singleton->mOSCMsg_DownloadEnd = YES;
						[self performSelectorOnMainThread:@selector(downloadEnd) 
											   withObject:nil 
											waitUntilDone:NO];
						break;
					}
					case 7:
					{
						NSLog(@"play received");
						singleton->mOSCMsg_Play = YES;
						break;
					}
					case 8:
						NSLog(@"stop received");
						singleton->mOSCMsg_Stop = YES;
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
                        singleton->mOSCMsg_State = u.int_val;
                        break;
                    }
                    case 2:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        //printf("rec_prog %d\n",u.int_val);
                        singleton->mOSCMsg_RecProg = (float)u.int_val / 1000.;
                        break;
                    }
                    case 3:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        singleton->mOSCMsg_InterstitialMsgDur = u.int_val;
                        pos += 4;
						
                        //printf("hint %s\n",mUDPInBuffer+pos);
                        singleton->mOSCMsg_InterstitialMsg = [[NSString alloc] initWithCString:mUDPInBuffer+pos encoding:NSASCIIStringEncoding];
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
                            [singleton->mAudioQueuePlayer SetSample:audio_index+i:audio_sample];
                            pos += 4;
                        }
                        
                        if (audio_index == singleton.nextAudioIndex)
                        {
                            singleton->mOSCMsg_DownloadProg = audio_index / (22050 * 5.);
                            singleton.nextAudioIndex = audio_index + size;
                            
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
                        singleton->mOSCMsg_Cue = u.int_val;
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
							singleton->mAudioQueuePlayer->mLoopStart = loop_start / 5000.;
							singleton->mAudioQueuePlayer->mLoopEnd = loop_end / 5000.;
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

-(void)DoReceiveTCP
{
    /*NSLog(@"mTCPThread isExecuting: %@", [mTCPThread isExecuting] == YES ? @"YES" : @"NO" );
    if ([mTCPThread isExecuting]) {
        
        [self performSelector:@selector(receive_tcp) onThread:mTCPThread withObject:nil waitUntilDone:NO];
    
    }
    else {*/
        mTCPThread = [[[NSThread alloc] initWithTarget:self 
                                              selector:@selector(receive_tcp) 
                                                object:nil]autorelease];
        [mTCPThread start];
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
    
    [self SendOSCMsg:"/saga/download\0\0":16]; //don't send until the socket is open and listening

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
            //printf("bytesRead: %d; buffer contents: %s\n", bytesRcvd, buffer);
            [incomingDataBuffer appendBytes:buffer length:bytesRcvd];
            ++count;
            //printf("receive packet count: %d\n",count);
        }
        if (bytesRcvd == 0) {
            //NSLog(@"total bytes recieved: %u",[incomingDataBuffer length]);
            [self tcp_file];
            done = YES;
            break;
        }
    }
    NSRange resetRange = {0, [incomingDataBuffer length]};
    [incomingDataBuffer replaceBytesInRange:resetRange withBytes:NULL length:0];
    close(clntSock);	
    close(servSock);
}

- (void)tcp_file
{
    NSAutoreleasePool *tcpThreadPool = [[NSAutoreleasePool alloc] init];
    
    NSData* raw = [NSData dataWithBytes:[incomingDataBuffer bytes] length:[incomingDataBuffer length]];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"forZero.mp3"];
    singleton->mAudioQueuePlayer.theFile = filePath;
	//NSLog(@"filePath:%@", filePath);
    
    [raw writeToFile:filePath atomically:YES];
    
    singleton->mOSCMsg_DownloadEnd = YES;
    
    [self.delegate downloadEnded];
    
    [tcpThreadPool drain];
}

@end
