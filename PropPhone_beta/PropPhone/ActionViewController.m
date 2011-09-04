//
//  ActionViewController.m
//  propPractice
//
//  Created by Chris Lavender on 8/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ActionViewController.h"

@interface ActionViewController()
{
    UIView *currentView;
}
@end

@implementation ActionViewController

@synthesize delegate=_delegate;

@synthesize transportState = _transportState;

- (void)updateScreenImage {
    if ([self.transportState isEqualToString:@"play"] && currentView != incomingCallView) {
        [self.view addSubview:incomingCallView];
        [currentView removeFromSuperview];
        currentView = incomingCallView;
        
    }
    else if ([self.transportState isEqualToString:@"pause"] && currentView != endCallview){
        
        [self.view addSubview:endCallview];
        [currentView removeFromSuperview];
        currentView = endCallview;
    }
    else if ([self.transportState isEqualToString:@"stop"] && currentView != standbyView){
        [self.view addSubview:standbyView];
        [currentView removeFromSuperview];
        currentView = standbyView;
    }
}

- (void)setTransportState:(NSString *)transportState {
    _transportState = transportState;
    [self updateScreenImage];
}

- (void)dealloc
{
    [_transportState release]; 
    
    [standbyView release];
    [incomingCallView release];
    [endCallview release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

#pragma mark - View lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            //customizations... 
        //This class is just a controller to manage the different sub-views
        [[NSBundle mainBundle] loadNibNamed:@"EndCallView"      owner:self options:nil];
        [[NSBundle mainBundle] loadNibNamed:@"IncomingCallView" owner:self options:nil];
        [[NSBundle mainBundle] loadNibNamed:@"StandbyView"      owner:self options:nil];
        }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:standbyView];
    currentView = standbyView;
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

- (IBAction)done:(id)sender
{
    [self.delegate actionViewControllerDidFinish:self];
}

- (IBAction)answerCall 
{
    [self.delegate userRespondedFromActionView:self withAction:@"pause"];
    self.transportState = @"pause";
    //printf("call answered\n");
}

- (IBAction)endCall
{
    [self.delegate userRespondedFromActionView:self withAction:@"stop"];
    self.transportState = @"stop";
    //printf("call declined\n");
}
 
@end
