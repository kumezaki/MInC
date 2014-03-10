//
//  AQPlayer.m
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_AQPlayer.h"

#import "MInC_Content.h"

// set the following to 1 if compiling for XML-style sequence data
#define WITH_XML_SEQS 0

#if WITH_XML_SEQS
#import <libxml/tree.h>
#import <libxml/parser.h>
#import <libxml/HTMLparser.h>
#import <libxml/xpath.h>
#import <libxml/xpathInternals.h>
#endif

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#if WITH_XML_SEQS
#include <libxml/xmlmemory.h>
#include <libxml/parser.h>
#endif

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
    
    MInC_Sequence* seq;
	
	Sequencer_Pri = [[MInC_Sequencer alloc] init];
    [self parseFile];
    Sequencer_Pri.SyncWithServer = YES;
	Sequencer_Pri.AmpMultiplier_Control = 0.5;
	Sequencer_Pri.DurMultiplier = 0.5;
    
	Sequencer_Sec = [[MInC_Sequencer alloc] init];
    seq = [[MInC_Sequence alloc] init];
    [seq assignNotes:num_notes_pulse:note_sequence_pulse:dur_sequence_pulse];
    [Sequencer_Sec setNextSequence:seq];
	Sequencer_Sec.AmpMultiplier_Control = 0.5 * 0.5;
	Sequencer_Sec.DurMultiplier = 0.1;
	
	SeqNum = 0;
	
    Biquad = [[MInC_Biquad alloc] init];
    Biquad.Type = LPF;
    Biquad.DBGain = 0.;
    Biquad.Freq = kSR/2.*0.5; /* 0.5 in freq setting assumes default position of control in touch view */
    Biquad.SRate = kSR;
    Biquad.Bandwidth = 1.0;

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

-(void) setSequence:(SInt32)seq_pos :(MInC_Sequence*)seq
{
	if (seq_pos >= 0 && seq_pos < 53)
	{
        MInC_Sequence* old_seq = Sequences[seq_pos];
        
		Sequences[seq_pos] = seq;
        
        if (old_seq != nil)
            [old_seq release];
        
        NumSequences = seq_pos + 1;
	}
}

#if WITH_XML_SEQS // XML way of loading sequence data
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
#else // pre-XML way of loading sequence data
-(void) parseFile
{
#if 1
    NumSequences = 1;
    for (SInt32 i = 0; i < NumSequences; i++)
    {
        Sequences[i] = [[MInC_Sequence alloc] init];
        switch (i)
        {
            case 0: [Sequences[i] assignNotes:num_notes_pulse:note_sequence_pulse:dur_sequence_pulse]; break;
            default: break;
        }
    }
#else
    NumSequences = 53;
    
    for (SInt32 i = 0; i < NumSequences; i++)
    {
        Sequences[i] = [[MInC_Sequence alloc] init];
        switch (i)
        {
            case 0: [Sequences[i] assignNotes:num_notes_01:note_sequence_01:dur_sequence_01]; break;
            case 1: [Sequences[i] assignNotes:num_notes_02:note_sequence_02:dur_sequence_02]; break;
            case 2: [Sequences[i] assignNotes:num_notes_03:note_sequence_03:dur_sequence_03]; break;
            case 3: [Sequences[i] assignNotes:num_notes_04:note_sequence_04:dur_sequence_04]; break;
            case 4: [Sequences[i] assignNotes:num_notes_05:note_sequence_05:dur_sequence_05]; break;
            case 5: [Sequences[i] assignNotes:num_notes_06:note_sequence_06:dur_sequence_06]; break;
            case 6: [Sequences[i] assignNotes:num_notes_07:note_sequence_07:dur_sequence_07]; break;
            case 7: [Sequences[i] assignNotes:num_notes_08:note_sequence_08:dur_sequence_08]; break;
            case 8: [Sequences[i] assignNotes:num_notes_09:note_sequence_09:dur_sequence_09]; break;
            case 9: [Sequences[i] assignNotes:num_notes_10:note_sequence_10:dur_sequence_10]; break;
            case 10: [Sequences[i] assignNotes:num_notes_11:note_sequence_11:dur_sequence_11]; break;
            case 11: [Sequences[i] assignNotes:num_notes_12:note_sequence_12:dur_sequence_12]; break;
            case 12: [Sequences[i] assignNotes:num_notes_13:note_sequence_13:dur_sequence_13]; break;
            case 13: [Sequences[i] assignNotes:num_notes_14:note_sequence_14:dur_sequence_14]; break;
            case 14: [Sequences[i] assignNotes:num_notes_15:note_sequence_15:dur_sequence_15]; break;
            case 15: [Sequences[i] assignNotes:num_notes_16:note_sequence_16:dur_sequence_16]; break;
            case 16: [Sequences[i] assignNotes:num_notes_17:note_sequence_17:dur_sequence_17]; break;
            case 17: [Sequences[i] assignNotes:num_notes_18:note_sequence_18:dur_sequence_18]; break;
            case 18: [Sequences[i] assignNotes:num_notes_19:note_sequence_19:dur_sequence_19]; break;
            case 19: [Sequences[i] assignNotes:num_notes_20:note_sequence_20:dur_sequence_20]; break;
            case 20: [Sequences[i] assignNotes:num_notes_21:note_sequence_21:dur_sequence_21]; break;
            case 21: [Sequences[i] assignNotes:num_notes_22:note_sequence_22:dur_sequence_22]; break;
            case 22: [Sequences[i] assignNotes:num_notes_23:note_sequence_23:dur_sequence_23]; break;
            case 23: [Sequences[i] assignNotes:num_notes_24:note_sequence_24:dur_sequence_24]; break;
            case 24: [Sequences[i] assignNotes:num_notes_25:note_sequence_25:dur_sequence_25]; break;
            case 25: [Sequences[i] assignNotes:num_notes_26:note_sequence_26:dur_sequence_26]; break;
            case 26: [Sequences[i] assignNotes:num_notes_27:note_sequence_27:dur_sequence_27]; break;
            case 27: [Sequences[i] assignNotes:num_notes_28:note_sequence_28:dur_sequence_28]; break;
            case 28: [Sequences[i] assignNotes:num_notes_29:note_sequence_29:dur_sequence_29]; break;
            case 29: [Sequences[i] assignNotes:num_notes_30:note_sequence_30:dur_sequence_30]; break;
            case 30: [Sequences[i] assignNotes:num_notes_31:note_sequence_31:dur_sequence_31]; break;
            case 31: [Sequences[i] assignNotes:num_notes_32:note_sequence_32:dur_sequence_32]; break;
            case 32: [Sequences[i] assignNotes:num_notes_33:note_sequence_33:dur_sequence_33]; break;
            case 33: [Sequences[i] assignNotes:num_notes_34:note_sequence_34:dur_sequence_34]; break;
            case 34: [Sequences[i] assignNotes:num_notes_35:note_sequence_35:dur_sequence_35]; break;
            case 35: [Sequences[i] assignNotes:num_notes_36:note_sequence_36:dur_sequence_36]; break;
            case 36: [Sequences[i] assignNotes:num_notes_37:note_sequence_37:dur_sequence_37]; break;
            case 37: [Sequences[i] assignNotes:num_notes_38:note_sequence_38:dur_sequence_38]; break;
            case 38: [Sequences[i] assignNotes:num_notes_39:note_sequence_39:dur_sequence_39]; break;
            case 39: [Sequences[i] assignNotes:num_notes_40:note_sequence_40:dur_sequence_40]; break;
            case 40: [Sequences[i] assignNotes:num_notes_41:note_sequence_41:dur_sequence_41]; break;
            case 41: [Sequences[i] assignNotes:num_notes_42:note_sequence_42:dur_sequence_42]; break;
            case 42: [Sequences[i] assignNotes:num_notes_43:note_sequence_43:dur_sequence_43]; break;
            case 43: [Sequences[i] assignNotes:num_notes_44:note_sequence_44:dur_sequence_44]; break;
            case 44: [Sequences[i] assignNotes:num_notes_45:note_sequence_45:dur_sequence_45]; break;
            case 45: [Sequences[i] assignNotes:num_notes_46:note_sequence_46:dur_sequence_46]; break;
            case 46: [Sequences[i] assignNotes:num_notes_47:note_sequence_47:dur_sequence_47]; break;
            case 47: [Sequences[i] assignNotes:num_notes_48:note_sequence_48:dur_sequence_48]; break;
            case 48: [Sequences[i] assignNotes:num_notes_49:note_sequence_49:dur_sequence_49]; break;
            case 49: [Sequences[i] assignNotes:num_notes_50:note_sequence_50:dur_sequence_50]; break;
            case 50: [Sequences[i] assignNotes:num_notes_51:note_sequence_51:dur_sequence_51]; break;
            case 51: [Sequences[i] assignNotes:num_notes_52:note_sequence_52:dur_sequence_52]; break;
            case 52: [Sequences[i] assignNotes:num_notes_53:note_sequence_53:dur_sequence_53]; break;
            default: break;
        }
    }
#endif
}
#endif

-(void) fillAudioBuffer:(Float64*)buffer :(const SInt32)num_frames
{
    /* primary sequencer */
	MInC_Note* note_pri = [Sequencer_Pri getNote];
	if (note_pri != nil)
    {
		Sequencer_Pri.Theta = [note_pri addSamples:buffer:num_frames:Sequencer_Pri.AmpMultiplier_Control*Sequencer_Pri.AmpMultiplier_Accel:Sequencer_Pri.Theta];
//        [Biquad processAudioBuffer:buffer :num_frames];
    }

#if 0
    /* secondary sequencer */
	MInC_Note* note_sec = [Sequencer_Sec getNote];
	if (note_sec != nil)
    {
		Sequencer_Sec.Theta = [note_sec addSamples:buffer:num_frames:Sequencer_Sec.AmpMultiplier_Control:Sequencer_Sec.Theta];
    }
#endif
}

-(void) reportElapsedTime:(Float64)elapsed_time
{
	[Sequencer_Pri update:elapsed_time];
	[Sequencer_Sec update:elapsed_time];
}

@end
