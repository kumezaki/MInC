//
//  Note.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/13/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Note.h"



@implementation Note

@synthesize mFreq;
@synthesize mAmp;
@synthesize mTheta;

-(double)getSample:(double)sample
{
	for (int j = 0; j < kNumberNotes; j++)
	{
		sample += aqp->mNotes[j].mAmp * [aqp->mWaveTable get:aqp->mNotes[j].mTheta];
		
		aqp->mNotes[j].mTheta += delta_theta[j]; 
	}
}



-(void)dealloc
{
	[mWaveTable release];
 	[super dealloc];
}


-(id)init
{
	[super init];
	
	mWaveTable = [WaveFormTable new];
	
	return self;
}


@end
