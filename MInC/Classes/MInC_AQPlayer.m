//
//  AQPlayer.m
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MInC_AQPlayer.h"

#import "MInC_BLITSaw.h"
#import "MInC_SequenceFile.h"

#import "MInC_FirstView.h"
extern MInC_FirstView *gFirstView;

#import "MInC_Content.h"
#import "MInC_Player.h"

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

#define MINC_AUDIO_BUFFER_BYTES 1024

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
	for (SInt32 i = 0; i < numFrames; i++)
    {
        if (buffer[i]>1. || buffer[i]<-1.)
            NSLog(@"!!!!!");

		((SInt16 *)inAQBuffer->mAudioData)[i] = buffer[i] * (SInt16)0x7FFF;
    }

	/* report elapsed time to sequencers */
	Float64 elapsed_time = (Float64)numFrames / kSR;
    [aqp reportElapsedTime:elapsed_time];
    
	inAQBuffer->mAudioDataByteSize = MINC_AUDIO_BUFFER_BYTES;
	inAQBuffer->mPacketDescriptionCount = 0;
	
	AudioQueueEnqueueBuffer(inAQ, inAQBuffer, 0, nil);
}

@implementation MInC_AQPlayer

@synthesize Sequences;

@synthesize PlayerID;

@synthesize PlayerDictionary;

- (void)dealloc {

    EACH_SEQUENCER_IN_DICTIONARY_METHOD(stop)
    
	[self stop];
	
	for (SInt32 i = 0; i < Sequences.count; i++)
		[Sequences[i] release];

    EACH_SEQUENCER_IN_DICTIONARY_METHOD(release)

    EACH_SYNTH_IN_DICTIONARY_METHOD(release)

    EACH_FILTER_IN_DICTIONARY_METHOD(release)
    
	[super dealloc];
}

- (id)init
{
	[super init];
	
	gAQP = self;
    
	Sequences = [[NSMutableArray alloc] init];

    PlayerDictionary = [[NSMutableDictionary alloc] init];
    
    [self parseFile];

#if MINC_SECONDARY_SEQUENCER
	Sequencer_Sec = [[MInC_Sequencer alloc] init];
    MInC_Sequence* seq = [[MInC_Sequence alloc] init];
    [seq assignNotes:num_notes_pulse:note_sequence_pulse:dur_sequence_pulse];
    [Sequencer_Sec setNextSequence:seq];
	Sequencer_Sec.AmpMultiplier_Control = 0.5 * 0.5;
	Sequencer_Sec.DurMultiplier = 0.1;
#endif
    
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
		NSLog(@"AudioQueueNewOutput %d\n",(int)result);
	
    for (SInt32 i = 0; i < kNumberBuffers; ++i)
	{
		result = AudioQueueAllocateBuffer(Queue, MINC_AUDIO_BUFFER_BYTES, &Buffers[i]);
		if (result != noErr)
			NSLog(@"AudioQueueAllocateBuffer %d\n",(int)result);
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

-(void) setSeqFileData:(NSData*) data
{
    MInC_SequenceFile* seqFile = [[MInC_SequenceFile alloc] init];
    
    [seqFile writeToFile:@"TCP.dat" withData:data];
    
    [seqFile readFromFile:@"TCP.dat"];
}

-(void) loadSeqFile
{
    MInC_SequenceFile* seqFile = [[MInC_SequenceFile alloc] init];
    
    [gFirstView startActivityIndicator];
    
    [seqFile readFromFile:@"TCP.dat"];
    
    [gFirstView stopActivityIndicator];    
}

-(void) setSequence:(SInt32)seq_num
{
    MInC_Player* player = PlayerDictionary[PLAYER_ID_STR(PlayerID)];

    if (player.SeqPos_Cur != seq_num)
    {
        MInC_Sequence* seq = Sequences[seq_num - 1];
        
        if (seq != nil)
        {
            player.SeqPos_Cur = seq_num;
            
            [player.Sequencer setNextSequence:Sequences[player.SeqPos_Cur-1]];

            [gFirstView setRelativePos:(AvgSeqPos - player.SeqPos_Cur)];
        }
        else
            NSLog(@"seq_num %d out of range",(int)seq_num);
    }
}

-(void) setSequence:(SInt32)seq_pos :(MInC_Sequence*)seq
{
    if (seq_pos >= 0)
        [Sequences insertObject:seq atIndex:seq_pos];
}

-(void) setOtherPlayersSequence:(NSMutableArray*)pos_array
{
    for (NSString* key in PlayerDictionary)
    {
        MInC_Player* player = PlayerDictionary[key];
        player.Missing = YES;
    }
    ((MInC_Player*)[PlayerDictionary valueForKey:PLAYER_ID_STR(PlayerID)]).Missing = NO;
    
    for (NSArray* player_info in pos_array)
    {
        NSString* key = player_info[0];
        NSInteger next_pos = [player_info[1] integerValue];
        MInC_Player* player = PlayerDictionary[key];
        if (player != nil)
        {
            NSLog(@"player w/ id %@ exists",key);
            player.Missing = NO;
        }
        else
        {
            /* create a new player w/ player_info */
            NSLog(@"creating new player w/ id %@",key);
            [self addPlayerWithID:key];
        }
        player = PlayerDictionary[key];
        player.SeqPos_Next = next_pos;
        NSLog(@"player %@ SeqPos_Next is %ld == %ld?",key,(long)next_pos,(long)player.SeqPos_Next);
    }
    
    for (NSString* key in PlayerDictionary)
    {
        MInC_Player* player = PlayerDictionary[key];
        MInC_Sequencer* sequencer = player.Sequencer;

        if (player.Missing)
        {
            player.SeqPos_Cur = 0;
            if (sequencer.Playing)
                [sequencer stop];
        }
        else if (player.SeqPos_Cur != player.SeqPos_Next)
        {
            player.SeqPos_Cur = player.SeqPos_Next;
            [sequencer setNextSequence:Sequences[player.SeqPos_Cur-1]];
            if (!sequencer.Playing)
                [sequencer start];
        }
        NSLog(@"player %@ SeqPos_Cur %ld",key,(long)player.SeqPos_Cur);
    }
}

-(void)setSeqPos:(NSNumber*)num
{
    [self setSequence:[num intValue]];
}

-(void)setAvgSeqPos:(NSNumber*)num
{
    AvgSeqPos = [num intValue];

    MInC_Player* player = gAQP.PlayerDictionary[PLAYER_ID_STR(gAQP.PlayerID)];

    [gFirstView setRelativePos:(AvgSeqPos - player.SeqPos_Cur)];
}

-(void)addPlayerWithID:(NSString*)player_id
{
    MInC_Sequencer* sequencer = [[MInC_Sequencer alloc] init];
    sequencer.SyncWithServer = YES;
    sequencer.DurMultiplier = 0.5;
    MInC_Player* player = [[MInC_Player alloc] initWithSequencer:sequencer];
    [PlayerDictionary setObject:player forKey:player_id];
    [self setSequencerAmplitudes];
    
    MInC_BLITSaw* blitsaw = [[MInC_BLITSaw alloc] init];
    player.BLITSaw = blitsaw;
    
    MInC_Biquad* biquad = [[MInC_Biquad alloc] init];
    biquad.Type = LPF;
    biquad.DBGain = 0.;
    biquad.Freq = kSR/2.*0.5; /* 0.5 in freq setting assumes default position of control in touch view */
    biquad.SRate = kSR;
    biquad.Bandwidth = 1.0;
    player.BiQuad = biquad;
}

-(void)setSequencerAmplitudes
{
    Float64 amp = 1./PlayerDictionary.count;
    EACH_SEQUENCER_IN_DICTIONARY_MEMBER(AmpMultiplier_Control) = amp;
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
    for (SInt32 i = 0; i < 1; i++)
    {
        Sequences[i] = [[MInC_Sequence alloc] init];
        switch (i)
        {
            case 0: [Sequences[i] assignNotes:num_notes_pulse:note_sequence_pulse:dur_sequence_pulse]; break;
            default: break;
        }
    }
#else
    for (SInt32 i = 0; i < 53; i++)
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
    /* primary sequencers */
	Float64 temp_buffer[num_frames];

    for (NSString* key in gAQP.PlayerDictionary)
    {
        MInC_Player* player = gAQP.PlayerDictionary[key];
        MInC_Sequencer* sequencer = player.Sequencer;
        
        memset(temp_buffer,0,sizeof(Float64)*num_frames);

        MInC_Note* note_pri = [sequencer getNote];
        Float64 freq = note_pri == nil ? 0. : [note_pri getFreqWithTransposition];

        MInC_BLITSaw* blit_saw = player.BLITSaw;
        if (blit_saw != nil)
            blit_saw.Theta = [blit_saw addSamples:temp_buffer :num_frames :[sequencer getAmp] :blit_saw.Theta :freq];

#if 1
        MInC_Biquad* biquad = player.BiQuad;
        biquad.Freq = [sequencer getCutoffFreq];
        [biquad processAudioBuffer:temp_buffer :num_frames];
#endif
        
        for (int i = 0; i < num_frames; i++)
            buffer[i] += temp_buffer[i];
    }
    
#if MINC_SECONDARY_SEQUENCER
    /* secondary sequencer */
	MInC_Note* note_sec = [Sequencer_Sec getNote];
	if (note_sec != nil)
    {
		Sequencer_Sec.Theta = [note_sec addSamples:buffer:num_frames:[Sequencer_Sec getAmp]:Sequencer_Sec.Theta];
    }
#endif
}

-(void) reportElapsedTime:(Float64)elapsed_time
{
    for (NSString* key in gAQP.PlayerDictionary)
        [((MInC_Player*)gAQP.PlayerDictionary[key]).Sequencer update:elapsed_time];
    
#if MINC_SECONDARY_SEQUENCER
	[Sequencer_Sec update:elapsed_time];
#endif
}

@end
