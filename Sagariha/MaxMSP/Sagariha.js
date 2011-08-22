autowatch = 1;

var gNumVoices = 1;

var gBufSize = 5000;
var gBufFileName = "buf_audio.aif";

function Audio()
{
    this.file = undefined;
    this.buf = new Array;
    this.buf_index = 0;
}
var gAudio = new Array;
var gTransmitAudioBufSize = 64;

var gIPAddress = new Array;
var gPortNum_Client_UDP = 31337;
var gPortNum_Client_TCP = 41337;

function loadbang()
{
    reset();
}

function reset()
{
    messnamed("saga_poly_in_1_msg","voices",gNumVoices);

    for (i = 0; i < gNumVoices; i++)
    {
        messnamed("saga_poly_in_1_msg","target",i+1);
        messnamed("saga_poly_in_2_msg","buf","saga_buf_"+(i+1));
    
        /* audio index */
        gAudio[i] = new Audio();
        
        /* IP address */
        gIPAddress[i] = undefined;

        /* pan */
        send_pan_x_msg(i+1,0.5);
        send_pan_y_msg(i+1,0.5);
    }

    messnamed("saga_poly_in_1_msg","target",0);
    messnamed("saga_poly_in_2_msg","size",gBufSize);
    messnamed("saga_poly_in_2_msg","read",gBufFileName);
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
        switch (val)
        {
            case 0:
                messnamed("saga_poly_in_1_msg","target",pos+1);
                messnamed("saga_poly_in_2_msg","play",0);
                break;
            case 1:
                messnamed("saga_poly_in_1_msg","target",pos+1);
                messnamed("saga_poly_in_2_msg","play",1);
                break;
            case 2:
                post("server record not supported in this version\n");
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
        post("server volume not supported in this version\n");
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
        post("pan not supported in this version\n");
    }
}

function osc_msg_hint(pos)
{
    if (pos != -1)
    {
        post("hint not supported in this version\n");
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

        gAudio[pos].buf_index = val;
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


/*** FUNCTIONS FOR HANDING OUTGOING OSC MESSAGES ***/

function send_rec_prog_msg(pos,v)
{
    messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
    messnamed("saga_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("saga_osc_out_msg","/saga/rec_prog",parseInt(v * 1000.));
}

function send_interstitial_msg(pos,dur,msg)
{
    messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
    messnamed("saga_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("saga_osc_out_msg","/saga/interstitial",dur,msg);
}

function send_audio_msg(pos,index,size,v)
{
    messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
    messnamed("saga_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("saga_osc_out_msg","/saga/audio",index,size,v);
//    post("audio_sample_value:",v,"\n");
}

function send_audio_end_msg(pos)
{
    messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
    messnamed("saga_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("saga_osc_out_msg","/saga/audio_end");
}

function send_cue_msg(pos,v)
{
    messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
    messnamed("saga_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("saga_osc_out_msg","/saga/cue",parseInt(v));
}

function send_client_play(pos)
{
    messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
    messnamed("saga_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("saga_osc_out_msg","/saga/play");
}

function send_client_stop(pos)
{
    messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
    messnamed("saga_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("saga_osc_out_msg","/saga/stop");
}

function send_client_loop(pos,start,stop)
{
    messnamed("saga_osc_out_msg","host",gIPAddress[pos]);
    messnamed("saga_osc_out_msg","port",gPortNum_Client_UDP);
    messnamed("saga_osc_out_msg","/saga/loop",parseInt(start),parseInt(stop));
}


/*** FUNCTION FOR TRANSMITTING AUDIO ***/

function audio_func(pos,val)
{
    if (gAudio[pos].file == undefined)
    {
        gAudio[pos].file = new File("saga_buf_"+(pos+1));
        //gAudio[pos].file = new File("audsound.mp3");
        gAudio[pos].file.byteorder = "big";
    }
    
//    post("gAudio[",+pos,"].file.filename =",gAudio[pos].file.filename,"\n");
    
    gAudio[pos].file.position = gAudio[pos].buf_index * 4 * 2;
    
//    post("gAudio[pos].buf_index:",gAudio[pos].buf_index,"\n");
//    post("gAudio[pos].file.position:",gAudio[pos].file.position,"\n");
    
    buf = gAudio[pos].file.readfloat32(gTransmitAudioBufSize*2);
    
    for (i = 0; i < gTransmitAudioBufSize*2; i+= 2)
        gAudio[pos].buf[i>>1] = buf[i];

    if (gAudio[pos].file.position == gAudio[pos].file.eof)
    {
        post("reached audio file eof\n");
        gAudio[pos].file.close();
        gAudio[pos].file = undefined;
        send_audio_end_msg(pos);
    }
    else
    {
//        post(gAudio[pos].buf_index,gAudio[pos].buf,"\n");
        send_audio_msg(pos,gAudio[pos].buf_index,gTransmitAudioBufSize,gAudio[pos].buf);
    }
}

/*** FUNCTIONS FOR SENDING MESSAGES INTERNALY WITHIN MAXMSP PATCHES ***/

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
