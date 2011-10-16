//
//  ProgressBarView.h
//  ForZero
//
//  Created by Chris Lavender on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@class ProgressBarView;
@protocol ProgressBarViewDelegate
- (float)progressValueForProgressBarView:(ProgressBarView *)requestor;
@end

@interface ProgressBarView : UIView {
    
}
@property (nonatomic, assign) id <ProgressBarViewDelegate> delegate;

@end
