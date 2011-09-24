//
//  ControlView.m
//  ForZero
//
//  Created by Chris Lavender on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "ControlView.h"

@implementation ControlView

@synthesize delegate=_delegate;
@synthesize frontView=_frontView, flipView=_flipView, currentDisplayedView=_currentDisplayedView;
@synthesize recButton=_recButton, stopButton=_stopButton, playButton=_playButton;
@synthesize viewLabel=_viewLabel;

- (void)dealloc
{
    [_viewLabel             release];
    [_recButton             release];
    [_stopButton            release];
    [_playButton            release];
    [_frontView             release];
    [_flipView              release];
    [_currentDisplayedView  release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // views are tagged in the .xib incase it's needed to reference by tag.
        // frontView = 1 & flipView = 2
        [self addSubview:self.frontView];
        [self addSubview:self.flipView];
        
        if ([self.frontView isKindOfClass:[ProgressBarView class]]) {
            self.frontView.delegate = self;
        }
        self.backgroundColor = [UIColor clearColor];
        
        //kCornerRadius is set in the ProgressView
        //it's used here so that the flipView will match
        self.flipView.layer.cornerRadius = kCornerRadius;
        
        [self bringSubviewToFront:self.frontView];
        self.currentDisplayedView = self.frontView;
    }
    return self;
}

- (void)awakeFromNib
{
    [self addSubview:self.frontView];
    [self addSubview:self.flipView];
    
    if ([self.frontView isKindOfClass:[ProgressBarView class]]) {
        self.frontView.delegate = self;
    }
    
    self.backgroundColor = [UIColor clearColor];
    self.flipView.layer.cornerRadius = kCornerRadius;
    
    [self bringSubviewToFront:self.frontView];
    self.currentDisplayedView = self.frontView;
}

#pragma mark - IBActions

// Currently a UIButton. Should probably be a swipe gesture.
- (IBAction)flipServerControls:(id)sender
{    
    
    [UIView transitionWithView:self
                      duration:.5
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
        NSLog(@"server: %@",[[sender titleLabel]text]);
    }
}

-(IBAction)setVolume:(id)sender
{
	if ([sender isKindOfClass:[UISlider class]]) {
        NSLog(@"%f\n",[(UISlider*)sender value]);
    }
}

#pragma mark - void Method Implementations

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
