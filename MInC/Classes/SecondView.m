//
//  SecondView.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SecondView.h"

#import "MInCAppDelegate.h"

#import "AQPlayer.h"
extern AQPlayer *gAQP;

#import "FirstView.h"
extern FirstView *gFirstView;

#import "FirstViewController.h"
extern FirstViewController *gViewController;

SecondView *gSecondView = nil;

@implementation SecondView

- (void)awakeFromNib {

	mIPAddressTextField.delegate = self;
	mPortNumTextField.delegate = self;
	
	gSecondView = self;
	
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
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"]];
	NSLog(file_exists?@"exists":@"does not exist");
    //	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"] error:NULL];
	if (file_exists)
		[self readDataFile];
    
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
	[self setServerIPAddress:mIPAddressTextField.text];
}

-(IBAction)PortNumChanged:(id)sender
{
	[self setServerPortNum:mPortNumTextField.text];
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
	
	[gFirstView createImageArray];
}

-(void)showMenu
{
	
}

-(void)SetIPAddress;
{
	mIPAddressTextField.text = [NSString stringWithFormat:@"%ld.%ld.%ld.%ld",(gViewController.networking.SendIPAddress&0xFF000000)>>24
								,(gViewController.networking.SendIPAddress&0x00FF0000)>>16
								,(gViewController.networking.SendIPAddress&0x0000FF00)>>8
								,(gViewController.networking.SendIPAddress&0x000000FF)>>0];
	mPortNumTextField.text = [NSString stringWithFormat:@"%d",gViewController.networking.SendPortNum];
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

-(void)setServerIPAddress:(NSString *)str
{
	NSArray* ip_add_array = [str componentsSeparatedByString:@"."];
	
	if ([ip_add_array count] != 4)
	{
		NSLog(@"IP address must have 4 components");
		return;
	}
	else
	{
		SInt32 i = 0;
		UInt32 ip_add = 0;
		for (NSString* s in ip_add_array)
		{
#if 0
			NSLog([NSString stringWithFormat:@"s=%@", s]);
#endif
			ip_add |= [s intValue] << (8 * (4 - ++i));
		}
		gViewController.networking.SendIPAddress = ip_add;
		[self writeDataFile];
		NSLog(@"IPAddressChanged to %08lx\n",gViewController.networking.SendIPAddress);
	}
	
}

-(void)setServerPortNum:(NSString *)str
{
#if 0
	char buffer[16];
	[mPortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	gViewController.networking.SendPortNum = [str intValue];
	[self writeDataFile];
	NSLog(@"PortNumChanged to %d\n",gViewController.networking.SendPortNum);
}

#pragma mark - data file

+(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
	return [docDirectory stringByAppendingPathComponent:@"MInC.dat"];
#if 0
	/* to delete the file */
	[fileManager removeItemAtPath:[docDirectory stringByAppendingPathComponent:@"MInC.dat"] error:NULL];
#endif
}

-(void)readDataFile
{
	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[SecondView dataFilePath]];
	NSLog(@"%@",[SecondView dataFilePath]);
	gViewController.networking.SendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	gViewController.networking.SendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%ld %d",gViewController.networking.SendIPAddress,gViewController.networking.SendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:gViewController.networking.SendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:gViewController.networking.SendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[SecondView dataFilePath] atomically:YES];
	[dict release];
}

@end
