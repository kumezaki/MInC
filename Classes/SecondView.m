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
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];

	[appDelegate SetServerIPAddress:mIPAddressTextField.text];
}

-(IBAction)PortNumChanged:(id)sender
{
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	
	[appDelegate SetServerPortNum:mPortNumTextField.text];
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
