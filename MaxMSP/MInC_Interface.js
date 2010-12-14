autowatch = 1;

var gInterfaceFileName = "MInC_Interface.txt";

var gNumVoices = 21;

var gMrmrIBMsgArray = new Array;

function Host()
{
	this.host_name = undefined;
	
	this.interf_pos = -1;
	this.interf_task = undefined;
	this.interf_task_count = 0;

	this.act_pac = 0;

	this.obj_r = undefined;
	this.obj_mxj = undefined;
	this.obj_p = undefined;
	this.obj_s = undefined;
}

var gHost = [];

function loadbang()
{
	for (dev_pos = 0; dev_pos < gNumVoices; dev_pos++)
		gHost[dev_pos] = new Host;

	read_interface();
}

function bang()
{
	player_list_update();
//	for (dev_pos = 0; dev_pos < gNumVoices; dev_pos++)
//		post("Host",dev_pos,gHost[dev_pos].host_name,"\n");
}

function read_interface()
{
    var f = new File(gInterfaceFileName,"read");

	if (f != undefined)
	{
		delete gMrmrIBMsgArray;
		gMrmrIBMsgArray = new Array;
		while (f.position != f.eof)
		{
			gMrmrIBMsgArray.push(f.readline(1024));
//			post(gMrmrIBMsgArray[gMrmrIBMsgArray.length-1],"\n");
		}
		
		f.close();
	}
}

function host(host_name,dev_pos)
{
	dev_pos = parseInt(dev_pos);

	post("ADDING HOST",dev_pos,host_name,"\n");
	
	if (gHost[dev_pos] != undefined) delete gHost[dev_pos];
	
	gHost[dev_pos] = new Host;
	gHost[dev_pos].host_name = host_name;

	create_tcp_sender(dev_pos);

	messnamed("net_tcp_send_msg_"+dev_pos,"address",gHost[dev_pos].host_name);
	messnamed("osc_msg","loading_start",dev_pos);
	gHost[dev_pos].interf_task = new Task(interface_func,this,dev_pos);
	gHost[dev_pos].interf_task.schedule(0);
}

function reset_host(dev_pos)
{
	dev_pos = parseInt(dev_pos);

	post("RESETTING HOST",dev_pos,gHost[dev_pos].host_name,"\n");
	
	if (gHost[dev_pos] == undefined) return;

	if (gHost[dev_pos].interf_task != undefined) { gHost[dev_pos].interf_task.cancel(); delete gHost[dev_pos].interf_task; }

	delete_tcp_sender(dev_pos);

	delete gHost[dev_pos];
	gHost[dev_pos] = new Host;
}

function port(num)
{
}

function interface_func()
{
	dev_pos = arguments[0];
	
	if (gHost[dev_pos].act_pac > 0)
	{
		act_pac_check(dev_pos);
		return;
	}
	else
		gHost[dev_pos].interf_task_count = 0;

	if (gHost[dev_pos].interf_pos == -1)
	{
		alert_msg(dev_pos,"Welcome to Mobile In C!","Loading interface. Please wait.");
		gHost[dev_pos].interf_pos = 0;
		gHost[dev_pos].interf_task.schedule(750);
		return;
	}
	else if (gHost[dev_pos].interf_pos == gMrmrIBMsgArray.length)
	{
		messnamed("osc_msg","loading_end",dev_pos);
		alert_msg(dev_pos,"Finished Loading!","Hit NEXT MODULE to start playing.");
		return;
	}

	messnamed("net_tcp_send_msg_"+dev_pos,gMrmrIBMsgArray[gHost[dev_pos].interf_pos]);
	gHost[dev_pos].interf_pos++;
	gHost[dev_pos].interf_task.schedule(750);
}

function act_pac(dev_pos,val)
{
	gHost[dev_pos].act_pac = val;
//	post("act_pac",dev_pos,gHost[dev_pos].act_pac,"\n");
}

function act_pac_check(dev_pos)
{
	gHost[dev_pos].interf_task_count++;
	if (gHost[dev_pos].interf_task_count > 10)
	{
		gHost[dev_pos].interf_task_count = 0;
		alert_msg(dev_pos,"Failed to load interface.", "Quit and relaunch Mrmr app.");
	}
	else
		gHost[dev_pos].interf_task.schedule(500);
}

function interstitial_msg(dev_pos,message,duration)
{
	if ((duration == 0) || (duration == undefined)) duration = 2000;
	messnamed("net_tcp_send_msg_"+dev_pos,"/mrmrIB mrmr_showInterstitial:"+message+"||"+duration);
}

function alert_msg(dev_pos,title,message)
{
	messnamed("net_tcp_send_msg_"+dev_pos,"/mrmrIB mrmr_alert title||"+title+"|| body||"+message+"||");
}

function create_tcp_sender(dev_pos)
{
	var p = this.patcher;
	var h = -200;
	var v = 20 + dev_pos * 100;
	
	gHost[dev_pos].obj_r = p.newdefault(h, v + 0, "r", "net_tcp_send_msg_"+dev_pos);
	gHost[dev_pos].obj_mxj = p.newdefault(h, v + 25, "mxj", "net.tcp.send", "@port", 31337);
	gHost[dev_pos].obj_p = p.newdefault(h, v + 50, "prepend", "act_pac", dev_pos);
	gHost[dev_pos].obj_s = p.newdefault(h, v + 75, "s", "interface_msg");
	p.connect(gHost[dev_pos].obj_r,0,gHost[dev_pos].obj_mxj,0);
	p.connect(gHost[dev_pos].obj_mxj,2,gHost[dev_pos].obj_p,0);
	p.connect(gHost[dev_pos].obj_p,0,gHost[dev_pos].obj_s,0);
}

function delete_tcp_sender(dev_pos)
{
	var p = this.patcher;
	p.remove(gHost[dev_pos].obj_r); gHost[dev_pos].obj_r = undefined;
	p.remove(gHost[dev_pos].obj_mxj); gHost[dev_pos].obj_mxj = undefined;
	p.remove(gHost[dev_pos].obj_p); gHost[dev_pos].obj_p = undefined;
	p.remove(gHost[dev_pos].obj_s); gHost[dev_pos].obj_s = undefined;
}

function player_list_update()
{
    messnamed("InC_lcd_msg","font","Arial",14);
    messnamed("InC_lcd_msg","moveto",225,50);
    messnamed("InC_lcd_msg","write","host address");

    var y = 80;

    for (i = 0; i < gNumVoices; i++)
    {
        
        messnamed("InC_lcd_msg","font","Arial",16);
        messnamed("InC_lcd_msg","moveto",225,y);
        messnamed("InC_lcd_msg","write",gHost[i].host_name);
        y += 25;
    }
}