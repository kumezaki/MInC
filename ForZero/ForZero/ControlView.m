//
//  ControlView.m
//  ForZero
//
//  Created by Chris Lavender on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "ControlView.h"

@implementation ControlView

@synthesize delegate;
@synthesize frontView               =_frontView;
@synthesize flipView                =_flipView;
@synthesize recButton               =_recButton;
@synthesize stopButton              =_stopButton;
@synthesize playButton              =_playButton;
@synthesize viewLabel               =_viewLabel;
@synthesize volumerSlider           =_volumerSlider;
@synthesize currentDisplayedView    =_currentDisplayedView;


- (void)dealloc
{
    [_viewLabel             release];
    [_recButton             release];
    [_stopButton            release];
    [_playButton            release];
    [_frontView             release];
    [_flipView              release];
    [_volumerSlider         release];
    [_currentDisplayedView  release];
    
    [super dealloc];
}

- (void)setupSelf
{
    // views are tagged in the .xib in case it's needed to reference them by tag.
    // frontView = 1 & flipView = 2
    [self addSubview:self.frontView];
    [self addSubview:self.flipView];
    
    if ([self.frontView isKindOfClass:[ProgressBarView class]]) {
        self.frontView.delegate = self;
    }
    self.backgroundColor = [UIColor clearColor];
    
    //kCornerRadius is set in the ProgressView
    //it's used here so that the flipView will match the front facing ProgressView
    self.flipView.layer.cornerRadius = kCornerRadius;

    [self bringSubviewToFront:self.frontView];
    self.currentDisplayedView = self.frontView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSelf];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setupSelf];
}

#pragma mark - IBActions

// Currently a UIButton. Should probably be a swipe gesture.
- (IBAction)flipServerControls:(id)sender
{    
    
    [UIView transitionWithView:self
                      duration:kCrossfadeDuration 
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        if (self.currentDisplayedView == self.frontView) {
                            [self sendSubviewToBack:self.frontView];
                            [self bringSubviewToFront:self.flipView];
                            self.currentDisplayedView = self.flipView;
                        }
                        else {
                            [self sendSubviewToBack:self.flipView];
                            [self bringSubviewToFront:self.frontView];
                            self.currentDisplayedView = self.frontView;
                        }
                    }
                    completion:^(BOOL finished){
                        
                    }];
}

-(IBAction)setTransportState:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        NSLog(@"ControlView setTransportState: %@",[[sender titleLabel]text]);
    }
}

-(IBAction)setVolume:(id)sender
{
	if ([sender isKindOfClass:[UISlider class]]) {
        NSLog(@"ControlView setVolume value:%f\n",[(UISlider*)sender value]);
    }
}

#pragma mark - void Method Implementations

- (void)updateFrameSize:(CGRect)frame
{
    self.frame  = frame;
    CGRect newSize = CGRectMake(0, 0, frame.size.width, frame.size.height);
    self.frontView.frame = newSize;
    self.flipView.frame = newSize;
}

- (void)displayProgress
{
    [self.frontView setNeedsDisplay];
}

#pragma mark - ProgressBarView Delegate Method Implementations
- (float)progressValueForProgressBarView:(ProgressBarView *)requestor
{
    float prog = [self.delegate progressValueForControlView:self];
    return prog;
}

@end
