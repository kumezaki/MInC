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

-(IBAction)SetSequence
{
	if (WithServer)
		[gViewController.networking sendOSCMsg:"/minc/mod\0\0\0":12];
	else
	{
		[gAQP setSequence:(++gAQP->SeqNum)];
		NewMod = YES;
	}
}

@end
