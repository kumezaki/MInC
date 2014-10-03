//
//  MInC_Reverb.m
//  MInC
//
//  Created by Kojiro Umezaki on 10/3/14.
//
//

#import "MInC_Reverb.h"

@implementation MInC_Reverb

@end

#include <ctype.h>
#include <stdlib.h>
#include <string.h>

/*----------------------------------------------------------------------------*/

#define RMS_REVERB_DEFAULT_ROOMSIZE_VAL		0.25
#define RMS_REVERB_DEFAULT_DAMP_VAL			0.75
#define RMS_REVERB_DEFAULT_WET_VAL			0.5
#define RMS_REVERB_DEFAULT_DRY_VAL			0.5
#define RMS_REVERB_DEFAULT_WIDTH_VAL		0.75
#define RMS_REVERB_DEFAULT_INPUTGAIN_VAL	1.0


/*----------------------------------------------------------------------------*/

struct RevModel gReverb[RMS_SAMP_NUM_REVERB_UNITS];
float gRevInGain[5];


/*----------------------------------------------------------------------------*/

void
Reverb_Init(void)
{
	int i;
	for (i = 0; i < RMS_SAMP_NUM_REVERB_UNITS; i++)
	{
		revmodel_init(&gReverb[i]);
		revmodel_setroomsize(&gReverb[i],RMS_REVERB_DEFAULT_ROOMSIZE_VAL);
		revmodel_setdamp(&gReverb[i],RMS_REVERB_DEFAULT_DAMP_VAL);
		revmodel_setwet(&gReverb[i],RMS_REVERB_DEFAULT_WET_VAL);
		revmodel_setdry(&gReverb[i],RMS_REVERB_DEFAULT_DRY_VAL);
		revmodel_setwidth(&gReverb[i],RMS_REVERB_DEFAULT_WIDTH_VAL);
        
		gRevInGain[i] = RMS_REVERB_DEFAULT_INPUTGAIN_VAL;
	}
}

RMSRevValType	Reverb_GetRoomSize(const RMSRevPosType id) { return revmodel_getroomsize(&gReverb[id]); }
void			Reverb_SetRoomSize(const RMSRevPosType id, const RMSRevValType val) { revmodel_setroomsize(&gReverb[id],val); }

RMSRevValType	Reverb_GetDamp(const RMSRevPosType id) { return revmodel_getdamp(&gReverb[id]); }
void			Reverb_SetDamp(const RMSRevPosType id, const RMSRevValType val) { revmodel_setdamp(&gReverb[id],val); }

RMSRevValType	Reverb_GetWet(const RMSRevPosType id) { return revmodel_getwet(&gReverb[id]); }
void			Reverb_SetWet(const RMSRevPosType id, const RMSRevValType val) { revmodel_setwet(&gReverb[id],val); }

RMSRevValType	Reverb_GetDry(const RMSRevPosType id) { return revmodel_getdry(&gReverb[id]); }
void			Reverb_SetDry(const RMSRevPosType id, const RMSRevValType val) { revmodel_setdry(&gReverb[id],val); }

RMSRevValType	Reverb_GetWidth(const RMSRevPosType id) { return revmodel_getwidth(&gReverb[id]); }
void			Reverb_SetWidth(const RMSRevPosType id, const RMSRevValType val) { revmodel_setwidth(&gReverb[id],val); }

RMSRevValType	Reverb_GetInputGainA(const RMSRevPosType id) { return gRevInGain[0]; }
void			Reverb_SetInputGainA(const RMSRevPosType id, const RMSRevValType val) { gRevInGain[0] = val; }
RMSRevValType	Reverb_GetInputGainB(const RMSRevPosType id) { return gRevInGain[1]; }
void			Reverb_SetInputGainB(const RMSRevPosType id, const RMSRevValType val) { gRevInGain[1] = val; }
RMSRevValType	Reverb_GetInputGainC(const RMSRevPosType id) { return gRevInGain[2]; }
void			Reverb_SetInputGainC(const RMSRevPosType id, const RMSRevValType val) { gRevInGain[2] = val; }
RMSRevValType	Reverb_GetInputGainD(const RMSRevPosType id) { return gRevInGain[3]; }
void			Reverb_SetInputGainD(const RMSRevPosType id, const RMSRevValType val) { gRevInGain[3] = val; }
RMSRevValType	Reverb_GetInputGainE(const RMSRevPosType id) { return gRevInGain[4]; }
void			Reverb_SetInputGainE(const RMSRevPosType id, const RMSRevValType val) { gRevInGain[4] = val; }

/*----------------------------------------------------------------------------*/

void
revmodel_process(register struct RevModel* rm, register Float64* ioL, register Float64* ioR, long numsamples, int skip)
{
	register float outL;
	register float outR;
	register float input = 0.;
	float output;
	register int i;
	register struct Comb *cf;
	register struct AllPass *ap;
	float bufout;
    
	while (numsamples-- > 0)
	{
		outL = outR = 0;
        
#if 0
		input = (*ioL + *ioR) * rm->gain;
#else
		for (i=0; i < skip; i++)
			input += *(ioL+i) * gRevInGain[i>>1];
		input *= rm->gain;
#endif
		
		/* Accumulate comb filters in parallel */
		for (i=0; i < numcombs; i++)
		{
			/* LEFT */
			cf = &rm->combL[i];
			
			output = cf->buffer[cf->bufidx];
			undenormalise(output);
			
			cf->filterstore = (output*cf->damp2) + (cf->filterstore*cf->damp1);
			undenormalise(cf->filterstore);
			
			cf->buffer[cf->bufidx] = input + (cf->filterstore*cf->feedback);
			
			if(++cf->bufidx>=cf->bufsize) cf->bufidx = 0;
			
			outL+=output;
			
            
			/* RIGHT */
			cf=&rm->combR[i];
			
			output = cf->buffer[cf->bufidx];
			undenormalise(output);
			
			cf->filterstore = (output*cf->damp2) + (cf->filterstore*cf->damp1);
			undenormalise(cf->filterstore);
			
			cf->buffer[cf->bufidx] = input + (cf->filterstore*cf->feedback);
			
			if(++cf->bufidx>=cf->bufsize) cf->bufidx = 0;
			
			outR+=output;
		}
		
		/* Feed through allpasses in series */
		for (i=0; i < numallpasses; i++)
		{
			/* LEFT */
			ap = &rm->allpassL[i];
			
			bufout = ap->buffer[ap->bufidx];
			
			undenormalise(bufout);
			
			output = -outL + bufout;
			ap->buffer[ap->bufidx] = outL + ((bufout)*ap->feedback);
			
			if(++ap->bufidx>=ap->bufsize) ap->bufidx = 0;
			
			outL=output;
			
			
			/* RIGHT */
			ap = &rm->allpassR[i];
			
			bufout = ap->buffer[ap->bufidx];
			
			undenormalise(bufout);
			
			output = -outR + bufout;
			ap->buffer[ap->bufidx] = outR + ((bufout)*ap->feedback);
			
			if(++ap->bufidx>=ap->bufsize) ap->bufidx = 0;
			
			outR=output;
		}
		
		/* Calculate output REPLACING anything already there */
		*ioL += outL*rm->wet1 + outR*rm->wet2;
		*ioR += outR*rm->wet1 + outL*rm->wet2;
		
		/* Increment sample pointers, allowing for interleave (if any) */
		ioL += skip;
		ioR += skip;
	}
}
