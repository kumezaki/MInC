//
//  InterstitialMessageView.m
//  ForZero
//
//  Created by Chris Lavender on 9/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "InterstitialMessageView.h"


@implementation InterstitialMessageView

@synthesize delegate;
@synthesize msg=_msg;

- (void)dealloc
{
    [label release];
    [image release];
    
    [mImageArray release];
    [_msg release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // set properties for the view
        self.backgroundColor = [UIColor blackColor];
        
        self.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
        

        // create image array
        mImageArray = [[NSArray alloc] initWithObjects:
                       [UIImage imageNamed:@"image_0.jpg"],
                       [UIImage imageNamed:@"image_1.jpg"],
                       nil
                       ];
        // alloc the image view & label. 
        // These were originally in displayText/displayImage, but moved to facilitate alpha transitions
        image = [[UIImageView alloc] initWithFrame:self.bounds];
        image.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        image.contentMode = UIViewContentModeScaleAspectFit;
        [self insertSubview:image atIndex:0];

        label = [[UILabel alloc]initWithFrame:self.frame];
        label.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        [label setTextAlignment:UITextAlignmentCenter];
        [label setFont:[UIFont boldSystemFontOfSize:22.0]];
        [label setTextColor:[UIColor whiteColor]];
        [label setBackgroundColor:[UIColor clearColor]];
        label.numberOfLines = 10;
        [self insertSubview:label atIndex:1];

        // create a static label
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 
                                                                 self.bounds.size.height - 20, 
                                                                 self.bounds.size.width, 
                                                                 20)];
        
        text.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
        
        [text setTextAlignment:UITextAlignmentCenter];
        [text setFont:[UIFont systemFontOfSize:12.0]];
        [text setTextColor:[UIColor whiteColor]];
        [text setBackgroundColor:[UIColor clearColor]];
        text.text = @"Touch the screen to dismiss this message.";
        
        [self insertSubview:text atIndex:1];
        [text release];

        /*
         // this button would replace the above label
         // thus the label & touches methods should be commented out if the button is perferred
        backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [backButton addTarget:self 
                       action:@selector(done) 
             forControlEvents:UIControlEventTouchUpInside];
        
        [backButton setTitle:@"back" forState:UIControlStateNormal];
        backButton.frame = CGRectMake(20, 430, 64, 32);
        
        [self addSubview:backButton];
         */
    }
    return self;
}
// setter override
- (void) setMsg:(NSString *)msg
{   
    if (msg != _msg)
    {
        [_msg release];
        _msg = [msg retain];
        
        image.image = nil;
        label.text = @"";
    }
    
    NSLog(@"InterstitialMessageView:%@",_msg);
    
    int image_pos = -1;
    
    if ([_msg isEqualToString:@"image_0"])
        image_pos = 0;
    else if ([_msg isEqualToString:@"image_1"])
        image_pos = 1;
    
    if (image_pos == -1) 
        [self displayText];
    else 
        [self displayImage:image_pos];
}

- (void) displayText
{
        label.text = self.msg;
}

- (void) displayImage:(int)image_pos
{
    image.image = [mImageArray objectAtIndex:image_pos];
}

- (void) done 
{
    [self.delegate interstitialViewDidFinish:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate interstitialViewDidFinish:self];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate interstitialViewDidFinish:self];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate interstitialViewDidFinish:self];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate interstitialViewDidFinish:self];
}

@end
