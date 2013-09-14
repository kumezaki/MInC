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
	appDelegate.mSecondView = self;
	
	mEditing = NO;

	[self SetIPAddress];
	
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
	Float64 sense = [mTempoSenseSlider value];
	NSLog(@"SetTempoSensitivity %f\n",sense);
	gAQP->Sequencer_Pri->mTempoSensitivity = sense * sense;
}

-(IBAction)SetPulseVolume:(id)sender
{
	Float64 amp = [mPulseVolSlider value];
	NSLog(@"SetPulseVolume %f\n",amp);
	gAQP->Sequencer_Sec->mAmpMultiplier = amp * amp;
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

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	NSLog(@"textFieldDidBeginEditing");
	mEditing = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	NSLog(@"textFieldDidEndEditing");
	mEditing = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
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
		[gAQP->Sequencer_Sec Start];
	else
		[gAQP->Sequencer_Sec Stop];
}

-(IBAction)ChangePiece:(id)sender;
{
	gAQP->Piece = mPieceSwitch.selectedSegmentIndex + 1;
	if(gAQP->Piece == 2)
	{
		gAQP->Part= mPartSwitch.selectedSegmentIndex + 1;
		if (gAQP->Part > 2)
			gAQP->Part = 2;
	}
	if(gAQP->Piece == 3)
	{
		gAQP->Part = mPartSwitch.selectedSegmentIndex + 1;
	}
	[gAQP parseFile];
	
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	[appDelegate CreateImageArray];
}

-(void)showMenu
{
	
}

-(void)SetIPAddress;
{
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	mIPAddressTextField.text = [NSString stringWithFormat:@"%ld.%ld.%ld.%ld",(appDelegate->mSendIPAddress&0xFF000000)>>24
								,(appDelegate->mSendIPAddress&0x00FF0000)>>16
								,(appDelegate->mSendIPAddress&0x0000FF00)>>8
								,(appDelegate->mSendIPAddress&0x000000FF)>>0];
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",appDelegate->mSendPortNum];
}


-(BOOL)IsEditing
{
	return mEditing;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 0;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 0;
}

@end
