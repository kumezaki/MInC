//
//  FirstViewController.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MInC_NetworkMessages.h"

#import "MInC_FirstView.h"
#import "MInC_SecondView.h"

#define FLOAT_TO_MRMR_INT(v) (SInt32)(v * 1000. + 0.5)

@interface MInC_ViewController : UIViewController <UIAccelerometerDelegate> {

}
// model objects
@property (nonatomic, retain) MInC_NetworkMessages* networking;

@property (nonatomic, retain) IBOutlet MInC_FirstView*  firstView;
@property (nonatomic, retain) IBOutlet MInC_SecondView* secondView;

-(void) loadFirstView;
-(void) loadSecondView;

@end
