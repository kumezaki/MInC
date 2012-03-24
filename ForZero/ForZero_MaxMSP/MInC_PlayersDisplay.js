autowatch = 1;

var gPlayers = new Global("players");

function join(i,ip_add,from_wait)
{
    update();
}

function leave(i)
{
    update();
}

function wait_join(ip_add)
{
    post("wait_join",ip_add,"\n");
}

function wait_leave(ip_add)
{
    post("wait_leave",ip_add,"\n");
}

function player_join(i,ip_add)
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
