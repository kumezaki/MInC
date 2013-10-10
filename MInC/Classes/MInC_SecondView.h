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
	IBOutlet UISwitch		*WithServerSwitch;
	IBOutlet UISwitch		*PulseSwitch;
	
	IBOutlet UISegmentedControl *PieceSwitch;
	IBOutlet UISegmentedControl *PartSwitch;
	
	IBOutlet UITextField *Piece;
	IBOutlet UITextField *Part;

	BOOL	Editing;
}

-(IBAction)setTempoSensitivity:(id)sender;
-(IBAction)setPulseVolume:(id)sender;

-(IBAction)iPAddressChanged:(id)sender;
-(IBAction)portNumChanged:(id)sender;

-(IBAction)withServerToggle:(id)sender;

-(IBAction)pulseToggle:(id)sender;

-(IBAction)changePiece:(id)sender;

-(IBAction)showMenu;

-(void)setIPAddress;

-(BOOL)isEditing;

-(void)setServerIPAddress:(NSString *)str;
-(void)setServerPortNum:(NSString *)str;

+(NSString *)dataFilePath;
-(void) readDataFile;
-(void) writeDataFile;

@end
