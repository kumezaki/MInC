//
//  FirstViewController.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NetworkMessages.h"

@interface FirstViewController : UIViewController <UIAccelerometerDelegate> {

}
// model objects
@property (nonatomic, retain) NetworkMessages           *networking;

@end
