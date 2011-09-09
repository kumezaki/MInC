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

@synthesize serverView=_serverView, clientView=_clientView;
@synthesize uploadButt=_uploadButt, downloadButt=_downloadButt, downloadIndicator=_downloadIndicator;
@synthesize serverRecButt=_serverRecButt, serverStopButt=_serverStopButt, serverPlayButt=_serverPlayButt;
@synthesize clientRecButt=_clientRecButt, clientStopButt=_clientStopButt, clientPlayButt=_clientPlayButt;

@synthesize recProgView=_recProgView, downloadProgView=_downloadProgView;

@synthesize networking=_networking, aqPlayer=_aqPlayer;

- (void)displayAlertMessage:(NSString*)msg
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Oops!" 
                                                    message:msg 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[UIAccelerometer sharedAccelerometer].updateInterval = 0.1;
        
    _aqPlayer = [[SagarihaAudioQueuePlayer alloc]init];
    _aqPlayer.delegate = self;
    
    _networking = [[NetworkMessages alloc] init];
    _networking.delegate = self;
    _networking.aqPlayer = self.aqPlayer;
    
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

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    //Set which orientations we allow
	if (
        (interfaceOrientation == UIInterfaceOrientationPortrait) ||
        (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) ||
        (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
        (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        )
	{
		return YES;
	}
	else
	{
		return NO;
	}
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
										 duration:(NSTimeInterval)duration
{
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
	{
		//----- GOING TO PORTRAIT -----
		//[[self view] setBackgroundColor:[UIColor blueColor]];
        self.serverView.frame = CGRectMake(0, 0, 320, 200);
        self.clientView.frame = CGRectMake(0, 260, 320, 200);
        self.uploadButt.frame = CGRectMake(88, 150, 45, 160);
        self.downloadButt.frame = CGRectMake(186, 150, 45, 160);
	}
	else
	{
		//----- GOING TO LANDSCAPE -----
		//[[self view] setBackgroundColor:[UIColor redColor]];
        self.serverView.frame = CGRectMake(0, 0, 480, 140);
        self.clientView.frame = CGRectMake(0, 160, 480, 140);
        self.uploadButt.frame = CGRectMake(139, 123, 45, 55);
        self.downloadButt.frame = CGRectMake(294, 123, 45, 55);
	}
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
    [mPanView release];

    // release the IBOutlets
    [_downloadProgView release];
    [_recProgView release];
    [_clientPlayButt release];
    [_clientStopButt release];
    [_clientRecButt release];
    [_serverPlayButt release];
    [_serverStopButt release];
    [_serverRecButt release];
    [_downloadIndicator release];
    [_uploadButt release];
    [_downloadButt release];
    [_clientView release];
    [_serverView release];
    
    // release model objects
    [_networking release];
    [_aqPlayer release];
    
    [super dealloc];
}

-(IBAction)setStateServer:(id)sender
{
	if ([sender isKindOfClass:[UIButton class]]) {
        NSLog(@"%@",[[sender titleLabel]text]);
        
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

-(IBAction)setStateClient:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        NSLog(@"%@",[[sender titleLabel]text]);

        if ( [[[sender titleLabel]text] isEqualToString:@"rec"] ) {
            NSLog(@"client recording is not yet supported");
        }
        else if ( [[[sender titleLabel]text] isEqualToString:@"stop"] ) {
            [self.aqPlayer Stop];        
        }
        else if ( [[[sender titleLabel]text] isEqualToString:@"play"] ) {
            [self.aqPlayer Start];
        }
    }
}

-(IBAction)downloadAudioFile 
{
    [self.networking startReceiveTCP]; /* Question: hasn't the TCP thread already started? What call this here? */
    [self.downloadIndicator startAnimating];
    [self.networking sendOSCMsg:"/fz/download\0\0\0\0":16];
}

-(IBAction)setEnvPeriod:(id)sender
{
	//[self.networking sendOSCMsgWithIntValue:"/fz/period\0\0\0\0":16:FLOAT_TO_MRMR_INT([mEnvPeriodSlider value])];
}

-(IBAction)setDelayLevel:(id)sender
{
	//[self.networking sendOSCMsgWithIntValue:"/fz/delay\0":12:FLOAT_TO_MRMR_INT([mDelayLevelSlider value])];
}

-(IBAction)setPan:(id)sender
{
	//[self.networking sendOSCMsgWithIntValue:"/fz/pan\0\0\0":12:FLOAT_TO_MRMR_INT([mPanSlider value])];
}

-(IBAction)setVolumeServer:(id)sender
{
	if ([sender isKindOfClass:[UISlider class]]) {
        // NSLog(@"%f\n",[(UISlider*)sender value]);
        [self.networking sendOSCMsgWithIntValue:"/fz/vol_s\0\0\0":12:FLOAT_TO_MRMR_INT([(UISlider*)sender value])];
    }
}

-(IBAction)setVolumeClient:(id)sender
{
    if ([sender isKindOfClass:[UISlider class]]) {
        // NSLog(@"%f\n",[(UISlider*)sender value]);
        self.aqPlayer.mAmp = [(UISlider*)sender value];
    }
}

-(IBAction)requestHint
{
	[self.networking sendOSCMsg:"/fz/hint\0\0\0\0":12];
}

-(void) setCue:(int)cue_num
{
    /*
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
     */
}

-(void)updateDownloadProg {
    
    if (self.networking->mOSCMsg_DownloadProg >= 0.)
	{
		self.downloadProgView.progress = self.networking->mOSCMsg_DownloadProg;
		self.networking->mOSCMsg_DownloadProg = -1.;
	}
}

#define __VINNIE__	0

-(void)downloadEnded 
{
    NSLog(@"Download ended");
    
    [self.downloadIndicator stopAnimating];
    
    self.clientPlayButt.highlighted = YES; // not sure this will actually activate the button.
    [self.aqPlayer Start];		
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
    	
	[self.networking sendOSCMsgWithFloatValue:"/fz/accelx\0\0":12:x];
	[self.networking sendOSCMsgWithFloatValue:"/fz/accely\0\0":12:y];
    //	[self.networking SendOSCMsgWithFloatValue:"/fz/accelz\0\0\0\0":16:z];
	
#if 0
	printf("%f, %f\n",x,y);
#endif
}

#pragma mark - SagarihaAudioQueuePlayerDelegate Method Implementations

- (void)audioQueueError:(NSString *)msg {
    [self displayAlertMessage:msg];
}

@end
