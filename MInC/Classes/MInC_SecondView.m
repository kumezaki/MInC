//
//  MInC_SecondView.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_SecondView.h"

#import "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

#import "MInC_ViewController.h"
extern MInC_ViewController *gViewController;

#import "MInC_Player.h"

MInC_SecondView *gSecondView = nil;

@implementation MInC_SecondView

- (void)awakeFromNib {

	gSecondView = self;
	
	IPAddressTextField.delegate = self;
	PortNumTextField.delegate = self;
	
	Editing = NO;

	[self setIPAddressAndPortNumTextFields];
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

#if 0
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
	if (file_exists)
		[gViewController.networking readDataFile];
#endif
    
	return self;
}

- (void)dealloc {
    [super dealloc];
}

-(IBAction)switchToPlay
{
    NSLog(@"switchToPlay");
    [gViewController loadFirstView];
}

-(IBAction)setTempoSensitivity:(id)sender
{
	Float64 sense = [TempoSenseSlider value];
	NSLog(@"setTempoSensitivity %f\n",sense);

    EACH_SEQUENCER_IN_DICTIONARY_MEMBER(TempoSensitivity) = sense * sense;
}

-(IBAction)setPulseVolume:(id)sender
{
#if MINC_SECONDARY_SEQUENCER
	Float64 amp = [PulseVolSlider value];
	NSLog(@"setPulseVolume %f\n",amp);
	gAQP->Sequencer_Sec.AmpMultiplier_Control = amp * amp;
#endif
}

-(IBAction)iPAddressChanged:(id)sender
{
	[self setServerIPAddress:IPAddressTextField.text];
}

-(IBAction)portNumChanged:(id)sender
{
	[self setServerPortNum:PortNumTextField.text];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	NSLog(@"textFieldDidBeginEditing");
	Editing = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	NSLog(@"textFieldDidEndEditing");
	Editing = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
	[theTextField resignFirstResponder];
	return YES;
}

-(IBAction)withServerToggle:(id)sender
{
//	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	gFirstView.WithServer = WithServerSwitch.on;
	NSLog(@"WithServer %s\n",gFirstView.WithServer?"ON":"OFF");
}

-(IBAction)pulseToggle:(id)sender
{
#if MINC_SECONDARY_SEQUENCER
	if (PulseSwitch.on)
		[gAQP->Sequencer_Sec start];
	else
		[gAQP->Sequencer_Sec stop];
#endif
}

-(void)setIPAddressAndPortNumTextFields
{
//	NSLog(@"%lu %d",gViewController.networking.SendIPAddress,gViewController.networking.SendPortNum);

#if MINC_NETWORK_LOCAL
	IPAddressTextField.text = [NSString stringWithFormat:@"%lu.%lu.%lu.%lu",(unsigned long)((gViewController.networking.SendIPAddress&0xFF000000)>>24)
								,(unsigned long)((gViewController.networking.SendIPAddress&0x00FF0000)>>16)
								,(unsigned long)((gViewController.networking.SendIPAddress&0x0000FF00)>>8)
								,(unsigned long)((gViewController.networking.SendIPAddress&0x000000FF)>>0)];
	PortNumTextField.text = [NSString stringWithFormat:@"%d",gViewController.networking.SendPortNum];
#endif
}


-(BOOL)isEditing
{
	return Editing;
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

-(void)setServerIPAddress:(NSString *)str
{
#if MINC_NETWORK_LOCAL
	[gViewController.networking newServerIPAddress:str];
    [gViewController.networking writeDataFile];
    NSLog(@"iPAddressChanged to %08x\n",(unsigned int)gViewController.networking.SendIPAddress);
#endif
}

-(void)setServerPortNum:(NSString *)str
{
#if MINC_NETWORK_LOCAL
	gViewController.networking.SendPortNum = [str intValue];
	[gViewController.networking writeDataFile];
	NSLog(@"portNumChanged to %d\n",gViewController.networking.SendPortNum);
#endif
}

@end
