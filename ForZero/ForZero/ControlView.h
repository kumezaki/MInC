//
//  ControlView.h
//  ForZero
//
//  Created by Chris Lavender on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h> //for animated transitions & cornerRadius property
#import "NetworkMessages.h"
#import "ProgressBarView.h"

@class ControlView;
@protocol ControlViewDelegate
- (float)progressValueForControlView:(ControlView *)requestor;
@end

@interface ControlView : UIView <ProgressBarViewDelegate> {

}
@property (nonatomic, assign) id <ControlViewDelegate> delegate;

@property (nonatomic, retain) IBOutlet ProgressBarView   *frontView;
@property (nonatomic, retain) IBOutlet UIView            *flipView;
@property (nonatomic, retain)          UIView            *currentDisplayedView;

@property (nonatomic, retain) IBOutlet UIButton *recButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UILabel  *viewLabel;
@property (nonatomic, retain) IBOutlet UISlider *volumerSlider;


- (IBAction)flipServerControls: (id)sender;

- (IBAction)setTransportState:  (id)sender;
- (IBAction)setVolume:          (id)sender;

- (void)updateFrameSize:(CGRect)frame;
- (void)displayProgress;

@end
