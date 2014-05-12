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

@synthesize networking  =_networking;
@synthesize flipButton  =_flipButton;
@synthesize panSlider   =_panSlider;
@synthesize panView     =_panView;

- (void)dealloc
{
    [_networking    release];
    [_flipButton    release];
    [_panView       release];
    [_panSlider     release];
    [super dealloc];
}

- (void)setup {
    /*
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[UIAccelerometer sharedAccelerometer].updateInterval = 0.1;
     */
    self.viewLabel.text = @"The Server";
    self.panView.delegate = self;
}

- (id)initWithFrame:(CGRect)frame
{
    [[NSBundle mainBundle] loadNibNamed:@"ServerControlView" owner:self options:nil];
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [[NSBundle mainBundle] loadNibNamed:@"ServerControlView" owner:self options:nil];
    [super awakeFromNib];
    [self setup];
 }

#pragma mark - IBActions

-(IBAction)setTransportState:(id)sender
{
	if ([sender isKindOfClass:[UIButton class]]) {
//        NSLog(@"server: %@",[[sender titleLabel]text]);
        
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

-(IBAction)setPanX:(id)sender
{
    float panVal = 0.0;
    if ([sender isKindOfClass:[UISlider class]]) {
        panVal = [(UISlider*)sender value];
    }
    else if ([sender isKindOfClass:[NSNumber class]]) {
        panVal = [(NSNumber*)sender floatValue];
    }
    [self.networking sendOSCMsgWithIntValue:"/fz/panx\0\0\0\0":12:FLOAT_TO_MRMR_INT(panVal)];
}

-(IBAction)setPanY:(id)sender
{
    float panVal = 0.0;
    if ([sender isKindOfClass:[UISlider class]]) {
        panVal = [(UISlider*)sender value];
    }
    else if ([sender isKindOfClass:[NSNumber class]]) {
        panVal = [(NSNumber*)sender floatValue];
    }
    [self.networking sendOSCMsgWithIntValue:"/fz/pany\0\0\0\0":12:FLOAT_TO_MRMR_INT(panVal)];
}

-(IBAction)setVolume:(id)sender
{
	if ([sender isKindOfClass:[UISlider class]]) {
        // NSLog(@"%f\n",[(UISlider*)sender value]);
        [self.networking sendOSCMsgWithIntValue:"/fz/vol_s\0\0\0":12:FLOAT_TO_MRMR_INT([(UISlider*)sender value])];
    }
}

#pragma mark - SagarihaPanView Method Implementations

- (void)panViewTouchPadValuesDidChange:(SagarihaPanView *)requestor
{
    float x = requestor.touchPoint.x / self.panView.bounds.size.width;
    float y = requestor.touchPoint.y / self.panView.bounds.size.height;
    
    [self setPanX:[NSNumber numberWithFloat:x]];
    [self setPanY:[NSNumber numberWithFloat:y]];
}

#pragma mark - UIAccelerometerDelegate Method Implementations

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
/*    
#if 0
	NSLog(@"%f, %f, %f\n", acceleration.x, acceleration.y, acceleration.z);
#endif
	
#define LIMIT_ACC_VAL(n)	n < -1. ? -1. : n > 1. ? 1. : n
	
	float x = LIMIT_ACC_VAL(acceleration.x);
	float y = LIMIT_ACC_VAL(acceleration.y+0.35);
    //float z = LIMIT_ACC_VAL(acceleration.z);
	
	//	[mPanView Set:(x+1.)/2:1.-((y+1.)/2)];
	[self.panView SetVelocity:x:-y];
	[self.panView setNeedsDisplay];
	
	x = [self.panView GetX] * 2. - 1.;
	y = (1. - [self.panView GetY]) * 2. - 1.;
    
	// [self.networking sendOSCMsgWithFloatValue:"/fz/accelx\0\0":12:x];
	// [self.networking sendOSCMsgWithFloatValue:"/fz/accely\0\0":12:y];
    // [self.networking SendOSCMsgWithFloatValue:"/fz/accelz\0\0\0\0":16:z];
    
    // [self.networking sendOSCMsgWithIntValue:"/fz/pan\0":8:FLOAT_TO_MRMR_INT(x)];	
#if 0
	printf("%f, %f\n",x,y);
#endif
*/    
}

@end
