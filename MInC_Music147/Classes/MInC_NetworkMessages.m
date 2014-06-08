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

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

#import "MInC_TouchView.h"

#import "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

#import "MInC_SequenceFile.h"

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

    MInC_SequenceFile* seqFile = [[MInC_SequenceFile alloc] init];
    [seqFile readFromFile:@"TCP.dat"];

	[self sendHeartBeat];
    
    FirstHeartBeat = YES;
        
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
	NSLog(@"self->UDPInBufferLength: %ld",self->UDPInBufferLength);
    NSLog(@"self->UDPInBuffer: %s",self->UDPInBuffer);
    
//    NSAutoreleasePool *udpThreadPool = [[NSAutoreleasePool alloc] init];

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
                add_type = [[self.msgDictionary objectForKey:buf_str] intValue];
				break;
			}
			case 2:
			{
				switch (add_type)
				{
					case 1:
                    {
						gFirstView.InterstitialString = [[NSString alloc] initWithCString:self->UDPInBuffer+pos encoding:NSASCIIStringEncoding];
						break;
                    }
					case 2:
					{
						int int_val;
						memcpy(&int_val,self->UDPInBuffer+pos,4);
						int_val = htonl(int_val);
						printf("mod number %d\n",int_val);
						[gAQP setSequence:int_val];
						gFirstView.NewMod = YES;
						break;
					}
					case 3:
					{
                        /* this is where the heartbeat is received */
						gFirstView.ServerIPAddString = [[NSString alloc] initWithCString:self->UDPInBuffer+pos encoding:NSASCIIStringEncoding];
                        if (FirstHeartBeat)
                        {
                            [self sendOSCMsg:"/minc/download\0\0":16];
                            [self startReceiveTCP];
                            FirstHeartBeat = NO;
                        }
                        [gFirstView heartBeat];
                        break;  
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

        //NSLog(@"%s: %s",msg_type_str,self->UDPInBuffer+pos);
        pos += ((strlen(self->UDPInBuffer+pos) / 4) + 1) * 4;
    }

//    [udpThreadPool drain];
}

- (void)tcpParse {
        
    //NSAutoreleasePool *tcpThreadPool = [[NSAutoreleasePool alloc] init];
    
    MInC_SequenceFile* seqFile = [[MInC_SequenceFile alloc] init];
    
    NSData* data = [NSData dataWithBytes:[self->IncomingDataBuffer bytes] length:[self->IncomingDataBuffer length]];
    
    [seqFile writeToFile:@"TCP.dat" withData:data];
    
    [seqFile readFromFile:@"TCP.dat"];
    
    [self.delegate downloadEnded:self];
    
    //[tcpThreadPool drain];

}

- (void)downloadFailed:(NSTimer*)timer
{
    NSLog(@"downloadFailed called");
    close(self->ClntSock);
    close(self->ServSock);
    self.errorMsg = @"Something went wrong. Either you are not connected to a performace server or there was a problem downloading. Please try again";
    [self.delegate downloadFailed:self];
}


#pragma mark- NSTimer heartbeat
-(void)sendHeartBeat
{
    [self sendOSCMsg:"/minc/hb\0\0\0\0":12];
	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(sendHeartBeat) userInfo:nil repeats:NO];  
}

#pragma mark- join/leave messages
-(void)sendJoin
{
    NSLog(@"sendJoin");
    [self sendOSCMsg:"/minc/join\0\0":12];
}

-(void)sendLeave
{
    NSLog(@"sendLeave");
    [self sendOSCMsg:"/minc/leave\0":12];
}

@end
