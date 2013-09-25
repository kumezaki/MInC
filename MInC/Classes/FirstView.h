//
//  FirstView.h
//  MInC
//
//  Created by Kojiro Umezaki on 9/20/13.
//
//

#import <UIKit/UIKit.h>

@interface FirstView : UIView {

    IBOutlet UIButton	*NextButton;

	BOOL				WithServer;
}

@property (readwrite) BOOL NewMod;

-(void)setWithServer:(BOOL)on;

-(IBAction)SetSequence;

@end
