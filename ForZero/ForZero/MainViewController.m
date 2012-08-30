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
@synthesize interstitialView    =_interstitialView;
#endif
@synthesize serverViewContainer =_serverViewContainer;
@synthesize clientViewContainer =_clientViewContainer;
@synthesize serverRecordProgVal =_serverRecordProgVal;
@synthesize serverRecordMeterVal=_serverRecordMeterVal;
@synthesize serverPlayMeterVal  =_serverPlayMeterVal;
@synthesize downloadIndicator   =_downloadIndicator;
@synthesize downloadProgView    =_downloadProgView;
@synthesize downloadButton      =_downloadButton;
@synthesize uploadButton        =_uploadButton;
@synthesize networking          =_networking;
@synthesize aqPlayer            =_aqPlayer;

- (void)setServerRecordProgVal:(float)newProgVal
{
    if (newProgVal < 0.) newProgVal = 0.;
	if (newProgVal > 1.) newProgVal = 1.;
	_serverRecordProgVal = newProgVal;
    self.serverViewContainer.frontView.progressVal = _serverRecordProgVal;
}

- (void)setServerPlayMeterVal:(int)newServerPlayMeterVal {
	_serverPlayMeterVal = newServerPlayMeterVal;
    self.serverViewContainer.rightMeterView.meterVal = _serverPlayMeterVal;
}

- (void)setServerRecordMeterVal:(int)newServerRecordMeterVal
{
	_serverRecordMeterVal = newServerRecordMeterVal;
    self.serverViewContainer.leftMeterView.meterVal = _serverRecordMeterVal;
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
    self.aqPlayer = [[SagarihaAudioQueuePlayer alloc] init];
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
    
    self.serverViewContainer.networking = self.networking;
    self.clientViewContainer.aqPlayer = self.aqPlayer;
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

- (void)layoutPortraitOrientation {

    [self.serverViewContainer updateFrameSize:CGRectMake(0, 0, 320, 200)];
    [self.clientViewContainer updateFrameSize:CGRectMake(0, 280, 320, 200)];

#define _no_upload_ 1

#if _no_upload_
    // one download button:
    self.downloadButton.frame = CGRectMake(115, 185, 90, 110);
#else
    // for when upload is supported as well:
    self.uploadButton.frame   = CGRectMake(88, 184, 45, 110);
    self.downloadButton.frame = CGRectMake(186, 184, 45, 110);
#endif
}

- (void)layoutLandscapeOrientation {

    [self.serverViewContainer updateFrameSize:CGRectMake(0, 0, 480, 150)];
    [self.clientViewContainer updateFrameSize:CGRectMake(0, 170, 480, 150)];

#if _no_upload_
    // one download button:
    self.downloadButton.frame = CGRectMake((self.view.bounds.size.width*0.5)-45 , 134, 90, 55);
#else
    // for when upload is supported as well:
    self.uploadButton.frame   = CGRectMake(139, 133, 45, 55);
    self.downloadButton.frame = CGRectMake(294, 133, 45, 55);
#endif
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.serverViewContainer.playButton.enabled = NO;
    self.serverViewContainer.playButton.alpha = 0.5;
    self.serverViewContainer.stopButton.enabled = NO;
    self.serverViewContainer.stopButton.alpha = 0.5;
    self.serverViewContainer.recButton.enabled = NO;
    self.serverViewContainer.recButton.alpha = 0.5;

    self.serverViewContainer.volumerSlider.enabled = NO;
    self.serverViewContainer.volumerSlider.alpha = 0.5;
    
    self.downloadButton.hidden = YES;

    // if there's no audio file to play shut off client controls
    if (self.aqPlayer.theFile == nil) {

        self.clientViewContainer.playButton.enabled = NO;
        self.clientViewContainer.playButton.alpha = 0.5;
        
        self.clientViewContainer.stopButton.enabled = NO;
        self.clientViewContainer.stopButton.alpha = 0.5;
        
        self.clientViewContainer.volumerSlider.enabled = NO;
        self.clientViewContainer.volumerSlider.alpha = 0.5;
    }
    
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        [self layoutPortraitOrientation];
    }
	else if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
		[self layoutLandscapeOrientation];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
										 duration:(NSTimeInterval)duration
{
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        [self layoutPortraitOrientation];
    }
	else if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
		[self layoutLandscapeOrientation];
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
    self.uploadButton             =nil;
    self.downloadButton           =nil;
    self.downloadProgView       =nil;
    self.downloadIndicator      =nil;
    self.clientViewContainer    =nil;
    self.serverViewContainer    =nil;
#if _AlphaInterstitial_
    self.interstitialView       =nil;
#endif
}

- (void)dealloc 
{
    // [mPanView release]; // currently not included in .xib file

    // release IBOutlet variables
#if _AlphaInterstitial_
    [_interstitialView      release];
#endif    
    [_downloadProgView      release];
    [_downloadIndicator     release];
    [_clientViewContainer   release];
    [_serverViewContainer   release];
    [_downloadButton          release];
    [_uploadButton            release];
        
    // release model objects
    [_networking            release];
    [_aqPlayer              release];
    
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
    
    // if there's an audio file to play turn on client controls
    if (self.aqPlayer.theFile != nil) {
        self.clientViewContainer.playButton.enabled = YES;
        self.clientViewContainer.playButton.alpha = 1.0;
        
        self.clientViewContainer.stopButton.enabled = YES;
        self.clientViewContainer.stopButton.alpha = 1.0;
        
        self.clientViewContainer.volumerSlider.enabled = YES;
        self.clientViewContainer.volumerSlider.alpha = 1.0;
    }
    
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
    // serverRecordProgVal setter calls setNeedsDisplay
    if (requestor != nil) {
        self.serverRecordProgVal = [requestor.recProgress floatValue];
    }
    else if (val != nil) {
        self.serverRecordProgVal = [val floatValue];
    }
}

- (void)displayServerPlayingMeterValue:(NetworkMessages *)requestor :(NSNumber *)val
{
    // serverMeterVal setter calls setNeedsDisplay
    if (requestor != nil) {
        self.serverPlayMeterVal = [requestor.playingMeterValue intValue];
    }
    else if (val != nil) {
        self.serverPlayMeterVal = [val intValue];
    }
    
}

- (void)displayServerRecordingMeterValue:(NetworkMessages *)requestor :(NSNumber *)val
{
    // serverMeterVal setter calls setNeedsDisplay
    if (requestor != nil) {
        self.serverRecordMeterVal = [requestor.recordingMeterValue intValue];
    }
    else if (val != nil) {
        self.serverRecordMeterVal = [val intValue];
    }
    
}

- (void)enableServerRecordButton
{
    self.serverViewContainer.recButton.enabled = YES;
    self.serverViewContainer.recButton.alpha = 1.0;
}

- (void)enableServerStopButton
{
    self.serverViewContainer.stopButton.enabled = YES;
    self.serverViewContainer.stopButton.alpha = 1.0;
}

- (void)enableServerPlayButton
{
    self.serverViewContainer.playButton.enabled = YES;
    self.serverViewContainer.playButton.alpha = 1.0;
}

- (void)enableServerDownloadButton
{
    self.downloadButton.hidden = NO;
}

- (void)enableServerVolumeSlider
{
    self.serverViewContainer.volumerSlider.enabled = YES;
    self.serverViewContainer.volumerSlider.alpha = 1.0;
}

- (void)enableServerPanView
{
    self.serverViewContainer.panView.enabled = YES;
    [self.serverViewContainer.panView setNeedsDisplay];
}

- (void)displayInterstitialMessage:(NetworkMessages*)requestor
{
#if _AlphaInterstitial_

    if (![requestor.interstitialMsg isEqualToString:self.interstitialView.msg]) {
        self.interstitialView.msg = requestor.interstitialMsg;
        [self.view addSubview:self.interstitialView];
    }
    if (self.interstitialView.alpha > 1.0) self.interstitialView.alpha = 1.0;
    else if (self.interstitialView.alpha < 1.0) self.interstitialView.alpha += 0.025;
    
    if (self.interstitialView.alpha < 1.0)
        [self performSelector:@selector(displayInterstitialMessage:) withObject:requestor afterDelay:0.05];

#else
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
     
     Alternatively, another implementation would change the default state image to something different than the 
     highlighted image.  This behaviour is probably closer to what a user might expect.
    */
}

#pragma mark - InterstitialMessageViewDelegate Method Implementations

- (void) interstitialViewDidFinish:(InterstitialMessageView *)requestor
{

#if _AlphaInterstitial_
    
    if (self.interstitialView.alpha < 0.0)      self.interstitialView.alpha = 0.0;
    else if (self.interstitialView.alpha > 0.0) self.interstitialView.alpha -= 0.025;
        
    if (self.interstitialView.alpha > 0.0)
    [self performSelector:@selector(interstitialViewDidFinish:) withObject:requestor afterDelay:0.05];
    
    if (self.interstitialView.alpha == 0.0) {
        [self.interstitialView removeFromSuperview];
    }

#else
    [requestor removeFromSuperview];

	CATransition *animation = [CATransition animation];
	[animation setDuration:kCrossfadeDuration];
	[animation setType:kCATransitionFade];   
        
	[self.view.layer addAnimation:animation forKey:nil];
#endif
}

@end
