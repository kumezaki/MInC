//
//  FirstViewController.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MInC_ViewController.h"

MInC_ViewController *gViewController = nil;

#include "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

@implementation MInC_ViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)setupSelf
{
    gViewController = self;

    self.networking = [[MInC_NetworkMessages alloc] init];

	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
}

- (void)awakeFromNib
{
    [self setupSelf];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

#pragma mark - accelerometer

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
#if 0
	NSLog(@"%f, %f, %f\n", acceleration.x, acceleration.y, acceleration.z);
#endif
    
#define LIMIT_ACC_VAL(n)	n < -1. ? -1. : n > 1. ? 1. : n
    
	Float64 x = LIMIT_ACC_VAL(acceleration.x);
	Float64 y = LIMIT_ACC_VAL(acceleration.y);
	Float64 z = LIMIT_ACC_VAL(acceleration.z);
    
	[self.networking sendOSCMsgWithIntValue:"/minc/accX\0\0":12:FLOAT_TO_MRMR_INT(x)];
	[self.networking sendOSCMsgWithIntValue:"/minc/accY\0\0":12:FLOAT_TO_MRMR_INT(y)];
	[self.networking sendOSCMsgWithIntValue:"/minc/accZ\0\0":12:FLOAT_TO_MRMR_INT(z)];

	// AMPLITUDE
	// if z is 0 to 0.6 then it is right side up, otherwise it is flipped -> should drop out
    if (z>0.6) gAQP->Sequencer_Pri.AmpMultiplier_Accel = 0.;
	else gAQP->Sequencer_Pri.AmpMultiplier_Accel = 0.5;

	// TEMPO
	Float64 tempo_mult = x * gAQP->Sequencer_Pri.TempoSensitivity;
#if 0 /* tilt left for faster; tilt right for slower */
	tempo_mult = 1.0 - tempo_mult;
#else /* tilt left for slower; tilt right for faster */
    tempo_mult += 1.0;
#endif
	tempo_mult *= 2.;
    gAQP->Sequencer_Pri.TempoMultiplier_Accel = tempo_mult;
    
#if 0
	NSLog(@"%f %f",x,tempo_mult);
#endif
}

@end
