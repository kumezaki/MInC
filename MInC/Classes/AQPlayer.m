//
//  AQPlayer.m
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "AQPlayer.h"

#import "Content.h"
/*
#import <libxml/tree.h>
#import <libxml/parser.h>
#import <libxml/HTMLparser.h>
#import <libxml/xpath.h>
#import <libxml/xpathInternals.h>*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <libxml/xmlmemory.h>
#include <libxml/parser.h>

#define FILE_NAME ""


AQPlayer *gAQP = nil;

void AQBufferCallback(void *inUserData, AudioQueueRef inAQ, AudioQueueBufferRef inAQBuffer) 
{
    AQPlayer *aqp = (AQPlayer *)inUserData;
	
	const int numFrames = (inAQBuffer->mAudioDataBytesCapacity) / sizeof(SInt16);
	
	double buffer[numFrames];
	memset(buffer,0,sizeof(double)*numFrames);

	Sequencer* seqr_pri = aqp->mSequencer_Pri;
	Sequencer* seqr_sec = aqp->mSequencer_Sec;
	Note* note_pri = [seqr_pri GetNote];
	Note* note_sec = [seqr_sec GetNote];
	
	if ((note_pri != nil) || (note_sec != nil))
	{
		seqr_pri->mTheta = [note_pri AddSamples:buffer:numFrames:seqr_pri->mAmpMultiplier:seqr_pri->mTheta];
		seqr_sec->mTheta = [note_sec AddSamples:buffer:numFrames:seqr_sec->mAmpMultiplier:seqr_sec->mTheta];
	}
	
	double max = 0.;
	for (int i = 0; i < numFrames; i++)
	{
		max = fabs(buffer[i]) > max ? fabs(buffer[i]) : max;
		((SInt16 *)inAQBuffer->mAudioData)[i] = buffer[i] * (SInt16)0x7FFF;
	}
//	printf("%f\n",max);

	double elapsed_time = numFrames / aqp->mSR;
	[seqr_pri Update:elapsed_time];
	[seqr_sec Update:elapsed_time];

	inAQBuffer->mAudioDataByteSize = 512;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation AQPlayer

- (void)dealloc {

	[mSequencer_Pri Stop];
	[self Stop];
	
	for (int i = 0; i < kNumSequences; i++)
		[mSequences[i] release];
	
	[mSequencer_Pri release];
		
	[super dealloc];
}

- (id)init
{
	[super init];
	
	gAQP = self;
	
	mSequencer_Pri = [Sequencer new];

#if 0
	for (int i = 0; i < kNumSequences; i++)
	{
		mSequences[i] = [Sequence new];
		switch (i)
		{
			case 0: [mSequences[i] AssignNotes:num_notes_01:note_sequence_01:dur_sequence_01]; break;
			case 1: [mSequences[i] AssignNotes:num_notes_02:note_sequence_02:dur_sequence_02]; break;
			case 2: [mSequences[i] AssignNotes:num_notes_03:note_sequence_03:dur_sequence_03]; break;
			case 3: [mSequences[i] AssignNotes:num_notes_04:note_sequence_04:dur_sequence_04]; break;
			case 4: [mSequences[i] AssignNotes:num_notes_05:note_sequence_05:dur_sequence_05]; break;
			case 5: [mSequences[i] AssignNotes:num_notes_06:note_sequence_06:dur_sequence_06]; break;
			case 6: [mSequences[i] AssignNotes:num_notes_07:note_sequence_07:dur_sequence_07]; break;
			case 7: [mSequences[i] AssignNotes:num_notes_08:note_sequence_08:dur_sequence_08]; break;
			case 8: [mSequences[i] AssignNotes:num_notes_09:note_sequence_09:dur_sequence_09]; break;
			case 9: [mSequences[i] AssignNotes:num_notes_10:note_sequence_10:dur_sequence_10]; break;
			case 10: [mSequences[i] AssignNotes:num_notes_11:note_sequence_11:dur_sequence_11]; break;
			case 11: [mSequences[i] AssignNotes:num_notes_12:note_sequence_12:dur_sequence_12]; break;
			case 12: [mSequences[i] AssignNotes:num_notes_13:note_sequence_13:dur_sequence_13]; break;
			case 13: [mSequences[i] AssignNotes:num_notes_14:note_sequence_14:dur_sequence_14]; break;
			case 14: [mSequences[i] AssignNotes:num_notes_15:note_sequence_15:dur_sequence_15]; break;
			case 15: [mSequences[i] AssignNotes:num_notes_16:note_sequence_16:dur_sequence_16]; break;
			case 16: [mSequences[i] AssignNotes:num_notes_17:note_sequence_17:dur_sequence_17]; break;
			case 17: [mSequences[i] AssignNotes:num_notes_18:note_sequence_18:dur_sequence_18]; break;
			case 18: [mSequences[i] AssignNotes:num_notes_19:note_sequence_19:dur_sequence_19]; break;
			case 19: [mSequences[i] AssignNotes:num_notes_20:note_sequence_20:dur_sequence_20]; break;
			case 20: [mSequences[i] AssignNotes:num_notes_21:note_sequence_21:dur_sequence_21]; break;
			case 21: [mSequences[i] AssignNotes:num_notes_22:note_sequence_22:dur_sequence_22]; break;
			case 22: [mSequences[i] AssignNotes:num_notes_23:note_sequence_23:dur_sequence_23]; break;
			case 23: [mSequences[i] AssignNotes:num_notes_24:note_sequence_24:dur_sequence_24]; break;
			case 24: [mSequences[i] AssignNotes:num_notes_25:note_sequence_25:dur_sequence_25]; break;
			case 25: [mSequences[i] AssignNotes:num_notes_26:note_sequence_26:dur_sequence_26]; break;
			case 26: [mSequences[i] AssignNotes:num_notes_27:note_sequence_27:dur_sequence_27]; break;
			case 27: [mSequences[i] AssignNotes:num_notes_28:note_sequence_28:dur_sequence_28]; break;
			case 28: [mSequences[i] AssignNotes:num_notes_29:note_sequence_29:dur_sequence_29]; break;
			case 29: [mSequences[i] AssignNotes:num_notes_30:note_sequence_30:dur_sequence_30]; break;
			case 30: [mSequences[i] AssignNotes:num_notes_31:note_sequence_31:dur_sequence_31]; break;
			case 31: [mSequences[i] AssignNotes:num_notes_32:note_sequence_32:dur_sequence_32]; break;
			case 32: [mSequences[i] AssignNotes:num_notes_33:note_sequence_33:dur_sequence_33]; break;
			case 33: [mSequences[i] AssignNotes:num_notes_34:note_sequence_34:dur_sequence_34]; break;
			case 34: [mSequences[i] AssignNotes:num_notes_35:note_sequence_35:dur_sequence_35]; break;
			case 35: [mSequences[i] AssignNotes:num_notes_36:note_sequence_36:dur_sequence_36]; break;
			case 36: [mSequences[i] AssignNotes:num_notes_37:note_sequence_37:dur_sequence_37]; break;
			case 37: [mSequences[i] AssignNotes:num_notes_38:note_sequence_38:dur_sequence_38]; break;
			case 38: [mSequences[i] AssignNotes:num_notes_39:note_sequence_39:dur_sequence_39]; break;
			case 39: [mSequences[i] AssignNotes:num_notes_40:note_sequence_40:dur_sequence_40]; break;
			case 40: [mSequences[i] AssignNotes:num_notes_41:note_sequence_41:dur_sequence_41]; break;
			case 41: [mSequences[i] AssignNotes:num_notes_42:note_sequence_42:dur_sequence_42]; break;
			case 42: [mSequences[i] AssignNotes:num_notes_43:note_sequence_43:dur_sequence_43]; break;
			case 43: [mSequences[i] AssignNotes:num_notes_44:note_sequence_44:dur_sequence_44]; break;
			case 44: [mSequences[i] AssignNotes:num_notes_45:note_sequence_45:dur_sequence_45]; break;
			case 45: [mSequences[i] AssignNotes:num_notes_46:note_sequence_46:dur_sequence_46]; break;
			case 46: [mSequences[i] AssignNotes:num_notes_47:note_sequence_47:dur_sequence_47]; break;
			case 47: [mSequences[i] AssignNotes:num_notes_48:note_sequence_48:dur_sequence_48]; break;
			case 48: [mSequences[i] AssignNotes:num_notes_49:note_sequence_49:dur_sequence_49]; break;
			case 49: [mSequences[i] AssignNotes:num_notes_50:note_sequence_50:dur_sequence_50]; break;
			case 50: [mSequences[i] AssignNotes:num_notes_51:note_sequence_51:dur_sequence_51]; break;
			case 51: [mSequences[i] AssignNotes:num_notes_52:note_sequence_52:dur_sequence_52]; break;
			case 52: [mSequences[i] AssignNotes:num_notes_53:note_sequence_53:dur_sequence_53]; break;
			default: break;
		}
	}
#else
	xmlDocPtr doc;
	xmlNodePtr cur;
	
	doc = xmlParseFile("/Users/kojiroumezaki/Docs/Music/Mobile_In_C/minc_unfuddle/MInC/InC.xml");

	if (doc == NULL ) {
		fprintf(stderr,"Document not parsed successfully. \n");
		return self;
	}
	
	cur = xmlDocGetRootElement(doc);
	
	if (cur == NULL) {
		fprintf(stderr,"empty document\n");
		xmlFreeDoc(doc);
		return self;
	}
	
	if (xmlStrcmp(cur->name, (const xmlChar *) "work")) {
		fprintf(stderr,"document of the wrong type, root node != work");
		xmlFreeDoc(doc);
		return self;
	}
	
	cur = cur->xmlChildrenNode;
	while (cur != NULL) {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"part"))){
            NSLog(@"part found");
			xmlNodePtr cur2 = cur->xmlChildrenNode;
			while (cur2 != NULL) {
				if ((!xmlStrcmp(cur2->name, (const xmlChar *)"sequence"))) {
                    NSLog(@"sequence found");
                    
                    int seq_id = atoi(xmlGetProp(cur2, "id"));
                    int num_notes = atoi(xmlGetProp(cur2, "numnote"));

                    NSLog(@"%d %d",seq_id,num_notes);
                    double *notesequence = (double*)malloc(sizeof(double)*num_notes);
					double *dursequence = (double*)malloc(sizeof(double)*num_notes);

					xmlNodePtr cur3 = cur2->xmlChildrenNode;
					int note_i = 0, dur_i = 0;
					while (cur3 != NULL) {
						if ((!xmlStrcmp(cur3->name, (const xmlChar *)"note"))) {
							// Add notes
                            float note_num = atof(xmlNodeListGetString(doc, cur3->xmlChildrenNode, 1));
                            NSLog(@"note [%d] %f",note_i,note_num);
                            notesequence[note_i++] = note_num;
						}
						else if ((!xmlStrcmp(cur3->name, (const xmlChar *)"dur"))) {
							// Add durs
                            float duration = atof(xmlNodeListGetString(doc, cur3->xmlChildrenNode, 1)); 
                            NSLog(@"dur [%d] %f",dur_i,duration);
                            dursequence[dur_i++] = duration;
						}
						cur3 = cur3->next;
					}
                    mSequences[seq_id] = [Sequence new];
					[mSequences[seq_id] AssignNotes:num_notes:notesequence:dursequence];
                    free(notesequence);
                    free(dursequence);
				}
				cur2 = cur2->next;
			}
		}
		cur = cur->next;
	}
	
	xmlFreeDoc(doc);
	
	
#endif
    
	mSequencer_Pri->mAmpMultiplier = 0.5;
	mSequencer_Pri->mDurMultiplier = 0.5;
	
	mSequencer_Sec = [Sequencer new];
	mSequencer_Sec->mSeq_Cur = [Sequence new];
	[mSequencer_Sec->mSeq_Cur AssignNotes:num_notes_pulse:note_sequence_pulse:dur_sequence_pulse];
	mSequencer_Sec->mAmpMultiplier = 0.5;
	mSequencer_Sec->mDurMultiplier = 0.5;

	mSR = 22050.;
	
	mSeqNum = 0;
	
	[self Start];

	[mSequencer_Pri Start];

	return self;
}

-(void) New
{
	mDataFormat.mFormatID = kAudioFormatLinearPCM;
	mDataFormat.mFormatFlags = kAudioFormatFlagIsSignedInteger;
	mDataFormat.mChannelsPerFrame = 1;
	mDataFormat.mSampleRate = mSR;
	mDataFormat.mBitsPerChannel = 16;
	mDataFormat.mFramesPerPacket = 1;
	mDataFormat.mBytesPerPacket = sizeof(SInt16);
	mDataFormat.mBytesPerFrame = sizeof(SInt16);

    OSStatus result = AudioQueueNewOutput(&mDataFormat, AQBufferCallback, self, nil, nil, 0, &mQueue);
	
	if (result != noErr)
		printf("AudioQueueNewOutput %ld\n",result);
	
    for (int i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(mQueue, 512, &mBuffers[i]);
		if (result != noErr)
			printf("AudioQueueAllocateBuffer %ld\n",result);
	}
}

-(OSStatus)Start
{
	OSStatus result = noErr;

    // if we have no queue, create one now
    if (mQueue == nil)
        [self New];
    
    // prime the queue with some data before starting
    for (int i = 0; i < kNumberBuffers; ++i)
        AQBufferCallback(self, mQueue, mBuffers[i]);            
	
    result = AudioQueueStart(mQueue, nil);
		
	return result;
}

-(OSStatus)Stop
{
	OSStatus result = noErr;

    result = AudioQueueStop(mQueue, true);
	
	return result;
}

-(void) SetSequence:(int)seq_num;
{
	if (seq_num >= 0 && seq_num <= kNumSequences)
	{
		mSeqNum = seq_num;
		[mSequencer_Pri SetNextSequence:mSequences[mSeqNum-1]];
	}
}

-(NSString*) GetModString;
{
	return [NSString stringWithFormat:@"%d",mSeqNum];
}

@end
