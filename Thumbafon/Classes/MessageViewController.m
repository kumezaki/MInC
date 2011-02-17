//
//  MessageViewController.m
//  Thumbafon
//
//  Created by Chris Lavender on 2/17/11.
//  Copyright 2011 Gnarly Dog Music. All rights reserved.
//

#import "MessageViewController.h"


@implementation MessageViewController
@synthesize mMsgLabel;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
		mMsgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 420, 30)];
		
		mMsgLabel.backgroundColor = [UIColor blackColor];
		
		mMsgLabel.font = [UIFont fontWithName:@"Helvetica" size: 20.0];
		
		mMsgLabel.shadowColor = [UIColor blueColor];
		
		mMsgLabel.shadowOffset = CGSizeMake(1,1);
		
		mMsgLabel.textColor = [UIColor whiteColor];
		
		mMsgLabel.textAlignment = UITextAlignmentCenter;
		
		[self addSubview:mMsgLabel];
		
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}

@end
