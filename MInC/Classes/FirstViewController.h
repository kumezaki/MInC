//
//  FirstViewController.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NetworkMessages.h"

#define FLOAT_TO_MRMR_INT(v) (SInt32)(v * 1000. + 0.5)

@interface FirstViewController : UIViewController <UIAccelerometerDelegate> {

}
// model objects
@property (nonatomic, retain) NetworkMessages           *networking;

@end
