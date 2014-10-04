//
//  FirstViewController.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MINC_ACCELLEROMETER 1
#define MINC_NETWORK_LOCAL  0

#import "MInC_NetworkMessages.h"

#import "MInC_FirstView.h"
#import "MInC_SecondView.h"

#define FLOAT_TO_MRMR_INT(v) (SInt32)(v * 1000. + (v < 0 ? -0.5 : 0.5))

@interface MInC_ViewController : UIViewController <UIAccelerometerDelegate,UIPickerViewDelegate> {
    
    IBOutlet UIImageView* viewA;
    IBOutlet UIImageView* viewB;
    
    NSMutableArray* scoreListArray;
    UIPickerView*   scoreListPickerView;
    UIToolbar*      pickerViewToolBar;
    
    SInt16 PrevX;
    SInt16 PrevY;
    SInt16 PrevZ;
    SInt16 IndexTempo;
    SInt16 IndexSpeed;
    SInt16 IndexMute;
}

#if MINC_NETWORK_LOCAL
// model objects
@property (nonatomic, retain) MInC_NetworkMessages* networking;
#endif

@property (nonatomic, retain) IBOutlet MInC_FirstView*  firstView;
@property (nonatomic, retain) IBOutlet MInC_SecondView* secondView;

-(void) loadFirstView;
-(void) loadSecondView;

- (void)setPlayerEnd;
- (void)setPlayerPos:(SInt16)pos;
- (void)setPlayerSpeed:(SInt16)pos;
- (void)setPlayerOctave:(SInt16)pos;
- (void)setPlayerMute:(SInt16)pos;
- (void)setPlayerLike:(SInt16)pos;

@end
