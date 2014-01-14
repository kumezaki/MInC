//
//  AQPlayer.m
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_AQPlayer.h"

#import "MInC_Content.h"
/*
#import <libxml/tree.h>
#import <libxml/parser.h>
#import <libxml/HTMLparser.h>
#import <libxml/xpath.h>
#import <libxml/xpathInternals.h>
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <libxml/xmlmemory.h>
#include <libxml/parser.h>

MInC_AQPlayer *gAQP = nil;

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{
    MInC_AQPlayer *aqp = (MInC_AQPlayer *)inUserData;
	
	const SInt32 numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);

	/* initialize temporary audio buffer */
	Float64 buffer[numFrames];
	memset(buffer,0,sizeof(Float64)*numFrames);
    
	/* fill the audio buffer */
    [aqp fillAudioBuffer:buffer:numFrames];

	/* copy/scale audio buffer to output buffer */
	Float64 max = 0.;
	for (SInt32 i = 0; i < numFrames; i++)
	{
		max = fabs(buffer[i]) > max ? fabs(buffer[i]) : max;
		((SInt16 *)inAQBuffer->mAudioData)[i] = buffer[i] * (SInt16)0x7FFF;
	}

	/* report elapsed time to sequencers */
	Float64 elapsed_time = (Float64)numFrames / kSR;
    [aqp reportElapsedTime:elapsed_time];
    
	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation MInC_AQPlayer

@synthesize SeqNum;
@synthesize NumSequences;

@synthesize Biquad;

- (void)dealloc {

	[Sequencer_Pri stop];
	[self stop];
	
	for (SInt32 i = 0; i < NumSequences; i++)
		[Sequences[i] release];
	
	[Sequencer_Pri release];
    
    [Biquad release];
		
	[super dealloc];
}

- (id)init
{
	[super init];
	
	gAQP = self;
	
	Sequencer_Pri = [[MInC_Sequencer alloc] init];
	
	[self parseFile];
    
    Sequencer_Pri.SyncWithServer = YES;
	Sequencer_Pri.AmpMultiplier_Control = 0.5;
	Sequencer_Pri.DurMultiplier = 0.5;
	
	Sequencer_Sec = [[MInC_Sequencer alloc] init];
    MInC_Sequence* seq = [[MInC_Sequence alloc] init];
    [seq assignNotes:num_notes_pulse:note_sequence_pulse:dur_sequence_pulse];
    [Sequencer_Sec setNextSequence:seq];
	Sequencer_Sec.AmpMultiplier_Control = 0.5 * 0.5;
	Sequencer_Sec.DurMultiplier = 0.1;
	
	SeqNum = 0;
	
    Biquad = [[MInC_Biquad alloc] init];
    [gAQP.Biquad biquad_set:LPF :0. :kSR/2.*0.5 :kSR :1.0]; /* 0.5 in freq setting assumes default position of control in touch view */

	[self start];

	return self;
}

-(void)setup
{
	DataFormat.mFormatID = kAudioFormatLinearPCM;
	DataFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger;
	DataFormat.mChannelsPerFrame = 1;
	DataFormat.mSampleRate = kSR;
	DataFormat.mBitsPerChannel = 16;
	DataFormat.mFramesPerPacket = 1;
	DataFormat.mBytesPerPacket = sizeof(SInt16);
	DataFormat.mBytesPerFrame = sizeof(SInt16);

    OSStatus result = AudioQueueNewOutput(&DataFormat, AQBufferCallback, self, nil, nil, 0, &Queue);
	
	if (result != noErr)
		NSLog(@"AudioQueueNewOutput %ld\n",result);
	
    for (SInt32 i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(Queue, 512, &Buffers[i]);
		if (result != noErr)
			NSLog(@"AudioQueueAllocateBuffer %ld\n",result);
	}
}

-(OSStatus)start
{
	OSStatus result = noErr;

    /* if we have no queue, create one now */
    if (Queue == nil)
        [self setup];
    
    /* prime the queue with some data before starting */
    for (SInt32 i = 0; i < kNumberBuffers; ++i)
        AQBufferCallback(self, Queue, Buffers[i]);            
	
    result = AudioQueueStart(Queue, nil);
		
	return result;
}

-(OSStatus)stop
{
	OSStatus result = noErr;

    result = AudioQueueStop(Queue, true);
	
	return result;
}

-(void) setSequence:(SInt32)seq_num;
{
	if (seq_num >= 0 && seq_num <= NumSequences)
	{
		SeqNum = seq_num;
		[Sequencer_Pri setNextSequence:Sequences[SeqNum-1]];
	}
}

-(void) parseFile
{
	NSString *title;
	title = @"InC";
	
    NSString *filePath = [[NSBundle mainBundle] pathForResource:title ofType:@"xml"];
    NSLog(@"%s",[filePath cStringUsingEncoding:NSASCIIStringEncoding]);
    
	xmlDocPtr doc;
	xmlNodePtr cur;
	
	doc = xmlParseFile([filePath cStringUsingEncoding:NSASCIIStringEncoding]);
	
	if (doc == NULL) {
		fprintf(stderr,"Document not parsed successfully. \n");
		return;
	}
	
	cur = xmlDocGetRootElement(doc);
	
	if (cur == NULL) {
		fprintf(stderr,"empty document\n");
		xmlFreeDoc(doc);
		return;
	}
	
	if (xmlStrcmp(cur->name, (const xmlChar *) "work")) {
		fprintf(stderr,"document of the wrong type, root node != work");
		xmlFreeDoc(doc);
		return;
	}
	else {
		fprintf(stderr,"correct document loaded");
	}
	
	cur = cur->xmlChildrenNode;
	while (cur != NULL) {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"part"))){
            NSLog(@"part found");
			SInt32 part = atoi((char*)xmlGetProp(cur, (xmlChar*)"id"));
			NumSequences = atoi((char*)xmlGetProp(cur, (xmlChar*)"numsequences"));
			NSLog(@"%ld %ld",part,NumSequences);

            xmlNodePtr cur2 = cur->xmlChildrenNode;
            SInt32 seq_i = 0;
            while (cur2 != NULL) {
                if ((!xmlStrcmp(cur2->name, (const xmlChar *)"sequence"))) {
                    
                    SInt32 seq_id = atoi((char*)xmlGetProp(cur2, (xmlChar*)"id"));
                    SInt32 num_notes = atoi((char*)xmlGetProp(cur2, (xmlChar*)"numnote"));
                    
                    NSLog(@"sequence %ld %ld",seq_id,num_notes);
                    Float64 *notesequence = (Float64*)malloc(sizeof(Float64)*num_notes);
                    Float64 *dursequence = (Float64*)malloc(sizeof(Float64)*num_notes);
                    
                    xmlNodePtr cur3 = cur2->xmlChildrenNode;
                    while (cur3 != NULL) {
                        SInt32 note_i = 0;
                        if ((!xmlStrcmp(cur3->name, (const xmlChar *)"notes"))) {
                            
                            xmlNodePtr cur4 = cur3->xmlChildrenNode;
                            while (cur4 != NULL) {
                                if ((!xmlStrcmp(cur4->name, (const xmlChar *)"note"))) {
                                    // Add notes
                                    NSLog(@"%s", (char*)xmlNodeListGetString(doc, cur4->xmlChildrenNode, 1));
                                    float note_num = atof((char*)xmlNodeListGetString(doc, cur4->xmlChildrenNode, 1));
                                    notesequence[note_i++] = note_num;
                                }
                                cur4 = cur4->next;
                            }
                        }
                        else if ((!xmlStrcmp(cur3->name, (const xmlChar *)"durs"))) {
                            xmlNodePtr cur4 = cur3->xmlChildrenNode;
                            while (cur4 != NULL) {
                                if ((!xmlStrcmp(cur4->name, (const xmlChar *)"dur"))) {
                                    // Add durations
                                    float dur = atof((char*)xmlNodeListGetString(doc, cur4->xmlChildrenNode, 1));
                                    dursequence[note_i++] = dur;
                                }
                                cur4 = cur4->next;
                            }
                        }
                        cur3 = cur3->next;
                    }
                    Sequences[seq_i] = [[MInC_Sequence alloc] init];
#if 0
                    for (SInt32 i = 0; i < num_notes; i++) NSLog(@"[%d] %f %f",i,notesequence[i],dursequence[i]);
#endif
                    [Sequences[seq_i] assignNotes:num_notes:notesequence:dursequence];

                    free(notesequence);
                    free(dursequence);
                    seq_i++;
                }
                cur2 = cur2->next;
            }
		}
		cur = cur->next;
	}
	xmlFreeDoc(doc);
}

-(void) fillAudioBuffer:(Float64*)buffer :(const SInt32)num_frames
{
    /* primary sequencer */
	MInC_Note* note_pri = [Sequencer_Pri getNote];
	if (note_pri != nil)
    {
		Sequencer_Pri.Theta = [note_pri addSamples:buffer:num_frames:Sequencer_Pri.AmpMultiplier_Control*Sequencer_Pri.AmpMultiplier_Accel:Sequencer_Pri.Theta];
        [Biquad processAudioBuffer:buffer :num_frames];
    }
    
    /* secondary sequencer */
	MInC_Note* note_sec = [Sequencer_Sec getNote];
	if (note_sec != nil)
    {
		Sequencer_Sec.Theta = [note_sec addSamples:buffer:num_frames:Sequencer_Sec.AmpMultiplier_Control:Sequencer_Sec.Theta];
    }
}

-(void) reportElapsedTime:(Float64)elapsed_time
{
	[Sequencer_Pri update:elapsed_time];
	[Sequencer_Sec update:elapsed_time];
}

@end
