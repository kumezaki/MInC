//
//  InterstitialMessageView.h
//  ForZero
//
//  Created by Chris Lavender on 9/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InterstitialMessageView;

@protocol InterstitialMessageViewDelegate
- (void) interstitialViewDidFinish:(InterstitialMessageView *)interstitialView;
@end

@interface InterstitialMessageView : UIView {
    
    UILabel     *label;
    UIImageView *image;
    UIButton    *backButton;
    
    NSArray     *mImageArray;
}
@property (nonatomic, assign) id<InterstitialMessageViewDelegate> delegate;

@property (nonatomic, retain) NSString* msg;

- (IBAction) done;

- (void) displayText;
- (void) displayImage:(int)image_pos;

@end
