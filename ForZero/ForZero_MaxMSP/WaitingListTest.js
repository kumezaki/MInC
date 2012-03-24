autowatch = 1;

/*----------------------------------------------------------------------------*/

var gPlayers = new Global("players");
gPlayers.max_num = 0;
gPlayers.ip_address = new Array;
gPlayers.auto_bump = new Array;

var gPlayersWaiting = new Global("players_waiting");
gPlayersWaiting.ip_address = new Array;
gPlayersWaiting.auto_bump = new Array;

var gAutoBumpTime = 0;

var gMsg_PlayerUpdate = "";

/*----------------------------------------------------------------------------*/

function loadbang()
{
	reset();
}

function reset()
{
	gPlayers.max_num = 10;
	
	gAutoBumpTime = 10000;

	gMsg_PlayerUpdate = "minc_player_update";

	for (i = 0; i < gPlayers.max_num; i++)
	{
		gPlayers.ip_address[i] = undefined;
		gPlayers.auto_bump[i] = new Task(player_leave,this,i);
	}
	
	while ((v = gPlayersWaiting.ip_address.shift()) != undefined)
	{
		post(v,"\n");
		gPlayersWaiting.auto_bump[v].cancel();
		delete gPlayersWaiting.auto_bump[v];
		gPlayersWaiting.auto_bump[v] = undefined;
	}

	heartbeat(0);
	
	gHeartBeatTime = 1000;
	gOSCAddress_Heartbeat = "/minc/hb";

	gIPAddress_Local = "0.0.0.0";
	gIPAddress_Broadcast = "0.0.0.0";
}

/*----------------------------------------------------------------------------*/

function max_num_players(v)
{
	gPlayers.max_num = v;
	post("maximum number of players set to "+gPlayers.max_num+"\n");
	
	reset();
}

function auto_bump_time(v)
{
	gAutoBumpTime = v;
	post("auto bump time set to "+gAutoBumpTime+" msecs\n");
}

function player_update_msg_name(v)
{
	gMsg_PlayerUpdate = v;
	post("player update message name set to "+gMsg_PlayerUpdate+"\n");
}

/*----------------------------------------------------------------------------*/

function player_join(i,ip_add,from_wait)
{
	post("player "+ip_add+" joining at index "+i+(from_wait?" from waiting list":"")+"\n");

	gPlayers.ip_address[i] = ip_add;

	messnamed(gMsg_PlayerUpdate,"join",i,ip_add,from_wait);
}

function player_leave(i)
{
	var ip_add = gPlayers.ip_address[i];
	post("player "+ip_add+" leaving at index "+i+"\n");

	gPlayers.ip_address[i] = undefined;
	
	messnamed(gMsg_PlayerUpdate,"leave",i);

	if (gPlayersWaiting.ip_address.length)
	{
		post("waiting list before",gPlayersWaiting.ip_address,"\n");
		ip_add = gPlayersWaiting.ip_address.shift();
		post("waiting list after",gPlayersWaiting.ip_address,"\n");
		
		gPlayersWaiting.auto_bump[ip_add].cancel();
		
		player_join(i,ip_add,true);
		gPlayers.auto_bump[i].cancel();
		gPlayers.auto_bump[i].schedule(gAutoBumpTime);
	}
}

function player_wait(ip_add)
{
	if (gPlayersWaiting.ip_address.indexOf(ip_add) == -1)
	{
		post(ip_add+" added to waiting list\n");
		gPlayersWaiting.ip_address.push(ip_add);
		post("waiting list",gPlayersWaiting.ip_address,"\n");

		messnamed(gMsg_PlayerUpdate,"wait_join",ip_add);

		if (gPlayersWaiting.auto_bump[ip_add] == undefined)
			gPlayersWaiting.auto_bump[ip_add] = new Task(player_leave_waiting,this,ip_add);
	}
	else
	{
		post(ip_add+" still on waiting list\n");
		gPlayersWaiting.auto_bump[ip_add].cancel();
	}
	gPlayersWaiting.auto_bump[ip_add].schedule(gAutoBumpTime);
}

function player_leave_waiting()
{
	var ip_add = arguments[0];
	post("player_leave_waiting",ip_add,"\n");
	var i = gPlayersWaiting.ip_address.indexOf(ip_add);
	gPlayersWaiting.ip_address.splice(i,1);
	post("waiting list",gPlayersWaiting.ip_address,"\n");
	
	messnamed(gMsg_PlayerUpdate,"wait_leave",ip_add);

	/* should delete task and remove from gPlayersWaiting.auto_bump array here? */
	post("gPlayersWaiting.auto_bump["+ip_add+"] "+gPlayersWaiting.auto_bump[ip_add]+"\n");
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
			player_wait(ip_add);
		else
			player_join(i,ip_add,false);
	}

	if (i != -1)
	{
		gPlayers.auto_bump[i].cancel();
		gPlayers.auto_bump[i].schedule(gAutoBumpTime);
	}
}

/*----------------------------------------------------------------------------*/

var gTask_ServerHeartbeat = new Task(heartbeat_func);
var gHeartBeatTime = 0;
var gOSCAddress_Heartbeat = "";

var gIPAddress_Local = "0.0.0.0";
var gIPAddress_Broadcast = "0.0.0.0";

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

function osc_address_heartbeat(v)
{
	gOSCAddress_Heartbeat = v;
	post("heartbeat OSC address set to "+gOSCAddress_Heartbeat+"\n");
}

function heartbeat(v)
{
	if (v == 0)
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
