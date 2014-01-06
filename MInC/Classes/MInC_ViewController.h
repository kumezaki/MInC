//
//  FirstViewController.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MInC_NetworkMessages.h"

#define FLOAT_TO_MRMR_INT(v) (SInt32)(v * 1000. + 0.5)

@interface MInC_ViewController : UIViewController <UIAccelerometerDelegate> {

}
// model objects
@property (nonatomic, retain) MInC_NetworkMessages           *networking;

@end
