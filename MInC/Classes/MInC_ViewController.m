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

MInC_ViewController *gViewController = nil;

#include "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

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

- (void)callHTTPServer:(NSString*)url_str withData:(NSData**)data :(NSURLResponse**)response :(NSError**)error
{
    *data = [NSURLConnection
            sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url_str]]
            returningResponse:response
            error:error];
}

- (void)getScoreList
{
    NSData* data = nil;
    NSURLResponse* response = nil;
    NSError* error = nil;

    /* request score list from HTTP server */
    [self.firstView startActivityIndicator];
    [self callHTTPServer:@"http://healthyboys.com/MInC/score_list.php?" withData:&data :&response :&error];
    if (error == nil)
    {
        // Parse data here
        NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Score list from healthyboys.com\n%@",myString);
        NSArray *listItems = [myString componentsSeparatedByString:@"\n"];
        long pos = 0;
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
            NSLog(@"[%ld] %@",pos++,item);
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
    NSString* url_string = [NSString stringWithFormat:@"http://healthyboys.com/MInC/score.php?score_id=%ld",(long)score_id];
    [self callHTTPServer:url_string withData:&data :&response :&error];
    MInC_SequenceFile* seqFile = [[MInC_SequenceFile alloc] init];
    if (error == nil)
    {
        // Parse data here
        NSString *myString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Score data from healthyboys.com\n%@",myString);
        
        // convert NSString in sequences
        [seqFile writeToFile:@"TCP.dat" withData:data];
    }
    else
        NSLog(@"Failed to receive score data from healthyboys.com");
    [seqFile readFromFile:@"TCP.dat"];
    [self.firstView stopActivityIndicator];
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
    [self getScoreData:[scoreListPickerView selectedRowInComponent:0]];

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

#if 0
	// AMPLITUDE
	// if z is 0 to 0.6 then it is right side up, otherwise it is flipped -> should drop out
    if (gAQP->Sequencer_Pri != nil)
        gAQP->Sequencer_Pri.AmpMultiplier_Accel = (z > 0.6)? 0. : 0.5;

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
}

#endif

@end
