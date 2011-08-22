//
//  SagarihaInterstitialMessageControls.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SagarihaInterstitialMessageControls : NSObject {

	IBOutlet UIImageView		*mInterstitialView;
	IBOutlet UILabel			*mInterstitialLabel;
	IBOutlet UIButton			*mOKButton;

	NSArray						*mImageArray;
}

-(IBAction)InterstitialMsgDone:(id)sender;

-(void)turnInterstitialMsgOn;
-(void)turnInterstitialMsgOff;

-(void)displayMessage;

@end
