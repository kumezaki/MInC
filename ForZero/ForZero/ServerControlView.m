//
//  ServerControlView.m
//  ForZero
//
//  Created by Chris Lavender on 9/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ServerControlView.h"

#define FLOAT_TO_MRMR_INT(v) (int)(v * 1000. + 0.5)

@implementation ServerControlView

@synthesize networking=_networking;

- (void)dealloc
{
    [_networking    release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    [[NSBundle mainBundle] loadNibNamed:@"ServerControlView" owner:self options:nil];
    self = [super initWithFrame:frame];
    if (self) {
        self.viewLabel.text = @"Server";
    }
    return self;
}

- (void) awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"ServerControlView" owner:self options:nil];
    [super awakeFromNib];
    self.viewLabel.text = @"Server";
}

#pragma mark - IBActions

-(IBAction)setTransportState:(id)sender
{
	if ([sender isKindOfClass:[UIButton class]]) {
        // NSLog(@"server: %@",[[sender titleLabel]text]);
        
        if ( [[[sender titleLabel]text] isEqualToString:@"rec"]) {
            [self.networking sendOSCMsgWithIntValue:"/fz/state\0\0\0":12:0];
        }
        else if ( [[[sender titleLabel]text] isEqualToString:@"stop"] ) {
            [self.networking sendOSCMsgWithIntValue:"/fz/state\0\0\0":12:1];
        }
        else if ( [[[sender titleLabel]text] isEqualToString:@"play"] ) {
            [self.networking sendOSCMsgWithIntValue:"/fz/state\0\0\0":12:2];
        }
    }
}


-(IBAction)setEnvPeriod:(id)sender
{
	//[self.networking sendOSCMsgWithIntValue:"/fz/period\0\0":12:FLOAT_TO_MRMR_INT([mEnvPeriodSlider value])];
}

-(IBAction)setDelayLevel:(id)sender
{
	//[self.networking sendOSCMsgWithIntValue:"/fz/delay\0\0\0":12:FLOAT_TO_MRMR_INT([mDelayLevelSlider value])];
}

-(IBAction)setPan:(id)sender
{
	//[self.networking sendOSCMsgWithIntValue:"/fz/pan\0":8:FLOAT_TO_MRMR_INT([mPanSlider value])];
}

-(IBAction)setVolume:(id)sender
{
	if ([sender isKindOfClass:[UISlider class]]) {
        // NSLog(@"%f\n",[(UISlider*)sender value]);
        [self.networking sendOSCMsgWithIntValue:"/fz/vol_s\0\0\0":12:FLOAT_TO_MRMR_INT([(UISlider*)sender value])];
    }
}
@end
