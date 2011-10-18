//
//  MeterView.h
//  ForZero
//
//  Created by Chris Lavender on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeterView;
@protocol MeterViewDelegate
- (float)floatValueForMeterView:(MeterView*)requestor;
@end

@interface MeterView : UIView
@property (nonatomic, assign) id<MeterViewDelegate> delegate;
@end
