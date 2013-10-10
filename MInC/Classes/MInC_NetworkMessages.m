//
//  MInC_NetworkMessages.m
//  ForZero
//
//  Created by Chris Lavender on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MInC_NetworkMessages.h"
//#import "MainViewController.h"

#import "MInC_Constants.h"

@interface MInC_NetworkMessages ()
@property (nonatomic, readwrite, retain) NSString       *interstitialMsg;
@property (nonatomic, readwrite, retain) NSString       *errorMsg;
@property (nonatomic, readwrite, retain) NSNumber       *recProgress;
@property (nonatomic, readwrite, retain) NSNumber       *playingMeterValue;
@property (nonatomic, readwrite, retain) NSNumber       *recordingMeterValue;
@property (nonatomic, readwrite, retain) NSDictionary   *msgDictionary;
@end

// just some practice using blocks
int (^oscValByteSwap)(char*) = ^(char* num) {
    int swapped = 0;
    memcpy(&swapped,num,4);
    swapped = htonl(swapped);
    return swapped;
};

@implementation MInC_NetworkMessages

@synthesize delegate;
@synthesize msgDictionary       =_msgDictionary;
//@synthesize aqPlayer            =_aqPlayer;
@synthesize interstitialMsg     =_interstitialMsg;
@synthesize errorMsg            =_errorMsg;
@synthesize recProgress         =_recProgress;
@synthesize playingMeterValue   =_playingMeterValue;
@synthesize recordingMeterValue =_recordingMeterValue;

#define OSC_START self->OutBufferLength = 0;
#define OSC_END [self send_udp];
#define OSC_ADD(msg,num_msg_bytes) memcpy(self->OutBuffer+self->OutBufferLength,msg,num_msg_bytes);self->OutBufferLength+=num_msg_bytes;

#define OSC_VAL_BYTE_SWAP(val_ptr) memcpy(&u.int_val,val_ptr,4); u.int_val = htonl(u.int_val);

union {
	float	flt_val;
	int		int_val;
} u;

- (id)init {

    [super init];

	[self sendHeartBeat];
    
    recMeterValueReceived = NO;
    progressValueReceived = NO;
    
    return self;
}

- (void)dealloc {
    
//    [_aqPlayer              release];
    [_interstitialMsg       release];
    [_errorMsg              release];
    [_recProgress           release];
    [_msgDictionary         release];
    [_playingMeterValue     release];
    [_recordingMeterValue   release];
    
    [super dealloc];
}

#pragma mark - getter/setter overrides
- (NSDictionary*)msgDictionary {
    if (!_msgDictionary) {
        // if the dictionary is nil than grab it from Constants
        self.msgDictionary = [MInC_Constants messageDictionary];
    }
    return _msgDictionary;
}

- (void)setInterstitialMsg:(NSString *)interstitialMsg
{
    if (![_interstitialMsg isEqualToString:interstitialMsg]) {
        [_interstitialMsg release];
        _interstitialMsg = [interstitialMsg retain];
        [self.delegate displayInterstitialMessage:self];
    }
}

- (void)setProgressValue:(NSNumber *)recProgress
{
    if (![_recProgress isEqualToNumber:recProgress]) {
        [_recProgress release];
        _recProgress = [recProgress retain];
        [self.delegate displayServerRecordProgress:self:nil];

        /* enable server play/stop/download buttons if we're receiving progress values */
        if (!progressValueReceived)
        {
            [self.delegate enableServerStopButton];
            [self.delegate enableServerPlayButton];
            [self.delegate enableServerDownloadButton];
            [self.delegate enableServerVolumeSlider];
            [self.delegate enableServerPanView];
            progressValueReceived = YES;
        }
    }
}

- (void)setPlayingMeterValue:(NSNumber *)playingMeterValue{
    
    if (![_playingMeterValue isEqualToNumber:playingMeterValue]) {
        [_playingMeterValue release];
        _playingMeterValue = [playingMeterValue retain];
        [self.delegate displayServerPlayingMeterValue:self:nil];
    }
}

- (void)setRecordingMeterValue:(NSNumber *)recordingMeterValue {
    
    if (![_recordingMeterValue isEqualToNumber:recordingMeterValue]) {
        [_recordingMeterValue release];
        _recordingMeterValue = [recordingMeterValue retain];
        [self.delegate displayServerRecordingMeterValue:self :nil];
        
        /* enable server record button if we're receiving record meter values */
        if (!recMeterValueReceived)
        {
            [self.delegate enableServerRecordButton];
            recMeterValueReceived = YES;
        }
    }
}

- (void)respondToServerHeartbeatMessage {
    [self sendOSCMsg:"/fz/hb\0\0":8];
}

#pragma mark- OSC packing methods
-(void)sendOSCMsg:(const char*)osc_str :(int)osc_str_length
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",s\0\0",4);
	    
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(self->IPAddBuf,self->IPAddSize)
	OSC_END
}

-(void)sendOSCMsgWithIntValue:(const char*)osc_str :(int)osc_str_length :(int)val
{
    // printf("sendOSCMsgWithIntValue\n");
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",si\0",4);
	val = htonl(val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(self->IPAddBuf,self->IPAddSize);
	OSC_ADD(&val,4);
	OSC_END
}

-(void)sendOSCMsgWithFloatValue:(const char*)osc_str :(int)osc_str_length :(float)val
{
	char buf[128]; memcpy(buf,osc_str,osc_str_length); memcpy(buf+osc_str_length,",sf\0",4);
	
	OSC_VAL_BYTE_SWAP(&val);
	
	OSC_START
	OSC_ADD(buf,osc_str_length+4);
	OSC_ADD(self->IPAddBuf,self->IPAddSize);
	OSC_ADD(&u.flt_val,4);
	OSC_END
}

#pragma mark- UDP & TCP message parsing
- (void)udpParse
{	
    // printf("UDPInBuffer: %s\n", self->UDPInBuffer);
    
    NSAutoreleasePool *udpThreadPool = [[NSAutoreleasePool alloc] init];

    ssize_t pos = 0;
    int msg_type = 0;
    int add_type = 0;
	
    while (pos < self->UDPInBufferLength)
    {
        switch (msg_type)
        {
            case 0:
            {
                // reference the proper add_type by using the osc message as a key in an NSDictionary
                // had to use an autorelease method for the string to live long enough for the key lookup.
                NSString* buf_str = [NSString stringWithCString:self->UDPInBuffer+pos encoding:NSASCIIStringEncoding];
                add_type = [[self.msgDictionary objectForKey:buf_str]intValue];
            }
				
            case 1:
            {
                switch (add_type)
                {
                    case 7:
					{   // /fz/play
                        NSLog(@"received /fz/play\n");
						mOSCMsg_Play = YES;						
                        break;
					}
					case 8:
					{   // /fz/stop
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
                    {   // /fz/state
                        OSC_VAL_BYTE_SWAP(self->UDPInBuffer+pos)
                        NSLog(@"received /fz/state:%d",u.int_val);
                        mOSCMsg_State = u.int_val;
                        break;
                    }
                    case 2:
                    {   // /fz/rec_prog
                        
                        // OSC_VAL_BYTE_SWAP(self->UDPInBuffer+pos)
                        // NSNumber *progVal = [[NSNumber alloc]initWithFloat:((float)u.int_val / 1000.)];
                        
                        // practice with blocks
						int newIntVal = oscValByteSwap(self->UDPInBuffer+pos);
                        float newVal = (float)newIntVal / 1000;
                        NSNumber *progVal = [[NSNumber alloc]initWithFloat:newVal];
                        
                        [self performSelectorOnMainThread:@selector(setProgressValue:)
                                               withObject:progVal 
                                            waitUntilDone:NO];
                        [progVal release];
                        break;
                    }
                    case 3:
                    {   // /fz/audio_out
						int newIntVal = oscValByteSwap(self->UDPInBuffer+pos);
						//NSLog(@"fz/audio_out %d",newIntVal);
                        //float newVal = (float)newIntVal / 7;
                        NSNumber *serverMeterVal = [[NSNumber alloc]initWithInt:newIntVal];
                        
                        [self performSelectorOnMainThread:@selector(setPlayingMeterValue:)
                                               withObject:serverMeterVal 
                                            waitUntilDone:NO];
                        [serverMeterVal release];
                        break;
                    }
                    case 4:
                    {   // /fz/audio_in
						int newIntVal = oscValByteSwap(self->UDPInBuffer+pos);
						//NSLog(@"fz/audio_in %d",newIntVal);
                        //float newVal = (float)newIntVal / 7;
                        NSNumber *serverMeterVal = [[NSNumber alloc]initWithInt:newIntVal];
                        
                        [self performSelectorOnMainThread:@selector(setRecordingMeterValue:)
                                               withObject:serverMeterVal 
                                            waitUntilDone:NO];
                        [serverMeterVal release];
                        break;
                    }
                    case 5:
                    {   // /fz/interstitial
                        
                        NSString *interstitialMsg = [[NSString alloc] initWithCString:self->UDPInBuffer+pos encoding:NSASCIIStringEncoding];
                        
                        [self performSelectorOnMainThread:@selector(setInterstitialMsg:) 
                                               withObject:interstitialMsg 
                                            waitUntilDone:NO];
                        [interstitialMsg release];
                        
                        break;
                    }
                    case 6:
                    {   // /fz/hb
                        //NSLog(@"received /fz/hb:%s\n",UDPInBuffer+pos);
                        NSString *serverIP = [[NSString alloc] initWithCString:self->UDPInBuffer+pos encoding:NSASCIIStringEncoding];
                        [super newServerIPAddress:serverIP];
//                        [self performSelectorOnMainThread:@selector(respondToServerHeartbeatMessage) withObject:nil waitUntilDone:NO];
                        [serverIP release];
                        break;
                    }
                    case 9:
                    {   // /fz/cue
                        OSC_VAL_BYTE_SWAP(self->UDPInBuffer+pos)
                        // NSLog(@"received /fz/cue:%d\n",u.int_val);
                        mOSCMsg_Cue = u.int_val;
                        break;
                    }
					case 10:
					{   // /fz/loop
                        /*
                        //currently disabled in Max patch
                        //NSLog(@"received /fz/loop:%s\n",self->UDPInBuffer+pos);
						OSC_VAL_BYTE_SWAP(self->UDPInBuffer+pos)
						float loop_start = u.int_val;
						pos += 4;
						
						OSC_VAL_BYTE_SWAP(self->UDPInBuffer+pos)
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
		
        //printf("%s: %s\n",msg_type_str,self->UDPInBuffer+pos);
        pos += ((strlen(self->UDPInBuffer+pos) / 4) + 1)* 4;            
    }
    [udpThreadPool drain];
}

- (void)tcpParse {
        
    //NSAutoreleasePool *tcpThreadPool = [[NSAutoreleasePool alloc] init];
    
    NSData* raw = [NSData dataWithBytes:[self->IncomingDataBuffer bytes] length:[self->IncomingDataBuffer length]];
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"forZero.mp3"];
//    self.aqPlayer.theFile = filePath;
	//NSLog(@"filePath:%@", filePath);
    
    [raw writeToFile:filePath atomically:YES];
        
    [self.delegate downloadEnded:self];
        
    //[tcpThreadPool drain];

}

- (void)downloadFailed:(NSTimer*)timer
{
    //NSLog(@"downloadFailed called");
    close(self->ClntSock);
    close(self->ServSock);
    self.errorMsg = @"Something went wrong. Either you are not connected to a performace server or there was a problem downloading. Please try again";
    [self.delegate downloadFailed:self];
}


#pragma mark- NSTimer heartbeat
-(void)sendHeartBeat
{
    [self sendOSCMsg:"/fz/hb\0\0":8];
	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(sendHeartBeat) userInfo:nil repeats:NO];  
}

#pragma mark- join/leave messages
-(void)sendJoin
{
    NSLog(@"sendJoin");
    [self sendOSCMsg:"/fz/join\0\0\0\0":12];
}

-(void)sendLeave
{
    NSLog(@"sendLeave");
    [self sendOSCMsg:"/minc/leave\0":12];
}

@end
