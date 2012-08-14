autowatch = 1;

/*----------------------------------------------------------------------------*/

var gPlayers = new Global("minc_pm");
gPlayers.max_num = 0;
gPlayers.ip_address = [];
gPlayers.timer = [];

var gPlayersWaiting = new Global("minc_pm_waiting");
gPlayersWaiting.ip_address = [];
gPlayersWaiting.timer = [];

var gTimerDur = 0;

var gMsg_PMUpdate = "";

/*----------------------------------------------------------------------------*/

function loadbang()
{
	reset();
}

function reset()
{
	gPlayers.max_num = 10;
	
	gTimerDur = 10000;

	gMsg_PMUpdate = "minc_pm_update";

	for (i = 0; i < gPlayers.max_num; i++)
	{
		gPlayers.ip_address[i] = undefined;
		gPlayers.timer[i] = new Task(player_leave,this,i);
	}
	
	while ((v = gPlayersWaiting.ip_address.shift()) != undefined)
	{
//		post("removing",v,"from waiting list\n");
		gPlayersWaiting.timer[v].cancel();
		delete gPlayersWaiting.timer[v];
		gPlayersWaiting.timer[v] = undefined;
	}

	heartbeat(0);
	
	gHeartBeatTime = 1000;
	gOSCAddress_Heartbeat = "/minc/hb";

	gIPAddress_Local = "0.0.0.0";
	gIPAddress_Broadcast = "0.0.0.0";
}

/*----------------------------------------------------------------------------*/

function max_num_players(N) // positive integer
{
	gPlayers.max_num = N;
	post("maximum number of players set to "+gPlayers.max_num+"\n");
	
	reset();
}

function timer_duration(dur) // milliseconds
{
	gTimerDur = dur;
	post("auto bump time set to "+gTimerDur+" msecs\n");
}

function player_update_msg_name(name) // for receive MaxMSP objects
{
	gMsg_PMUpdate = name;
	post("player update message name set to "+gMsg_PMUpdate+"\n");
}

/*----------------------------------------------------------------------------*/

function player_join(i,ip_add,from_wait)
{
	gPlayers.ip_address[i] = ip_add;
	post("player "+ip_add+" joining at index "+i+(from_wait?" from waiting list":"")+"\n");

	messnamed(gMsg_PMUpdate,"join",i,ip_add,from_wait);
}

function player_leave(i)
{
	var ip_add = gPlayers.ip_address[i];
	post("player "+ip_add+" leaving at index "+i+"\n");

	gPlayers.ip_address[i] = undefined;
	
	messnamed(gMsg_PMUpdate,"leave",i);

	if (gPlayersWaiting.ip_address.length)
	{
		ip_add = gPlayersWaiting.ip_address.shift();
//		post("waiting list",gPlayersWaiting.ip_address,"\n");
		
		gPlayersWaiting.timer[ip_add].cancel();
		
		player_join(i,ip_add,true);
		gPlayers.timer[i].cancel();
		gPlayers.timer[i].schedule(gTimerDur);
	}
}

function player_wait_join(ip_add)
{
	if (gPlayersWaiting.ip_address.indexOf(ip_add) == -1)
	{
		post(ip_add+" added to waiting list\n");
		gPlayersWaiting.ip_address.push(ip_add);
//		post("waiting list",gPlayersWaiting.ip_address,"\n");

		messnamed(gMsg_PMUpdate,"wait_join",ip_add);

		if (gPlayersWaiting.timer[ip_add] == undefined)
			gPlayersWaiting.timer[ip_add] = new Task(player_wait_leave,this,ip_add);
	}
	else
	{
		post(ip_add+" still on waiting list\n");
		gPlayersWaiting.timer[ip_add].cancel();
	}
	gPlayersWaiting.timer[ip_add].schedule(gTimerDur);
}

function player_wait_leave()
{
	var ip_add = arguments[0];
	post("player_wait_leave",ip_add,"\n");
	var i = gPlayersWaiting.ip_address.indexOf(ip_add);
	gPlayersWaiting.ip_address.splice(i,1);
//	post("waiting list",gPlayersWaiting.ip_address,"\n");
	
	messnamed(gMsg_PMUpdate,"wait_leave",ip_add);

	/* should delete task and remove from gPlayersWaiting.timer array here? */
	post("gPlayersWaiting.timer["+ip_add+"] "+gPlayersWaiting.timer[ip_add]+"\n");
}

/*----------------------------------------------------------------------------*/

function osc()
{
//	post(arguments[0],arguments[1],"\n");

	var ip_add = arguments[1];
	
	if (ip_add == "0.0.0.0") return;

	var i = gPlayers.ip_address.indexOf(ip_add);

	if (i == -1)
	{
		i = gPlayers.ip_address.indexOf(undefined);
		if (i == -1 || i >= gPlayers.max_num)
			player_wait_join(ip_add);
		else
			player_join(i,ip_add,false);
	}

	if (i != -1)
	{
		gPlayers.timer[i].cancel();
		gPlayers.timer[i].schedule(gTimerDur);
	}
}

/*----------------------------------------------------------------------------*/

var gTask_ServerHeartbeat = new Task(heartbeat_func);
var gHeartBeatTime = 0;
var gOSCAddress_Heartbeat = "";

var gIPAddress_Local = "0.0.0.0";
var gIPAddress_Broadcast = "0.0.0.0";

/*----------------------------------------------------------------------------*/

function ip_address_local(ip_add)
{
	gIPAddress_Local = ip_add;
	post("local IP address set to "+gIPAddress_Local+"\n");
}

function ip_address_broadcast(ip_add)
{
	gIPAddress_Broadcast = ip_add;
	post("router broadcast IP address set to "+gIPAddress_Broadcast+"\n");
	outlet(0,"host",gIPAddress_Broadcast);
}

function osc_address_heartbeat(osc_add)
{
	gOSCAddress_Heartbeat = osc_add;
	post("heartbeat OSC address set to "+gOSCAddress_Heartbeat+"\n");
}

/*----------------------------------------------------------------------------*/

function heartbeat(on) // 0 = off; 1 = on
{
	if (on == 0)
		gTask_ServerHeartbeat.cancel();
	else
		gTask_ServerHeartbeat.schedule(0);
}

function heartbeat_func()
{
	if (gIPAddress_Local != "0.0.0.0")
	{
		post("heartbeat "+gIPAddress_Local+"\n");

		outlet(0,gOSCAddress_Heartbeat,gIPAddress_Local);
	}
	gTask_ServerHeartbeat.schedule(gHeartBeatTime);
}
