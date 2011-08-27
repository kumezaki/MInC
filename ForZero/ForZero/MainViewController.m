//
//  MainViewController.m
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

#define FLOAT_TO_MRMR_INT(v) (int)(v * 1000. + 0.5)

@implementation MainViewController

@synthesize mStateServerSegControl;
@synthesize mStateClientSegControl;

@synthesize mRecProgView;
@synthesize mDownloadProgView;
@synthesize mDownloadIndicator;

@synthesize networking = _networking;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[UIAccelerometer sharedAccelerometer].updateInterval = 0.1;
        
    mAudioQueuePlayer = [[SagarihaAudioQueuePlayer alloc]init];
    
    _networking = [[NetworkMessages alloc] init];
    _networking.delegate = self;
    _networking.mAudioQueuePlayer = mAudioQueuePlayer;
    
    [super viewDidLoad];
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    controller.networking = self.networking;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
    [_networking release];
    [mAudioQueuePlayer release];
    [mPanView release];
    [super dealloc];
}

-(IBAction)setStateServer:(id)sender
{
	[self.networking sendOSCMsgWithIntValue:"/saga/state\0":12:mStateServerSegControl.selectedSegmentIndex];
}

-(IBAction)setStateClient:(id)sender
{
	switch (mStateClientSegControl.selectedSegmentIndex)
	{
		case 0: /* stop */
			[mAudioQueuePlayer Stop];
			break;
		case 1: /* play */
			[mAudioQueuePlayer Start];
			break;
		case 2:	/* download */
            //	singleton.nextAudioIndex = 0;
#if 0
			[networking SendOSCMsgWithIntValue:"/saga/audio\0":12:singleton.nextAudioIndex];
#else
			[self.networking startReceiveTCP]; /* Question: hasn't the TCP thread already started? What call this here? */
            [mDownloadIndicator startAnimating];
            [self.networking sendOSCMsg:"/saga/download\0\0":16];
            
#endif
			break;
	}
}

-(IBAction)setEnvPeriod:(id)sender
{
	[self.networking sendOSCMsgWithIntValue:"/saga/period\0\0\0\0":16:FLOAT_TO_MRMR_INT([mEnvPeriodSlider value])];
}

-(IBAction)setDelayLevel:(id)sender
{
	[self.networking sendOSCMsgWithIntValue:"/saga/delay\0":12:FLOAT_TO_MRMR_INT([mDelayLevelSlider value])];
}

-(IBAction)setPan:(id)sender
{
	[self.networking sendOSCMsgWithIntValue:"/saga/pan\0\0\0":12:FLOAT_TO_MRMR_INT([mPanSlider value])];
}

-(IBAction)setVolumeServer:(id)sender
{
	//	NSLog(@"%f\n",[mVolumeServerSlider value]);
	[self.networking sendOSCMsgWithIntValue:"/saga/vol_s\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeServerSlider value])];
}

-(IBAction)setVolumeClient:(id)sender
{
	//	NSLog(@"%f\n",[mVolumeClientSlider value]);
	//	[self sendOSCMsgWithIntValue:"/saga/vol_c\0\0\0":12:FLOAT_TO_MRMR_INT([mVolumeClientSlider value])];
	mAudioQueuePlayer->mAmp = [mVolumeClientSlider value];
}

-(IBAction)requestHint
{
	[self.networking sendOSCMsg:"/saga/hint\0\0":12];
}

-(void) setCue:(int)cue_num
{
	mStateServerSegControl.hidden = cue_num < 2;
	mRecProgView.hidden = cue_num < 2;
	
	mEnvPeriodSlider.hidden = cue_num < 3;
	mEnvPeriodLabel.hidden = cue_num < 3;
	
	//mPanView.hidden = NO; cue_num < 4;
	//mPanLabel.hidden = NO; cue_num < 4;
	
	mDelayLevelSlider.hidden = cue_num < 5;
	mDelayLevelLabel.hidden = cue_num < 5;
	
	mStateClientSegControl.hidden = YES;
	mDownloadProgView.hidden = YES;
	
	mVolumeServerSlider.hidden = cue_num < 7;
	mVolumeServerLabel.hidden = cue_num < 7;
	
	mVolumeClientSlider.hidden = YES;
	mVolumeClientLabel.hidden = YES;
	
	//	NSLog(@"setting cue number to %d\n",cue_num);
}

-(void)updateDownloadProg {
    
    if (self.networking->mOSCMsg_DownloadProg >= 0.)
	{
		mDownloadProgView.progress = self.networking->mOSCMsg_DownloadProg;
		self.networking->mOSCMsg_DownloadProg = -1.;
	}
}

#define __VINNIE__	0

-(void)downloadEnded {

    NSLog(@"Download ended");
#if __VINNIE__
    [singleton->mAudioQueuePlayer->mWaveTable->mArray writeToFile:@"SagarihaAudio.aif" atomically:YES];
    mStateClientSegControl.selectedSegmentIndex = 0;
#else
    [mDownloadIndicator stopAnimating];
    mStateClientSegControl.selectedSegmentIndex = 1;
    [mAudioQueuePlayer Start];
#endif
		
}
    
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
#if 0
	NSLog(@"%f, %f, %f\n", acceleration.x, acceleration.y, acceleration.z);
#endif
	
#define LIMIT_ACC_VAL(n)	n < -1. ? -1. : n > 1. ? 1. : n
	
	float x = LIMIT_ACC_VAL(acceleration.x);
	float y = LIMIT_ACC_VAL(acceleration.y+0.35);
    //float z = LIMIT_ACC_VAL(acceleration.z);
	
	//	[mPanView Set:(x+1.)/2:1.-((y+1.)/2)];
	[mPanView SetVelocity:x:-y];
	[mPanView setNeedsDisplay];
	
	x = [mPanView GetX] * 2. - 1.;
	y = (1. - [mPanView GetY]) * 2. - 1.;
    	
	[self.networking sendOSCMsgWithFloatValue:"/saga/accelx\0\0\0\0":16:x];
	[self.networking sendOSCMsgWithFloatValue:"/saga/accely\0\0\0\0":16:y];
    //	[self.networking SendOSCMsgWithFloatValue:"/saga/accelz\0\0\0\0":16:z];
	
#if 0
	printf("%f, %f\n",x,y);
#endif
}

@end
