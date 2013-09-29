//
//  FirstView.m
//  MInC
//
//  Created by Kojiro Umezaki on 9/20/13.
//
//

#import "FirstView.h"

#import "FirstViewController.h"
#import "MInCAppDelegate.h"

extern AQPlayer *gAQP;
extern FirstViewController *gViewController;

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

    return self;
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

@end
