//
//  GDMediaPlayer.m
//  Prop Phone
//
//  Created by Chris Lavender on 7/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GDMediaPlayer.h"
#import <Foundation/Foundation.h>

@interface GDMediaPlayer()
- (void) musicPlayerStateDidChange;
@end

#pragma mark Audio session callbacks_________________________

// Audio session callback function for responding to audio route changes. If playing 
//		back application audio when the headset is unplugged, this callback pauses 
//		playback and displays an alert that allows the user to resume or stop playback.
//
//		The system takes care of iPod audio pausing during route changes--this callback  
//		is not involved with pausing playback of iPod audio.
void audioRouteChangeListenerCallback (
                                       void                      *inUserData,
                                       AudioSessionPropertyID    inPropertyID,
                                       UInt32                    inPropertyValueSize,
                                       const void                *inPropertyValue
                                       ) {
	
	// ensure that this callback was invoked for a route change
	if (inPropertyID != kAudioSessionProperty_AudioRouteChange) return;
    
	// This callback, being outside the implementation block, needs a reference to the
	//		GDMediaPlayer object, which it receives in the inUserData parameter.
	//		You provide this reference when registering this callback (see the call to 
	//		AudioSessionAddPropertyListener).
	GDMediaPlayer *gdMediaPlayer = (GDMediaPlayer *) inUserData;
	
	// if application sound is not playing, there's nothing to do, so return.
	if (gdMediaPlayer.defaultSoundPlayer.playing == 0 ) {
        
		NSLog (@"Audio route change while application audio is stopped.");
		return;
		
	} else {
        
		// Determines the reason for the route change, to ensure that it is not
		//		because of a category change.
		CFDictionaryRef	routeChangeDictionary = inPropertyValue;
		
		CFNumberRef routeChangeReasonRef =
        CFDictionaryGetValue (
                              routeChangeDictionary,
                              CFSTR (kAudioSession_AudioRouteChangeKey_Reason)
                              );
        
		SInt32 routeChangeReason;
		
		CFNumberGetValue (
                          routeChangeReasonRef,
                          kCFNumberSInt32Type,
                          &routeChangeReason
                          );
		
		// "Old device unavailable" indicates that a headset was unplugged, or that the
		//	device was removed from a dock connector that supports audio output. This is
		//	the recommended test for when to pause audio.
		if (routeChangeReason == kAudioSessionRouteChangeReason_OldDeviceUnavailable) {
            
			[gdMediaPlayer.defaultSoundPlayer pause];
			NSLog (@"Output device removed, so application audio was paused.");
            
			UIAlertView *routeChangeAlertView = 
            [[UIAlertView alloc]	initWithTitle: NSLocalizedString (@"Playback Paused", @"Title for audio hardware route-changed alert view")
                                       message: NSLocalizedString (@"Audio output was changed", @"Explanation for route-changed alert view")
                                      delegate: gdMediaPlayer
                             cancelButtonTitle: NSLocalizedString (@"StopPlaybackAfterRouteChange", @"Stop button title")
                             otherButtonTitles: NSLocalizedString (@"ResumePlaybackAfterRouteChange", @"Play button title"), nil];
			[routeChangeAlertView show];
			// release takes place in alertView:clickedButtonAtIndex: method
            [routeChangeAlertView release];//CL added.
		} else {
            
			NSLog (@"A route change occurred that does not require pausing of application audio.");
		}
	}
}

@implementation GDMediaPlayer

@synthesize defaultSoundPlayer;	// for playing default sound
@synthesize userMediaCollection;
@synthesize delegate;


- (id)init {
    
    [super init];
    
    if (self) {
        [self setupApplicationAudio];
    } 
    return self;
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:@"MPMusicPlayerControllerPlaybackStateDidChangeNotification" 
                                                  object:_musicPlayer];
    [_musicPlayer endGeneratingPlaybackNotifications];
    
    [_musicPlayer stop];
    [defaultSoundPlayer stop];
    self.defaultSoundPlayer=nil;
    self.delegate=nil;
    [super dealloc];
}

- (void) updatePlayerQueueWithMediaCollection: (MPMediaItemCollection *) collection {
    [_musicPlayer stop];
    
    //NSLog(@"MPMediaItemCollection count:%d", [collection count]);
    
    if (collection) {
        [self setUserMediaItemCollection: collection];
        [_musicPlayer setQueueWithItemCollection: userMediaCollection];
     }
}

- (void)setUserMediaItemCollection:(MPMediaItemCollection*)collection {
    userMediaCollection = collection;
    }

#pragma mark User-Selected Audio Transport_____________

- (void)playerTransport:(NSString*)action {
    if ([action isEqualToString:@"play"]) [self playSound];
    else if ([action isEqualToString:@"pause"]) [self pauseSound];
    else [self stopSound];

}

- (void)playSound {
    if (itunesLib) {
        if (_musicPlayer.playbackState == YES) {
            _musicPlayer.currentPlaybackTime = 0;
        }
        [_musicPlayer play];
    }
    else {
        if ([defaultSoundPlayer isPlaying]) {
            defaultSoundPlayer.currentTime = 0;
        }
        // printf("play\n");
        [defaultSoundPlayer play];
    }
    [self.delegate mediaPlayerIsPlaying:YES];
}
- (void)pauseSound {
    if (itunesLib) {
        [_musicPlayer pause];
    }
    else {
        //  printf("pause\n");
        [defaultSoundPlayer stop];
    } 
    [self.delegate mediaPlayerIsPlaying:NO];
}
- (void)stopSound {
    if (itunesLib) {
        [_musicPlayer stop];
    }
    else {
        // printf("stop\n");
        [defaultSoundPlayer stop];
    }
    defaultSoundPlayer.currentTime = 0;
    [self.delegate mediaPlayerIsPlaying:NO];
}

#pragma mark Default Sound Audio Transport______________

- (void)playDefault {
    
	[defaultSoundPlayer play];
}


#pragma mark Audio Setup__________________________________

#if TARGET_IPHONE_SIMULATOR
#warning *** Simulator mode: iPod library access works only when running on a device.
#endif

- (void) setupApplicationAudio {

	// Gets the file system path to the sound to play.
	NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"tele"
                                                              ofType:@"mp3"];
    
	// Converts the sound's file path to an NSURL object
	NSURL *newURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
	// Registers this class as the delegate of the audio session.
	[[AVAudioSession sharedInstance] setDelegate: self];
	
     // Use this code to allow the app sound to continue to play when the screen is locked.
     [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: nil];
     
     UInt32 doSetProperty = 0;
     AudioSessionSetProperty (
     kAudioSessionProperty_OverrideCategoryMixWithOthers,
     sizeof (doSetProperty),
     &doSetProperty
     );
    
	// Registers the audio route change listener callback function
	AudioSessionAddPropertyListener (
                                     kAudioSessionProperty_AudioRouteChange,
                                     audioRouteChangeListenerCallback,
                                     self
                                     );
    
	// Activates the audio session.
	NSError *activationError = nil;
	[[AVAudioSession sharedInstance] setActive: YES error: &activationError];
    
	// Instantiates the AVAudioPlayer object, initializing it with the sound
	AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:newURL error: nil];
	self.defaultSoundPlayer = newPlayer;
	[newPlayer release];
    [newURL release];

	[defaultSoundPlayer prepareToPlay]; //ensures that playback starts quickly when the user taps Play
	[defaultSoundPlayer setVolume: 1.0];
	[defaultSoundPlayer setDelegate: self];
    
    // instantiate a music player
    _musicPlayer = [MPMusicPlayerController applicationMusicPlayer];
    _musicPlayer.repeatMode = MPMusicRepeatModeNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(musicPlayerStateDidChange) 
                                                 name:@"MPMusicPlayerControllerPlaybackStateDidChangeNotification" 
                                               object:_musicPlayer];
    
    [_musicPlayer beginGeneratingPlaybackNotifications];
}

- (void)setLoopMode:(BOOL)switchVal {
    if (switchVal) {
        _musicPlayer.repeatMode = MPMusicRepeatModeOne;
        defaultSoundPlayer.numberOfLoops = -1;
    }
    else {
        _musicPlayer.repeatMode = MPMusicRepeatModeNone;
        defaultSoundPlayer.numberOfLoops = 0;
    }
}

- (void)setSoundMode:(BOOL)switchVal {
    if (switchVal != itunesLib) [self stopSound];
    itunesLib = switchVal;
}

#pragma mark - AVAudioPlayer Delegate Method Impementations

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self.delegate mediaPlayerIsPlaying:NO];
}

#pragma mark - MPMusicPlayerController Notification Method

// to report if something is playing, mediaPlayerIsPlaying Delegate method is also called above.
- (void) musicPlayerStateDidChange {
    printf("music player changed state\n");
    if (_musicPlayer.playbackState == NO)
        [self.delegate mediaPlayerIsPlaying:NO];
}

@end
