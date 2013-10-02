//
//  FirstView.h
//  MInC
//
//  Created by Kojiro Umezaki on 9/20/13.
//
//

#import <UIKit/UIKit.h>

@interface FirstView : UIView {

	IBOutlet UISlider			*mNoteDurationSlider;
	IBOutlet UIView				*mTouchView;
    
    IBOutlet UIButton	*NextButton;

	IBOutlet UIButton	*EightVbButton;
	IBOutlet UIButton	*EightVaButton;
	IBOutlet UIButton	*TwoTimesSlowButton;
	IBOutlet UIButton	*TwoTimesFastButton;
	IBOutlet UIButton	*HintButton;
	IBOutlet UIButton	*StatusButton;

	IBOutlet UISegmentedControl	*SpeakerSegControl;
	IBOutlet UISegmentedControl	*InstrSegControl;

	BOOL				WithServer;
}

@property (readwrite) BOOL NewMod;

@property (nonatomic, retain)   IBOutlet UIImageView	*mNotationView;
@property (nonatomic, retain)   IBOutlet UILabel		*mStatusLabel;

-(void)setWithServer:(BOOL)on;

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

-(IBAction)SetNoteDuration:(id)sender;

@end
