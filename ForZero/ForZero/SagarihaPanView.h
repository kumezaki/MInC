//
//  SagarihaPanView.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 10/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@class SagarihaPanView;

@protocol SagarihaPanViewDelegate
- (void)panViewTouchPadValuesDidChange:(SagarihaPanView*)requestor;
@end

@interface SagarihaPanView : UIView {

	Float64	x;
	Float64	y;
    
    BOOL    enabled;
    
}

@property (nonatomic, assign) id<SagarihaPanViewDelegate>delegate;
@property (nonatomic) CGPoint touchPoint;
@property (nonatomic) BOOL enabled;

-(void)doTouch:(NSSet *)touches withEvent:(UIEvent *)event;

/*
// old methods to work with accelerometer
-(double)GetX;
-(double)GetY;

-(void)Set:(double)x:(double)y;
-(void)SetVelocity:(double)x:(double)y;
*/

@end
