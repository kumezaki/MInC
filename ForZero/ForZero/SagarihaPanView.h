//
//  SagarihaPanView.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 10/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SagarihaPanView : UIView {

	double	mX;
	double	mY;
    
    double	mXX;
	double	mYY;
    
}

-(double)GetX;
-(double)GetY;

-(void)Set:(double)x:(double)y;
-(void)SetVelocity:(double)x:(double)y;

@end
