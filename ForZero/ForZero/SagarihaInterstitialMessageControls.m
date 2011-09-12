//
//  SagarihaInterstitialMessageControls.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SagarihaInterstitialMessageControls.h"

@implementation SagarihaInterstitialMessageControls
@synthesize networking = _networking;

-(void)awakeFromNib
{
	mImageArray = [[NSArray alloc] initWithObjects:
				   [UIImage imageNamed:@"image_0.jpg"],
				   [UIImage imageNamed:@"image_1.jpg"],
				   nil
				   ];
}

-(void)dealloc
{
	[mImageArray release];
	[super dealloc];
}

-(IBAction)InterstitialMsgDone:(id)sender
{
	//	NSLog(@"InterstitialMsgDone\n");
	[self turnInterstitialMsgOff];
}

-(void)turnInterstitialMsgOn
{
	mInterstitialView.alpha = 1.0;
	
	//if (self.networking->mOSCMsg_InterstitialMsgDur != -1)
	{
#if 0
		double dur = mOSCMsg_InterstitialMsgDur / 1000.;
		[NSTimer scheduledTimerWithTimeInterval:dur target:self selector:@selector(turnInterstitialMsgOff) userInfo:nil repeats:NO];
#endif
	}
	//mOKButton.hidden = self.networking->mOSCMsg_InterstitialMsgDur == -1 ? YES : NO;
	
	[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];

	self.window.backgroundColor = [UIColor blackColor];

	//	UITabBarItem *tabBarItem = [[tabBarController.tabBar items] objectAtIndex:1];
	//	[tabBarItem setEnabled:NO];
}

-(void)turnInterstitialMsgOff
{
	if (mInterstitialView.alpha < 0.0)
		mInterstitialView.alpha = 0.0;
	else if (mInterstitialView.alpha > 0.0)
		mInterstitialView.alpha -= 0.05;
	
	if (mInterstitialView.alpha > 0.0)
		[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(turnInterstitialMsgOff) userInfo:nil repeats:NO];
	
	mOKButton.hidden = YES;
	
	[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];

	self.window.backgroundColor = [UIColor whiteColor];
	
	//	UITabBarItem *tabBarItem = [[tabBarController.tabBar items] objectAtIndex:1];
	//	[tabBarItem setEnabled:YES];
}

-(void)displayMessage
{
	/*
    [self turnInterstitialMsgOn];
	
	int image_pos = -1;
    
	if ([self.networking->mOSCMsg_InterstitialMsg isEqualToString:@"image_0"])
		image_pos = 0;
	else if ([self.networking->mOSCMsg_InterstitialMsg isEqualToString:@"image_1"])
		image_pos = 1;
	if (image_pos == -1)
	{
		mInterstitialLabel.text = self.networking->mOSCMsg_InterstitialMsg;
		mInterstitialView.image = nil;
	}
	else
	{
		mInterstitialLabel.text = @"";
		mInterstitialView.image = [mImageArray objectAtIndex:image_pos];
	}
     */
}

@end
