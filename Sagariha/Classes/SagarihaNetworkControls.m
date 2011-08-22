//
//  SagarihaNetworkControls.m
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SagarihaNetworkControls.h"

#import "SagarihaNetworking.h"
#import "SagarihaSingleton.h"

extern SagarihaNetworking* networking;
extern SagarihaSingleton* singleton;

@implementation SagarihaNetworkControls

-(void)awakeFromNib
{
	NSLog(@"SagarihaNetworkControls awakeFromNib");

	mIPAddressTextField.delegate = self;
	mPortNumTextField.delegate = self;
	
	mIPAddressTextField.text = [NSString stringWithFormat:@"%d.%d.%d.%d",(networking->mSendIPAddress&0xFF000000)>>24
								,(networking->mSendIPAddress&0x00FF0000)>>16
								,(networking->mSendIPAddress&0x0000FF00)>>8
								,(networking->mSendIPAddress&0x000000FF)>>0];
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",networking->mSendPortNum];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	return YES;
}

-(IBAction)IPAddressChanged:(id)sender
{
	NSArray* ip_add_array = [mIPAddressTextField.text componentsSeparatedByString:@"."];
	
	if ([ip_add_array count] != 4)
	{
		NSLog(@"IP address must have 4 components");
		mIPAddressTextField.text = @"";
	}
	else
	{
		int i = 0;
		UInt32 ip_add = 0;
		for (NSString* s in ip_add_array)
		{
#if 0
			NSLog([NSString stringWithFormat:@"s=%@", s]);
#endif
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		networking->mSendIPAddress = ip_add;
		[singleton writeDataFile];
		NSLog(@"IPAddressChanged to %08lx\n",networking->mSendIPAddress);
	}
}

-(IBAction)PortNumChanged:(id)sender
{
#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	networking->mSendPortNum = [mPortNumTextField.text intValue];
	[singleton writeDataFile];
	NSLog(@"PortNumChanged to %d\n",networking->mSendPortNum);
}

@end
