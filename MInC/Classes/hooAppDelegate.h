//
//  hooAppDelegate.h
//  hoo
//
//  Created by Kojiro Umezaki on 5/5/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AQPlayer.h"

@interface hooAppDelegate : NSObject <UIApplicationDelegate, UIAccelerometerDelegate> {
	
	UIWindow				*window;

	IBOutlet UIButton		*mNextButton;
	IBOutlet UIImageView	*mNotationView;
	IBOutlet UIView			*mTouchView;
	NSArray					*mImageArray;

	AQPlayer				*mAQP;
	
	UInt32					mSendIPAddress;
	SInt16					mSendPortNum;
	char					mOutBuffer[1024];
	int						mOutBufferLength;

	SInt16					mReceivePortNum;

	NSThread				*mThread;

    CFURLRef				mSoundFileURLRef;
	SystemSoundID			mSoundFileObject;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (readwrite)    CFURLRef        mSoundFileURLRef;
@property (readonly)    SystemSoundID    mSoundFileObject;

-(IBAction)AudioStart;
-(IBAction)AudioStop;
-(IBAction)NextSequence;

-(void)send_udp;
-(void)receive_udp;

@end

