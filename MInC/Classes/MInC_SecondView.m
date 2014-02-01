//
//  SecondView.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_SecondView.h"

#import "MInC_AppDelegate.h"

#import "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

#import "MInC_ViewController.h"
extern MInC_ViewController *gViewController;

MInC_SecondView *gSecondView = nil;

@implementation MInC_SecondView

- (void)awakeFromNib {

	gSecondView = self;
	
	IPAddressTextField.delegate = self;
	PortNumTextField.delegate = self;
	
	Editing = NO;
    
	[self setIPAddress];
	
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

-(IBAction)setTempoSensitivity:(id)sender
{
	Float64 sense = [TempoSenseSlider value];
	NSLog(@"setTempoSensitivity %f\n",sense);
	gAQP->Sequencer_Pri.TempoSensitivity = sense * sense;
}

-(IBAction)setPulseVolume:(id)sender
{
	Float64 amp = [PulseVolSlider value];
	NSLog(@"setPulseVolume %f\n",amp);
	gAQP->Sequencer_Sec.AmpMultiplier_Control = amp * amp;
}

-(IBAction)iPAddressChanged:(id)sender
{
	[gViewController.networking newServerIPAddress:IPAddressTextField.text];
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

-(IBAction)withServerToggle:(id)sender;
{
//	MInCAppDelegate *appDelegate = (MInCAppDelegate*)[[UIApplication sharedApplication] delegate];
	gFirstView.WithServer = WithServerSwitch.on;
	NSLog(@"WithServer %s\n",gFirstView.WithServer?"ON":"OFF");
}

-(IBAction)pulseToggle:(id)sender;
{
	if (PulseSwitch.on)
		[gAQP->Sequencer_Sec start];
	else
		[gAQP->Sequencer_Sec stop];
}

-(void)setIPAddress;
{
	IPAddressTextField.text = [NSString stringWithFormat:@"%ld.%ld.%ld.%ld",(gViewController.networking.SendIPAddress&0xFF000000)>>24
								,(gViewController.networking.SendIPAddress&0x00FF0000)>>16
								,(gViewController.networking.SendIPAddress&0x0000FF00)>>8
								,(gViewController.networking.SendIPAddress&0x000000FF)>>0];
	PortNumTextField.text = [NSString stringWithFormat:@"%d",gViewController.networking.SendPortNum];
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

#if 0
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
		NSLog(@"iPAddressChanged to %08lx\n",gViewController.networking.SendIPAddress);
	}
	
}
#endif

-(void)setServerPortNum:(NSString *)str
{
#if 0
	char buffer[16];
	[PortNumTextField.text getCString:buffer maxLength:16 encoding:NSASCIIStringEncoding];
#endif
	
	gViewController.networking.SendPortNum = [str intValue];
	[self writeDataFile];
	NSLog(@"portNumChanged to %d\n",gViewController.networking.SendPortNum);
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
	NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[MInC_SecondView dataFilePath]];
	NSLog(@"%@",[MInC_SecondView dataFilePath]);
	gViewController.networking.SendIPAddress = [[dict valueForKey:@"server_ip_address"] unsignedIntValue];
	gViewController.networking.SendPortNum = [[dict valueForKey:@"server_port_num"] unsignedIntValue];
	NSLog(@"%ld %d",gViewController.networking.SendIPAddress,gViewController.networking.SendPortNum);
}

-(void)writeDataFile
{
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	[dict setValue:[NSNumber numberWithUnsignedInt:gViewController.networking.SendIPAddress] forKey:@"server_ip_address"];
	[dict setValue:[NSNumber numberWithUnsignedInt:gViewController.networking.SendPortNum] forKey:@"server_port_num"];
	[dict writeToFile:[MInC_SecondView dataFilePath] atomically:YES];
	[dict release];
}

@end
