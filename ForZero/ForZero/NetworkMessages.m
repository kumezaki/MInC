//
//  NetworkMessages.m
//  ForZero
//
//  Created by Chris Lavender on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NetworkMessages.h"

@interface NetworkMessages ()
@property (nonatomic, readwrite, retain) NSString *interstitialMsg;
@property (nonatomic, readwrite, retain) NSNumber *recProgress;
@end

@implementation NetworkMessages

@synthesize delegate;
@synthesize aqPlayer=_aqPlayer;
@synthesize interstitialMsg=_interstitialMsg, recProgress=_recProgress;

#define OSC_START mOutBufferLength = 0;
#define OSC_END [self send_udp];
#define OSC_ADD(msg,num_msg_bytes) memcpy(mOutBuffer+mOutBufferLength,msg,num_msg_bytes);mOutBufferLength+=num_msg_bytes;

#define OSC_VAL_BYTE_SWAP(val_ptr) memcpy(&u.int_val,val_ptr,4); u.int_val = htonl(u.int_val);
union {
	float	flt_val;
	int		int_val;
} u;

- (id)init {
    [super init];
    return self;
}

- (void)dealloc {
    
    [_aqPlayer          release];
    [_interstitialMsg   release];
    [_recProgress     release];
    [super dealloc];
}

#pragma mark - setter overrides
- (void)setInterstitialMsg:(NSString *)interstitialMsg
{
    if (interstitialMsg != _interstitialMsg) {
        [_interstitialMsg release];
        _interstitialMsg = [interstitialMsg retain];
        [self.delegate displayInterstitialMessage:self];
    }
}

- (void)setProgressValue:(NSNumber *)recProgress
{
    if (recProgress != _recProgress) {
        [_recProgress release];
        _recProgress = [recProgress retain];
        [self.delegate displayServerRecordProgress:self:nil];
    }
}

#pragma mark- OSC packing methods
-(void)sendOSCMsg:(const char*)osc_str:(int)osc_str_length
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",s\0\0",4);
	    
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size)
	OSC_END
}

-(void)sendOSCMsgWithIntValue:(const char*)osc_str:(int)osc_str_length:(int)val
{
    // printf("sendOSCMsgWithIntValue\n");
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",si\0",4);
	val = htonl(val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(&val,4);
	OSC_END
}

-(void)sendOSCMsgWithFloatValue:(const char*)osc_str:(int)osc_str_length:(float)val
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",sf\0",4);
	
	OSC_VAL_BYTE_SWAP(&val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(ip_add_buf,ip_add_size);
	OSC_ADD(&u.flt_val,4);
	OSC_END
}

#pragma mark- UDP & TCP message parsing
- (void)udpParse
{	
    // printf("mUDPInBuffer: %s\n", mUDPInBuffer);
    
    NSAutoreleasePool *udpThreadPool = [[NSAutoreleasePool alloc] init];

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
				
                OSC_MSG_COMPARE("/fz/state",1)
                else OSC_MSG_COMPARE("/fz/rec_prog",2)
					else OSC_MSG_COMPARE("/fz/interstitial",3)
						else OSC_MSG_COMPARE("/fz/hb",4)
							else OSC_MSG_COMPARE("/fz/play",5)
								else OSC_MSG_COMPARE("/fz/stop",6)
									else OSC_MSG_COMPARE("/fz/cue",7)
										else OSC_MSG_COMPARE("/fz/loop",8)
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
                        NSLog(@"received /fz/play\n");
						mOSCMsg_Play = YES;						
                        break;
					}
					case 6:
					{
                        NSLog(@"received /fz/stop\n");
						mOSCMsg_Stop = YES;
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
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        NSLog(@"received /fz/state:%d",u.int_val);
                        mOSCMsg_State = u.int_val;
                        break;
                    }
                    case 2:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        // NSLog(@"received /fz/rec_prog:%d",u.int_val);
                        NSNumber *progVal = [[NSNumber alloc]initWithFloat:((float)u.int_val / 1000.)];
                        [self performSelectorOnMainThread:@selector(setProgressValue:)
                                               withObject:progVal 
                                            waitUntilDone:NO];
                        [progVal release];
                        break;
                    }
                    case 3:
                    {
                        //NSLog(@"received /fz/interstitial:%s\n",mUDPInBuffer+pos);
                        
                        NSString *interstitialMsg = [[NSString alloc] initWithCString:mUDPInBuffer+pos encoding:NSASCIIStringEncoding];
                        
                        [self performSelectorOnMainThread:@selector(setInterstitialMsg:) 
                                               withObject:interstitialMsg 
                                            waitUntilDone:NO];
                        [interstitialMsg release];
                        
                        break;
                    }
                    case 4:
                    {
                        // NSLog(@"received /fz/hb:%s\n",mUDPInBuffer+pos);
                        NSString *serverIP = [[NSString alloc] initWithCString:mUDPInBuffer+pos encoding:NSASCIIStringEncoding];
                        
                        [super newServerIPAddress:serverIP]; // in super
                        [serverIP release];
                        
                        break;
                    }
                    case 7:
                    {
                        OSC_VAL_BYTE_SWAP(mUDPInBuffer+pos)
                        // NSLog(@"received /fz/cue:%d\n",u.int_val);
                        mOSCMsg_Cue = u.int_val;
                        break;
                    }
					case 8:
					{
                        /*
                        //currently disabled in Max patch
                        //NSLog(@"received /fz/loop:%s\n",mUDPInBuffer+pos);
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
							self.aqPlayer->mLoopStart = loop_start / 5000.;
							self.aqPlayer->mLoopEnd = loop_end / 5000.;
						}
                        */
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
    [udpThreadPool drain];
}

- (void)tcpParse {
        
    //NSAutoreleasePool *tcpThreadPool = [[NSAutoreleasePool alloc] init];
    
    NSData* raw = [NSData dataWithBytes:[incomingDataBuffer bytes] length:[incomingDataBuffer length]];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"forZero.mp3"];
    self.aqPlayer.theFile = filePath;
	//NSLog(@"filePath:%@", filePath);
    
    [raw writeToFile:filePath atomically:YES];
        
    [self.delegate downloadEnded:self];
        
    //[tcpThreadPool drain];

}

@end
