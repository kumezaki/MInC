//
//  DirectionsViewController.h
//  Prop Phone
//
//  Created by Chris Lavender on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DirectionsViewController : UIViewController <UIWebViewDelegate>{
    UIWebView *webView;
}
- (IBAction)done;

@end
