autowatch = 1;

var gPlayers = new Global("players");

function player_join(i,ip_address)
{
	update();
}

function player_leave(i)
{
	update();
}

function update()
{
	var a = new Array;
	for (i = 0; i < gPlayers.max_num; i++)
		a[i] = gPlayers.ip_address[i] != undefined;
	outlet(0,a);
}
