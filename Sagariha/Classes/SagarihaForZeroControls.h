//
//  SagarihaForZeroControls.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SagarihaForZeroControls : NSObject {

	IBOutlet UIButton			*mStartButton;
	IBOutlet UIButton			*mSubtractButton;
	IBOutlet UIButton			*mStopButton;
	IBOutlet UIButton			*mPanicButton;
}

-(IBAction)ForZero_Start:(id)sender;
-(IBAction)ForZero_Subtract:(id)sender;
-(IBAction)ForZero_Stop:(id)sender;
-(IBAction)ForZero_Panic:(id)sender;

@end
