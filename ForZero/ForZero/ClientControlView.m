//
//  ClientControlView.m
//  ForZero
//
//  Created by Chris Lavender on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ClientControlView.h"

@implementation ClientControlView
@synthesize aqPlayer=_aqPlayer;

- (void) awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"ClientControlView" owner:self options:nil];
    [super awakeFromNib];
    self.viewLabel.text = @"Your Device";
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(startPlaybackMetering:) 
                                                 name:@"AudioQueuePlayerIsPlayingNotification" 
                                               object:_aqPlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(stopPlaybackMetering:) 
                                                 name:@"AudioQueuePlayerIsStoppedNotification" 
                                               object:_aqPlayer];
    
    _level = (AudioQueueLevelMeterState*)malloc(sizeof(AudioQueueLevelMeterState));
    
    _meterRefreshRate = 0.33;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:@"AudioQueuePlayerIsPlayingNotification" 
                                                  object:_aqPlayer];
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:@"AudioQueuePlayerIsStoppedNotification" 
                                                  object:_aqPlayer];

    [_aqPlayer release];
    [super dealloc];
}

#pragma mark- IBActions
-(IBAction)setTransportState:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        // NSLog(@"client: %@",[[sender titleLabel]text]);
        
        if ( [[[sender titleLabel]text] isEqualToString:@"rec"] ) {
            NSLog(@"client recording is not yet supported");
        }
        else if ( [[[sender titleLabel]text] isEqualToString:@"stop"] ) {
            [self.aqPlayer stop];
        }
        else if ( [[[sender titleLabel]text] isEqualToString:@"play"] ) {
            [self.aqPlayer start];
        }
    }
}

- (IBAction)setVolume:(id)sender {
    if ([sender isKindOfClass:[UISlider class]]) {
        self.aqPlayer.amp = ((UISlider*)sender).value;
    }
}

#pragma mark - void Methods

- (void)startPlaybackMetering:(NSNotification*)notification
{
    if (_updateTimer != nil) [_updateTimer invalidate];
    
    _updateTimer = [NSTimer 
                    scheduledTimerWithTimeInterval:_meterRefreshRate 
                    target:self 
                    selector:@selector(refreshPlaybackMeter) 
                    userInfo:nil 
                    repeats:YES
                    ];

}

- (void)stopPlaybackMetering:(NSNotification*)notification
{
    self.rightMeterView.meterVal = 0.0;
    
    [_updateTimer invalidate];
    _updateTimer = nil;
}

- (void)refreshPlaybackMeter
{
    UInt32 data_sz = sizeof(AudioQueueLevelMeterState);
    OSStatus result = AudioQueueGetProperty(self.aqPlayer.mQueue, kAudioQueueProperty_CurrentLevelMeter, _level, &data_sz);
    if (result)
        NSLog(@"metering failed: %ld\n",result);
    
    result = AudioQueueGetParameter(self.aqPlayer.mQueue, kAudioQueueParam_Volume, &_volume);
    
    if (result)
        NSLog(@"get volume failed: %ld\n",result);
    
    float averageLevel = _level->mAveragePower * _volume;
    
    int n = (int)(averageLevel * 64.);
    
    int i;
    
    if (averageLevel > 0.) {
        for (i = 1; i < 8; i++)
        {
            if (n == 0) break;
            n >>= 1;
        }
    }
    else i = 0;
    
    self.rightMeterView.meterVal = i;
    
}

@end
