//
//  PropViewController.m
//  Prop Phone
//
//  Created by Chris Lavender on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PropViewController.h"
#import "GDMediaPlayer.h"
#import "Connection.h"

@interface PropViewController()
{
    ActionViewController    *mActionCon;
    
    BOOL    loopingOn;
    BOOL    timerSet;
    BOOL    itunesOn;
    
    BOOL    timerActivated;
    BOOL    timerButtonDisplayToggle;
    
    int     countdownTime;
    int     min;
    int     sec;
    
    MPMediaItemCollection   *mediaCollection;
}
@end

#pragma mark -
@implementation PropViewController

@synthesize playButton=_playButton, pauseButton= _pauseButton, stopButton= _stopButton;
@synthesize led=_led, status=_status;
@synthesize loopButton=_loopButton, timerButton=_timerButton, phoneButton=_phoneButton, ipodButton=_ipodButton;
@synthesize timerSaveButton=_timerSaveButton, timerCancelButton=_timerCancelButton;
@synthesize timerSetView;
@synthesize timerScrollView=_timerScrollView;
@synthesize countdownLable=_countdownLable;
@synthesize delegate=_delegate;


- (void)presentAlert:(NSString*)msg {
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Oops!" 
                                                    message:msg 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)resetTimer {
    
    countdownTime = 0;
    min = 0;
    sec = 0;
    timerActivated = NO;
    timerButtonDisplayToggle = NO;
    
    [self.timerScrollView selectRow:0 inComponent:0 animated:YES];
    [self.timerScrollView selectRow:0 inComponent:1 animated:YES];
    
    [self.timerButton setImage:[UIImage imageNamed:@"timer_default1.png"] forState:UIControlStateNormal];
    
    self.countdownLable.text =@"";
}

- (void)formatCountdownLabel {
    int m = countdownTime / 60;
    int s = countdownTime % 60;
    // printf("countdown %d:%02d\n",m, s);
    self.countdownLable.text = [NSString stringWithFormat:@"%d : %02d",m,s];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[NSBundle mainBundle] loadNibNamed:@"TimerSetView" owner:self options:nil];
        
        mMediaPlayer = [[GDMediaPlayer alloc]init];
        mMediaPlayer.delegate = self;
        
        mServer = [[PropServer alloc]init];
        mServer.delegate = self;
        [mServer start];
    }
    return self;
}

- (void)dealloc
{        
    [mMediaPlayer release];
    [mServer release];
    
    self.timerSetView = nil;

    [_playButton release];
    [_pauseButton release];
    [_stopButton release];
    [_status release];
    [_led release];
    [_loopButton release];
    [_timerButton release];
    [_phoneButton release];
    [_ipodButton release];
    [_timerSaveButton release];
    [_timerCancelButton release];
    [_timerScrollView release];
    [_countdownLable release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // retrieve the last Loop setting...
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"loopButton"]) {
        loopingOn = YES;
        [self.loopButton setImage:[UIImage imageNamed:@"loop_default2.png"] forState:UIControlStateNormal];
    }
    else [self.loopButton setImage:[UIImage imageNamed:@"loop_default1.png"] forState:UIControlStateNormal];
    
    
    // retrieve the last sound source setting...
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundSetting"]) {
        itunesOn = YES;
        [self.ipodButton setImage:[UIImage imageNamed:@"ipod_default2.png"] forState:UIControlStateNormal];
        [self.phoneButton setImage:[UIImage imageNamed:@"phone_default1.png"] forState:UIControlStateNormal];
    }
    else {
        [self.ipodButton setImage:[UIImage imageNamed:@"ipod_default1.png"] forState:UIControlStateNormal];
        [self.phoneButton setImage:[UIImage imageNamed:@"phone_default2.png"] forState:UIControlStateNormal];
    }
    [mMediaPlayer setSoundMode:itunesOn];
    
    // retrieve the last chosen itunes track if any.
    NSNumber *anID = [[NSUserDefaults standardUserDefaults] objectForKey:@"itunesSelection"];
    if (anID != nil) {
        MPMediaQuery *query = [MPMediaQuery songsQuery]; 
        
        MPMediaPropertyPredicate *predicate = 
        [MPMediaPropertyPredicate predicateWithValue: anID forProperty: MPMediaItemPropertyPersistentID]; 
        
        [query addFilterPredicate:predicate]; 
        NSArray *mediaItems = [NSArray arrayWithArray:[query items]]; 
        //this array will consist of song with given persistentId. add it to collection and play it 
        if ([mediaItems count] > 0) mediaCollection = [MPMediaItemCollection collectionWithItems:mediaItems];
        [mMediaPlayer updatePlayerQueueWithMediaCollection: mediaCollection];
    }
    
    
    // if for some reason the itunesOn == YES but there was a problem retrieving an itunes reference.
    else {
        itunesOn = NO;
        [self.ipodButton setImage:[UIImage imageNamed:@"ipod_default1.png"] forState:UIControlStateNormal];
        [self.phoneButton setImage:[UIImage imageNamed:@"phone_default2.png"] forState:UIControlStateNormal];
    }

    mTransportState = @"stop";
    self.status.text = [NSString stringWithFormat:@" "];
    self.countdownLable.text = [NSString stringWithFormat:@" "];
    self.led.hidden = YES;
    countdownTime = 0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions

- (IBAction)loopPlaybackToggle {
        
    if (!loopingOn) {
        [self.loopButton setImage:[UIImage imageNamed:@"loop_default2.png"] forState:UIControlStateNormal];
        loopingOn = YES;
    }
    else {
        [self.loopButton setImage:[UIImage imageNamed:@"loop_default1.png"] forState:UIControlStateNormal];
        loopingOn = NO;
    }
    [mMediaPlayer setLoopMode:loopingOn];
}

- (IBAction)mediaTransport:(id)sender {
    NSString *state = @"stop";
    
    if ([sender isKindOfClass:[UIButton class]]) {
        state = [[sender titleLabel]text];
    }
    else if ([sender isKindOfClass:[NSString class]]) {
        // NSLog(@"NSString:%@", sender);
        state = sender;
    }
    if ([state isEqualToString:@"stop"]) timerActivated = NO;
    
    if (mActionCon != nil) mActionCon.transportState = state;
     
    mTransportState = state;
    [mMediaPlayer playerTransport:mTransportState];
}

- (IBAction)propViewPlayButton:(UIButton *)sender { 
    // printf("countdown %d\n", countdownTime);
    // of the count is 0 just play
    if (countdownTime == 0) {
        [self.timerScrollView reloadAllComponents];
        [self mediaTransport:sender];
        [self resetTimer];
    }
    // of timer is deactivated reset everything
    else if (!timerActivated) {
        countdownTime = 0;
        [self resetTimer];
        return;
    }
    // otherwise display the time and set the repeat
    else {
        [self formatCountdownLabel];
        countdownTime = countdownTime - 1.;
        [self performSelector:@selector(propViewPlayButton:) withObject:sender afterDelay:1.0];
    }
    if (!timerButtonDisplayToggle) {
        [self.timerButton setImage:[UIImage imageNamed:@"timer_default1.png"] 
                          forState: UIControlStateNormal];
        timerButtonDisplayToggle = YES;
    }
    else {
        [self.timerButton setImage:[UIImage imageNamed:@"timer_default2.png"] 
                          forState: UIControlStateNormal];
        timerButtonDisplayToggle = NO;
    }
}

- (IBAction)selectDefaultSound {
    
    if (itunesOn) {
        itunesOn = NO;
        [self.ipodButton setImage:[UIImage imageNamed:@"ipod_default1.png"] forState:UIControlStateNormal];
        [self.phoneButton setImage:[UIImage imageNamed:@"phone_default2.png"] forState:UIControlStateNormal];
    }
    else {
        //[self presentAlert:@"To disable the default ringtone goto the iPod icon & select a track from your iTunes library."];
    }
    [mMediaPlayer setSoundMode:itunesOn];
}

- (IBAction)showMediaPicker:(UIButton*)sender {

    if (!itunesOn) {
        [self.phoneButton setImage:[UIImage imageNamed:@"phone_default1.png"] forState:UIControlStateNormal];
        itunesOn = YES;
    }
            
    MPMediaPickerController *picker = [[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeAnyAudio];                   
    
    [picker setDelegate: self];
    [picker setAllowsPickingMultipleItems: NO];
    
    picker.prompt =
    NSLocalizedString (@"Select a file from your iTunes Library",
                       "Prompt in media item picker");
    
    [self presentModalViewController: picker animated: YES];
    [picker release];
}

- (void) mediaPicker: (MPMediaPickerController *) mediaPicker didPickMediaItems: (MPMediaItemCollection *) collection {
    
    [self.ipodButton setImage:[UIImage imageNamed:@"ipod_default2.png"] forState:UIControlStateNormal];
    itunesOn = YES;
    [mMediaPlayer setSoundMode:itunesOn];

    // needed to toggle the status bar on/off to deal with spacing wonkiness.
    // probablly should sub-class the picker but fuck it...
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    [self dismissModalViewControllerAnimated: YES];
    
    mediaCollection = collection;
    [mMediaPlayer updatePlayerQueueWithMediaCollection: mediaCollection];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void) mediaPickerDidCancel: (MPMediaPickerController *) mediaPicker {
    
    // NSLog(@"userMediaCollection count:%d", [mediaCollection count]);
    if ([mediaCollection count]==0) {
        [self selectDefaultSound];
        [self presentAlert: @"To use a track from your iTunes library you'll need to make a selection."];
    }

    else {
        [self.ipodButton setImage:[UIImage imageNamed:@"ipod_default2.png"] 
                         forState:UIControlStateNormal];
        [self.phoneButton setImage:[UIImage imageNamed:@"phone_default1.png"] 
                          forState:UIControlStateNormal];
    }
    [mMediaPlayer setSoundMode:itunesOn];
    
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    [self dismissModalViewControllerAnimated: YES];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (IBAction)done
{    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:loopingOn forKey:@"loopButton"];
    [defaults setBool:itunesOn forKey:@"soundSetting"];
    [defaults setBool:timerSet forKey:@"timerSetting"];

    MPMediaItem *mediaItem = [mediaCollection.items objectAtIndex:0]; 
    NSNumber *anId = [mediaItem valueForProperty:MPMediaItemPropertyPersistentID]; 
    [defaults setObject:anId forKey:@"itunesSelection"];
    
    [defaults synchronize];

    if (mServer.isConnected) [mServer.mHeartbeatTimer invalidate];
    [mServer stop];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    [self.delegate killProp:self];
}

- (IBAction)showActionView;
{    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide]; 
    
    mActionCon = [[ActionViewController alloc]initWithNibName:nil bundle:nil];
    mActionCon.delegate = self;
    
    mActionCon.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:mActionCon animated:YES];
    
    mActionCon.transportState = mTransportState;
}

- (IBAction)showTimerSetView 
{
    [self resetTimer];

    self.timerSetView.center = CGPointMake(160, -200);//-175
    self.timerScrollView.showsSelectionIndicator = YES;
    
    [self.view addSubview:self.timerSetView];
    
    [UIView animateWithDuration:.5 
                     animations:^{
                         self.timerSetView.center = CGPointMake(160, 200);
                     } 
                     completion:NULL];
}

- (IBAction)setCountdownState:(UIBarButtonItem *)sender {    
    if (sender.tag == 1 && countdownTime > 0) {
        timerActivated = YES;
        [self formatCountdownLabel];
        [self.timerButton setImage:[UIImage imageNamed:@"timer_default2.png"] 
                          forState:UIControlStateNormal];
    }
    else {
        [self resetTimer];
    }
    [self dismissTimerSetView];
}

- (IBAction)dismissTimerSetView {
        
    [UIView animateWithDuration:.5 
                     animations:^{
                         self.timerSetView.center = CGPointMake(160, -200);
                     } 
                     completion:^(BOOL finished){
                         [timerSetView removeFromSuperview];
                     }];
}


#pragma mark - ActionViewController Delegate Method Impementations
- (void)userRespondedFromActionView:(ActionViewController *)controller withAction :(NSString *)action
{
    [mMediaPlayer playerTransport:action];
    mTransportState = action;
}

- (void)actionViewControllerDidFinish:(ActionViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
    [mActionCon release];
    mActionCon = nil;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide]; 
}

#pragma mark - ConnectionLogic Delegate Method Impementations

- (void) processMessage:(NSString*)message{
    [self mediaTransport:message];
}

- (void)connectionTerminated:(id)sender reason:(NSString *)reason
{
    [mServer.mHeartbeatTimer invalidate];
    
    // Explain what happened
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Connection Terminated" message:reason delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    self.status.text = @" ";
    self.led.hidden = YES;
}

- (void)isConnected:(BOOL)state {
    //printf("isConnected state:%s\n", state == NO ? "NO\n" : "YES\n");
    if (state) {
        self.led.hidden = NO;
        self.status.text = @"CONNECTED!";
    }
    else {
        self.status.text = @" ";
    }
}
- (void)displayHeartbeat:(UInt8)val {
    self.led.highlighted = val == 0 ? NO : YES;
}

- (void)didReceiveLoopStateMsg:(UInt8)val {
    // loopPlaybackToggle actually toggles the BOOL
    // so it needs to be set to the opposite state here
    // before calling the toggle method
    if (val > 0) {
        loopingOn = NO;
    }
    else loopingOn = YES;
    [self loopPlaybackToggle];
}

#pragma mark - UIPickerViewDataSource Method Impementations
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger numRows = 0;
    
    if (component == 0) {
        numRows = 10;
    }
    else if (component == 1) {
        numRows = 60;
    }
    return numRows;
}

#pragma mark - UIPickerViewDelegate Method Impementations
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [NSString stringWithFormat:@"%d",row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //get the values
	NSInteger newMinutes = [pickerView selectedRowInComponent:0];
	NSInteger newSeconds = [pickerView selectedRowInComponent:1];

    countdownTime = (newMinutes * 60) + newSeconds;
    
    //NSLog(@"minutes:%d seconds:%d countdown time: %d",newMinutes,newSeconds,countdownTime);
}

#pragma mark - GMMediaPlayer Delegate Method Impementations
- (void)mediaPlayerIsPlaying:(BOOL)state {
    if (state) {
        [self.playButton setImage:[UIImage imageNamed:@"play_default2.png"] 
                         forState:UIControlStateNormal];
        if (mServer.isConnected) {
            [mServer.currentConnection.processOSC packOSCMsg:"/prop/playbutt\0\0":16];
        }
    }
    else {
        [self.playButton setImage:[UIImage imageNamed:@"play_default.png"] 
                          forState:UIControlStateNormal];
        if (mServer.isConnected) {
            [mServer.currentConnection.processOSC packOSCMsg:"/prop/stopbutt\0\0":16];
        }
        if (![mTransportState isEqualToString:@"stop"]) {
            mTransportState = @"stop";
        }
    }

    // if active then reset the timer elements
    if (timerActivated) {
        [self resetTimer];
        mTransportState = @"stop";
    }
}
@end
