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

	Float64	mX[MAX_NUM_TOUCHES];
	Float64	mY[MAX_NUM_TOUCHES];
	
	UITouch*	mTouch[MAX_NUM_TOUCHES];
}

-(void)ProcessTouch:(NSSet *)touches;
-(void)UpdateCoordinates:(SInt32)a_index :(SInt32)b_index;

@end
