autowatch = 1;

outlets = 2;

var gPlayers = new Global("minc_pm");
var gPlayersWaiting = new Global("minc_pm_waiting");

function join(i,ip_add,from_wait)
{
	if (from_wait)
    	update_players_waiting();
    update_players();
}

function leave(i)
{
    update_players();
}

function wait_join(ip_add)
{
    update_players_waiting();
    post("wait_join",ip_add,gPlayersWaiting.ip_address.length,"\n");
}

function wait_leave(ip_add)
{
    update_players_waiting();
    post("wait_leave",ip_add,gPlayersWaiting.ip_address.length,"\n");
}

function update_players()
{
    var a = new Array;
    for (i = 0; i < gPlayers.max_num; i++)
        a[i] = gPlayers.ip_address[i] != undefined;
    outlet(0,a);
}

function update_players_waiting()
{
    outlet(1,gPlayersWaiting.ip_address.length);
}
