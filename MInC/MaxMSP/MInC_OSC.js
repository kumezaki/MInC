autowatch = 1;

var gIDMapFileName = "MInC_ID_Map.txt";

var gHintsFileName = "MInC_Hints.txt";
var gHintsArray = new Array;

var gNumVoices = 21;

var gMaxNumModules = 53;

var gMaxVolume = 0.5;
var gMaxCents = 50.; 

var gSpeedAdjust = 1.02;

var gLastNotFound = "";

function Device()
{
    this.mod = 0;
    this.speed = 1.0;
    this.speed_mod = 0;
    this.oct = 0;
    this.release = 100;
    this.adsr = [10.,1.,0.,100.];        /* for now, decay is a percentage */
    this.filter_freq_pos = 1000;        /* the slider position from 0 to 1000 */
    this.filter_freq_delta = 0;
    this.rhythm_aug = 0;
    this.hint_pos = 0;
    this.present = false;
    this.loading = false;
}

var gDeviceArray = [];
var gDeviceNameArray = [];

var gWidgetIDArray = [];

var gAutoSenseTask = new Task(autosense_func);
var gAutoSenseTaskPeriod = 3000;

var gHeartBeatTask = new Task(heartbeat_func);
var gHeartBeatTaskPeriod = 1000;

var gMsgIDArray = [];

function autosense_func()
{
    var delete_array = [];

    for (i = 0; i < gNumVoices; i++)
    {
        if (gDeviceArray[i].loading)
        {
//            post("loading",i,"\n");
        }
        else if (gDeviceNameArray[i] != undefined)
        {
//            post("present",i,gDeviceArray[i].present?"true":"false","\n");
            if (gDeviceArray[i].present == false)
                delete_array.push(i);
            gDeviceArray[i].present = false;
        }
    }

    while (delete_array.length > 0)
        update_dev(delete_array.pop(),"");
    
    gAutoSenseTask.schedule(gAutoSenseTaskPeriod);
}

function heartbeat_func()
{
    messnamed("heartbeat_msg","bang");

    gHeartBeatTask.schedule(gHeartBeatTaskPeriod);
}

function loading_start(dev_pos)
{
    gDeviceArray[dev_pos].loading = true;
}

function loading_end(dev_pos)
{
    gDeviceArray[dev_pos].loading = false;
    gDeviceArray[dev_pos].present = true;
}

function autosense(enable)
{
    if (enable)
        gAutoSenseTask.schedule(2000);
    else
        gAutoSenseTask.cancel();
}

function heartbeat(enable)
{
    if (enable)
        gHeartBeatTask.schedule(0);
    else
        gHeartBeatTask.cancel();
}

function loadbang()
{
    read_mapping();
    read_hints();
    
    for (i = 0; i < gNumVoices; i++)
    {
        gDeviceNameArray.push(undefined);
        gDeviceArray.push(new Device());
    }

    i = 0;    
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

    messnamed("InC_in1_msg","voices",gNumVoices);
    
    heartbeat(true);
}    

function bang()
{
    player_list_update();
//    for (dev_pos = 0; dev_pos < gNumVoices; dev_pos++)
//        post("Device",dev_pos,gDeviceNameArray[dev_pos],gDeviceArray[dev_pos].mod,"\n");
}

function read_mapping(filename)
{
     var filename;
   if (arguments.length == 0)
        filename = gIDMapFileName;

    post("reading",filename);
    var f = new File(filename,"read");

    while (f.position != f.eof)
    {
        var l = f.readline(1024);
        var s = [];
        s = l.split(" ");
        
        gWidgetIDArray[s[0]] = parseInt(s[1]);
        post(s[0],"mapped to ID",gWidgetIDArray[s[0]],"\n");
    }
    
    f.close();
}

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

function get_free_dev_pos()
{
    for (i = 0; i < gNumVoices; i++)
        if (gDeviceNameArray[i] == undefined) return i;

    return -1;
}

function osc_minc()
{
    var a = arguments[0].split("/");
    var val = arguments[arguments.length-1];

//    for (i = 0; i < arguments.length; i++) post(arguments[i],"\n");

    var dev_name = arguments[1];

    var dev_pos = gDeviceNameArray.indexOf(dev_name);
    
    if (dev_pos < 0)
    {
        dev_pos = get_free_dev_pos();
        if (dev_pos < 0)
        {
            post("no free dev_pos available\n");
            return;
        }
        update_dev(dev_pos,dev_name);
        messnamed("interface_msg","host",dev_name,dev_pos);
    }
    
    var dev = gDeviceArray[dev_pos];

    switch (gMsgIDArray[a[1]])
    {
        case gMsgIDArray["hb"]:
        {
            dev.present = true;
            post("heartbeat",dev_name,"\n");
            break;
        }

        case gMsgIDArray["mod"]:
        {
            set_module(dev_pos);
            var mod = gDeviceArray[dev_pos].mod;
            messnamed("interface_msg","mod_msg",dev_pos,mod);
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
                    send_speed_msg(dev_pos);
                }
                break;
            }

        case gMsgIDArray["accY"]: send_tuning_msg(dev_pos,val); break;
        case gMsgIDArray["accZ"]: send_dropout_msg(dev_pos,val); break;

        default:
            post(a[1],"not supported\n");
            break;
    }
}

function osc_mrmr()
{
    var a = arguments[0].split("/");
    var val = arguments[arguments.length-1];
    
    var dev_name_pos = 3;
    if (a[1] == "slider") dev_name_pos = 4;

    var dev_name = a[dev_name_pos];
    var dev_pos = gDeviceNameArray.indexOf(dev_name);
    
    if (dev_pos < 0) { if (dev_name != gLastNotFound) { post("could not find",dev_name,"in gDeviceNameArray\n"); gLastNotFound = dev_name; } return; }
    
    var dev = gDeviceArray[dev_pos];

    if (a[1] == "accelerometerX")
    {
        dev.present = true;
        switch (parseInt(a[2]))
        {
            case gWidgetIDArray["speed"]:
            {
                var speed_mod = val < 400 ? -1 : val > 600 ? +1 : 0;
                if (speed_mod != dev.speed_mod)
                {
                    dev.speed_mod = speed_mod;
                    send_speed_msg(dev_pos);
                }
                break;
            }
        }
    }

    else if (a[1] == "accelerometerY")
    {
        switch (parseInt(a[2]))
        {
            case gWidgetIDArray["tuning"]: send_tuning_msg(dev_pos,val); break;
        }
    }

    else if (a[1] == "accelerometerZ")
    {
        switch (parseInt(a[2]))
        {
            case gWidgetIDArray["dropout"]: send_dropout_msg(dev_pos,val); break;
        }
    }

    else if (a[1] == "pushbutton")
    {
        switch (parseInt(a[2]))
        {
            case gWidgetIDArray["module"]: if (val != 0) set_module(dev_pos); break;
            case gWidgetIDArray["spkr1"]: if (val != 0) send_dac_msg(dev_pos,1); break;
            case gWidgetIDArray["spkr2"]: if (val != 0) send_dac_msg(dev_pos,2); break;
            case gWidgetIDArray["spkr3"]: if (val != 0) send_dac_msg(dev_pos,3); break;
            case gWidgetIDArray["spkr4"]: if (val != 0) send_dac_msg(dev_pos,4); break;
            case gWidgetIDArray["inst_high"]: if (val != 0) set_inst_high(dev_pos); break;
            case gWidgetIDArray["inst_mid"]: if (val != 0) set_inst_mid(dev_pos); break;
            case gWidgetIDArray["inst_low"]: if (val != 0) set_inst_low(dev_pos); break;
            case gWidgetIDArray["inst_sub"]: if (val != 0) set_inst_sub(dev_pos); break;
            case gWidgetIDArray["octdown"]: send_oct_msg(dev_pos,val,dev.oct,-1); break;
            case gWidgetIDArray["octup"]: send_oct_msg(dev_pos,val,dev.oct,+1); break;
            case gWidgetIDArray["half_time"]: set_rhythm_aug(dev_pos,val==0?0:-1); break;
            case gWidgetIDArray["double_time"]: set_rhythm_aug(dev_pos,val==0?0:+1); break;
            case gWidgetIDArray["hint"]: if (val != 0) hint(dev_pos); break;
            case gWidgetIDArray["status"]: if (val != 0) status(dev_pos); break;
        }
    }

    else if (a[1] == "slider")
    {
        switch (parseInt(a[3]))
        {
            case gWidgetIDArray["release"]: send_release_msg(dev_pos,val); break;
        }
    }
    
    else if (a[1] == "tactile3DX")
    {
        switch (parseInt(a[2]))
        {
            case gWidgetIDArray["filter"]: send_filter_cutoff_msg(dev_pos,val); break;
        }
    }

    else if (a[1] == "tactile3DY")
    {
        switch (parseInt(a[2]))
        {
            case gWidgetIDArray["waveform"]: send_waveform_msg(dev_pos,val); break;
        }
    }

    else if (a[1] == "tactile3DZ")
    {
        switch (parseInt(a[2]))
        {
            case gWidgetIDArray["volume"]: send_volume_msg(dev_pos,val); break;
        }
    }
}

function update_dev(dev_pos,dev_name)
{
    if (dev_name == "") dev_name = undefined;
    
    dev_pos = parseInt(dev_pos);
    
    if (dev_name != gDeviceNameArray[dev_pos])
    {
        post("update_dev",dev_pos,dev_name,"\n");
    
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

function get_avg_mod()
{
    var total = 0;
    var count = 0;
    for (i = 0; i < gNumVoices; i++)
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
    for (i = 0; i < gNumVoices; i++)
        if (gDeviceArray[i].mod > 0)
            return false;
    return true;
}

function get_all_at_last()
{
    var total = 0;
    for (i = 0; i < gNumVoices; i++)
    {
        total += gDeviceArray[i].mod;
        if ((gDeviceArray[i].mod > 0) && (gDeviceArray[i].mod < gMaxNumModules))
            return false;
    }
    return total != 0;
}

function seq_speed(dev_pos,s)
{
    if (gDeviceArray[dev_pos].speed != s)
    {
        gDeviceArray[dev_pos].speed = s;
        send_speed_msg(dev_pos);
    }
}

function set_module(dev_pos)
{
    autosense(!get_all_off());
    
    var prev_all_at_last = get_all_at_last();

    var mod = ++gDeviceArray[dev_pos].mod;
    
    if (mod <= gMaxNumModules)
    {
        var prefix = "A";
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
    
    var msg = get_mod_message(mod,avg_mod,dif_mod);

    var all = false;
    if (mod == gMaxNumModules)
    {
        var cur_all_at_last = get_all_at_last();
        if (cur_all_at_last)
            all = prev_all_at_last != cur_all_at_last;
    }
    
    if (all)
    {
        for (i = 0; i < gNumVoices; i++)
            if (gDeviceArray[i].mod != 0)
                messnamed("interface_msg","interstitial_msg",i,msg);
    }
    else
        messnamed("interface_msg","interstitial_msg",dev_pos,msg);
    
    /*** ahead/behind message ***/
    if (dif_mod > 3)
        messnamed("interface_msg","alert_msg",dev_pos,"Ahead of group average.","Consider waiting.");
    else if (dif_mod < -3)
        messnamed("interface_msg","alert_msg",dev_pos,"Behind group avergae.","Consider next module.");
}

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

function set_rhythm_aug(dev_pos,val)
{
    var dev = gDeviceArray[dev_pos];
    dev.rhythm_aug = val;
    send_speed_msg(dev_pos);
}

function send_speed_msg(dev_pos)
{
    var dev = gDeviceArray[dev_pos];
    var s = dev.speed;
    
    s *= dev.rhythm_aug == -1 ? 0.5 : dev.rhythm_aug == 1 ? 2.0 : 1.0;

    s *= dev.speed_mod == 1 ? (1./gSpeedAdjust) : dev.speed_mod == -1 ? gSpeedAdjust : 1.0;

    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","phasor","freq",s);
}

function send_dac_msg(dev_pos,speaker_num)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","dac","set","dac"+speaker_num);
}

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
    messnamed("InC_in2_msg","adsr",    dev.adsr[0],
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

function send_dropout_msg(dev_pos,val)
{
    messnamed("InC_in1_msg","target",dev_pos+1);
    messnamed("InC_in2_msg","dropout",val < 600 ? 1. : 0., 250);
}

function hint(dev_pos)
{
    var hint_pos = gDeviceArray[dev_pos].hint_pos++;
//    post(gHintsArray[hint_pos],"\n");
    messnamed("interface_msg","interstitial_msg",dev_pos,gHintsArray[hint_pos],5000);
    gDeviceArray[dev_pos].hint_pos %= gHintsArray.length;
}

function status(dev_pos)
{
    var mod = gDeviceArray[dev_pos].mod;
    var avg_mod = get_avg_mod();
    var dif_mod = mod - avg_mod;

    messnamed("interface_msg","interstitial_msg",dev_pos,get_mod_message(mod,avg_mod,dif_mod),2000);
}

function get_mod_message(mod,avg_mod,dif_mod)
{
    var msg = "";

    if (mod == gMaxNumModules)
    {
        /*** at last module ***/
        if (get_all_at_last())
            msg    += "You and everyone else are at the last module. As a group, crescendo and decrescendo a few times. Then, exit by quitting app.";
        else
            msg    += "You are at the last module. Wait for all others to catch up.";
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
            msg    += " "    
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

function player_list_update()
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

    for (i = 0; i < gNumVoices; i++)
    {
        
        messnamed("InC_lcd_msg","font","Arial",20);
        messnamed("InC_lcd_msg","moveto",0,y);
        messnamed("InC_lcd_msg","write",gDeviceNameArray[i]);
        
        messnamed("InC_lcd_msg","font","Arial",18);
        messnamed("InC_lcd_msg","moveto",130,y);
        messnamed("InC_lcd_msg","write",gDeviceArray[i].loading?"L":gDeviceArray[i].mod);
        
        messnamed("InC_lcd_msg","font","Arial",16);
        messnamed("InC_lcd_msg","moveto",190,y);
        messnamed("InC_lcd_msg","write",i+1);
        y += 25;
    }
}
