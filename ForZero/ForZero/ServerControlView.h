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
#import "SagarihaPanView.h"

@interface ServerControlView : ControlView <UIAccelerometerDelegate, SagarihaPanViewDelegate> {
    IBOutlet UIButton* flipButton;
    
}

@property (nonatomic, retain) NetworkMessages           *networking;
@property (nonatomic, retain) IBOutlet UIButton         *flipButton;
@property (nonatomic, retain) IBOutlet UISlider         *panSlider;
@property (nonatomic, retain) IBOutlet SagarihaPanView  *panView;

- (IBAction)setPanX:(id)sender;
- (IBAction)setPanY:(id)sender;
- (IBAction)setEnvPeriod:(id)sender;
- (IBAction)setDelayLevel:(id)sender;

@end
