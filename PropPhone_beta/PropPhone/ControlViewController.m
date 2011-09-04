//
//  ControlViewController.m
//  Prop Phone
//
//  Created by Chris Lavender on 8/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ControlViewController.h"
#import "ConnectionLogic.h"
#import "AppConfig.h"

@interface ControlViewController() 
{
    BOOL loopingOn;
}
@end

@implementation ControlViewController

@synthesize clientConnection = _clientConnection;
@synthesize delegate=_delegate;

@synthesize bv =_bv;

@synthesize led=_led;
@synthesize status=_status;
@synthesize loopButton=_loopButton;
@synthesize playButton=_playButton;

@synthesize activityIndicator = _activityIndicator;
@synthesize nameLabel = _nameLabel;
@synthesize statusLabel = _statusLabel;

- (BOOL)connected {
    BOOL result;
    if (self.clientConnection == nil) result = NO;
    else result = YES;
    return result;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Customization
            }
    return self;
}

- (void)dealloc
{    
    
    [_clientConnection release];
    [_led release];
    [_status release];
    [_loopButton release];
    [_playButton release];
    
    [_statusLabel release];
    [_nameLabel release];
    [_activityIndicator release];
    
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
    self.status.text = @"Not Connected.";
    
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

#pragma mark - IBActions

- (IBAction)showBrowser
{
    [[NSBundle mainBundle] loadNibNamed:@"BrowserView" owner:self options:nil];
    
    //alloc/init the browser
    serverBrowser = [[ServerBrowser alloc] init];
    serverBrowser.delegate = self;
    self.nameLabel.text = [AppConfig getInstance].name;
    [self updateServerList];
    
    //start the browser
    [serverBrowser start];
    [self.activityIndicator startAnimating];
    self.statusLabel.text = @"Searching for a device to control...";
    
    self.bv.frame = CGRectMake(0, 
                               480, 
                               self.bv.bounds.size.width, 
                               self.bv.bounds.size.height);
    
    //show the browser view (off screen)
    [self.view addSubview:self.bv];

    [UIView animateWithDuration:.5 
                     animations:^{
                         self.bv.frame = CGRectMake(0, 
                                                    480 - self.bv.bounds.size.height, 
                                                    self.bv.bounds.size.width, 
                                                    self.bv.bounds.size.height);
                     } 
                     completion:NULL];

}

- (IBAction)dismissBrowser {
    
    [UIView animateWithDuration:.5 
                     animations:^{
                         self.bv.frame = CGRectMake(0, 
                                                    480, 
                                                    self.bv.bounds.size.width, 
                                                    self.bv.bounds.size.height);
                     } 
                     completion:^(BOOL finished){
                         [self.bv removeFromSuperview];
                         [serverBrowser stop];
                         [serverBrowser release];
                         [self.activityIndicator stopAnimating];
                         self.bv = nil;
                     }];
}

- (IBAction)done
{
    if (self.clientConnection != nil) { 
        printf("ControlViewController.clientConnection stopped?\n");
        [self.clientConnection stop];
    }
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];

    [self.delegate killControl:self];
}

- (IBAction)mediaTransport:(UIButton*)sender {
    
    /*const char *msg = [sender.titleLabel.text cStringUsingEncoding:NSASCIIStringEncoding];
     [(Prop_PhoneAppDelegate*) [[UIApplication sharedApplication] delegate] sendOSCMsg:msg :sizeof(msg)];*/
    
    NSString *transportAction = sender.titleLabel.text;
    
    if ([transportAction isEqualToString:@"play"]) {
        [self.clientConnection.connection.processOSC packOSCMsg:"/prop/play\0\0":12];
    }
    else if ([transportAction isEqualToString:@"pause"]) {
        [self.clientConnection.connection.processOSC packOSCMsg:"/prop/pause\0":12];
    }
    else if ([transportAction isEqualToString:@"stop"]) {
        [self.clientConnection.connection.processOSC packOSCMsg:"/prop/stop\0\0":12];
    }
}

- (IBAction)playDefaultSound:(UIButton*)sender {
    
    NSString *transportAction = sender.titleLabel.text;
    
    if ([transportAction isEqualToString:@"default"]) {
        [self.clientConnection.connection.processOSC packOSCMsg:"/prop/default\0\0\0":16];
    }
}

- (IBAction)sendLoopPlaybackToggle {
    
    if (!loopingOn) {
        [self.loopButton setImage:[UIImage imageNamed:@"loop_default2.png"] forState:UIControlStateNormal];
        loopingOn = YES;
    }
    else {
        [self.loopButton setImage:[UIImage imageNamed:@"loop_default1.png"] forState:UIControlStateNormal];
        loopingOn = NO;
    }
    //printf("loopingOn:%d\n", (int)loopingOn);
    [self.clientConnection.connection.processOSC packOSCMsgWithIntValue:"/prop/loop\0\0":12:(int)loopingOn];
}


#pragma mark - ConnectionLogicDelegate Methods Implementations
    
/* Error Alerts */
    // Room closed from outside
- (void)connectionTerminated:(id)sender reason:(NSString*)reason {
    
    if (self.bv != nil) [self dismissBrowser];

    // Explain what happened
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Connection Terminated" message:reason delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    
    [self.led setImage:[UIImage imageNamed:@"plug_default.png"] 
              forState:UIControlStateNormal];
    
    [self.led setImage:[UIImage imageNamed:@"plug_highlighted.png"] 
              forState:UIControlStateHighlighted];
   
    self.led.highlighted = NO;
    self.led.userInteractionEnabled = YES;
    self.status.text = @"Not Connected.";
    self.clientConnection = nil;
}

- (void)displayHeartbeat:(UInt8)val
{
    //NSLog(@"%d",val);
    //self.led.highlighted = val == 0 ? NO : YES;
    if (val > 0) {
        [self.led setImage:[UIImage imageNamed:@"heart_highlight.png"] 
                  forState:UIControlStateNormal];
    }
    else [self.led setImage:[UIImage imageNamed:@"heart_default.png"] 
                   forState:UIControlStateNormal];
}

- (void)processMessage:(NSString *)message {    
    if ([message isEqualToString:@"playbutt"]) {
        [self.playButton setImage:[UIImage imageNamed:@"play_default2.png"] 
                         forState:UIControlStateNormal];
    }
    else if ([message isEqualToString:@"stopbutt"]) {
        [self.playButton setImage:[UIImage imageNamed:@"play_default.png"] 
                         forState:UIControlStateNormal];
    }

}

- (void)didResolveService:(NSNetService *)service {
    [self dismissBrowser];
    [self.clientConnection.connection.processOSC packOSCMsgWithIntValue:"/prop/loop\0\0":12:(int)loopingOn];
    self.led.userInteractionEnabled = NO;
}

#pragma mark -
#pragma mark ServerBrowserDelegate Method Implementations

- (void)updateServerList {
    [serverList reloadData];
    [self.activityIndicator stopAnimating];
    self.statusLabel.text = @"Connect to another Prop Phone device.";
}

#pragma mark -
#pragma mark UITableViewDelegate Method Implementations

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath* currentRow = [serverList indexPathForSelectedRow];
    if ( currentRow == nil ) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Which device?" message:@"Please select which device you want to connect to from the list above" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    //printf("tableView didSelectRowAtIndexPath in BrowserViewController\n");
    
    if (![self connected]) {
        
        NSNetService* selectedServer = [serverBrowser.servers objectAtIndex:currentRow.row];
        
        ControlClient* connection = [[[ControlClient alloc] initWithNetService:selectedServer]autorelease];
        
        [serverBrowser stop];

        self.clientConnection = connection;
        self.status.text = [NSString stringWithFormat:@"Connected to: %@", selectedServer.name];
        
        if ( self.clientConnection != nil ) {
            self.clientConnection.delegate = self;
            [self.clientConnection start];
        }

        self.statusLabel.text = @"Connecting...";
        [self.activityIndicator startAnimating];
    }
    else {
        [serverBrowser stop];
        [self dismissBrowser];
    }
}

#pragma mark UITableViewDataSource Method Implementations

// Number of rows in each section. One section by default.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [serverBrowser.servers count];
}


// Table view is requesting a cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* serverListIdentifier = @"serverListIdentifier";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:serverListIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:serverListIdentifier] autorelease];
	}
    
    // Set cell's text to server's name
    NSNetService* server = [serverBrowser.servers objectAtIndex:indexPath.row];
    cell.textLabel.text = [server name];
    
    return cell;
}


@end