//
//  SecondView.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SecondView.h"

#import "AQPlayer.h"
#import "FirstView.h"
#import "MInCAppDelegate.h"

extern AQPlayer *gAQP;
extern FirstView *gFirstView;

@implementation SecondView

- (void)awakeFromNib {

	mIPAddressTextField.delegate = self;
	mPortNumTextField.delegate = self;
	
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	appDelegate.SecondView = self;
	
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
	gAQP->Sequencer_Pri->TempoSensitivity = sense * sense;
}

-(IBAction)SetPulseVolume:(id)sender
{
	Float64 amp = [mPulseVolSlider value];
	NSLog(@"SetPulseVolume %f\n",amp);
	gAQP->Sequencer_Sec->AmpMultiplier = amp * amp;
}

-(IBAction)IPAddressChanged:(id)sender
{
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];

	[appDelegate setServerIPAddress:mIPAddressTextField.text];
}

-(IBAction)PortNumChanged:(id)sender
{
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	
	[appDelegate setServerPortNum:mPortNumTextField.text];
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
//	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	[gFirstView setWithServer:mWithServerSwitch.on];
}

-(IBAction)PulseToggle:(id)sender;
{
	if (mPulseSwitch.on)
		[gAQP->Sequencer_Sec start];
	else
		[gAQP->Sequencer_Sec stop];
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
	[appDelegate createImageArray];
}

-(void)showMenu
{
	
}

-(void)SetIPAddress;
{
	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	mIPAddressTextField.text = [NSString stringWithFormat:@"%ld.%ld.%ld.%ld",(appDelegate->SendIPAddress&0xFF000000)>>24
								,(appDelegate->SendIPAddress&0x00FF0000)>>16
								,(appDelegate->SendIPAddress&0x0000FF00)>>8
								,(appDelegate->SendIPAddress&0x000000FF)>>0];
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",appDelegate->SendPortNum];
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
