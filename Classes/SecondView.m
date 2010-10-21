//
//  SecondView.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SecondView.h"

#import "AQPlayer.h"
#import "MInCAppDelegate.h"

extern AQPlayer *gAQP;

@implementation SecondView

- (void)awakeFromNib {

	mIPAddressTextField.delegate = self;
	mPortNumTextField.delegate = self;
	
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	mIPAddressTextField.text = [NSString stringWithFormat:@"%d.%d.%d.%d",(appDelegate->mSendIPAddress&0xFF000000)>>24
																		,(appDelegate->mSendIPAddress&0x00FF0000)>>16
																		,(appDelegate->mSendIPAddress&0x0000FF00)>>8
																		,(appDelegate->mSendIPAddress&0x000000FF)>>0];
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",appDelegate->mSendPortNum];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (id)init {
	[super init];
	
	return self;
}

- (void)dealloc {
    [super dealloc];
}

-(IBAction)SetTempoSensitivity:(id)sender
{
	double sense = [mTempoSenseSlider value];
	printf("SetTempoSensitivity %f\n",sense);
	gAQP->mSequencer_Pri->mTempoSensitivity = sense * sense;
}

-(IBAction)SetPulseVolume:(id)sender
{
	double amp = [mPulseVolSlider value];
	printf("SetPulseVolume %f\n",amp);
	gAQP->mSequencer_Sec->mAmpMultiplier = amp * amp;
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
		MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];

		int i = 0;
		UInt32 ip_add = 0;
		for (NSString* s in ip_add_array)
		{
#if 0
			NSLog([NSString stringWithFormat:@"s=%@", s]);
#endif
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		appDelegate->mSendIPAddress = ip_add;
		[appDelegate writeDataFile];
		printf("IPAddressChanged to %08x\n",appDelegate->mSendIPAddress);
	}
}

-(IBAction)PortNumChanged:(id)sender
{
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];

#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	appDelegate->mSendPortNum = [mPortNumTextField.text intValue];
	[appDelegate writeDataFile];
	printf("PortNumChanged to %d\n",appDelegate->mSendPortNum);
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	return YES;
}

-(IBAction)WithServerToggle:(id)sender;
{
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appDelegate SetWithServer:mWithServerSwitch.on];
}

-(IBAction)PulseToggle:(id)sender;
{
	if (mPulseSwitch.on)
		[gAQP->mSequencer_Sec Start];
	else
		[gAQP->mSequencer_Sec Stop];
}

@end
