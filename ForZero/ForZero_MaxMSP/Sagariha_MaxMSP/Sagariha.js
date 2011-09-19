autowatch = 1;

var gNumVoices = 7;

var gBufSize = 5000;
var gFadeDur = 500;

var gMinInitDur = 0;
var gMaxInitDur = 30000;

var gMinRecDur = 2500;
var gMaxRecDur = gBufSize - gFadeDur - 100;
var gMaxRecBufSizeRatio = parseFloat(gMaxRecDur) / gBufSize;

var gMinPlayDur = 10000;
var gMaxPlayDur = 20000;

var gState = new Array;
var gTask_State = new Array;
var gTask_Play = new Array;
var gTask_Rec = new Array;

var gEnvDelay = new Array;
var gTask_EnvDelay = new Array;

var gDelayLevel = new Array;
var gTask_DelayLevel = new Array;

var gAudioBufIndex = new Array;
var gAudioBuf = new Array;
var gAudioFile = new Array;
var gTask_Audio = new Array;
var gAudioBufSize = 64;
var gAudioTaskInterval = 2;

var gIPAddress = new Array;

var gVolServer = new Array;

var gTask_Cue = new Task(cue_task);
var gInitMsg = "Instructions to follow.";


function loadbang()
{
	messnamed("saga_poly_in_1_msg","voices",gNumVoices);

	for (i = 0; i < gNumVoices; i++)
	{
		messnamed("saga_poly_in_1_msg","target",i+1);
		messnamed("saga_poly_in_2_msg","buf","saga_buf_"+(i+1));
	
		/* state */
		gTask_State[i] = new Task(state_func,this,i);
		gState[i] = 0;

		gTask_Play[i] = new Task(send_play_msg);
		gTask_Rec[i] = new Task(send_rec_msg);
		
		/* env delay */
		gTask_EnvDelay[i] = new Task(env_delay_func,this,i);
		gEnvDelay[i] = 0.;

		/* delay level */
		gTask_DelayLevel[i] = new Task(delay_level_func,this,i);
		gDelayLevel[i] = 0.;
		
		/* audio index */
		gTask_Audio[i] = new Task(audio_func,this,i);
		gAudioBuf[i] = new Array;
		gAudioFile[i] = undefined;
		gAudioBufIndex[i] = 0;

		/* IP address */
		gIPAddress[i] = undefined;

		/* volume client */
		gVolServer[i] = 1.0;

		/* pan */
		send_pan_x_msg(i+1,parseFloat(i)/(gNumVoices-i));
		send_pan_y_msg(i+1,0.5);
	}

	messnamed("saga_poly_in_1_msg","target",0);
	messnamed("saga_poly_in_2_msg","size",gBufSize);
	messnamed("saga_poly_in_2_msg","fade",gFadeDur);
	messnamed("saga_poly_in_2_msg","env","set",0,",",1,50,1,100,0,50);
	messnamed("saga_poly_in_2_msg","env","bang");
	messnamed("saga_poly_in_2_msg","delay",0.5);

	init_track_plug();
}

function automate(enable)
{
	if (enable)
		for (i = 0; i < gNumVoices; i++)
		{
			if (gIPAddress[i] == undefined)
			{
				gTask_State[i].schedule(0);
				gTask_EnvDelay[i].schedule(0);
				gTask_DelayLevel[i].schedule(0);
			}
		}
	else
		for (i = 0; i < gNumVoices; i++)
		{
			gTask_State[i].cancel();
			gTask_EnvDelay[i].cancel();
			gTask_DelayLevel[i].cancel();
		}
}

var gCue = 0;
var gNumCues = 8;
var gCueDur = 0;

var gCue_VolServerFade = 7;
var gCue_VolClientFade = 9;
var gCue_Finished = 8;
var gCue_Finished_Other = 9;
var gCue_Finished_All = 10;

function start_cues()
{
	gCue = 0;
	gTask_Cue.schedule(0);
}

function stop_cues()
{
	gTask_Cue.cancel();
}

function cue_task()
{
	cue(++gCue);

	messnamed("saga_cue_msg",gCue);

	if ((gCue + 1) < gNumCues)
		if (gCueDur > 0)
			gTask_Cue.schedule(gCueDur);
}

function cue(n,pos)
{
	var dur = 0;
	var msg = "";

	switch (n)
	{
		case 0:
			dur = -1; msg = gInitMsg;
			gCueDur = 0;
			break;
		case 1:
			dur = 3000; msg = "Touch Instructions button to see these instructions.";
			gCueDur = 10000;
			break;
		case 2:
			dur = 5000; msg = "Touch Record to capture some on-stage sound.  Re-record whenever you wish using your best judgement.";
			gCueDur = 60000;
			break;
		case 3:
			dur = 3000; msg = "Notice that tilting your device pans the sound around in the space.";
			gCueDur = 20000;
			break;
		case 4:
			dur = 3000; msg = "Control Modulation at your discretion.";
			gCueDur = 20000;
			break;
		case 5:
			dur = 3000; msg = "Control Delay amount at your discretion.";
			gCueDur = 20000;
			break;
		case 6:
			dur = 3000; msg = "Continue to Record at will.";
			gCueDur = 60000;
			break;
		case gCue_VolServerFade:
			dur = 5000; msg = "Notice the Volume slider near the bottom.  Please take 30-60 seconds to slowly turn that volume down to absolute zero.";
			gCueDur = 60000;
			break;
		case gCue_Finished:
			dur = -1; msg = "You have finished.  Some others are still playing.";
			break;
		case gCue_Finished_Other:
			dur = -1; msg = "Another player has finished.  Some more are still playing.";
			break;
		case gCue_Finished_All:
			dur = -1; msg = "Everyone has finished playing.  The piece has completed.  Thank you.";
			gCueDur = 0;
			break;
	}
	
	if (pos == undefined)
	{
		gCue = n;
		gCueSendPos = 0;
		gCueSendDur = dur;
		gCueSendMsg = msg;
		gInterstitial = true;
		gCueSenderTask.schedule(0);
	}
	else
	{
		if (gIPAddress[pos] != undefined)
		{
			send_interstitial_msg(pos,dur,msg);
			send_cue_msg(pos,n);
		}
	}
}

var gCueSendPos = 0;
var gCueSendDur = 0;
var gCueSendMsg = "";
var gInterstitial = false;
var gCueSenderTask = new Task(cue_sender_task_func);

function cue_sender_task_func()
{
	if (gCueSendPos < gNumVoices)
	{
		if (gIPAddress[gCueSendPos] != undefined)
			if (gInterstitial)
				send_interstitial_msg(gCueSendPos,gCueSendDur,gCueSendMsg);
			else
				send_cue_msg(gCueSendPos,gCue);

		gCueSendPos++;
		gCueSenderTask.schedule(10);
	}
	
	if (gInterstitial && (gCueSendPos == gNumVoices))
	{
		gInterstitial = false;
		gCueSendPos = 0;
		gCueSenderTask.schedule(10);
	}
}

function state_func(pos)
{
	var min_dur = 0;
	var max_dur = 0;

	var state = 0;
	switch (gState[pos])
	{
		/* off to play */
		case 0: state = 1; min_dur = gMinInitDur; max_dur = gMaxInitDur; break;

		/* play to rec */		
		case 1: state = 2; min_dur = gMinRecDur; max_dur = gMaxRecDur; break;
		
		/* rec to play */
		case 2: state = 1; min_dur = gMinPlayDur; max_dur = gMaxPlayDur; break;
	}
	
	send_state_msg(pos,state);
	gState[pos] = state;
	messnamed("saga_state_multislider_msg",gState);	

	if (gIPAddress[pos] == undefined)
	{
		var range = max_dur - min_dur;
		gTask_State[pos].schedule(range * Math.random() + min_dur);
	}
	else
	{
		messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
		messnamed("saga_osc_out_msg","port",31337);
		messnamed("saga_osc_out_msg","/saga/state",state);
	}
}

function env_delay_func(pos)
{
	var min_dur = 5000;
	var max_dur = 10000;

	var delay = Math.random() * 200.;

	send_env_delay_msg(pos,delay);
	gEnvDelay[pos] = delay;
	messnamed("saga_env_delay_multislider_msg",gEnvDelay);

	var range = max_dur - min_dur;
	gTask_EnvDelay[pos].schedule(range * Math.random() + min_dur);
}

function delay_level_func(pos)
{
	var min_dur = 5000;
	var max_dur = 10000;

	var level = Math.random() * 1.0;

	send_delay_level_msg(pos,level);
	gDelayLevel[pos] = level;
	messnamed("saga_delay_level_multislider_msg",gDelayLevel);

	var range = max_dur - min_dur;
	gTask_DelayLevel[pos].schedule(range * Math.random() + min_dur);
}

function send_state_msg(pos,state)
{
	var play = 0;
	var rec = 0;
	var target_pos = pos + 1;
	switch (state)
	{
		case 0:
			play = 0;
			rec = 0;
			post(target_pos,"changed to off\n");
			break;
		case 1:
			play = 1;
			rec = 0;
			post(target_pos,"changed to play\n");
			break;
		case 2:
			play = 0;
			rec = 1;
			post(target_pos,"changed to rec\n");
			break;
		default:
			break;
	}

	gTask_Play[pos].arguments = new Array(target_pos,play);
	gTask_Play[pos].schedule(play?0:0);

	gTask_Rec[pos].arguments = new Array(target_pos,rec);
	gTask_Rec[pos].schedule(rec?gFadeDur:0);
}

function send_vol_msg(target_pos,val)
{
	messnamed("saga_poly_in_1_msg","target",target_pos);
	messnamed("saga_poly_in_2_msg","vol",val);
}

function send_pan_x_msg(target_pos,val)
{
	messnamed("saga_poly_in_1_msg","target",target_pos);
	messnamed("saga_poly_in_2_msg","pan_x",val);
}

function send_pan_y_msg(target_pos,val)
{
	messnamed("saga_poly_in_1_msg","target",target_pos);
	messnamed("saga_poly_in_2_msg","pan_y",val);
}

function send_play_msg(target_pos,play)
{
	messnamed("saga_poly_in_1_msg","target",target_pos);
	messnamed("saga_poly_in_2_msg","play",play);
}

function send_rec_msg(target_pos,rec)
{
	messnamed("saga_poly_in_1_msg","target",target_pos);
	messnamed("saga_poly_in_2_msg","rec",rec);
}

function send_env_delay_msg(target_pos,delay)
{
	messnamed("saga_poly_in_1_msg","target",target_pos);
	messnamed("saga_poly_in_2_msg","env_delay",delay);
}

function send_delay_level_msg(target_pos,level)
{
	messnamed("saga_poly_in_1_msg","target",target_pos);
	messnamed("saga_poly_in_2_msg","delay_level",level,3000);
}

function init_track_plug()
{
	messnamed("saga_trackplug_in_msg",51,1);		/* enable gate */
	messnamed("saga_trackplug_in_msg",53,0.652778);	/* gate threshold */
	messnamed("saga_trackplug_in_msg",56,0.674743);	/* gate attack */

	messnamed("saga_trackplug_in_msg",18,0.566323);	/* hi-shelf frequency */
	messnamed("saga_trackplug_in_msg",20,0.875);	/* hi-shelf gain */
}

var gDump = false;
function dump(enable)
{
	gDump = enable;
	post("gDump",gDump,"\n");
}

function osc_msg()
{
	if (gDump)
		post(arguments[0],arguments[1],arguments[2],"\n");
	
	var osc_add = arguments[0];
	var ip_add = arguments[1];
	var val = arguments[2];

	pos = find_ip_address_pos(ip_add);
	
	if (pos == -1)
	{
		pos = find_ip_address_pos(undefined);
		if (pos != -1)
		{
			gIPAddress[pos] = ip_add;
			post("setting",ip_add,"to target pos",pos+1,"\n");
//			send_interstitial_msg(pos,-1,gInitMsg);
		}
	}

	if (pos == -1) return;
	
	if (osc_add == "/accelx")
		osc_msg_accelx(pos,val);

	else if (osc_add == "/accely")
		osc_msg_accely(pos,val);

	else if (osc_add == "/state")
		osc_msg_state(pos,val);

	else if (osc_add == "/period")
		osc_msg_period(pos,val);

	else if (osc_add == "/delay")
		osc_msg_delay(pos,val);

	else if (osc_add == "/vol_s")
		osc_msg_vol_s(pos,val);

	else if (osc_add == "/vol_c")
		osc_msg_vol_c(pos,val);

	else if (osc_add == "/pan")
		osc_msg_pan(pos,val);

	else if (osc_add == "/hint")
		osc_msg_hint(pos);

	else if (osc_add == "/audio")
		osc_msg_audio(pos,val);

	else if (osc_add == "/fz_start")
		osc_msg_fz_start();

	else if (osc_add == "/fz_sub")
		osc_msg_fz_sub();

	else if (osc_add == "/fz_stop")
		osc_msg_fz_stop();

	else if (osc_add == "/fz_panic")
		osc_msg_fz_panic();
}

function osc_msg_state(pos,val)
{
	if (pos != -1)
	{
		var state = val;
		send_state_msg(pos,state);
		gState[pos] = state;
		messnamed("saga_state_multislider_msg",gState);
		
		gTask_State[pos].cancel();
		
		if (state == 2)
		{
			send_rec_prog_msg(pos,0.);
			gTask_State[pos].schedule(gMaxRecDur);
		}
	}
}

function osc_msg_period(pos,val)
{
	if (pos != -1)
	{
		var delay = (val / 1000.) * 200.;
		send_env_delay_msg(pos+1,delay);
		gEnvDelay[pos] = delay;
		messnamed("saga_env_delay_multislider_msg",gEnvDelay);
	}
}

function osc_msg_delay(pos,val)
{
	if (pos != -1)
	{
		var level = (val / 1000.) * 1.0;
		send_delay_level_msg(pos+1,level);
		gDelayLevel[pos] = level;
		messnamed("saga_delay_level_multislider_msg",gDelayLevel);
	}
}

function osc_msg_vol_s(pos,val)
{
	if (pos != -1)
	{
		gVolServer[pos] = (val / 1000.) * 1.0;
		send_vol_msg(pos+1,gVolServer[pos]);
		if (gCue == gCue_VolServerFade)
		{
			if (gVolServer[pos] == 0.)
				player_faded_out(pos);
		}
	}
}

function osc_msg_vol_c(pos,val)
{
	if (pos != -1)
	{
	}
}

function osc_msg_pan(pos,val)
{
	if (pos != -1)
	{
		var pan = (val / 1000.) * 1.0;
		send_pan_msg(pos+1,pan);
	}
}

function osc_msg_hint(pos)
{
	if (pos != -1)
	{
		cue(gCue,pos);
	}
}

function osc_msg_audio(pos,val)
{
	if (pos != -1)
	{
		if (val == 0)
		{
			messnamed("saga_poly_in_1_msg","target",pos+1);
			messnamed("saga_poly_in_2_msg","write","samptype","float32");
			messnamed("saga_poly_in_2_msg","write","writeraw","saga_buf_"+(pos+1));
		
		}

		gAudioBufIndex[pos] = val;
		audio_func(pos,val);
	}
}

function osc_msg_accelx(pos,val)
{
	if (pos != -1)
	{
		val = (val + 1.0) / 2.;
		send_pan_x_msg(pos+1,val);
	}
}

function osc_msg_accely(pos,val)
{
	if (pos != -1)
	{
		val = (val + 1.0) / 2.;
		send_pan_y_msg(pos+1,val);
	}
}

function osc_msg_fz_start()
{
	messnamed("fz_msg","start");
}

function osc_msg_fz_sub()
{
	messnamed("fz_msg","sub");
}

function osc_msg_fz_stop()
{
	messnamed("fz_msg","stop");
}

function osc_msg_fz_panic()
{
	messnamed("fz_msg","panic");
}


function find_ip_address_pos(ip_add)
{
	for (i = 0; i < gNumVoices; i++)
		if (gIPAddress[i] == ip_add)
			return i;
	return -1;
}

function rec_prog(target_pos,v)
{
	var pos = target_pos - 1;
	if (gIPAddress[pos] == undefined)
	{
		if (gDump)
			post("rec_prog",target_pos,v,"\n");
	}
	else if (v != 0.)
	{
		v /= gMaxRecBufSizeRatio;
		send_rec_prog_msg(pos,v);
	}
}

function audio_func(pos,val)
{
	if (gAudioFile[pos] == undefined)
	{
		gAudioFile[pos] = new File("saga_buf_"+(pos+1));
		gAudioFile[pos].byteorder = "big";
//		post(gAudioFile[pos].byteorder,"byte order\n");
	}
	
	gAudioFile[pos].position = gAudioBufIndex[pos] * 4 * 2;
	
	buf = gAudioFile[pos].readfloat32(gAudioBufSize*2);
	
	for (i = 0; i < gAudioBufSize*2; i+= 2)
		gAudioBuf[pos][i>>1] = buf[i];

	if (gAudioFile[pos].position == gAudioFile[pos].eof)
	{
		gAudioFile[pos].close();
		gAudioFile[pos] = undefined;
		send_audio_end_msg(pos);
	}
	else
	{
		send_audio_msg(pos,gAudioBufIndex[pos],gAudioBufSize,gAudioBuf[pos]);
//		post(gAudioBufIndex[pos],gAudioBuf[pos],"\n");
	}
}

function send_rec_prog_msg(pos,v)
{
	messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
	messnamed("saga_osc_out_msg","port",31337);
	messnamed("saga_osc_out_msg","/saga/rec_prog",parseInt(v * 1000.));
}

function send_interstitial_msg(pos,dur,msg)
{
	messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
	messnamed("saga_osc_out_msg","port",31337);
	messnamed("saga_osc_out_msg","/saga/interstitial",dur,msg);
}

function send_audio_msg(pos,index,size,v)
{
	messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
	messnamed("saga_osc_out_msg","port",31337);
	messnamed("saga_osc_out_msg","/saga/audio",index,size,v);
}

function send_audio_end_msg(pos)
{
	messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
	messnamed("saga_osc_out_msg","port",31337);
	messnamed("saga_osc_out_msg","/saga/audio_end");
}

function send_cue_msg(pos,v)
{
	messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
	messnamed("saga_osc_out_msg","port",31337);
	messnamed("saga_osc_out_msg","/saga/cue",parseInt(v));
}

function send_client_play(pos)
{
	messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
	messnamed("saga_osc_out_msg","port",31337);
	messnamed("saga_osc_out_msg","/saga/play");
}

function send_client_stop(pos)
{
	messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
	messnamed("saga_osc_out_msg","port",31337);
	messnamed("saga_osc_out_msg","/saga/stop");
}


function player_faded_out(pos)
{
	var all_done = true;

	for (i = 0; i < gNumVoices; i++)
	{
		if (gIPAddress[i] != undefined)
			if (gVolServer[i] > 0.)
			{
				all_done = false;
				break;
			}
	}

	if (all_done)
	{
		gCue = gCue_Finished_All;
		cue(gCue);
		return;
	}

	for (i = 0; i < gNumVoices; i++)
	{
		if (gIPAddress[i] != undefined)
			if (gVolServer[i] == 0.)
				if (i == pos)
					cue(gCue_Finished,pos);
/*
				else
					cue(gCue_Finished_Other,i);
			
*/
	}
}
