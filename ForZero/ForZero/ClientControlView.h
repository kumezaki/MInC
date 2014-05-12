//
//  ClientControlView.h
//  ForZero
//
//  Created by Chris Lavender on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

#import "ControlView.h"
#import "SagarihaAudioQueuePlayer.h"


@interface ClientControlView : ControlView {
    AudioQueueLevelMeterState   *_level;    
    NSTimer     *_updateTimer;
    
    Float32     _volume;
    Float32     _meterRefreshRate; // 1.0 = 1sec
}
@property (nonatomic, retain) SagarihaAudioQueuePlayer   *aqPlayer;

- (void)startPlaybackMetering:(NSNotification*)notification;
- (void)stopPlaybackMetering:(NSNotification*)notification;
- (void)refreshPlaybackMeter;
@end
