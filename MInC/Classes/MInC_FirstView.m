//
//  MInC_FirstView.m
//  MInC
//
//  Created by Kojiro Umezaki on 9/20/13.
//
//

#import "MInC_FirstView.h"

#import "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

#import "MInC_SecondView.h"
extern MInC_SecondView *gSecondView;

#import "MInC_ViewController.h"
extern MInC_ViewController *gViewController;

MInC_FirstView *gFirstView = nil;

@implementation MInC_FirstView

@synthesize NewMod;
@synthesize WithServer;
@synthesize HeartbeatTimer;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)awakeFromNib
{
    gFirstView = self;
    
	NewMod = NO;
	WithServer = NO;
    
	[self createImageArray];
    
	TouchView.multipleTouchEnabled = YES;
    
	_InterstitialString = nil;
	_ServerIPAddString = nil;

#if 0
    //Load logo images for Heartbeat Animation
    NSMutableArray *MInCLogo = [NSMutableArray array];
    for (int i = 1; i <= 2; i++)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"terry-riley_in-C_%d", i] ofType:@"png"];
        
        UIImage *image = [UIImage imageWithContentsOfFile:path];

        if (image)
            [MInCLogo addObject:image];
    }
#endif
    
    LoadSeqFileTimer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:gAQP selector:@selector(loadSeqFile) userInfo:nil repeats:NO];
    [self startActivityIndicator];
    [self checkIncomingMessages];

    ActivityIndicatorView.hidesWhenStopped = YES;
    
    [self setRelativePos:0];
}

- (void)dealloc
{
//	[_ImageArray release];
    
    if ([self.HeartbeatTimer isValid])
        [self.HeartbeatTimer invalidate];
    
    [super dealloc];
}

-(IBAction)switchToSettings
{
    NSLog(@"switchToSettings");
    [gViewController loadSecondView];
}

-(IBAction)setSequence
{
	if (WithServer)
    {
		[gViewController.networking sendOSCMsg:"/minc/mod\0\0\0":12];
	}
    else
	{
		[gAQP setSequence:(++gAQP.SeqNum)];
		NewMod = YES;
	}

//    NSLog(@"WithServer %s",WithServer?"ON":"OFF");
//    NSLog(@"gAQP->SeqNum %ld",gAQP.SeqNum);
}

-(IBAction)set8vbDown:(id)sender
{
	[self send8vb:true];
    gAQP->Sequencer_Pri.TransposeValue_Control = -12.;
}

-(IBAction)set8vbUp:(id)sender
{
	[self send8vb:false];
    gAQP->Sequencer_Pri.TransposeValue_Control = -0.;
}

-(void)send8vb:(BOOL)direction
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/8vb\0\0\0":12:direction?1:0];
}

-(IBAction)set8vaDown:(id)sender
{
	[self send8va:true];
    gAQP->Sequencer_Pri.TransposeValue_Control = +12.;
}

-(IBAction)set8vaUp:(id)sender
{
	[self send8va:false];
    gAQP->Sequencer_Pri.TransposeValue_Control = 0.;
}

-(void)send8va:(BOOL)direction
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/8va\0\0\0":12:direction?1:0];
}

-(IBAction)set2xSlowDown:(id)sender
{
	[self send2xSlow:true];
    gAQP->Sequencer_Pri.TempoMultiplier_Control = 0.5;
}

-(IBAction)set2xSlowUp:(id)sender
{
	[self send2xSlow:false];
    gAQP->Sequencer_Pri.TempoMultiplier_Control = 1.;
}

-(void)send2xSlow:(BOOL)direction
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/2xslow\0\0\0\0":16:direction?1:0];
}

-(IBAction)set2xFastDown:(id)sender
{
	[self send2xFast:true];
    gAQP->Sequencer_Pri.TempoMultiplier_Control = 2.;
}

-(IBAction)set2xFastUp:(id)sender
{
	[self send2xFast:false];
    gAQP->Sequencer_Pri.TempoMultiplier_Control = 1.;
}

-(void)send2xFast:(BOOL)direction
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/2xfast\0\0\0\0":16:direction?1:0];
}

-(IBAction)requestHint:(id)sender
{
	[gViewController.networking sendOSCMsg:"/minc/hint\0\0":12];
}

-(IBAction)requestStatus:(id)sender
{
	[gViewController.networking sendOSCMsg:"/minc/status\0\0\0\0":16];
}

-(IBAction)setSpeaker:(id)sender
{
	NSLog(@"setSpeaker %ld\n",(long)SpeakerSegControl.selectedSegmentIndex);
    
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/speak\0":12:(int)SpeakerSegControl.selectedSegmentIndex];
}

-(IBAction)setInstrument:(id)sender
{
	NSLog(@"setInstrument %ld\n",(long)InstrSegControl.selectedSegmentIndex);
    
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/instr\0":12:(int)InstrSegControl.selectedSegmentIndex];

    
    Float64 transpose[4] = { +12., 0., -12., -24. };
    gAQP->Sequencer_Pri.TransposeValue_Instr = transpose[InstrSegControl.selectedSegmentIndex];
}

-(IBAction)setNoteDuration:(id)sender
{
	MInC_Sequencer* q = gAQP->Sequencer_Pri;
	if (q != nil)
		q.DurMultiplier = [NoteDurationSlider value];
    
    [gViewController.networking sendOSCMsgWithIntValue:"/minc/dur\0\0\0":12:FLOAT_TO_MRMR_INT([NoteDurationSlider value])];
}

-(void)sendOSC_Filter:(Float64)val
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/filt\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

-(void)sendOSC_Volume:(Float64)val
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/vol\0\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

-(void)sendOSC_Waveform:(Float64)val
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/wave\0\0":12:FLOAT_TO_MRMR_INT(val)];
}

#pragma mark - image array

-(void) createImageArray
{
#if 0
    UIImage *image = [UIImage imageNamed:@"InCCover.jpg"];
    [gFirstView.NotationView setImage:image];
    _ImageArray = [[NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"InC01.jpg"],
                  [UIImage imageNamed:@"InC02.jpg"],
                  [UIImage imageNamed:@"InC03.jpg"],
                  [UIImage imageNamed:@"InC04.jpg"],
                  [UIImage imageNamed:@"InC05.jpg"],
                  [UIImage imageNamed:@"InC06.jpg"],
                  [UIImage imageNamed:@"InC07.jpg"],
                  [UIImage imageNamed:@"InC08.jpg"],
                  [UIImage imageNamed:@"InC09.jpg"],
                  [UIImage imageNamed:@"InC10.jpg"],
                  [UIImage imageNamed:@"InC11.jpg"],
                  [UIImage imageNamed:@"InC12.jpg"],
                  [UIImage imageNamed:@"InC13.jpg"],
                  [UIImage imageNamed:@"InC14.jpg"],
                  [UIImage imageNamed:@"InC15.jpg"],
                  [UIImage imageNamed:@"InC16.jpg"],
                  [UIImage imageNamed:@"InC17.jpg"],
                  [UIImage imageNamed:@"InC18.jpg"],
                  [UIImage imageNamed:@"InC19.jpg"],
                  [UIImage imageNamed:@"InC20.jpg"],
                  [UIImage imageNamed:@"InC21.jpg"],
                  [UIImage imageNamed:@"InC22.jpg"],
                  [UIImage imageNamed:@"InC23.jpg"],
                  [UIImage imageNamed:@"InC24.jpg"],
                  [UIImage imageNamed:@"InC25.jpg"],
                  [UIImage imageNamed:@"InC26.jpg"],
                  [UIImage imageNamed:@"InC27.jpg"],
                  [UIImage imageNamed:@"InC28.jpg"],
                  [UIImage imageNamed:@"InC29.jpg"],
                  [UIImage imageNamed:@"InC30.jpg"],
                  [UIImage imageNamed:@"InC31.jpg"],
                  [UIImage imageNamed:@"InC32.jpg"],
                  [UIImage imageNamed:@"InC33.jpg"],
                  [UIImage imageNamed:@"InC34.jpg"],
                  [UIImage imageNamed:@"InC35.jpg"],
                  [UIImage imageNamed:@"InC36.jpg"],
                  [UIImage imageNamed:@"InC37.jpg"],
                  [UIImage imageNamed:@"InC38.jpg"],
                  [UIImage imageNamed:@"InC39.jpg"],
                  [UIImage imageNamed:@"InC40.jpg"],
                  [UIImage imageNamed:@"InC41.jpg"],
                  [UIImage imageNamed:@"InC42.jpg"],
                  [UIImage imageNamed:@"InC43.jpg"],
                  [UIImage imageNamed:@"InC44.jpg"],
                  [UIImage imageNamed:@"InC45.jpg"],
                  [UIImage imageNamed:@"InC46.jpg"],
                  [UIImage imageNamed:@"InC47.jpg"],
                  [UIImage imageNamed:@"InC48.jpg"],
                  [UIImage imageNamed:@"InC49.jpg"],
                  [UIImage imageNamed:@"InC50.jpg"],
                  [UIImage imageNamed:@"InC51.jpg"],
                  [UIImage imageNamed:@"InC52.jpg"],
                  [UIImage imageNamed:@"InC53.jpg"],
                  nil
                  ];
#endif
}

-(void)checkIncomingMessages
{
	if (_InterstitialString != nil)
	{
		[_StatusLabel setText:_InterstitialString];
		[_InterstitialString release];
		_InterstitialString = nil;
	}
	
	if (NewMod == YES)
	{
#if 0
		if (gAQP.SeqNum >= 0 && gAQP.SeqNum <= gAQP.NumSequences)
			_NotationView.image = [_ImageArray objectAtIndex:gAQP.SeqNum-1];
#endif
		NewMod = NO;
        if (!gAQP->Sequencer_Pri.Playing)
            [gAQP->Sequencer_Pri start];
	}
    
	if (_ServerIPAddString != nil)
	{
        gFirstView.WithServer = YES;
        
		[gViewController.networking newServerIPAddress:_ServerIPAddString];
		
		if ((gSecondView != nil) && ![gSecondView isEditing])
			[gSecondView setIPAddressAndPortNumTextFields];
		
		[_ServerIPAddString release];
		_ServerIPAddString = nil;
	}
	
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkIncomingMessages) userInfo:nil repeats:NO];
}

-(void)startActivityIndicator
{
#if MINC_POS_GRAPHICS
    viewGradient.hidden = YES;
    viewPos.hidden = YES;
    viewAvgPos.hidden = YES;
#endif
    [ActivityIndicatorView startAnimating];
}

-(void)stopActivityIndicator
{
#if MINC_POS_GRAPHICS
    viewGradient.hidden = NO;
    viewPos.hidden = NO;
    viewAvgPos.hidden = !gViewController.networking.ReceivingHeartBeat;
#endif
    [ActivityIndicatorView stopAnimating];
}

-(void)updateAvgPosView
{
#if MINC_POS_GRAPHICS
    viewAvgPos.hidden = !gViewController.networking.ReceivingHeartBeat;
#endif
}

-(void)setRelativePos:(SInt16)pos
{
#if MINC_POS_GRAPHICS
    NSLog(@"setRelativePos pos=%d",pos);

    if (gViewController.networking.ReceivingHeartBeat)
    {
        pos = pos < -3 ? -4 : pos;
        pos = pos > +3 ? +4 : pos;
        pos = -pos;
    }
    else
        pos = 0;
    
    Float64 h = self.bounds.size.height;
    Float64 w = self.bounds.size.width;
    Float64 cell_h = 35.;
    Float64 y = h / 2. + cell_h * (pos - 0.5);
    
    viewAvgPos.frame = CGRectMake(0., y, w, cell_h);
    
	[self setNeedsDisplay];
#endif
}

-(void)heartBeat
{
//    NSLog(@"received heartbeat");

    [UIView animateWithDuration:0.1 animations:^{
        viewA.alpha = 1.0;
        viewB.alpha = 1.0;
        
    }];

    [UIView animateWithDuration:0.9 animations:^{
        viewA.alpha = 0.0;
        viewB.alpha = 1.0;
        
    }];
}

-(void)startHeartBeatCheck
{
//    NSLog(@"startHeartBeatCheck");
    if ([HeartbeatTimer isValid])
        [HeartbeatTimer invalidate];
    HeartbeatTimer = [NSTimer scheduledTimerWithTimeInterval:10. target:self selector:@selector(heartBeatLost) userInfo:nil repeats:NO];
}

-(void)heartBeatLost
{
    NSLog(@"heartBeatLost");
    gViewController.networking.ReceivingHeartBeat = NO;
    [self updateAvgPosView];
}

@end
