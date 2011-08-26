//
//  SagarihaNetworkControls.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SagarihaNetworkControls.h"

#import "SagarihaSingleton.h"

extern SagarihaSingleton* singleton;

@implementation SagarihaNetworkControls

@synthesize editing;

-(void)awakeFromNib
{
	NSLog(@"SagarihaNetworkControls awakeFromNib");

	mIPAddressTextField.delegate = self;
	mPortNumTextField.delegate = self;
	
	editing = NO;
	
	[self SetIPAddress];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	NSLog(@"textFieldDidBeginEditing");
	editing = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	NSLog(@"textFieldDidEndEditing");
	editing = NO;
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	return YES;
}

-(IBAction)IPAddressChanged:(id)sender
{
	[singleton->networking SetServerIPAddress:mIPAddressTextField.text];
}

-(IBAction)PortNumChanged:(id)sender
{
	[singleton->networking SetServerPortNum:mPortNumTextField.text];
}

-(void)SetIPAddress
{
	NSLog(@"SetIPAddress called");
	mIPAddressTextField.text = [NSString stringWithFormat:@"%d.%d.%d.%d",(singleton->networking->mSendIPAddress&0xFF000000)>>24
								,(singleton->networking->mSendIPAddress&0x00FF0000)>>16
								,(singleton->networking->mSendIPAddress&0x0000FF00)>>8
								,(singleton->networking->mSendIPAddress&0x000000FF)>>0];
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",singleton->networking->mSendPortNum];
}

@end
