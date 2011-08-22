//
//  SagarihaNetworkControls.h
//  Sagariha
//
//  Created by Kojiro Umezaki on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SagarihaNetworkControls : NSObject <UITextFieldDelegate> {

	IBOutlet UITextField		*mIPAddressTextField;
	IBOutlet UITextField		*mPortNumTextField;
}

-(IBAction)IPAddressChanged:(id)sender;
-(IBAction)PortNumChanged:(id)sender;

@end
