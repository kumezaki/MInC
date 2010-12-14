autowatch = 1;

var gNumVoices = 21;
var gDeviceNameArray = new Array;

var gUpdateDeviceNameArray = new Array;

var gUpdateTask = new Task(update_func);
var gUpdateTaskDur = 250;

function loadbang()
{
	for (i = 0; i < gNumVoices; i++)
		gDeviceNameArray[i] = undefined;
}

function bang()
{
	player_list_update();
//	for (dev_pos = 0; dev_pos < gNumVoices; dev_pos++)
//		post("Device Name",dev_pos,gDeviceNameArray[dev_pos],"\n");
}

function purge(dev_pos)
{
	post("PURGING",dev_pos,"\n");
	gDeviceNameArray[dev_pos] = undefined;
	messnamed("interface_msg","reset_host",dev_pos);
	messnamed("osc_msg","update_dev",dev_pos,"");
}

function clear()
{
	gUpdateDeviceNameArray.length = 0;
	gUpdateTask.cancel();
	gUpdateTask.schedule(gUpdateTaskDur);
}

function append(name)
{
	gUpdateDeviceNameArray.push(name);
}

function update_func()
{
//	for (i = 0; i < gUpdateDeviceNameArray.length; i++)
//		post("update_func",gUpdateDeviceNameArray[i],"\n");

	delete_devices();

	add_devices();
}

function find_device(name,array)
{
	for (i in array)
		if (array[i] == name)
			return i;
	return -1;
}

function find_open_pos(array)
{
	for (i in array)
		if (array[i] == undefined)
			return i;
	return -1;
}

var not_found_array = new Array;
function get_not_found_array(array0,array1)
{
	not_found_array.length = 0;
	for (i in array0)
	{
		var dev_name = array0[i];
		if (dev_name != undefined)
			if (find_device(dev_name,array1) == -1)
				not_found_array.push(dev_name);
	}
	return not_found_array;
}

function update_devices()
{
	for (i = 0; i < gNumVoices; i++)
	{
		var dev_name = gDeviceNameArray[i];
		messnamed("osc_msg","update_dev",i,dev_name==undefined?"":dev_name);
	}
}

function send_interface(dev_name,dev_pos)
{
//	post("send_interface",dev_name,dev_pos,"\n");
	messnamed("zeroconf_resolve_msg","name",dev_name,parseInt(dev_pos));
}


/*** ADD ***/

var gAddTask = new Task(add_func);
var gAddArray = new Array;
function add_func()
{
	if (gAddArray.length > 0)
	{
		var status = 0;
	
		post("JOINING",gAddArray,gAddArray.length,"\n");
		dev_name = gAddArray.shift();
		pos = find_open_pos(gDeviceNameArray);
		if (pos != -1)
		{
			if (gDeviceNameArray.indexOf(dev_name) < 0)
			{
				gDeviceNameArray[pos] = dev_name;
				send_interface(dev_name,pos);
				messnamed("osc_msg","update_dev",pos,dev_name);
			}
			else
				status = 1;
		}
		else
			status = 2;

		switch (status)
		{
			case 1: post("could not add",dev_name,"name already exists\n"); break;
			case 2: post("could not add",dev_name,"maxed out voices\n"); break;
			default: break;
		}
	}

	if (gAddArray.length > 0)
		gAddTask.schedule(2000);
}

function add_devices()
{
	a = get_not_found_array(gUpdateDeviceNameArray,gDeviceNameArray);
	if (a.length > 0)
	{
		while (a.length > 0) gAddArray.push(a.shift());
		if (!gAddTask.running) gAddTask.execute();
	}
}


/*** DELETE ***/

var gDelTask = new Task(del_func);
var gDelArray = new Array;
function del_func()
{
	if (gDelArray.length > 0)
	{
		post("LEAVING",gDelArray,gDelArray.length,"\n");
		dev_name = gDelArray.shift();
		pos = find_device(dev_name,gDeviceNameArray)
		gDeviceNameArray[pos] = undefined;
		messnamed("interface_msg","reset_host",pos);
		messnamed("osc_msg","update_dev",pos,"");
	}

	if (gDelArray.length > 0)
		gDelTask.schedule(2000);
}

function delete_devices()
{
	a = get_not_found_array(gDeviceNameArray,gUpdateDeviceNameArray);
	if (a.length > 0)
	{
		while (a.length > 0) gDelArray.push(a.shift());
		if (!gDelTask.running) gDelTask.execute();
	}
}

function player_list_update()
{
    messnamed("InC_lcd_msg","font","Arial",14);
    messnamed("InC_lcd_msg","moveto",375,50);
    messnamed("InC_lcd_msg","write","zeroconf");

    var y = 80;

    for (i = 0; i < gNumVoices; i++)
    {
        messnamed("InC_lcd_msg","font","Arial",16);
        messnamed("InC_lcd_msg","moveto",375,y);
        messnamed("InC_lcd_msg","write",gDeviceNameArray[i]);
        y += 25;
    }
}
