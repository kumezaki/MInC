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

#if 1
    // this stuff should go into dataFilePath method
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"KoDeep.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
    //	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"KoDeep.dat"] error:NULL];
#endif
	if (file_exists)
    {
		[self readDataFile];
        [mAudio SetNumBeats:mNumBeats:GET_FRACTION];

        mBeatLabel.text = [[NSString alloc] initWithFormat:@"%d",mNumBeats];
        mBeatSlider.value = (mNumBeats - 1) / 24.;
        mTempoSlider.value = (mAudio->mTempoMultiplier - 1.) / 2.;
        mPitchSlider.value = (mAudio->mBaseMIDINote - 69.) / 12.;
   }
}

- (id)init {

	[super init];

	[[UIAccelerometer sharedAccelerometer] setDelegate:self];

    tempoAccelTrackingOn = NO;
    pitchAccelTrackingOn = NO;

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
    [self writeDataFile];
}

-(IBAction)SetFraction:(id)sender
{
	NSLog(@"%d",mFractionControl.selectedSegmentIndex);
	[mAudio SetNumBeats:mNumBeats:GET_FRACTION];
    [self writeDataFile];
}

-(IBAction)SetTempo:(id)sender
{
	NSLog(@"%f",mTempoSlider.value);
	mAudio->mTempoMultiplier = mTempoSlider.value * 2 + 1.;
    [self writeDataFile];
}

-(IBAction)SetPitch:(id)sender
{
	NSLog(@"%f",mPitchSlider.value);
	[mAudio SetBaseMIDINote:(mPitchSlider.value * 12. + 69.)];
    [self writeDataFile];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    if (tempoAccelTrackingOn)
    {
        NSLog(@"%f, %f, %f", acceleration.x, acceleration.y, acceleration.z);
        mAudio->mTempoMultiplier += acceleration.x * 0.1;
        mTempoSlider.value = (mAudio->mTempoMultiplier - 1.) / 2.;
        [self writeDataFile];
    }
    if (pitchAccelTrackingOn)
    {
        NSLog(@"%f, %f, %f", acceleration.x, acceleration.y, acceleration.z);
        [mAudio SetBaseMIDINote:mAudio->mBaseMIDINote + acceleration.x * 0.1];
        mPitchSlider.value = (mAudio->mBaseMIDINote - 69.) / 12.;
        [self writeDataFile];
    }
}

-(IBAction)decrementBeat
{
    if (mNumBeats > 0) mNumBeats--;

    mBeatSlider.value = (mNumBeats - 1.) / 24.;
	mBeatLabel.text = [[NSString alloc] initWithFormat:@"%d",mNumBeats];
	[mAudio SetNumBeats:mNumBeats:GET_FRACTION];
    [self writeDataFile];
}

-(IBAction)incrementBeat
{
    if (mNumBeats < 24) mNumBeats++;

    mBeatSlider.value = (mNumBeats - 1.) / 24.;
	mBeatLabel.text = [[NSString alloc] initWithFormat:@"%d",mNumBeats];
	[mAudio SetNumBeats:mNumBeats:GET_FRACTION];
    [self writeDataFile];
}

-(IBAction)tempoFineOn { NSLog(@"tempoFineOn"); tempoAccelTrackingOn = YES; }
-(IBAction)tempoFineOff { NSLog(@"tempoFineOff"); tempoAccelTrackingOn = NO; }

-(IBAction)pitchFineOn { NSLog(@"pitchFineOn"); pitchAccelTrackingOn = YES; }
-(IBAction)pitchFineOff { NSLog(@"pitchFineOff"); pitchAccelTrackingOn = NO; }

+(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
	return [docDirectory stringByAppendingPathComponent:@"KoDeep.dat"];
#if 0
	/* to delete the file */
	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"KoDeep.dat"] error:NULL];
#endif
}

-(void)readDataFile
{
	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[KoDeepAppDelegate dataFilePath]];

	NSLog(@"%@",[KoDeepAppDelegate dataFilePath]);

	mNumBeats = [[dict valueForKey:@"num_beats"] unsignedIntValue];
	mFractionControl.selectedSegmentIndex = [[dict valueForKey:@"fraction"] unsignedIntValue];
    mAudio->mTempoMultiplier = [[dict valueForKey:@"tempo"] doubleValue];
    mAudio->mBaseMIDINote = [[dict valueForKey:@"pitch"] doubleValue];

	NSLog(@"%d %d %f %f",mNumBeats,mFractionControl.selectedSegmentIndex, mAudio->mTempoMultiplier, mAudio->mBaseMIDINote);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];

    UInt32 num_beats = mNumBeats;
    UInt32 fraction = GET_FRACTION * 4 + 0.5;
    Float64 tempo = mAudio->mTempoMultiplier;
    Float64 pitch = mAudio->mBaseMIDINote;
    
	[dict setValue:[NSNumber numberWithUnsignedInt:num_beats] forKey:@"num_beats"];
	[dict setValue:[NSNumber numberWithUnsignedInt:fraction] forKey:@"fraction"];
	[dict setValue:[NSNumber numberWithDouble:tempo] forKey:@"tempo"];
	[dict setValue:[NSNumber numberWithDouble:pitch] forKey:@"pitch"];

	[dict writeToFile:[KoDeepAppDelegate dataFilePath] atomically:YES];

	[dict release];
}

@end
