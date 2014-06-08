//
//  MInC_ImageView.m
//  MInC
//
//  Created by Kojiro Umezaki on 1/30/14.
//
//

#import "MInC_ImageView.h"

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

@implementation MInC_ImageView

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan count:%lu\n",(unsigned long)touches.count);
    [gFirstView setSequence];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesMoved count:%lu\n",(unsigned long)touches.count);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded count:%lu\n",(unsigned long)touches.count);
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesCancelled\n");
}

@end
