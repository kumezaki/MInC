/*
     File: Picker.m
 Abstract: A view that displays both the currently advertised game name and a list of other games
 available on the local network - discovered & displayed by BrowserViewController.
  Version: 1.8
  
 Copyright (C) 2010 Apple Inc. All Rights Reserved.
 
 */

#import "Picker.h"

#define kOffset 5.0

@interface Picker ()
@property (nonatomic, retain, readwrite) BrowserViewController *bvc;
@property (nonatomic, retain, readwrite) UILabel *deviceNameLabel;
@end

@implementation Picker

@synthesize bvc = _bvc;
@synthesize deviceNameLabel = _deviceNameLabel;

- (id)initWithFrame:(CGRect)frame type:(NSString*)type {
    if ((self = [super initWithFrame:frame])) {
		// add autorelease to the NSNetServiceBrowser to release the browser once the connection has been
		// established. An active browser can cause a delay in sending data.
		// <rdar://problem/7000938>
		
         self.bvc = [[[BrowserViewController alloc] initWithTitle:nil showDisclosureIndicators:NO showCancelButton:NO]autorelease];
		[self.bvc searchForServicesOfType:type inDomain:@"local"];
                
		self.opaque = YES;
		self.backgroundColor = [UIColor whiteColor];
		
		UIImageView* img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pickerBG.png"]];
		[self addSubview:img];
		[img release];
		
		CGFloat runningY = kOffset;
		CGFloat width = self.bounds.size.width - 2 * kOffset;
		
		UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
		[label setTextAlignment:UITextAlignmentCenter];
		[label setFont:[UIFont boldSystemFontOfSize:15.0]];
		[label setTextColor:[UIColor whiteColor]];
		[label setShadowColor:[UIColor colorWithWhite:0.0 alpha:0.75]];
		[label setShadowOffset:CGSizeMake(1,1)];
		[label setBackgroundColor:[UIColor clearColor]];
		label.text = @"Your device name is:";
		label.numberOfLines = 1;
		[label sizeToFit];
		label.frame = CGRectMake(kOffset, runningY, width, label.frame.size.height);
		[self addSubview:label];
		
		runningY += label.bounds.size.height;
		[label release]; 
		
		self.deviceNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[self.deviceNameLabel setTextAlignment:UITextAlignmentCenter];
		[self.deviceNameLabel setFont:[UIFont boldSystemFontOfSize:24.0]];
		[self.deviceNameLabel setLineBreakMode:UILineBreakModeTailTruncation];
		[self.deviceNameLabel setTextColor:[UIColor whiteColor]];
		[self.deviceNameLabel setShadowColor:[UIColor colorWithWhite:0.0 alpha:0.75]];
		[self.deviceNameLabel setShadowOffset:CGSizeMake(1,1)];
		[self.deviceNameLabel setBackgroundColor:[UIColor clearColor]];
		[self.deviceNameLabel setText:@"Default Name"];
		[self.deviceNameLabel sizeToFit];
		[self.deviceNameLabel setFrame:CGRectMake(kOffset, runningY, width, self.deviceNameLabel.frame.size.height)];
		[self.deviceNameLabel setText:@""];
		[self addSubview:self.deviceNameLabel];
		
		runningY += self.deviceNameLabel.bounds.size.height + kOffset * 2;
		
		label = [[UILabel alloc] initWithFrame:CGRectZero];
		[label setTextAlignment:UITextAlignmentCenter];
		[label setFont:[UIFont boldSystemFontOfSize:15.0]];
		[label setTextColor:[UIColor whiteColor]];
		[label setShadowColor:[UIColor colorWithWhite:0.0 alpha:0.75]];
		[label setShadowOffset:CGSizeMake(1,1)];
		[label setBackgroundColor:[UIColor clearColor]];
		label.text = @"Connect with another Prop Phone device:";
		label.numberOfLines = 1;
		[label sizeToFit];
		label.frame = CGRectMake(kOffset, runningY, width, label.frame.size.height);
		[self addSubview:label];
		
		runningY += label.bounds.size.height + 2;
        [label release];

        UIToolbar *toolbar = [[UIToolbar alloc] init];
        toolbar.barStyle = UIBarStyleBlack;
        [toolbar sizeToFit];
        CGFloat toolbarHeight = [toolbar frame].size.height;
        CGRect rootViewBounds = self.bounds;
        CGFloat rootViewHeight = CGRectGetHeight(rootViewBounds);
        CGFloat rootViewWidth = CGRectGetWidth(rootViewBounds);
        CGRect rectArea = CGRectMake(0, rootViewHeight - toolbarHeight, rootViewWidth, toolbarHeight);
        [toolbar setFrame:rectArea];
        UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" 
                                                                       style:UIBarButtonItemStyleBordered 
                                                                      target:self 
                                                                      action:@selector(cancelPicker)];
        
        [toolbar setItems:[NSArray arrayWithObjects:infoButton,nil]];
        [self addSubview:toolbar];
        [toolbar release];

        		
		[self.bvc.view setFrame:CGRectMake(0, 
                                           runningY, 
                                           self.bounds.size.width, 
                                           self.bounds.size.height - (runningY+toolbarHeight))];

		[self addSubview:self.bvc.view];
        [self.bvc.tableView reloadData];//needed?    
	}

	return self;
}

- (void)dealloc {
	// Cleanup any running resolve and free memory
	[self.bvc release];
	[self.deviceNameLabel release];
	
	[super dealloc];
}

- (id<BrowserViewControllerDelegate>)delegate {
	return self.bvc.delegate;
}

- (void)setDelegate:(id<BrowserViewControllerDelegate>)delegate {
	[self.bvc setDelegate:delegate];
}

- (NSString *)deviceName {
	return self.deviceNameLabel.text;
}

- (void)setDeviceName:(NSString *)string {
	[self.deviceNameLabel setText:string];
	[self.bvc setOwnName:string];
}

- (void)cancelPicker
{
    [self.bvc cancelAction];
}

@end
