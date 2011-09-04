//
//  GDMediaPlayer.h
//  Prop Phone
//
//  Created by Chris Lavender on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@class GDMediaPlayer;
@protocol GDMediaPlayerDelegate
- (void)mediaPlayerIsPlaying:(BOOL)state;
@end

@interface GDMediaPlayer : NSObject <AVAudioPlayerDelegate> {

    MPMusicPlayerController *_musicPlayer;
    MPMediaItemCollection   *userMediaCollection;
    
    AVAudioPlayer			*defaultSoundPlayer;
	NSURL					*soundFileURL;
    
    BOOL                    itunesLib;

}
@property (nonatomic, assign)   id<GDMediaPlayerDelegate> delegate;

@property (nonatomic, retain)	AVAudioPlayer	*defaultSoundPlayer;
@property (nonatomic, readonly) MPMediaItemCollection *userMediaCollection;

- (void)updatePlayerQueueWithMediaCollection:(MPMediaItemCollection *)collection;
- (void)setUserMediaItemCollection:(MPMediaItemCollection*)collection;
- (void)setupApplicationAudio;

- (void)playerTransport:(NSString*)action;
- (void)setLoopMode:(BOOL)switchVal;
- (void)setSoundMode:(BOOL)switchVal;

- (void)playSound;
- (void)pauseSound;
- (void)stopSound;
- (void)playDefault;

@end
