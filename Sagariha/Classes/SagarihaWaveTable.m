//
//  SagarihaWaveTable.m
//  Sagariha
//
//  Created by Venky on 4/14/10.
//  Copyright 2010 Venkatramanan Krishnamani. All rights reserved.
//

#import "SagarihaWaveTable.h"


@implementation SagarihaWaveTable

-(id)init
{
	[super init];

	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *docDirectory = [paths objectAtIndex:0];
	NSFileManager *fileManager = [NSFileManager defaultManager];
	bool file_exists = 
        [fileManager fileExistsAtPath:[docDirectory stringByAppendingPathComponent:@"SagarihaAudio.dat"]];
    
	NSLog(file_exists?@"audio file exists":@"audio file does not exist");
	
	if (file_exists)
		mArray = [[NSMutableArray alloc] initWithContentsOfFile:[SagarihaWaveTable dataFilePath]];
	else
	{
		mArray = [[NSMutableArray alloc] init];

	for (int i = 0; i < kWaveTableSize; i++)
	{
	#if 0
		mTable[i] = sinf((double)i/kWaveTableSize * 2 * 3.1415);
	#else
	//		mTable[i] = 0.;
			[mArray insertObject:[[NSNumber alloc] initWithDouble:0.] atIndex:i];
	#endif
		}
	}

	return self;
}

- (void)dealloc {
    
	[mArray release];
	
	[super dealloc];
}


+(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory = [paths objectAtIndex:0];
    NSLog(@"docDirectory: %@", [docDirectory stringByAppendingString:@"/SagarihaAudio.dat"]);
	return [docDirectory stringByAppendingPathComponent:@"SagarihaAudio.dat"];
}

-(double) Get:(double)index
{
	int i0 = (int)(index * kWaveTableSize) % kWaveTableSize;
	int i1 = (i0 + 1) % kWaveTableSize;
	double k = index - (int)index;
#if 0
	double s0 = mTable[i0];
	double s1 = mTable[i1];
#else
	double s0 = [[mArray objectAtIndex:i0] doubleValue];
	double s1 = [[mArray objectAtIndex:i1] doubleValue];
#endif
	return s0 + (s1 - s0) * k;
}

-(void) Set:(UInt32)index:(double)value
{
	if (index < kWaveTableSize)
	{
//		mTable[index] = value;
		[mArray replaceObjectAtIndex:index withObject:[[NSNumber alloc] initWithDouble:value]];
	}
}

@end
