//
//  MInC_SequenceFile.h
//  MInC
//
//  Created by Kojiro Umezaki on 2/17/14.
//
//

#import <Foundation/Foundation.h>

@interface MInC_SequenceFile : NSObject

-(void)writeToFile:(NSString*)fileName withData:(NSData*)data;

-(void)readFromFile:(NSString*)fileName;

@end
