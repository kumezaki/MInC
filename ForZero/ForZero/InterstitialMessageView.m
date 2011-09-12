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
    [mImageArray release];
    [_msg release];
    [super dealloc];
}

- (void) setMsg:(NSString *)msg
{   
    if (msg != _msg)
    {
        [_msg release];
        _msg = [msg retain];
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


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        mImageArray = [[NSArray alloc] initWithObjects:
                       [UIImage imageNamed:@"image_0.jpg"],
                       [UIImage imageNamed:@"image_1.jpg"],
                       nil
                       ];
        
        self.backgroundColor = [UIColor blackColor];
        self.clearsContextBeforeDrawing = YES;
        
        self.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
        
        /*
         // if a button is preferred for removing the view
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

- (void) displayText
{
    label = [[UILabel alloc]initWithFrame:self.frame];
    
    label.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    
    [label setTextAlignment:UITextAlignmentCenter];
    [label setFont:[UIFont boldSystemFontOfSize:22.0]];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    label.numberOfLines = 10;
    label.text = self.msg;
    
    [self addSubview: label];
    [label release];
}

- (void) displayImage:(int)image_pos
{
    image = [[UIImageView alloc] initWithImage:[mImageArray objectAtIndex:image_pos]];
    
    image.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    
    [self addSubview:image];
    [image release];
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
