//
//  MainViewController.h
//  Prop Phone
//
//  Created by Chris Lavender on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DirectionsViewController.h"
#import "PropViewController.h"
#import "ControlViewController.h"
#import "SpinButton.h"


@interface MainViewController : UIViewController <PropViewControllerDelegate, ControlViewControllerDelegate>
{
    DirectionsViewController    *directions;
    PropViewController          *propView;
    ControlViewController       *controlView;
}

@property (nonatomic, retain) IBOutlet SpinButton *comedy;
@property (nonatomic, retain) IBOutlet SpinButton *tragedy;

- (IBAction)showDirections;
- (IBAction)enablePropMode;
- (IBAction)enableControlMode;

@end
