//
//  MInC_FirstView.h
//  MInC
//
//  Created by Kojiro Umezaki on 9/20/13.
//
//

#import <UIKit/UIKit.h>

@interface MInC_FirstView : UIView {

	IBOutlet UISlider	*NoteDurationSlider;
	IBOutlet UIView		*TouchView;
    
    IBOutlet UIButton	*NextButton;

	IBOutlet UIButton	*EightVbButton;
	IBOutlet UIButton	*EightVaButton;
	IBOutlet UIButton	*TwoTimesSlowButton;
	IBOutlet UIButton	*TwoTimesFastButton;
	IBOutlet UIButton	*HintButton;
	IBOutlet UIButton	*SettingsButton;
	IBOutlet UIButton	*StatusButton;

	IBOutlet UISegmentedControl	*SpeakerSegControl;
	IBOutlet UISegmentedControl	*InstrSegControl;
    
    IBOutlet UIImageView    *LogoImageView;
}

@property (readwrite) BOOL NewMod;
@property (readwrite) BOOL WithServer;

@property (nonatomic, retain)   IBOutlet UIImageView	*NotationView;
@property (nonatomic, retain)   IBOutlet UILabel		*StatusLabel;

@property (nonatomic, retain)   NSArray					*ImageArray;

@property (nonatomic, retain)   NSString				*InterstitialString;
@property (nonatomic, retain)   NSString				*ServerIPAddString;

-(IBAction)switchToSettings;

-(IBAction)setSequence;

-(IBAction)set8vbDown:(id)sender;
-(IBAction)set8vbUp:(id)sender;
-(void)send8vb:(BOOL)direction;

-(IBAction)set8vaDown:(id)sender;
-(IBAction)set8vaUp:(id)sender;
-(void)send8va:(BOOL)direction;

-(IBAction)set2xSlowDown:(id)sender;
-(IBAction)set2xSlowUp:(id)sender;
-(void)send2xSlow:(BOOL)direction;

-(IBAction)set2xFastDown:(id)sender;
-(IBAction)set2xFastUp:(id)sender;
-(void)send2xFast:(BOOL)direction;

-(IBAction)requestHint:(id)sender;
-(IBAction)requestStatus:(id)sender;

-(IBAction)setSpeaker:(id)sender;
-(IBAction)setInstrument:(id)sender;

-(IBAction)setNoteDuration:(id)sender;

-(void)sendOSC_Filter:(Float64)val;
-(void)sendOSC_Volume:(Float64)val;
-(void)sendOSC_Waveform:(Float64)val;

-(void) createImageArray;

-(void)checkIncomingMessages;

-(void)heartBeat;

@end
