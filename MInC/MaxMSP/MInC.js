autowatch = 1;

/*----------------------------------------------------------------------------*/

var gPlayers = new Global("minc_pm");

/*----------------------------------------------------------------------------*/

function Device()
{
    this.mod = 0;
    this.speed = 1.0;
    this.speed_mod = 0;
    this.oct = 0;
    this.release = 100;
    this.adsr = [10.,1.,0.,100.];	/* for now, decay is a percentage */
    this.filter_freq_pos = 1000;	/* the slider position from 0 to 1000 */
    this.filter_freq_delta = 0;
    this.rhythm_aug = 0;
    this.hint_pos = 0;
    this.prefix = "A";
}

/*----------------------------------------------------------------------------*/

var gDeviceArray = [];
var gDeviceNameArray = [];

/*----------------------------------------------------------------------------*/

var gMaxNumModules = 53;	/* this needs to change depending on the piece */

/*----------------------------------------------------------------------------*/
/* initialization */

function loadbang()
{
    init_msg_id_array();
    
    for (i = 0; i < gPlayers.max_num; i++)
    {
        gDeviceArray[i] = new Device();
        gDeviceNameArray[i] = undefined;
    }
    
    read_hints();
    
	/* set the numbers of poly~ voices */
    messnamed("InC_in1_msg","voices",gPlayers.max_num);
}

/*----------------------------------------------------------------------------*/
/* player joining/leaving */

function join()
{
	update_dev(arguments[0],arguments[1]);
}

function leave()
{
	update_dev(arguments[0],"");
}

function wait_join() {}
function wait_leave() {}


/*----------------------------------------------------------------------------*/
/* osc message parsing */

var gMsgIDArray = [];

function osc()
{
//	post(arguments[0],arguments[1],arguments[2],"\n");
    
    var osc_add = arguments[0];
    var ip_add = arguments[1];
    var val = arguments[2];
    
    if (osc_add.search("/minc/") != 0)
    	return;
    	
	osc_add = osc_add.slice(5);

    pos = gPlayers.ip_address.indexOf(ip_add);
    
    if (pos != -1)
    {
    	do_msg(osc_add,pos,val);
    }
}

function do_msg(osc_add,pos,val)
{
//	post(osc_add,pos,val,"\n");

    var dev_pos = pos;
    var dev_name = gPlayers.ip_address[pos];
    
    var dev = gDeviceArray[dev_pos];

    var a = osc_add.split("/");
//	post(a,"\n");

    switch (gMsgIDArray[a[1]])
    {
        case gMsgIDArray["hb"]:
        {
            post("heartbeat",dev_name,"\n");
            break;
        }

        case gMsgIDArray["mod"]:
        {
            set_module(dev_pos);
            var mod = gDeviceArray[dev_pos].mod;
            send_osc_mod_msg(dev_pos,mod);
            break;
        }

        case gMsgIDArray["speak"]: send_dac_msg(dev_pos,val+1); break;

        case gMsgIDArray["instr"]:
        {
            switch (val)
            {
                case 0: set_inst_high(dev_pos); break;
                case 1: set_inst_mid(dev_pos); break;
                case 2: set_inst_low(dev_pos); break;
                case 3: set_inst_sub(dev_pos); break;
                default:
                    post("instrument type not found\n");
                    break;
            }
            break;
        }

        case gMsgIDArray["8vb"]: send_oct_msg(dev_pos,val,dev.oct,-1); break;
        case gMsgIDArray["8va"]: send_oct_msg(dev_pos,val,dev.oct,+1); break;

        case gMsgIDArray["2xslow"]: set_rhythm_aug(dev_pos,val==0?0:-1); break;
        case gMsgIDArray["2xfast"]: set_rhythm_aug(dev_pos,val==0?0:+1); break;

        case gMsgIDArray["dur"]: send_release_msg(dev_pos,val); break;

        case gMsgIDArray["filt"]: send_filter_cutoff_msg(dev_pos,val); break;
        case gMsgIDArray["wave"]: send_waveform_msg(dev_pos,val); break;
        case gMsgIDArray["vol"]: send_volume_msg(dev_pos,val); break;

        case gMsgIDArray["hint"]: hint(dev_pos); break;

        case gMsgIDArray["status"]: status(dev_pos); break;

        case gMsgIDArray["accX"]:
            {
                var speed_mod = val < 400 ? -1 : val > 600 ? +1 : 0;
                if (speed_mod != dev.speed_mod)
                {
                    dev.speed_mod = speed_mod;
//					send_speed_msg(dev_pos);
                }
                break;
            }
        case gMsgIDArray["accY"]:
			{
//				send_tuning_msg(dev_pos,val);
				break;
			}
        case gMsgIDArray["accZ"]:
			{
//				send_dropout_msg(dev_pos,val);
				break;
			}

        case gMsgIDArray["beat"]: send_sync_msg(dev_pos); break;

        default:
            post(a[1],"not supported\n");
            break;
    }
}

function init_msg_id_array()
{
    var i = 0;    
    gMsgIDArray["hb"] = i++;
    gMsgIDArray["mod"] = i++;
    gMsgIDArray["speak"] = i++;
    gMsgIDArray["instr"] = i++;
    gMsgIDArray["8va"] = i++;
    gMsgIDArray["8vb"] = i++;
    gMsgIDArray["2xslow"] = i++;
    gMsgIDArray["2xfast"] = i++;
    gMsgIDArray["dur"] = i++;
    gMsgIDArray["filt"] = i++;
    gMsgIDArray["wave"] = i++;
    gMsgIDArray["vol"] = i++;
    gMsgIDArray["hint"] = i++;
    gMsgIDArray["status"] = i++;
    gMsgIDArray["accX"] = i++;
    gMsgIDArray["accY"] = i++;
    gMsgIDArray["accZ"] = i++;
    gMsgIDArray["beat"] = i++;
}

/*----------------------------------------------------------------------------*/
/* functions to set prefix */

function set_prefix(dev_pos,p)
{
	if (gDeviceArray[dev_pos] != undefined)
	{
		post("setting device "+dev_pos+" prefix to "+p+"\n");
		gDeviceArray[dev_pos].prefix = p;
	}
}

/*----------------------------------------------------------------------------*/
/* functions to set module */

function set_module(dev_pos)
{
    var prev_all_at_last = get_all_at_last();

    var mod = ++gDeviceArray[dev_pos].mod;
    
    if (mod <= gMaxNumModules)
    {
        var prefix = gDeviceArray[dev_pos].prefix;
        var filename = prefix + mod + "_seq.txt";
        post("module",dev_pos,mod,filename,"\n");
    
        messnamed("InC_in1_msg","target",dev_pos+1);
        messnamed("InC_in2_msg","seq","read",filename);
        messnamed("InC_in2_msg","phasor","phase",0.);
        if (mod == 1)
            messnamed("InC_in2_msg","phasor","freq",0.6666666666666666);
        messnamed("InC_in2_msg","seq","play",1);
    }
    else
        gDeviceArray[dev_pos].mod = mod = gMaxNumModules;


    var avg_mod = get_avg_mod();
    var dif_mod = mod - avg_mod;
    
    var msg = mod_message(mod,avg_mod,dif_mod);

    var all = false;
    if (mod == gMaxNumModules)
    {
        var cur_all_at_last = get_all_at_last();
        if (cur_all_at_last)
            all = prev_all_at_last != cur_all_at_last;
    }
    
    if (all)
    {
        for (i = 0; i < gPlayers.max_num; i++)
            if (gDeviceArray[i].mod != 0)
                send_osc_interstitial_msg(i,msg);
    }
    else
        send_osc_interstitial_msg(dev_pos,msg);
    
    /*** ahead/behind message ***/
    if (dif_mod > 3)
        send_osc_alert_msg(dev_pos,"Ahead of group average.","Consider waiting.");
    else if (dif_mod < -3)
        send_osc_alert_msg(dev_pos,"Behind group avergae.","Consider next module.");
}

/*----------------------------------------------------------------------------*/
/* functions to set sequence speed */

function set_rhythm_aug(dev_pos,val)
{
    var dev = gDeviceArray[dev_pos];
    dev.rhythm_aug = val;
    send_speed_msg(dev_pos);
}

/*----------------------------------------------------------------------------*/
/* messages from seq/synth */

function seq_speed(dev_pos,s)
{
    if (gDeviceArray[dev_pos].speed != s)
    {
        gDeviceArray[dev_pos].speed = s;
        send_speed_msg(dev_pos);
    }
}

/*----------------------------------------------------------------------------*/
/* functions to set instrument parameters */

function set_inst(dev_pos,oct,max_amp,a,d,s,r,freq_delta,q)
{
    var dev = gDeviceArray[dev_pos];

    dev.oct = oct;
    send_oct_msg(dev_pos,0,dev.oct,0);
    
    send_max_amp_msg(dev_pos,max_amp);

    dev.adsr[0] = a;
    dev.adsr[1] = d;
    dev.adsr[2] = s;
    dev.adsr[3] = r;
    send_release_msg(dev_pos,dev.release);

    dev.filter_freq_delta = freq_delta;
    send_filter_cutoff_msg(dev_pos,dev.filter_freq_pos);
    send_filter_q_msg(dev_pos,q);
    
//    post("max_amp",max_amp,"adsr",a,d,s,r,"filt",freq_delta,q,"\n");
}

function set_inst_high(dev_pos)
{
    set_inst(dev_pos,+1,0.8,30,1.0,0.0,0,-1000.,1.);
}

function set_inst_mid(dev_pos)
{
    set_inst(dev_pos,0,1.0,10,0.9,0.0,0,0.,2.);;
}

function set_inst_low(dev_pos)
{
    set_inst(dev_pos,-1,1.0,40,0.8,0.,0,1000.,4.);
}

function set_inst_sub(dev_pos)
{
    set_inst(dev_pos,-2,0.8,2,0.5,0.0,0,500.,15.);
}

/*----------------------------------------------------------------------------*/
/* messages to seq/synth - general */

var gSpeedAdjust = 1.02;

function send_speed_msg(dev_pos)
{
    var dev = gDeviceArray[dev_pos];
    var s = dev.speed;
    
    s *= dev.rhythm_aug == -1 ? 0.5 : dev.rhythm_aug == 1 ? 2.0 : 1.0;

    s *= dev.speed_mod == 1 ? (1./gSpeedAdjust) : dev.speed_mod == -1 ? gSpeedAdjust : 1.0;

    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","phasor","freq",s);
}

function send_sync_msg(dev_pos)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","phasor","phase",0.);
}

function send_dac_msg(dev_pos,speaker_num)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","dac","set","dac"+speaker_num);
}

function send_dropout_msg(dev_pos,val)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","dropout",val < 600 ? 1. : 0., 250);
}

/*----------------------------------------------------------------------------*/
/* messages to seq/synth - synth-specific */

var gMaxVolume = 0.5;
var gMaxCents = 50.; 

function send_oct_msg(dev_pos,val,base,direction)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","oct",base+(val==0?0:direction));
}

function send_max_amp_msg(dev_pos,val)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","max_amp",val);
}

function send_release_msg(dev_pos,val)
{
    var dev = gDeviceArray[dev_pos];

    dev.release = val;

    var sus = val > 900;

    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","adsr", dev.adsr[0],
                                    dev.adsr[1] * dev.release,
                                    sus ? 1. : dev.adsr[2],
                                    dev.adsr[3]);
}

function send_filter_cutoff_msg(dev_pos,val)
{
    var dev = gDeviceArray[dev_pos];

    var f = Math.pow(val/1000.,2.0)*20000.-dev.filter_freq_delta;
    f = f < 200.? 200. : f;
    
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","filter","freq",f);

    dev.filter_freq_pos = val;
}

function send_filter_q_msg(dev_pos,q)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","filter","q",q);
}

function send_volume_msg(dev_pos,val)
{
    if (val < 100) return;
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","volume",(val/1000.)*gMaxVolume);
}

function send_waveform_msg(dev_pos,val)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","saw",Math.cos((val/1000.) * (3.1415926/2)));
    messnamed("InC_in2_msg","rect",Math.sin((val/1000.) * (3.1415926/2)));
}

function send_tuning_msg(dev_pos,val)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","tuning",(val/1000.-0.25)*gMaxCents/100.);
}

/*----------------------------------------------------------------------------*/
/* messages to device */

gPortNum = 31337;

function send_osc_mod_msg(dev_pos,mod_num)
{
	outlet(0,"host",gPlayers.ip_address[dev_pos]);
	outlet(0,"port",gPortNum);
	outlet(0,"/minc/mod",mod_num);
}

function send_osc_interstitial_msg(dev_pos,message)
{
	outlet(0,"host",gPlayers.ip_address[dev_pos]);
	outlet(0,"port",gPortNum);
	outlet(0,"/minc/interstitial",message);
}

function send_osc_alert_msg(dev_pos,title,message)
{
	outlet(0,"host",gPlayers.ip_address[dev_pos]);
	outlet(0,"port",gPortNum);
	outlet(0,"/minc/alert",title,message);
}

/*----------------------------------------------------------------------------*/
/* status */

function mod_message(mod,avg_mod,dif_mod)
{
    var msg = "";

    if (mod == gMaxNumModules)
    {
        /*** at last module ***/
        if (get_all_at_last())
            msg += "You and everyone else are at the last module. As a group, crescendo and decrescendo a few times. Then, exit by quitting app.";
        else
            msg += "You are at the last module. Wait for all others to catch up.";
    }
    else
    {
        /*** at module message ***/
        msg += "You are at module "
                    + mod
                    + " of 53.";
        if (dif_mod == 0)
            msg += " At the average."
        else
            msg += " "    
                + (dif_mod > 0 ? "+" : "")
                + dif_mod
                + " from average of "
                + avg_mod
                + ".";
    }
    
    switch (mod)
    {
        case 6: msg += "This module has long notes. Try long note durations."; break;
        case 7: msg += "This module has short notes but long rests."; break;
        case 8: msg += "This module has long notes. Try long note durations."; break;
        case 9: msg += "This module has short notes but long rests."; break;
        case 14: msg += "This module has long notes. Try long note durations."; break;
        case 15: msg += "This module is one very short note."; break;
        case 19: msg += "This module has one note."; break;
        case 21: msg += "This module has one long note. Try long note duration."; break;
        case 22: msg += "This module begins a series of steady notes. Try to sync up with others in the group!"; break;
        case 30: msg += "This module has one long note. Try long note duration."; break;
        case 35: msg += "This module is long and has notes of many kinds."; break;
        case 42: msg += "This module has four long notes. It works well as a bass line."; break;
    }
    
    return msg;
}

function status(dev_pos)
{
    var mod = gDeviceArray[dev_pos].mod;
    var avg_mod = get_avg_mod();
    var dif_mod = mod - avg_mod;

    send_osc_interstitial_msg(dev_pos,mod_message(mod,avg_mod,dif_mod),2000);
}

/*----------------------------------------------------------------------------*/
/* hints */

var gHintsFileName = "MInC_Hints.txt";
var gHintsArray = new Array;

function read_hints()
{
    var filename;
    if (arguments.length == 0)
        filename = gHintsFileName;

    post("reading",filename);
    var f = new File(filename,"read");

    if (f != undefined)
    {
        delete gHintsArray;
        gHintsArray = new Array;
        while (f.position != f.eof)
        {
            gHintsArray.push(f.readline(1024));
            post(gHintsArray[gHintsArray.length-1],"\n");
        }
        
        f.close();
    }
}

function hint(dev_pos)
{
    var hint_pos = gDeviceArray[dev_pos].hint_pos++;
//	post(gHintsArray[hint_pos],"\n");
    send_osc_interstitial_msg(dev_pos,gHintsArray[hint_pos],5000);
    gDeviceArray[dev_pos].hint_pos %= gHintsArray.length;
}

/*----------------------------------------------------------------------------*/
/* player update */

function update_dev(dev_pos,dev_name)
{
    if (dev_name == "") dev_name = undefined;
    
    dev_pos = parseInt(dev_pos);
    
    if (dev_name != gDeviceNameArray[dev_pos])
    {
        gDeviceNameArray[dev_pos] = dev_name;
        
        if (dev_name == undefined)
        {
            post("stopping poly target",dev_pos+1,"\n");
            messnamed("InC_in1_msg","target",dev_pos+1);
            messnamed("InC_in2_msg","seq","play",0);
            messnamed("InC_in2_msg","adsr",0.);
            delete gDeviceArray[dev_pos];
            gDeviceArray[dev_pos] = new Device();
        }
        else
        {
            gDeviceArray[dev_pos].mod = get_avg_mod();
            set_inst_mid(dev_pos);
            send_volume_msg(dev_pos,500);
        }
    }
}

/*----------------------------------------------------------------------------*/
/* player statistics */

function get_avg_mod()
{
    var total = 0;
    var count = 0;
    for (i = 0; i < gPlayers.max_num; i++)
    {
        if (gDeviceArray[i].mod != 0)
        {
            total += gDeviceArray[i].mod;
            count++;
        }
    }
    if (count > 0)
        return parseInt(total/count+0.5);
    return 0;
}

function get_all_off()
{
    for (i = 0; i < gPlayers.max_num; i++)
        if (gDeviceArray[i].mod > 0)
            return false;
    return true;
}

function get_all_at_last()
{
    var total = 0;
    for (i = 0; i < gPlayers.max_num; i++)
    {
        total += gDeviceArray[i].mod;
        if ((gDeviceArray[i].mod > 0) && (gDeviceArray[i].mod < gMaxNumModules))
            return false;
    }
    return total != 0;
}

/*----------------------------------------------------------------------------*/
/* player display -- these can probably move out of this code module */

function bang()
{
	player_list_update_post();
    player_list_update_lcd();
}

function player_list_update_post()
{
	for (dev_pos = 0; dev_pos < gPlayers.max_num; dev_pos++)
		post("Device",dev_pos,gDeviceNameArray[dev_pos],gDeviceArray[dev_pos].mod,"\n");
}

function player_list_update_lcd()
{
    messnamed("InC_lcd_msg","font","Arial",24);
    messnamed("InC_lcd_msg","border",0);
    messnamed("InC_lcd_msg","clear");
    
    messnamed("InC_lcd_msg","moveto",60,20);
    messnamed("InC_lcd_msg","write","Performers","\n");
    
    messnamed("InC_lcd_msg","font","Arial",14);
    messnamed("InC_lcd_msg","moveto",30,50);
    messnamed("InC_lcd_msg","write","player");
    messnamed("InC_lcd_msg","moveto",120,50);
    messnamed("InC_lcd_msg","write","module");
    messnamed("InC_lcd_msg","moveto",180,50);
    messnamed("InC_lcd_msg","write","poly~");

    var y = 80;

    for (i = 0; i < gPlayers.max_num; i++)
    {
        
        messnamed("InC_lcd_msg","font","Arial",20);
        messnamed("InC_lcd_msg","moveto",0,y);
        messnamed("InC_lcd_msg","write",gDeviceNameArray[i]);
        
        messnamed("InC_lcd_msg","font","Arial",18);
        messnamed("InC_lcd_msg","moveto",130,y);
        messnamed("InC_lcd_msg","write",gDeviceArray[i].mod);
        
        messnamed("InC_lcd_msg","font","Arial",16);
        messnamed("InC_lcd_msg","moveto",190,y);
        messnamed("InC_lcd_msg","write",i+1);
        y += 25;
    }
}
