//
//  ForZeroGUIMockupViewController.m
//  ForZeroGUIMockup
//
//  Created by Kojiro Umezaki on 9/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ForZeroGUIMockupViewController.h"

@implementation ForZeroGUIMockupViewController
@synthesize serverView, deviceView;
@synthesize downloadButton, uploadButton;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    //Set which orientations we allow
	if (
        (interfaceOrientation == UIInterfaceOrientationPortrait) ||
        (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) ||
        (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) ||
        (interfaceOrientation == UIInterfaceOrientationLandscapeRight)
        )
	{
		return YES;
	}
	else
	{
		return NO;
	}
}

//********** WILL ROTATE ORIENTATION **********
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
										 duration:(NSTimeInterval)duration
{
	if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
	{
		//----- GOING TO PORTRAIT -----
		//[[self view] setBackgroundColor:[UIColor blueColor]];
        self.serverView.frame = CGRectMake(0, 0, 320, 200);
        self.deviceView.frame = CGRectMake(0, 260, 320, 200);
        self.uploadButton.frame = CGRectMake(88, 150, 45, 160);
        self.downloadButton.frame = CGRectMake(186, 150, 45, 160);
	}
	else
	{
		//----- GOING TO LANDSCAPE -----
		//[[self view] setBackgroundColor:[UIColor redColor]];
        self.serverView.frame = CGRectMake(0, 0, 480, 140);
        self.deviceView.frame = CGRectMake(0, 160, 480, 140);
        self.uploadButton.frame = CGRectMake(139, 123, 45, 55);
        self.downloadButton.frame = CGRectMake(294, 123, 45, 55);
	}
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.uploadButton=nil;
    self.downloadButton=nil;
    self.serverView=nil;
    self.deviceView=nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
