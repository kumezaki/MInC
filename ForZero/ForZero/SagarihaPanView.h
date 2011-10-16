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

	double	mX;
	double	mY;
}
@property (nonatomic, assign) id<SagarihaPanViewDelegate>delegate;
@property (nonatomic) CGPoint touchPoint;

-(double)GetX;
-(double)GetY;

-(void)Set:(double)x:(double)y;
-(void)SetVelocity:(double)x:(double)y;

@end
