//
//  FlipsideViewController.m
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize delegate;
@synthesize networking;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    
	mIPAddressTextField.delegate = self;
	mPortNumTextField.delegate = self;
	
	mIPAddressTextField.text = [NSString stringWithFormat:@"%d.%d.%d.%d"
                                ,(((NetworkConnections*)self.networking).mSendIPAddress&0xFF000000)>>24
								,(((NetworkConnections*)self.networking).mSendIPAddress&0x00FF0000)>>16
								,(((NetworkConnections*)self.networking).mSendIPAddress&0x0000FF00)>>8
								,(((NetworkConnections*)self.networking).mSendIPAddress&0x000000FF)>>0];
    
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",((NetworkConnections*)self.networking).mSendPortNum];
    
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor]; 
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (
        (interfaceOrientation == UIInterfaceOrientationPortrait) ||
        (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) ||
        (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
        (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        )
	{
		return YES;
	}
	else
	{
		return NO;
	}

}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
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
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		((NetworkConnections*)self.networking).mSendIPAddress = ip_add;
		[(NetworkConnections*)self.networking writeDataFile];
		NSLog(@"IPAddressChanged to %08lx\n",((NetworkConnections*)self.networking).mSendIPAddress);
	}
}

-(IBAction)PortNumChanged:(id)sender
{
#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	((NetworkConnections*)self.networking).mSendPortNum = [mPortNumTextField.text intValue];
    [(NetworkConnections*)self.networking writeDataFile];
	NSLog(@"PortNumChanged to %d\n",self.networking.mSendPortNum);
}

-(IBAction)ForZero_Start:(id)sender
{
    [self.networking sendOSCMsg:"/fz/start\0\0\0":12];    
}

-(IBAction)ForZero_Subtract:(id)sender
{
	[self.networking sendOSCMsg:"/fz/sub\0":8];
}

-(IBAction)ForZero_Stop:(id)sender
{    
	[self.networking sendOSCMsg:"/fz/stop\0\0\0\0":12];
}

-(IBAction)ForZero_Panic:(id)sender
{
	[self.networking sendOSCMsg:"/fz/panic\0\0\0":12];
}

@end
