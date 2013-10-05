//
//  SecondView.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SecondView : UIView <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIActionSheetDelegate> {

	IBOutlet UISlider		*mTempoSenseSlider;
	IBOutlet UISlider		*mPulseVolSlider;
	IBOutlet UITextField	*mIPAddressTextField;
	IBOutlet UITextField	*mPortNumTextField;
	IBOutlet UISwitch		*mWithServerSwitch;
	IBOutlet UISwitch		*mPulseSwitch;
	
	IBOutlet UISegmentedControl *mPieceSwitch;
	IBOutlet UISegmentedControl *mPartSwitch;
	
	IBOutlet UITextField *mPiece;
	IBOutlet UITextField *mPart;
	UIActionSheet *menu;

	BOOL	mEditing;
}

-(IBAction)SetTempoSensitivity:(id)sender;
-(IBAction)SetPulseVolume:(id)sender;

-(IBAction)IPAddressChanged:(id)sender;
-(IBAction)PortNumChanged:(id)sender;

-(IBAction)WithServerToggle:(id)sender;

-(IBAction)PulseToggle:(id)sender;

-(IBAction)ChangePiece:(id)sender;

-(IBAction)showMenu;

-(void)SetIPAddress;

-(BOOL)IsEditing;

-(void)setServerIPAddress:(NSString *)str;
-(void)setServerPortNum:(NSString *)str;

+(NSString *)dataFilePath;
-(void) readDataFile;
-(void) writeDataFile;

@end
