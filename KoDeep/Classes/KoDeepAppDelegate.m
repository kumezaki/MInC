//
//  KoDeepAppDelegate.m
//  KoDeep
//
//  Created by Kojiro Umezaki on 8/10/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "KoDeepAppDelegate.h"

@implementation KoDeepAppDelegate

#define GET_FRACTION	((double)mFractionControl.selectedSegmentIndex / 4)

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
	
	mAudio = [KoDeep_Audio new];
}

- (id)init {
	[super init];
	mNumBeats = 1;
	return self;
}

- (void)dealloc {

	[mAudio release];
	
    [window release];
    [super dealloc];
}

-(IBAction)SetOnOff:(id)sender
{
	NSLog(@"%d",mOnOffSwitch.on);
	
	if (mOnOffSwitch.on) { [mAudio ResetBeatNum]; [mAudio Start]; } else [mAudio Stop];
}

-(IBAction)SetBeats:(id)sender
{
	mNumBeats = mBeatSlider.value * 24 + 1;
	NSLog(@"%f %d",mBeatSlider.value,mNumBeats);
	mBeatLabel.text = [[NSString alloc] initWithFormat:@"%d",mNumBeats];
	[mAudio SetNumBeats:mNumBeats:GET_FRACTION];
}

-(IBAction)SetFraction:(id)sender
{
	NSLog(@"%d",mFractionControl.selectedSegmentIndex);
	[mAudio SetNumBeats:mNumBeats:GET_FRACTION];
}

-(IBAction)SetTempo:(id)sender
{
	NSLog(@"%f",mTempoSlider.value);
	mAudio->mTempoMultiplier = mTempoSlider.value * 2 + 1.;
}

-(IBAction)SetPitch:(id)sender
{
	NSLog(@"%f",mPitchSlider.value);
	[mAudio SetBaseMIDINote:(mPitchSlider.value * 12. + 69.)];
}

@end
