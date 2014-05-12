//
//  TouchView.h
//  SimpleSynth
//
//  Created by Kojiro Umezaki on 12/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TouchView : UIView {

	Float64 mFreq_Default;
	Float64 mFreq;
	Float64 mFreq_Delta;
	
	Float64 mX;

	Float64 mTouchX_Start;
	Float64 mTouchY_Start;
	
	UInt16	mSFPos;
}

-(void)UpdatePosition;

-(void)SetSoundFilePos:(UInt16)pos;

@end
