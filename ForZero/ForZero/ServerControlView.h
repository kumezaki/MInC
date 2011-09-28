//
//  ServerControlView.h
//  ForZero
//
//  Created by Chris Lavender on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControlView.h"
#import "NetworkMessages.h"

@interface ServerControlView : ControlView {
    
}
@property (nonatomic, retain) NetworkMessages   *networking;
@property (nonatomic, retain) IBOutlet UISlider *panSlider;

- (IBAction)setPan:         (id)sender;
- (IBAction)setEnvPeriod:   (id)sender;
- (IBAction)setDelayLevel:  (id)sender;

@end
