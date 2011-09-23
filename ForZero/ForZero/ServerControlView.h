//
//  ServerControlView.h
//  ForZero
//
//  Created by Chris Lavender on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ServerControlView;

@protocol ServerControlViewDelegate
- (float)recordProgressForServerView:(ServerControlView *)requestor;  // -1.0 (frown) to 1.0 (smile)
@end

@interface ServerControlView : UIView {
    
}

@property (assign) id <ServerControlViewDelegate> delegate;

@end
