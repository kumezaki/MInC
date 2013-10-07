//
//  FirstView.m
//  MInC
//
//  Created by Kojiro Umezaki on 9/20/13.
//
//

#import "FirstView.h"

#import "MInCAppDelegate.h"

#import "FirstViewController.h"
extern FirstViewController *gViewController;

#import "SecondView.h"
extern SecondView *gSecondView;

extern AQPlayer *gAQP;

FirstView *gFirstView = nil;

@implementation FirstView

@synthesize NewMod;

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

-(id)init
{
    [super init];
    
    gFirstView = self;

	WithServer = YES;

	NewMod = NO;

	[self createImageArray];

	TouchView.multipleTouchEnabled = YES;

	_InterstitialString = nil;
	_ServerIPAddString = nil;
	
	[self checkIncomingMessages];
    
    return self;
}

- (void)dealloc
{
	[_ImageArray release];
    
    [super dealloc];
}

-(void)setWithServer:(BOOL)on
{
	WithServer = on;
	NSLog(@"setWithServer %s\n",WithServer?"ON":"OFF");
}

-(IBAction)setSequence
{
	if (WithServer)
		[gViewController.networking sendOSCMsg:"/minc/mod\0\0\0":12];
	else
	{
		[gAQP setSequence:(++gAQP->SeqNum)];
		NewMod = YES;
	}
}

-(IBAction)set8vbDown:(id)sender
{
	[self send8vb:true];
}

-(IBAction)set8vbUp:(id)sender
{
	[self send8vb:false];
}

-(void)send8vb:(BOOL)direction
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/8vb\0\0\0":12:direction?1:0];
}

-(IBAction)set8vaDown:(id)sender
{
	[self send8va:true];
}

-(IBAction)set8vaUp:(id)sender
{
	[self send8va:false];
}

-(void)send8va:(BOOL)direction
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/8va\0\0\0":12:direction?1:0];
}

-(IBAction)set2xSlowDown:(id)sender
{
	[self send2xSlow:true];
}

-(IBAction)set2xSlowUp:(id)sender
{
	[self send2xSlow:false];
}

-(void)send2xSlow:(BOOL)direction
{
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/2xslow\0\0\0\0":16:direction?1:0];
}

-(IBAction)set2xFastDown:(id)sender
{
	[self send2xFast:true];
}

-(IBAction)set2xFastUp:(id)sender
{
	[self send2xFast:false];
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
	NSLog(@"setSpeaker %d\n",SpeakerSegControl.selectedSegmentIndex);
    
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/speak\0":12:SpeakerSegControl.selectedSegmentIndex];
}

-(IBAction)setInstrument:(id)sender
{
	NSLog(@"setInstrument %d\n",InstrSegControl.selectedSegmentIndex);
    
	[gViewController.networking sendOSCMsgWithIntValue:"/minc/instr\0":12:InstrSegControl.selectedSegmentIndex];
}

-(IBAction)setNoteDuration:(id)sender
{
	Sequencer* q = gAQP->Sequencer_Pri;
	if (q != nil)
		q->DurMultiplier = [NoteDurationSlider value];
    
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
	if (gAQP->Piece == 1)
	{
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
	}
	else if (gAQP->Piece == 2) {
		UIImage *image = [UIImage imageNamed:@"PPCover.jpg"];
		[gFirstView.NotationView setImage:image];
		_ImageArray = [[NSArray alloc] initWithObjects:
                      [UIImage imageNamed:@"PP1.jpg"],
                      [UIImage imageNamed:@"PP2.jpg"],
                      [UIImage imageNamed:@"PP3.jpg"],
                      [UIImage imageNamed:@"PP4.jpg"],
                      [UIImage imageNamed:@"PP5.jpg"],
                      [UIImage imageNamed:@"PP6.jpg"],
                      [UIImage imageNamed:@"PP7.jpg"],
                      [UIImage imageNamed:@"PP8.jpg"],
                      [UIImage imageNamed:@"PP9.jpg"],
                      [UIImage imageNamed:@"PP10.jpg"],
                      [UIImage imageNamed:@"PP11.jpg"],
                      [UIImage imageNamed:@"PP12.jpg"],
                      [UIImage imageNamed:@"PP13.jpg"],
                      [UIImage imageNamed:@"PP14.jpg"],
                      [UIImage imageNamed:@"PP15.jpg"],
                      [UIImage imageNamed:@"PP16.jpg"],
                      [UIImage imageNamed:@"PP17.jpg"],
                      [UIImage imageNamed:@"PP18.jpg"],
                      [UIImage imageNamed:@"PP19.jpg"],
                      [UIImage imageNamed:@"PP20.jpg"],
                      [UIImage imageNamed:@"PP21.jpg"],
                      [UIImage imageNamed:@"PP22.jpg"],
                      [UIImage imageNamed:@"PP23.jpg"],
                      [UIImage imageNamed:@"PP24.jpg"],
                      [UIImage imageNamed:@"PP25.jpg"],
                      [UIImage imageNamed:@"PP26.jpg"],
                      [UIImage imageNamed:@"PP27.jpg"],
                      [UIImage imageNamed:@"PP28.jpg"],
                      [UIImage imageNamed:@"PP29.jpg"],
                      [UIImage imageNamed:@"PP30.jpg"],
                      [UIImage imageNamed:@"PP31.jpg"],
                      [UIImage imageNamed:@"PP32.jpg"],
                      nil
                      ];
	}
	else if (gAQP->Piece == 3) {
		UIImage *image = [UIImage imageNamed:@"TrafficCover.jpg"];
		[gFirstView.NotationView setImage:image];
		_ImageArray = [[NSArray alloc] initWithObjects:
                      [UIImage imageNamed:@"Traffic1.jpg"],
                      [UIImage imageNamed:@"Traffic2.jpg"],
                      [UIImage imageNamed:@"Traffic3.jpg"],
                      [UIImage imageNamed:@"Traffic4.jpg"],
                      [UIImage imageNamed:@"Traffic5.jpg"],
                      [UIImage imageNamed:@"Traffic6.jpg"],
                      [UIImage imageNamed:@"Traffic7.jpg"],
                      [UIImage imageNamed:@"Traffic8.jpg"],
                      [UIImage imageNamed:@"Traffic9.jpg"],
                      [UIImage imageNamed:@"Traffic10.jpg"],
                      [UIImage imageNamed:@"Traffic11.jpg"],
                      [UIImage imageNamed:@"Traffic12.jpg"],
                      [UIImage imageNamed:@"Traffic13.jpg"],
                      [UIImage imageNamed:@"Traffic14.jpg"],
                      [UIImage imageNamed:@"Traffic15.jpg"],
                      [UIImage imageNamed:@"Traffic16.jpg"],
                      [UIImage imageNamed:@"Traffic17.jpg"],
                      [UIImage imageNamed:@"Traffic18.jpg"],
                      [UIImage imageNamed:@"Traffic19.jpg"],
                      [UIImage imageNamed:@"Traffic20.jpg"],
                      [UIImage imageNamed:@"Traffic21.jpg"],
                      [UIImage imageNamed:@"Traffic22.jpg"],
                      [UIImage imageNamed:@"Traffic23.jpg"],
                      [UIImage imageNamed:@"Traffic24.jpg"],
                      [UIImage imageNamed:@"Traffic25.jpg"],
                      [UIImage imageNamed:@"Traffic26.jpg"],
                      [UIImage imageNamed:@"Traffic27.jpg"],
                      [UIImage imageNamed:@"Traffic28.jpg"],
                      [UIImage imageNamed:@"Traffic29.jpg"],
                      [UIImage imageNamed:@"Traffic30.jpg"],
                      [UIImage imageNamed:@"Traffic31.jpg"],
                      [UIImage imageNamed:@"Traffic32.jpg"],
                      [UIImage imageNamed:@"Traffic33.jpg"],
                      [UIImage imageNamed:@"Traffic34.jpg"],
                      [UIImage imageNamed:@"Traffic35.jpg"],
                      [UIImage imageNamed:@"Traffic36.jpg"],
                      nil
                      ];
		
	}
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
		if (gAQP->SeqNum >= 0 && gAQP->SeqNum <= gAQP->NumSequences)
			_NotationView.image = [_ImageArray objectAtIndex:gAQP->SeqNum-1];
		NewMod = NO;
	}
    
	if (_ServerIPAddString != nil)
	{
		[gSecondView setServerIPAddress:_ServerIPAddString];
		
		if ((gSecondView != nil) && ![gSecondView isEditing])
			[gSecondView setIPAddress];
		
		[_ServerIPAddString release];
		_ServerIPAddString = nil;
	}
	
	[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(checkIncomingMessages) userInfo:nil repeats:NO];
}

@end
