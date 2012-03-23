autowatch = 1;

/*----------------------------------------------------------------------------*/

var gMaxNumPlayers = 10;

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

function loadbang()
{
	reset();
}

function reset()
{
	for (i = 0; i < gPlayers.max_num; i++)
		gPlayers.ip_address[i] = undefined;

	delete gPlayersWaiting.ip_address;
	gPlayersWaiting.ip_address = new Array;
	
	delete gPlayersWaiting.auto_bump;
	gPlayersWaiting.auto_bump = new Array;
}

function osc(v)
{
	post(v,"\n");

	var pos = gPlayers.ip_address.indexOf(v);

	if (pos == -1)
	{
		pos = gPlayers.ip_address.indexOf(undefined);
		if (pos == -1 || pos >= gPlayers.max_num)
			player_wait(v);
		else
			player_join(pos,v);
	}
	else
		post("player "+v+" exists\n");
}

function player_join(pos,v)
{
	post("player "+v+" joining at pos "+pos+"\n");
	gPlayers.ip_address[pos] = v;
}

function player_leave(pos)
{	
	var v = gPlayers.ip_address[pos];
	post("player "+v+" leaving at pos "+pos+"\n");

	gPlayers.ip_address[pos] = undefined;
	
	if (gPlayersWaiting.ip_address.length)
	{
		post("waiting list before",gPlayersWaiting.ip_address,"\n");
		v = gPlayersWaiting.ip_address.shift();
		post("waiting list after",gPlayersWaiting.ip_address,"\n");
		
		gPlayersWaiting.auto_bump[v].cancel();
		
		player_join(pos,v);
	}
}

function player_wait(v)
{
	if (gPlayersWaiting.ip_address.indexOf(v) == -1)
	{
		post(v+" added to waiting list\n");
		gPlayersWaiting.ip_address.push(v);
		gPlayersWaiting.auto_bump[v] = new Task(player_leave_waiting,this,v);
		post("waiting list",gPlayersWaiting.ip_address,"\n");
	}
	else
	{
		post(v+" still on waiting list\n");
		gPlayersWaiting.auto_bump[v].cancel();
	}
	gPlayersWaiting.auto_bump[v].schedule(gAutoBumpTime);
}

function player_leave_waiting()
{
	var v = arguments[0];
	post("player_leave_waiting",v,"\n");
	var i = gPlayersWaiting.ip_address.indexOf(v);
	gPlayersWaiting.ip_address = gPlayersWaiting.ip_address.slice(i,i+1);
	
	/* should delete task and remove from gPlayersWaiting.auto_bump array here */
}
