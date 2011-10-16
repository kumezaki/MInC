autowatch = 1;

var gNumVoices = 2;

var gBufSize = 5000;
var gBufFileName = "audsound.aif";
var gFadeDur = 500;

var gIPAddress = new Array;
var gPortNum_Client_UDP = 31337;
var gPortNum_Client_TCP = 41337;

function buffer_set()
{
	messnamed("fz_poly_in_1_msg","target",0);
    messnamed("fz_poly_in_2_msg","size",gBufSize);
    messnamed("fz_poly_in_2_msg","set","fz_buf");
}
function loadbang()
{
    reset();
}

function reset()
{
    messnamed("fz_poly_in_1_msg","voices",gNumVoices);

    for (i = 0; i < gNumVoices; i++)
    {
        messnamed("fz_poly_in_1_msg","target",i+1);
        messnamed("fz_poly_in_2_msg","buf","fz_buf_"+(i+1));
        
        /* IP address */
        gIPAddress[i] = undefined;

        /* pan */
        send_pan_x_msg(i+1,0.5);
        send_pan_y_msg(i+1,0.5);
    }

    messnamed("fz_poly_in_1_msg","target",0);
    messnamed("fz_poly_in_2_msg","size",gBufSize);
    messnamed("fz_poly_in_2_msg","fade",gFadeDur);
    messnamed("fz_poly_in_2_msg","read",gBufFileName);
}

var gDump = false;
function dump(enable)
{
	gDump = enable;
	post("gDump",gDump,"\n");
}

/*** FUNCTIONS FOR HANDING INCOMING OSC MESSAGES ***/

function find_ip_address_pos(ip_add)
{
    for (i = 0; i < gNumVoices; i++)
        if (gIPAddress[i] == ip_add)
            return i;
    return -1;
}

function osc_msg()
{
//    post(arguments[0],arguments[1],arguments[2],"\n");
    
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
        }
    }

    if (pos == -1) return;
    
    if (osc_add == "/accelx");
        //osc_msg_accelx(pos,val);

    else if (osc_add == "/accely");
       // osc_msg_accely(pos,val);

    else if (osc_add == "/state")
        osc_msg_transport_state(pos,val);

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

    else if (osc_add == "/start")
        osc_msg_start();

    else if (osc_add == "/sub")
        osc_msg_sub();

    else if (osc_add == "/stop")
        osc_msg_stop();

    else if (osc_add == "/panic")
        osc_msg_panic();

    else if (osc_add == "/download")
        osc_msg_download(pos);
}

function osc_msg_transport_state(pos,val)
{
    if (pos != -1)
    {
        switch (val)
        {
            case 0: // record
            	messnamed("fz_poly_in_1_msg","target",pos+1);
            	messnamed("fz_poly_in_2_msg","play",0);
				messnamed("fz_poly_in_2_msg","rec",1);
                break;
            case 1: // stop
                messnamed("fz_poly_in_1_msg","target",pos+1);
				messnamed("fz_poly_in_2_msg","rec",0);
                messnamed("fz_poly_in_2_msg","play",0);
                break;
            case 2: // play
                messnamed("fz_poly_in_1_msg","target",pos+1);
				messnamed("fz_poly_in_2_msg","rec",0);
                messnamed("fz_poly_in_2_msg","play",1);
                break;
        }
    }
}

function osc_msg_period(pos,val)
{
    if (pos != -1)
    {
        post("period not supported in this version\n");
    }
}

function osc_msg_delay(pos,val)
{
    if (pos != -1)
    {
        post("delay not supported in this version\n");
    }
}

function osc_msg_vol_s(pos,val)
{
    if (pos != -1)
    {
        // post("vol received value:",val,"\n");
        var vol = (val / 1000.) * 1.0;
		send_vol_msg(pos+1,vol);
    }
}

function osc_msg_vol_c(pos,val)
{
    if (pos != -1)
    {
        post("client volume not supported in this version\n");
    }
}

function osc_msg_pan(pos,val)
{
    if (pos != -1)
    {
        var pan = (val / 1000.) * 1.0;
		// post("pan received value:",pan,"\n");
		send_pan_x_msg(pos+1,pan);
    }
}

function osc_msg_hint(pos)
{
    if (pos != -1)
    {
        post("hint not supported in this version\n");
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

function osc_msg_start()
{
    messnamed("fz_msg","start");
}

function osc_msg_sub()
{
    messnamed("fz_msg","sub");
}

function osc_msg_stop()
{
    messnamed("fz_msg","stop");
}

function osc_msg_panic()
{
    messnamed("fz_msg","panic");
}

function osc_msg_download(pos)
{
    if (pos != -1)
    {
        var file_name = "fz_buf_"+(pos+1);
        var tcp_port_num = 41337;
        
        messnamed("fz_poly_in_1_msg","target",pos+1);
        messnamed("fz_poly_in_2_msg","write","samptype","int16");
        messnamed("fz_poly_in_2_msg","write","writeraw",file_name);
                
                // post("raw audio file created for pos:",pos,"\n");

        f = new File("fz_download.txt","write", "TEXT");
		f.open();
        		// post("fz_download.txt created for pos:",pos,"\n");
        f.writeline(gIPAddress[pos]+", "+tcp_port_num+", ../ForZero_MaxMSP/"+file_name);
        		post("script file written for pos:",pos,"\n");
        f.close();
        	 	// post("txt file closed for pos:",pos,"\n");
    }		
}

/*** MISCELLANEOUS FUNCTIONS ***/

function exit_tcp_script()
{
    f = new File("fz_download.txt","w");
    f.writeline("exit");
    f.close();
}


/*** FUNCTIONS FOR HANDING OUTGOING OSC MESSAGES ***/
function rec_prog(target_pos,v)
{
	var pos = target_pos - 1;
	if (gIPAddress[pos] == undefined)
	{
		if (gDump)
			// post("rec_prog",target_pos,v,"\n");
	}
	else
	{
		if (gDump)
			// post("rec_prog",target_pos,v,"\n");
		send_rec_prog_msg(pos,v);
	}
}

/*** FUNCTIONS FOR OUTPUTTING OSC MESSAGES TO DEVICES***/
function send_rec_prog_msg(pos,v)
{
    messnamed("fz_osc_out_msg","host",gIPAddress[pos]);
    messnamed("fz_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("fz_osc_out_msg","/fz/rec_prog",parseInt(v * 1000.));
}

function send_interstitial_msg(pos,dur,msg)
{
    messnamed("fz_osc_out_msg","host",gIPAddress[pos]);
    messnamed("fz_osc_out_msg","port",gPortNum_Client_UDP);
    //messnamed("fz_osc_out_msg","/fz/interstitial",dur,msg);
	messnamed("fz_osc_out_msg","/fz/interstitial",msg);
}

function send_audio_end_msg(pos)
{
    messnamed("fz_osc_out_msg","host",gIPAddress[pos]);
    messnamed("fz_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("fz_osc_out_msg","/fz/audio_end");
}

function send_cue_msg(pos,v)
{
    messnamed("fz_osc_out_msg","host",gIPAddress[pos]);
    messnamed("fz_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("fz_osc_out_msg","/fz/cue",parseInt(v));
}

function send_client_play(pos)
{
    messnamed("fz_osc_out_msg","host",gIPAddress[pos]);
    messnamed("fz_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("fz_osc_out_msg","/fz/play");
}

function send_client_stop(pos)
{
    messnamed("fz_osc_out_msg","host",gIPAddress[pos]);
    messnamed("fz_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("fz_osc_out_msg","/fz/stop");
}

/*** FUNCTIONS FOR SENDING MESSAGES INTERNALY WITHIN MAXMSP PATCHES ***/

function send_vol_msg(target_pos,val)
{
    messnamed("fz_poly_in_1_msg","target",target_pos);
    messnamed("fz_poly_in_2_msg","vol",val,50);
}

function send_pan_x_msg(target_pos,val)
{
    messnamed("fz_poly_in_1_msg","target",target_pos);
    messnamed("fz_poly_in_2_msg","pan_x",val);
}

function send_pan_y_msg(target_pos,val)
{
    messnamed("fz_poly_in_1_msg","target",target_pos);
    messnamed("fz_poly_in_2_msg","pan_y",val);
}

function send_play_msg(target_pos,play)
{
    messnamed("fz_poly_in_1_msg","target",target_pos);
    messnamed("fz_poly_in_2_msg","play",play);
}

function send_rec_msg(target_pos,rec)
{
    messnamed("fz_poly_in_1_msg","target",target_pos);
    messnamed("fz_poly_in_2_msg","rec",rec);
}

function send_env_delay_msg(target_pos,delay)
{
    messnamed("fz_poly_in_1_msg","target",target_pos);
    messnamed("fz_poly_in_2_msg","env_delay",delay);
}

function send_delay_level_msg(target_pos,level)
{
    messnamed("fz_poly_in_1_msg","target",target_pos);
    messnamed("fz_poly_in_2_msg","delay_level",level,3000);
}
