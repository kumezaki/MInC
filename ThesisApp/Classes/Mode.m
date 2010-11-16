//
//  Mode.m
//  ThesisApp
//
//  Created by Chris Lavender on 11/15/10.
//  Copyright 2010 Gnarly Dog Music. All rights reserved.
//

#import "Mode.h"


@implementation Mode

-(double) getNoteFreq:(int)val
{
	mFreq = modeFreq[val];
	
	
	//switch (val) {
//		case 0:modeFreq[0] = 440;break;
//		case 1:modeFreq[1] = 466;break;
//		case 2:modeFreq[2] = 587;break;
//		case 3:modeFreq[3] = 659;break;
//		case 4:modeFreq[4] = 699;break;
//		case 5:modeFreq[5] = 880;break;
//		case 6:modeFreq[6] = 932;break;
//		case 7:modeFreq[7] = 1175;break;
//		default: break;
//	}	
//	
	return mFreq;
	
}

@end
