//
//  MInC_TouchView.h
//  MInC
//
//  Created by Kojiro Umezaki on 5/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MInC_Sequencer.h"

#define MAX_NUM_TOUCHES	2

@interface MInC_TouchView : UIView {

	Float64     X[MAX_NUM_TOUCHES];
	Float64     Y[MAX_NUM_TOUCHES];
	
	UITouch*	Touch[MAX_NUM_TOUCHES];
    
    UIView*     AnimationView;

    NSMutableArray*    PlayerPosArray;
    
    IBOutlet UIButton*  LikeButton;
}

-(void)processTouch:(NSSet *)touches;
-(void)updateCoordinates:(SInt32)a_index :(SInt32)b_index;

-(IBAction)doLike;

@end
