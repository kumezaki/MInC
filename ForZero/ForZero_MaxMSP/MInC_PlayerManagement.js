autowatch = 1;

/*----------------------------------------------------------------------------*/

var gPlayers = new Global("players");
gPlayers.max_num = 10;
gPlayers.ip_address = new Array;
gPlayers.auto_bump = new Array;

var gPlayersWaiting = new Global("players_waiting");
gPlayersWaiting.ip_address = new Array;
gPlayersWaiting.auto_bump = new Array;

/*----------------------------------------------------------------------------*/

var gAutoBumpTime = 10000;

/*----------------------------------------------------------------------------*/

var gMsg_PlayerJoin = "minc_player_join";
var gMsg_PlayerLeave = "minc_player_leave";

/*----------------------------------------------------------------------------*/

function loadbang()
{
	reset();
}

function reset()
{
	for (i = 0; i < gPlayers.max_num; i++)
	{
		gPlayers.ip_address[i] = undefined;
		gPlayers.auto_bump[i] = new Task(player_leave,this,i);
	}
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

function player_join_msg_name(v)
{
	gMsg_PlayerJoin = v;
	post("player join message name set to "+gMsg_PlayerJoin+"\n");
}

function player_leave_msg_name(v)
{
	gMsg_PlayerLeave = v;
	post("player leave message name set to "+gMsg_PlayerLeave+"\n");
}

/*----------------------------------------------------------------------------*/

function check_player_range(i)
{
	if (i < 0 || i >= gPlayers.max_num)
	{
		post("player index "+i+" out of range\n");
		return false;
	}
	return true; /* returns true if in range */
}

function player_join(i,ip_add)
{
	if (!check_player_range(i)) return;

	post("player "+ip_add+" joining at index "+i+"\n");

	gPlayers.ip_address[i] = ip_add;
	
	messnamed(gMsg_PlayerJoin,i,ip_add);
}

function player_leave(i)
{
	if (!check_player_range(i)) return;

	var v = gPlayers.ip_address[i];
	post("player "+v+" leaving at index "+i+"\n");

	gPlayers.ip_address[i] = undefined;

	messnamed(gMsg_PlayerLeave,i);
}

/*----------------------------------------------------------------------------*/

function filter_ip_address(v)
{
	var deny = false;
	
	/* deny IP addresses here (e.g. 0.0.0.0, non-local address) */
	if (v == "0.0.0.0")
		deny = true;

	return deny;
}

function osc()
{
//	post(arguments[0],arguments[1],"\n");
	
	var ip_add = arguments[1];
	
	if (filter_ip_address(ip_add)) return;

	var i = gPlayers.ip_address.indexOf(ip_add);
	
	if (i == -1)
	{
		i = gPlayers.ip_address.indexOf(undefined);
		if (i != -1)
			player_join(i,ip_add);
	}

	if (i != -1)
	{
		gPlayers.auto_bump[i].cancel();
		gPlayers.auto_bump[i].schedule(gAutoBumpTime);
	}
}

/*----------------------------------------------------------------------------*/

var gTask_ServerHeartbeat = new Task(heartbeat_func);
var gHeartBeatTime = 1000;
var gOSCAddress_Heartbeat = "/minc/hb";

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

/*----------------------------------------------------------------------------*/

var gIPAddress_Local = "0.0.0.0";
var gIPAddress_Broadcast = "0.0.0.0";

var gCount = 0;

function ip_address_local(v)
{
	gIPAddress_Local = v;
	post("local IP address set to "+gIPAddress_Local+"\n");
}

function ip_address_broadcast(v)
{
	gIPAddress_Broadcast = v;
	post("router broadcast IP address set to "+gIPAddress_Broadcast+"\n");
	outlet(0,"host",gIPAddress_Broadcast);
}

function clear()
{
    gCount = 0;
}

function append(v)
{
    if (gCount++ == 1)
    {
		gIPAddress_Local = v;
        post("local IP address is "+v+"\n");

        a = v.split(".")
        a[3] = 255;
        b = a[0]+"."+a[1]+"."+a[2]+"."+a[3];
		gIPAddress_Broadcast = a;
        post("router broadcast IP address is "+b+"\n");
    }
}
