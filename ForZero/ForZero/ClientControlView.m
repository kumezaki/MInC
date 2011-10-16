//
//  ClientControlView.m
//  ForZero
//
//  Created by Chris Lavender on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ClientControlView.h"

@implementation ClientControlView
@synthesize aqPlayer=_aqPlayer;

- (id)initWithFrame:(CGRect)frame
{
    [[NSBundle mainBundle] loadNibNamed:@"ClientControlView" owner:self options:nil];
    self = [super initWithFrame:frame];
    if (self) {
        self.viewLabel.text = @"Your Device";
    }
    return self;

}

- (void) awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"ClientControlView" owner:self options:nil];
    [super awakeFromNib];
    self.viewLabel.text = @"Your Device";
}

- (void)dealloc
{
    [_aqPlayer release];
    [super dealloc];
}

#pragma mark- IBActions
-(IBAction)setTransportState:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        // NSLog(@"client: %@",[[sender titleLabel]text]);
        
        if ( [[[sender titleLabel]text] isEqualToString:@"rec"] ) {
            NSLog(@"client recording is not yet supported");
        }
        else if ( [[[sender titleLabel]text] isEqualToString:@"stop"] ) {
            [self.aqPlayer stop];
        }
        else if ( [[[sender titleLabel]text] isEqualToString:@"play"] ) {
            [self.aqPlayer start];
        }
    }
}

- (IBAction)setVolume:(id)sender {
    if ([sender isKindOfClass:[UISlider class]]) {
        self.aqPlayer.mAmp = ((UISlider*)sender).value;
    }
}


@end
