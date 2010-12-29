//
//  SimpleSynth_Singleton.m
//  SimpleSynth
//
//  Created by Kojiro Umezaki on 12/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleSynth_Singleton.h"

#import "AQPlayer.h"

AQPlayer* gAQP;

@implementation SimpleSynth_Singleton

-(id)init
{
	[super init];

	gAQP = [[AQPlayer_SimpleSF alloc] init];

	UIWindow* window = [self GetAppWindow];

	for (int i = 0; i < kNumViews; i++)
	{
		CGRect viewRect = CGRectMake(10+50,30+(i*110),300-50,100);
		mView[i] = [[TouchView alloc] initWithFrame:viewRect];
		[mView[i] setBackgroundColor:[UIColor darkGrayColor]];
		[mView[i] setHidden:NO];
		[window addSubview:mView[i]];
		[mView[i] SetSoundFilePos:i];
		
		CGRect buttonRect = CGRectMake(10,30+(i*110),40,100);
		mButtons[i] = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
		mButtons[i].frame = buttonRect;
		[mButtons[i] setTitle:@"Mute" forState:UIControlStateNormal];
		[mButtons[i] setHidden:NO];
		[mButtons[i] addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchDown];
		[window addSubview:mButtons[i]];
	}
	
	return self;
}

-(void)dealloc
{
	[gAQP release];

	for (int i = 0; i < kNumViews; i++)
	{
		[mView[i] release];
		[mButtons[i] release];
	}
	
	[super dealloc];
}

-(UIWindow*)GetAppWindow { return nil; }

-(void)doButton:(id)sender
{
	for (int i = 0; i < kNumViews; i++)
		if (mButtons[i] == sender)
		{
			if (strcmp(object_getClassName(gAQP),"AQPlayer_SimpleSF")==0)
			{
				AQPlayer_SimpleSF *aqp = (AQPlayer_SimpleSF*)gAQP;
				[aqp SetMute:i:![aqp GetMute:i]];
				[mButtons[i] setTitle:([aqp GetMute:i]?@"Mute":@"") forState:UIControlStateNormal];
			}
		}
}

@end


#import "AppDelegate_iPhone.h"

@implementation SimpleSynth_Singleton_iPhone

-(UIWindow*)GetAppWindow
{
	AppDelegate_iPhone *appDelegate = (AppDelegate_iPhone*)[[UIApplication sharedApplication] delegate];
	return appDelegate.window;
}

@end


#import "AppDelegate_iPad.h"

@implementation SimpleSynth_Singleton_iPad

-(UIWindow*)GetAppWindow
{
	AppDelegate_iPad *appDelegate = (AppDelegate_iPad*)[[UIApplication sharedApplication] delegate];
	return appDelegate.window;
}

@end
