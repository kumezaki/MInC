autowatch = 1;

var gNumVoices = 21;

function Host()
{
	this.host_name = undefined;
	
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
}

function bang()
{
	player_list_update();
	for (dev_pos = 0; dev_pos < gNumVoices; dev_pos++)
		post("Host",dev_pos,gHost[dev_pos].host_name,"\n");
}

function host(host_name,dev_pos)
{
	dev_pos = parseInt(dev_pos);

	post("ADDING HOST",dev_pos,host_name,"\n");
	
	if (gHost[dev_pos] != undefined) delete gHost[dev_pos];
	
	gHost[dev_pos] = new Host;
	gHost[dev_pos].host_name = host_name;
}

function reset_host(dev_pos)
{
	dev_pos = parseInt(dev_pos);

	post("RESETTING HOST",dev_pos,gHost[dev_pos].host_name,"\n");
	
	if (gHost[dev_pos] == undefined) return;

	delete gHost[dev_pos];
	gHost[dev_pos] = new Host;
}

function port(num)
{
}

function mod_msg(dev_pos,mod_num)
{
	post("mod_msg\n");

	dev_pos = parseInt(dev_pos);

	outlet(0,"host",gHost[dev_pos].host_name);
	outlet(0,"port",31337);
	outlet(0,"/MInC/mod",parseInt(mod_num));
}

function interstitial_msg(dev_pos,message)
{
	dev_pos = parseInt(dev_pos);

	outlet(0,"host",gHost[dev_pos].host_name);
	outlet(0,"port",31337);
	outlet(0,"/MInC/interstitial",message);
}

function alert_msg(dev_pos,title,message)
{
	dev_pos = parseInt(dev_pos);

	outlet(0,"host",gHost[dev_pos].host_name);
	outlet(0,"port",31337);
	outlet(0,"/MInC/alert",title,message);
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
