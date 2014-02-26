//
//  FirstViewController.m
//  MInCPrototype
//
//  Created by Kevin T. Lee on 2/18/14.
//  Copyright (c) 2014 University of California, Irvine (Music). All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
//    [imgView setImage:[UIImage imageNamed:@"MInC_Logos.png"]];
    
	// Do any additional setup after loading the view, typically from a nib
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flashScreen)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:doubleTap];
    [singleTap requireGestureRecognizerToFail:doubleTap];
}

-(void) flashScreen {
    NSLog(@"Single Tap");
    UIWindow* wnd = [UIApplication sharedApplication].keyWindow;
    UIView* v = [[UIView alloc] initWithFrame: CGRectMake(0, 0, wnd.frame.size.width, wnd.frame.size.height)];
    [wnd addSubview: v];
    v.backgroundColor = [UIColor whiteColor];
    [UIView beginAnimations: nil context: nil];
    [UIView setAnimationDuration: 1.0];
    v.alpha = 0.0f;
    [UIView commitAnimations];
}

- (void)singleTap
{
    NSLog(@"Single Tap");
}

- (void)doubleTap
{
    NSLog(@"Double Tap");
}




@end

