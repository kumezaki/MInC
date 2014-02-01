//
//  SecondView.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MInC_SecondView : UIView <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIActionSheetDelegate> {

	IBOutlet UISlider		*TempoSenseSlider;
	IBOutlet UISlider		*PulseVolSlider;
	IBOutlet UITextField	*IPAddressTextField;
	IBOutlet UITextField	*PortNumTextField;
	IBOutlet UISwitch		*PulseSwitch;
	
	BOOL	Editing;

@public
	IBOutlet UISwitch		*WithServerSwitch;
}

-(IBAction)setTempoSensitivity:(id)sender;
-(IBAction)setPulseVolume:(id)sender;

-(IBAction)iPAddressChanged:(id)sender;
-(IBAction)portNumChanged:(id)sender;

-(IBAction)withServerToggle:(id)sender;

-(IBAction)pulseToggle:(id)sender;

-(void)setIPAddress;

-(BOOL)isEditing;

#if 0
-(void)setServerIPAddress:(NSString *)str;
#endif
-(void)setServerPortNum:(NSString *)str;

+(NSString *)dataFilePath;
-(void) readDataFile;
-(void) writeDataFile;

@end
