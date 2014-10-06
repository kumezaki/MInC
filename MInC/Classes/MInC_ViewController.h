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

@interface MInC_URL : NSObject<NSURLConnectionDelegate> {
    NSMutableData*      Data;
    NSURLConnection*    Conn;
}
@end

@interface MInC_URL_PlayerList : MInC_URL
@end

@interface MInC_URL_SetPlayerParam : MInC_URL { const char* ParamName; }
-(void)setParam:(const char*)param_name withValue:(SInt16)val;
@end

@interface MInC_ViewController : UIViewController <UIAccelerometerDelegate,UIPickerViewDelegate,NSURLConnectionDelegate> {
    
    IBOutlet UIImageView* viewA;
    IBOutlet UIImageView* viewB;
    
    NSMutableArray* scoreListArray;
    UIPickerView*   scoreListPickerView;
    UIToolbar*      pickerViewToolBar;
    
    SInt16 PrevX;
    SInt16 PrevY;
    SInt16 PrevZ;
    SInt16 IndexTempo;
    SInt16 IndexOctave;
    SInt16 IndexMute;

    MInC_URL_PlayerList*        URL_PlayerList;
    MInC_URL_SetPlayerParam*    URL_SetPlayerPos;
    MInC_URL_SetPlayerParam*    URL_SetPlayerSpeed;
    MInC_URL_SetPlayerParam*    URL_SetPlayerOctave;
    MInC_URL_SetPlayerParam*    URL_SetPlayerMute;
    MInC_URL_SetPlayerParam*    URL_SetPlayerLike;
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
