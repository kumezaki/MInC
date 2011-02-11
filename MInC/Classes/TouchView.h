//
//  TouchView.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Sequencer.h"

#define MAX_NUM_TOUCHES	2

@interface TouchView : UIView {

	double	mX[MAX_NUM_TOUCHES];
	double	mY[MAX_NUM_TOUCHES];
	
	UITouch*	mTouch[MAX_NUM_TOUCHES];
}

-(void)ProcessTouch:(NSSet *)touches;
-(void)UpdateCoordinates:(int)a_index:(int)b_index;

@end
