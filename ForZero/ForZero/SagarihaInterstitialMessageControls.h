//
//  SagarihaInterstitialMessageControls.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkMessages.h"

@interface SagarihaInterstitialMessageControls : UIView {

	IBOutlet UIImageView		*mInterstitialView;
	IBOutlet UILabel			*mInterstitialLabel;
	IBOutlet UIButton			*mOKButton;

	NSArray						*mImageArray;
}
@property(nonatomic,assign) NetworkMessages *networking;

-(IBAction)InterstitialMsgDone:(id)sender;

-(void)turnInterstitialMsgOn;
-(void)turnInterstitialMsgOff;

-(void)displayMessage;

@end
