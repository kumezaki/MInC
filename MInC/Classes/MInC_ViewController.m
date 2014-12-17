//
//  FirstViewController.m
//  MInC
//
//  Created by Kojiro Umezaki on 5/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "MInC_ViewController.h"

#import "MInC_Constants.h"
#import "MInC_SequenceFile.h"
#import "MInC_TouchView.h"

MInC_ViewController *gViewController = nil;

#include "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

#import "MInC_Player.h"

@implementation MInC_ViewController

@synthesize firstView = _firstView;
@synthesize secondView = _secondView;

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

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark Synchronous URL

- (BOOL)callHTTPServer:(NSString*)url_str withData:(NSData**)data :(NSURLResponse**)response :(NSError**)error
{
    *data = [NSURLConnection
            sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url_str]]
            returningResponse:response
            error:error];
    return *error != nil;
}

- (void)getPlayerID
{
    NSData* data = nil;
    NSURLResponse* response = nil;
    NSError* error = nil;

    /* request score list from HTTP server */
    [self.firstView startActivityIndicator];
    NSString* url_string = [NSString stringWithFormat:@"http://healthyboys.com/MInC/player_id.php?"];
    [self callHTTPServer:url_string withData:&data :&response :&error];
    if (error == nil)
    {
        // Parse data here
        NSString* player_id_string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        gAQP.PlayerID = [player_id_string integerValue];
        NSLog(@"Player ID from healthyboys.com: %ld",(long)gAQP.PlayerID);
        
        [gAQP addPlayerWithID:PLAYER_ID_STR(gAQP.PlayerID)];
    }
    else
        NSLog(@"Failed to receive player ID from healthyboys.com");
    [self.firstView stopActivityIndicator];
}
    
- (void)getScoreList
{
    NSData* data = nil;
    NSURLResponse* response = nil;
    NSError* error = nil;

    /* request score list from HTTP server */
    [self.firstView startActivityIndicator];
    NSString* url_string = [NSString stringWithFormat:@"http://healthyboys.com/MInC/score_list.php?id=%08ld",(long)gAQP.PlayerID];
    [self callHTTPServer:url_string withData:&data :&response :&error];
    if (error == nil)
    {
        // Parse data here
        NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Score list from healthyboys.com\n%@",myString);
        NSArray *listItems = [myString componentsSeparatedByString:@"\n"];
//        long pos = 0;
        for (NSString* item in listItems)
        {
#if 0
            NSArray *stringItems = [item componentsSeparatedByString:@" "];
            if (stringItems.count == 2)
            {
                NSLog(@"[%ld] %@",(long)[[stringItems objectAtIndex:0] integerValue],[stringItems objectAtIndex:1]);
                [scoreListArray addObject:[stringItems objectAtIndex:1]];
            }
#else
//            NSLog(@"[%ld] %@",pos++,item);
            [scoreListArray addObject:item];
#endif
        }
    }
    else
        NSLog(@"Failed to receive score list from healthyboys.com");
    [self.firstView stopActivityIndicator];
}

- (void)getScoreData:(NSInteger)score_id
{
    NSData* data = nil;
    NSURLResponse* response = nil;
    NSError* error = nil;
    
    /* request score data from HTTP server */
    [self.firstView startActivityIndicator];
    NSString* url_string = [NSString stringWithFormat:@"http://healthyboys.com/MInC/score.php?id=%08ld&score_id=%ld",(long)gAQP.PlayerID,(long)score_id];
    [self callHTTPServer:url_string withData:&data :&response :&error];
    MInC_SequenceFile* seqFile = [[MInC_SequenceFile alloc] init];
    if (error == nil)
    {
        // Parse data here
//        NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"Score data from healthyboys.com\n%@",myString);
        
        // convert NSString in sequences
        [seqFile writeToFile:@"TCP.dat" withData:data];
    }
    else
        NSLog(@"Failed to receive score data from healthyboys.com");
    [gAQP.Sequences removeAllObjects];
    [seqFile readFromFile:@"TCP.dat"];
    [self.firstView stopActivityIndicator];
}

- (void)getAverageMod
{
    NSData* data = nil;
    NSURLResponse* response = nil;
    NSError* error = nil;
    
    /* request score list from HTTP server */
    [self.firstView startActivityIndicator];
    NSString* url_string = [NSString stringWithFormat:@"http://healthyboys.com/MInC/avg_mod.php?"];
    [self callHTTPServer:url_string withData:&data :&response :&error];
    if (error == nil)
    {
        // Parse data here
        NSString* avg_mod_string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSInteger avg_mod_int = [avg_mod_string integerValue];
        NSLog(@"Average Module from healthyboys.com: %ld",(long)avg_mod_int);
        [gAQP setSeqPos:[[NSNumber alloc] initWithInt:(int)avg_mod_int]];
    }
    else
        NSLog(@"Failed to receive average module from healthyboys.com");
    [self.firstView stopActivityIndicator];
}

- (void)getPlayerList
{
    URL_PlayerList = [[MInC_URL_PlayerList alloc] init];
}

- (void)setPlayerEnd
{
    NSData* data = nil;
    NSURLResponse* response = nil;
    NSError* error = nil;
    
    /* send player position to HTTP server */
    NSString* url_string = [NSString stringWithFormat:@"http://healthyboys.com/MInC/player_end.php?id=%08ld",(long)gAQP.PlayerID];
    [gViewController callHTTPServer:url_string withData:&data :&response :&error];
    if (error == nil)
    {
        NSLog(@"%@ sent",url_string);
    }
    else
        NSLog(@"Failed to send player end to healthyboys.com");
}

#define SET_PLAYER_PARAM(member_variable,param_name) \
    if (gAQP.PlayerID == -1) return; \
    member_variable = [[MInC_URL_SetPlayerParam alloc] init]; \
    [member_variable setParam:param_name withValue:val];

- (void)setPlayerPos:(SInt16)val
{
    SET_PLAYER_PARAM(URL_SetPlayerPos,"pos")
}

- (void)setPlayerSpeed:(SInt16)val
{
    SET_PLAYER_PARAM(URL_SetPlayerSpeed,"speed")
}

- (void)setPlayerOctave:(SInt16)val
{
    SET_PLAYER_PARAM(URL_SetPlayerOctave,"octave")
}

- (void)setPlayerMute:(SInt16)val
{
    SET_PLAYER_PARAM(URL_SetPlayerMute,"mute")
}

- (void)setPlayerLike:(SInt16)val
{
    SET_PLAYER_PARAM(URL_SetPlayerLike,"like")
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    NSLog(@"%ld",(long)row);
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return scoreListArray.count;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 300;
    return sectionWidth;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    UIColor* color = IS_OS_7_OR_LATER ? [UIColor whiteColor] : [UIColor blackColor];
    return [[NSAttributedString alloc] initWithString:scoreListArray[row] attributes:@{NSForegroundColorAttributeName:color}];
}

- (void)setupSelf
{
    gViewController = self;

#if MINC_NETWORK_LOCAL
    self.networking = [[MInC_NetworkMessages alloc] init]; /* needs to go before loading views to set persistent IP address and port number */
#endif
    
    self.firstView = [[[NSBundle mainBundle] loadNibNamed:@"MInC_FirstView" owner:self options:nil] objectAtIndex:0];
    self.secondView = [[[NSBundle mainBundle] loadNibNamed:@"MInC_SecondView" owner:self options:nil] objectAtIndex:0];
    
    [self loadFirstView];
    
    self.firstView.TouchView.userInteractionEnabled = NO;
    
    scoreListArray = [[NSMutableArray alloc] init];
    [self getScoreList];

    NSLog(@"%f %f %f %f",self.firstView.bounds.origin.x,self.firstView.bounds.origin.y,self.firstView.bounds.size.width,self.firstView.bounds.size.height);
    
    pickerViewToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 20, 320, 44)];
    [pickerViewToolBar setBarStyle:UIBarStyleBlackTranslucent];
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneSelectingScore:)];
    doneButton.tintColor = [UIColor redColor];
    pickerViewToolBar.items = [[NSArray alloc] initWithObjects:flexButton,doneButton,nil];

    scoreListPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 64, 320, 200)];
    scoreListPickerView.delegate = self;
    scoreListPickerView.showsSelectionIndicator = YES;

    [self.firstView addSubview:pickerViewToolBar];
    [self.firstView addSubview:scoreListPickerView];
    
#if MINC_ACCELLEROMETER
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
#endif
}

- (void)doneSelectingScore:(id)sender
{
    [scoreListPickerView resignFirstResponder];
    [self getPlayerID];
    [self getScoreData:[scoreListPickerView selectedRowInComponent:0]];
    [self getAverageMod];
    
    [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(getPlayerList) userInfo:nil repeats:YES];

    pickerViewToolBar.hidden = YES;
    scoreListPickerView.hidden = YES;

    self.firstView.TouchView.userInteractionEnabled = YES;
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

-(void) removeSubviews
{
    NSArray *subViewArray = [[[UIApplication sharedApplication] delegate].window subviews];
    for (id obj in subViewArray) [obj removeFromSuperview];
}

-(void) loadFirstView;
{
    [self removeSubviews];

    [[[UIApplication sharedApplication] delegate].window addSubview:self.firstView];

    // The following seems to be needed when running in simulator, but not on device (for 3.5" only?)
    self.firstView.frame = self.view.bounds;

#if 0
    NSLog(@"firstView origin %f %f",self.firstView.frame.origin.x,self.firstView.frame.origin.y);
#endif
}

-(void) loadSecondView;
{
   [self removeSubviews];
    [[[UIApplication sharedApplication] delegate].window addSubview:self.secondView];
}

#pragma mark - accelerometer

#if MINC_ACCELLEROMETER

#define MINC_ACCELLEROMETER_XY 0
#define MINC_ACCELLEROMETER_AMPLITUDE 0
#define MINC_ACCELLEROMETER_TEMPO 0
#define MINC_ACCELLEROMETER_FREQ_AMP 0
#define MINC_ACCELLEROMETER_OSC_SEND 0

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
#if 0
	NSLog(@"%f, %f, %f", acceleration.x, acceleration.y, acceleration.z);
#endif

    MInC_Player* player = gAQP.PlayerDictionary[PLAYER_ID_STR(gAQP.PlayerID)];

#define LIMIT_ACC_VAL(n)	n < -1. ? -1. : n > 1. ? 1. : n

#if MINC_ACCELLEROMETER_XY
	Float64 x = LIMIT_ACC_VAL(acceleration.x);
	Float64 y = LIMIT_ACC_VAL(acceleration.y);
#endif
	Float64 z = LIMIT_ACC_VAL(acceleration.z);

//    NSLog(@"%f",y);
//    NSLog(@"(%f,%f,%f)",x,y,z);
    
    bool changed;

    if (IndexMute == 0)
    {
#if MINC_ACCELLEROMETER_XY
        // X
        changed = NO;
        if (x < -0.6) { if (PrevX != -1 && IndexTempo > -2) { NSLog(@"slow triggered"); IndexTempo--; changed = YES; } PrevX = -1; }
        else if (x > 0.6) { if (PrevX != 1 && IndexTempo < 2) { NSLog(@"fast triggered"); IndexTempo++; changed = YES; } PrevX = 1; }
        else { PrevX = 0; }
        if (changed) { player.SeqSpeed_Cur = player.SeqSpeed_Next = IndexTempo; player.Sequencer.TempoMultiplier_Control = pow(2.0,IndexTempo); [self setPlayerSpeed:IndexTempo]; }

        // Y
        changed = NO;
        if (y < -0.85) { if (PrevY != -1 && IndexOctave > -3) { NSLog(@"lower triggered y=%f",y); IndexOctave--; changed = YES; } PrevY = -1; }
        else if (y > 0.05) { if (PrevY != 1 && IndexOctave < 3) { NSLog(@"higher triggered y=%f",y); IndexOctave++; changed = YES; } PrevY = 1; }
        else { PrevY = 0; }
        if (changed) { player.SeqOctave_Cur = player.SeqOctave_Next = IndexOctave; player.Sequencer.TransposeValue_Control = IndexOctave * 12; [self setPlayerOctave:IndexOctave]; }
#endif
    }
    
    changed = NO;
    if (z > 0.8) { if (PrevZ != 1) { NSLog(@"mute triggered"); IndexMute = 1; changed = YES; } PrevZ = 1; }
    else { if (PrevZ != 0) { NSLog(@"unmute triggered"); IndexMute = 0; changed = YES; } PrevZ = 0; }
    if (changed) { player.SeqMute_Cur = player.SeqMute_Next = IndexMute; player.Sequencer.AmpMultiplier_Accel = IndexMute == 1 ? 0. : 1.0; [self setPlayerMute:IndexMute]; }
    
    
#if MINC_ACCELLEROMETER_OSC_SEND
	[self.networking sendOSCMsgWithIntValue:"/minc/accX\0\0":12:FLOAT_TO_MRMR_INT(x)];
	[self.networking sendOSCMsgWithIntValue:"/minc/accY\0\0":12:FLOAT_TO_MRMR_INT(y)];
	[self.networking sendOSCMsgWithIntValue:"/minc/accZ\0\0":12:FLOAT_TO_MRMR_INT(z)];
#endif
    
#if MINC_ACCELLEROMETER_FREQ_AMP
    x = (x + 1.0) / 2.;
    y = (y + 1.0) / 2.;
    
    if (gFirstView != nil)
    {
        [gFirstView sendOSC_Filter:x];
        Float64 cutoff_freq = kSR / 2. * (x > 0.9 ? 0.9 : x); /* 90% is max */
        [gAQP->Sequencer_Pri setCutoffFreq_Accel:cutoff_freq];
//        NSLog(@"cutoff freq %f",cutoff_freq);
        
        [gFirstView sendOSC_Volume:y];
        Float64 amp = y < 0.05 ? 0.0 : y; /* anything less than 5% goes to -infinity */
        [gAQP->Sequencer_Pri setAmp_Accel:amp];
//        NSLog(@"amplitude %f",y);
    }
#endif

#if MINC_ACCELLEROMETER_AMPLITUDE
	// AMPLITUDE (is this obsolete given the similar code above?
	// if z is 0 to 0.6 then it is right side up, otherwise it is flipped -> should drop out
    if (player != nil)
        player.Sequencer.AmpMultiplier_Accel = (z > 0.6)? 0. : 1.0;
#endif
    
#if MINC_ACCELLEROMETER_TEMPO
	// TEMPO
    if (gAQP->Sequencer_Pri != nil)
    {
        Float64 tempo_mult = x * gAQP->Sequencer_Pri.TempoSensitivity;
#if 0 /* tilt left for faster; tilt right for slower */
        tempo_mult = 1.0 - tempo_mult;
#else /* tilt left for slower; tilt right for faster */
        tempo_mult += 1.0;
#endif
        tempo_mult *= 2.;
        gAQP->Sequencer_Pri.TempoMultiplier_Accel = tempo_mult;
    }
#endif

#if 0
	NSLog(@"%f %f",x,tempo_mult);
#endif
    
#if 0
    [gFirstView.TouchView setNeedsDisplay];
#endif
}

#endif

@end

/*********************************************************************************/

#pragma mark NSURLConnection Delegate Methods

@implementation MInC_URL
@end

@implementation MInC_URL_PlayerList

-(id)init
{
    self = [super init];
    
    NSString* url_string = [NSString stringWithFormat:@"http://healthyboys.com/MInC/player_list.php?id=%08ld",(long)gAQP.PlayerID];

    // Create the request.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url_string]];
    
    // Create url connection and fire request
    Conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    Data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [Data appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *myString = [[NSString alloc] initWithData:Data encoding:NSUTF8StringEncoding];
    NSLog(@"Player list from healthyboys.com\n%@",myString);
    
    NSArray *playerItems = [myString componentsSeparatedByString:@"\n"];
    NSMutableArray *playerParamArray = [[NSMutableArray alloc] initWithCapacity:playerItems.count];
    
    for (NSString* playerItem in playerItems)
    {
        NSArray* playerInfoArray = [playerItem componentsSeparatedByString:@","];
        if (playerInfoArray.count > 1)
        {
            /* filter out "self" here */
            if ([playerInfoArray[0] integerValue] != gAQP.PlayerID)
            {
                NSInteger player_id = [playerInfoArray[0] integerValue];
                NSInteger player_pos = [playerInfoArray[1] integerValue];
                NSInteger player_speed = [playerInfoArray[2] integerValue];
                NSInteger player_octave = [playerInfoArray[3] integerValue];
                NSInteger player_mute = [playerInfoArray[4] integerValue];
                NSInteger player_like = [playerInfoArray[5] integerValue];
                
#if 0
                NSLog(@"player ID (integer value) %ld %ld %ld %ld %ld %ld",
                      (long)player_id,
                      (long)player_pos,
                      (long)player_speed,
                      (long)player_octave,
                      (long)player_mute,
                      (long)player_like);
#endif
                
                NSArray *playerInfo = [NSArray arrayWithObjects:
                                       [[NSNumber alloc] initWithInteger:player_id],
                                       [[NSNumber alloc] initWithInteger:player_pos],
                                       [[NSNumber alloc] initWithInteger:player_speed],
                                       [[NSNumber alloc] initWithInteger:player_octave],
                                       [[NSNumber alloc] initWithInteger:player_mute],
                                       [[NSNumber alloc] initWithInteger:player_like],
                                       nil];
                
                [playerParamArray addObject:playerInfo];
            }
        }
    }
    
    [gAQP setOtherPlayersSequence:playerParamArray];
    [gFirstView.TouchView setNeedsDisplay];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Failed to receive player list from healthyboys.com");
}

@end

@implementation MInC_URL_SetPlayerParam

-(void)setParam:(const char*)param_name withValue:(SInt16)val;
{
    ParamName = param_name;

    NSString* url_string = [NSString stringWithFormat:@"http://healthyboys.com/MInC/player_%s.php?id=%08ld&val=%d",ParamName,(long)gAQP.PlayerID,val];
    
    // Create the request.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url_string]];
    
    // Create url connection and fire request
    Conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {}

// Return nil to indicate not necessary to store a cached response for this connection
- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse*)cachedResponse { return nil; }

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Failed to send player %s to healthyboys.com",ParamName);
}

@end
