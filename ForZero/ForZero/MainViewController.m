//
//  MainViewController.m
//  ForZero
//
//  Created by Chris Lavender on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h> // for animated view transitions
#import "MainViewController.h"

@implementation MainViewController

#if _AlphaInterstitial_
@synthesize interstitialView=_interstitialView;
#endif

@synthesize serverViewContainer=_serverViewContainer, clientViewContainer=_clientViewContainer;
@synthesize uploadButt=_uploadButt, downloadButt=_downloadButt, downloadIndicator=_downloadIndicator;
@synthesize downloadProgView=_downloadProgView;
@synthesize networking=_networking, aqPlayer=_aqPlayer;
@synthesize progVal=_progVal;

- (void)setProgVal:(float)newProgVal
{
    if (newProgVal < 0.) newProgVal = 0.;
	if (newProgVal > 1.) newProgVal = 1.;
	_progVal = newProgVal;
	[self.serverViewContainer displayProgress];
}


- (void)displayAlertMessage:(NSString*)alertMsg
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Oops!" 
                                                    message:alertMsg 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)setupSelf
{
    self.aqPlayer = [[SagarihaAudioQueuePlayer alloc]init];
    self.aqPlayer.delegate = self;
    
    self.networking = [[NetworkMessages alloc] init];
    self.networking.delegate = self;
    self.networking.aqPlayer = self.aqPlayer;

#if _AlphaInterstitial_    
    self.interstitialView = [[InterstitialMessageView alloc]initWithFrame:CGRectMake(0,0,
                                                                                     self.view.bounds.size.width,
                                                                                     self.view.bounds.size.height)];
    self.interstitialView.delegate = self;
    self.interstitialView.alpha = 0.0;
#endif
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self) 
    {
        [self setupSelf];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setupSelf];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[UIAccelerometer sharedAccelerometer].updateInterval = 0.1;
    
    self.serverViewContainer.delegate = self;
    self.serverViewContainer.networking = self.networking;
    
    self.clientViewContainer.delegate = self;
    self.clientViewContainer.aqPlayer = self.aqPlayer;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
										 duration:(NSTimeInterval)duration
{
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
	{
		//----- GOING TO PORTRAIT -----
        [self.serverViewContainer updateFrameSize:CGRectMake(0, 0, 320, 200)];
        [self.clientViewContainer updateFrameSize:CGRectMake(0, 280, 320, 200)];
        self.uploadButt.frame   = CGRectMake(88, 184, 45, 110);
        self.downloadButt.frame = CGRectMake(186, 184, 45, 110);
	}
	else
	{
		//----- GOING TO LANDSCAPE -----
        [self.serverViewContainer updateFrameSize:CGRectMake(0, 0, 480, 150)];
        [self.clientViewContainer updateFrameSize:CGRectMake(0, 170, 480, 150)];
        self.uploadButt.frame   = CGRectMake(139, 133, 45, 55);
        self.downloadButt.frame = CGRectMake(294, 133, 45, 55);
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
    self.downloadProgView   =nil;
    self.downloadIndicator  =nil;
    self.uploadButt         =nil;
    self.downloadButt       =nil;
    self.clientViewContainer    =nil;
    self.serverViewContainer    =nil;

#if _AlphaInterstitial_
    self.interstitialView   =nil;
#endif
}

- (void)dealloc
{
    // [mPanView release]; // currently not included in .xib file

    // release IBOutlet variables
#if _AlphaInterstitial_
    [_interstitialView release];
#endif    
    [_downloadProgView      release];
    [_downloadIndicator     release];
    [_uploadButt            release];
    [_downloadButt          release];
    [_clientViewContainer   release];
    [_serverViewContainer   release];
        
    // release model objects
    [_networking        release];
    [_aqPlayer          release];
    
    [super dealloc];
}

#pragma mark - IBActions

- (IBAction)showInfo:(id)sender
{    
    FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
    controller.delegate = self;
    controller.networking = self.networking;
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
    
    [controller release];
}

-(IBAction)downloadAudioFile 
{
    [self.networking startReceiveTCP]; /* Question: hasn't the TCP thread already started? Why call this here? */
    [self.downloadIndicator startAnimating];
    [self.networking sendOSCMsg:"/fz/download\0\0\0\0":16];
}

-(IBAction)requestHint
{
	[self.networking sendOSCMsg:"/fz/hint\0\0\0\0":12];
}

#pragma mark - void methods

-(void)updateDownloadProg 
{
    /*
     // obsolete
    if (self.networking->mOSCMsg_DownloadProg >= 0.)
	{
		self.downloadProgView.progress = self.networking->mOSCMsg_DownloadProg;
		self.networking->mOSCMsg_DownloadProg = -1.;
	}
     */
}    
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
*/
}

-(void) setCue:(int)cue_num
{
    /*
     // obsolete methodology
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

#pragma mark - FlipsideViewControllerDelegate Method Implementations

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - NetworkMessagesDelegate Method Implementations

- (void)downloadEnded:(NetworkMessages*)requestor 
{
    NSLog(@"Download ended");
    [self.downloadIndicator stopAnimating];
    [self.aqPlayer start];		
}

- (void)downloadFailed:(NetworkMessages *)requestor
{
    NSLog(@"Download failed");
    [self.downloadIndicator stopAnimating];
    [self displayAlertMessage:requestor.errorMsg];
}

- (void)displayServerRecordProgress:(NetworkMessages*)requestor:(NSNumber *)val
{
    // progVal setter calls displayProgress in self.serverControlView
    if (requestor != nil) {
        self.progVal = [requestor.recProgress floatValue];
    }
    else if (val != nil) {
        self.progVal = [val floatValue];
    }
    
    // the below is to automatically show/hide & update a standard UIProgressView
    // NSLog(@"progress value:%f",self.progVal);
 /* if (progVal <= 0. || progVal >= 1.) self.recProgView.hidden = YES;
    else if (self.recProgView.hidden == YES) self.recProgView.hidden = NO;
    self.recProgView.progress = progVal;*/
}


- (void)displayInterstitialMessage:(NetworkMessages*)requestor
{
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
#if _AlphaInterstitial_
    printf("AlphaInterstitial fade in\n");

    if (![requestor.interstitialMsg isEqualToString:self.interstitialView.msg]) {
        self.interstitialView.msg = requestor.interstitialMsg;
        [self.view addSubview:self.interstitialView];
    }
    if (self.interstitialView.alpha > 1.0) self.interstitialView.alpha = 1.0;
    else if (self.interstitialView.alpha < 1.0) self.interstitialView.alpha += 0.05;
    
    if (self.interstitialView.alpha < 1.0)
        [self performSelector:@selector(displayInterstitialMessage:) withObject:requestor afterDelay:0.1];

#else
    printf("Quartz Animated Interstitial fade in\n");
    NSString *msg = requestor.interstitialMsg;
    
    InterstitialMessageView *interstitialView = 
            [[InterstitialMessageView alloc]initWithFrame:CGRectMake(0,
                                                                     0, 
                                                                     self.view.bounds.size.width, 
                                                                     self.view.bounds.size.height)];
    
    interstitialView.delegate = self;
    interstitialView.msg = msg;
    
	[self.view addSubview:interstitialView];
    
	CATransition *animation = [CATransition animation];
	[animation setDuration:kCrossfadeDuration];
	[animation setType:kCATransitionFade];    
	[self.view.layer addAnimation:animation forKey:nil];
    
    [interstitialView release];
#endif
    
}

#pragma mark - ControlViewDelegate Method Implementations
// this method is for testing the custom progress view
// connect any UISlider to First Responder of testSlider
- (IBAction) testSlider:(UISlider*)sender
{
    [self displayServerRecordProgress:nil:[NSNumber numberWithFloat:sender.value]];
}

- (float)progressValueForControlView:(ControlView *)requestor
{
	float prog = 0;
	if (requestor == self.serverViewContainer) 
    {
		prog = self.progVal;
        // NSLog(@"progress value:%f",prog);
	}
	return prog;
}

#pragma mark - SagarihaAudioQueuePlayerDelegate Method Implementations

- (void)audioQueueError:(NSString *)errorMsg 
{
    [self displayAlertMessage:errorMsg];
}

- (void)audioQueueTransportState:(SagarihaAudioQueuePlayer*)requestor
{
    /*
     This method is for control of button hightlighting (ie. keep play or rec buttons highlighted while working).
     The button highlighted property of the stock UIButton defaults to NO with TouchUpInside and similar calls.
     For this to work we'll probably need to subclass UIButton (or UIControl) and customize the behaviour.
    */
}

#pragma mark - InterstitialMessageViewDelegate Method Implementations

- (void) interstitialViewDidFinish:(InterstitialMessageView *)requestor
{

#if _AlphaInterstitial_
    
    printf("AlphaInterstitial fade out\n");
    if (self.interstitialView.alpha < 0.0) self.interstitialView.alpha = 0.0;
    else if (self.interstitialView.alpha > 0.0) self.interstitialView.alpha -= 0.05;
        
    if (self.interstitialView.alpha > 0.0)
    [self performSelector:@selector(interstitialViewDidFinish:) withObject:requestor afterDelay:0.1];
    
    if (self.interstitialView.alpha == 0.0) {
        [self.interstitialView removeFromSuperview];
    }

#else
    printf("Quartz Animated Interstitial fadeout\n");
    [requestor removeFromSuperview];

	CATransition *animation = [CATransition animation];
	[animation setDuration:kCrossfadeDuration];
	[animation setType:kCATransitionFade];   
    
    //[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
	[self.view.layer addAnimation:animation forKey:nil];
#endif
}

@end
