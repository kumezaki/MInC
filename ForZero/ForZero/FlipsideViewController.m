//
//  FlipsideViewController.m
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize delegate;
@synthesize networking;
@synthesize serverView          =_serverView;
@synthesize clientView          =_clientView;
@synthesize ipLabel             =_ipLabel;
@synthesize portLabel           =_portLabel;
@synthesize devIPLabel          =_devIPLabel;
@synthesize portNumTextField    =_portNumTextField;
@synthesize ipAddressTextField  =_ipAddressTextField;

- (void)dealloc
{
    [_serverView            release];
    [_clientView            release];
    [_ipAddressTextField    release];
    [_portNumTextField      release];
    [_devIPLabel            release];
    [_ipLabel               release];
    [_portLabel             release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (void)layoutPortraitOrientation {
    self.ipLabel.frame              = CGRectMake(20, 40, 85, 21);
    self.portLabel.frame            = CGRectMake(215, 40, 85, 21);
    self.serverView.frame           = CGRectMake(0, 44, 320, 156);
    self.clientView.frame           = CGRectMake(0, 280, 320, 200);
    self.portNumTextField.frame     = CGRectMake(215, 85, 85, 31);
    self.ipAddressTextField.frame   = CGRectMake(20, 85, 175, 31);
}
- (void)layoutLandscapeOrientation {
    self.ipLabel.frame              = CGRectMake(20, 45, 85, 21);
    self.portLabel.frame            = CGRectMake(330, 45, 85, 21);
    self.serverView.frame           = CGRectMake(0, 44, 480, 121);
    self.clientView.frame           = CGRectMake(0, 185, 480, 135);
    self.portNumTextField.frame     = CGRectMake(330, 65, 125, 31);
    self.ipAddressTextField.frame   = CGRectMake(20, 65, 260, 31);
}

- (void)viewDidLoad
{    
    [super viewDidLoad];
    
    self.serverView.layer.cornerRadius = kCornerRadius;
    self.clientView.layer.cornerRadius = kCornerRadius;
    
	self.ipAddressTextField.delegate = self;
	self.portNumTextField.delegate = self;
	
	self.ipAddressTextField.text = [NSString stringWithFormat:@"%d.%d.%d.%d"
                                ,(((NetworkConnections*)self.networking).mSendIPAddress&0xFF000000)>>24
								,(((NetworkConnections*)self.networking).mSendIPAddress&0x00FF0000)>>16
								,(((NetworkConnections*)self.networking).mSendIPAddress&0x0000FF00)>>8
								,(((NetworkConnections*)self.networking).mSendIPAddress&0x000000FF)>>0];
    
	self.portNumTextField.text = [NSString stringWithFormat:@"%d",((NetworkConnections*)self.networking).mSendPortNum];

    self.devIPLabel.text = [NSString stringWithFormat:@"%@",((NetworkConnections*)self.networking).devIP];    
}

- (void)viewWillAppear:(BOOL)animated {
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        [self layoutPortraitOrientation];
    }
	else if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
		[self layoutLandscapeOrientation];
	}
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.serverView         =nil;
    self.clientView         =nil;
    self.ipLabel            =nil;
    self.portLabel          =nil;
    self.devIPLabel         =nil;
    self.portNumTextField   =nil;
    self.ipAddressTextField =nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
										 duration:(NSTimeInterval)duration {
	
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        [self layoutPortraitOrientation];
    }
	else if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
		[self layoutLandscapeOrientation];
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
	NSArray* ip_add_array = [self.ipAddressTextField.text componentsSeparatedByString:@"."];
	
	if ([ip_add_array count] != 4)
	{
		NSLog(@"IP address must have 4 components");
		self.ipAddressTextField.text = @"";
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
	}
}

-(IBAction)PortNumChanged:(id)sender
{
#if 0
	char buffer[16];
	[self.portNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	((NetworkConnections*)self.networking).mSendPortNum = [self.portNumTextField.text intValue];
    [(NetworkConnections*)self.networking writeDataFile];
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
