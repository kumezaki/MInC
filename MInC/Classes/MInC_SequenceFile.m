//
//  MInC_SequenceFile.m
//  MInC
//
//  Created by Kojiro Umezaki on 2/17/14.
//
//

#import "MInC_SequenceFile.h"

#import "MInC_AQPlayer.h"
extern MInC_AQPlayer *gAQP;

#import "MInC_Sequence.h"

@implementation MInC_SequenceFile

-(void)writeToFile:(NSString*)fileName withData:(NSData*)data
{
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSLog(@"filePath:%@", filePath);
    [data writeToFile:filePath atomically:YES];
}

-(void)readFromFile:(NSString*)fileName
{
    /* read data from file */
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",content);
    NSArray* elems = [content componentsSeparatedByString:@"\n"];
    NSLog(@"count %d",[elems count]);

    /* convert text in file to note numbers and durations */
    Float64 note_nums[kMaxNumNotes];
    Float64 note_durs[kMaxNumNotes];
    SInt16 count = 0;
    SInt16 seq_num = 0;
    for (NSString* s in elems)
    {
        NSLog(@"%@",s);
        NSArray* note = [s componentsSeparatedByString:@" "];
        NSLog(@"%d",note.count);
        if (note.count == 1)
        {
            if (seq_num != 0)
            {
                /* create new sequence with note numbers and durations and assign to primary sequencer */
                for (SInt16 i = 0; i < count; i++)
                    NSLog(@"%0.3f %0.3f",note_nums[i],note_durs[i]);
                MInC_Sequence* seq = [[MInC_Sequence alloc] init];
                [seq assignNotes:count :note_nums :note_durs];
                [gAQP setSequence:(seq_num-1) :seq];
                count = 0;
            }
            
            seq_num = [[note objectAtIndex:0] intValue];
        }
        else if (note.count == 2)
        {
            note_nums[count] = [[note objectAtIndex:0] intValue];
            note_durs[count] = [[note objectAtIndex:1] floatValue];
            count++;
        }
    }
}

@end
