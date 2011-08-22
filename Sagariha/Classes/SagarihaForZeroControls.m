//
//  SagarihaForZeroControls.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SagarihaForZeroControls.h"

#import "SagarihaNetworking.h"

extern SagarihaNetworking* networking;

@implementation SagarihaForZeroControls

-(IBAction)ForZero_Start:(id)sender
{
    [networking SendOSCMsg:"/saga/fz_start\0\0":16];    
}

-(IBAction)ForZero_Subtract:(id)sender
{
	[networking SendOSCMsg:"/saga/fz_sub\0\0\0\0":16];
}

-(IBAction)ForZero_Stop:(id)sender
{    
	[networking SendOSCMsg:"/saga/fz_stop\0\0\0":16];
}

-(IBAction)ForZero_Panic:(id)sender
{
	[networking SendOSCMsg:"/saga/fz_panic\0\0":16];
}

@end
