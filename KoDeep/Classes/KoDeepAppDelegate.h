//
//  KoDeepAppDelegate.h
//  KoDeep
//
//  Created by Kojiro Umezaki on 8/10/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KoDeep_Audio.h"

@interface KoDeepAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	IBOutlet UISlider*				mBeatSlider;
	IBOutlet UISlider*				mTempoSlider;
	IBOutlet UISlider*				mPitchSlider;
	IBOutlet UISwitch*				mOnOffSwitch;
	IBOutlet UISegmentedControl*	mFractionControl;
	
	IBOutlet UILabel*				mBeatLabel;

	KoDeep_Audio*					mAudio;	
	
	UInt16							mNumBeats;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(IBAction)SetOnOff:(id)sender;
-(IBAction)SetBeats:(id)sender;
-(IBAction)SetFraction:(id)sender;
-(IBAction)SetTempo:(id)sender;
-(IBAction)SetPitch:(id)sender;

@end

