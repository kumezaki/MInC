autowatch = 1;

function Player()
{
	this.ip_address = undefined;
}

var gMaxNumPlayers = 10;	/* can this be global? */
var gPlayer = new Array;

function loadbang()
{
	reset();
}

function reset()
{
	for (i = 0; i < gMaxNumPlayers; i++)
	{
		gPlayer[i] = new Player;
	}
}

function player_join(i,ip_address)
{
	gPlayer[i].ip_address = ip_address;
	update();
}

function player_leave(i)
{
	gPlayer[i].ip_address = undefined;
	update();
}

function update()
{
	var a = new Array;
	for (i = 0; i < gMaxNumPlayers; i++)
		a[i] = gPlayer[i].ip_address != undefined;
	outlet(0,a);
}
