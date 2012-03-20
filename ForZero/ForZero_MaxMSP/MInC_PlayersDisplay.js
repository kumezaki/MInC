autowatch = 1;

function Player()
{
	this.ip_address = undefined;
}

var gPlayers = new Global("players");

var gPlayerArray = new Array;

var gTestArray = new Global("test_array");
gTestArray.a = new Array;
gTestArray.a[0] = "foo";
gTestArray.a[1] = "goo";
gTestArray.a[2] = "hoo";

function loadbang()
{
	reset();
}

function reset()
{
	for (i = 0; i < gPlayers.max_num; i++)
	{
		gPlayerArray[i] = new Player;
	}
}

function player_join(i,ip_address)
{
	gPlayerArray[i].ip_address = ip_address;
	update();
}

function player_leave(i)
{
	gPlayerArray[i].ip_address = undefined;
	update();
}

function update()
{
	var a = new Array;
	for (i = 0; i < gPlayers.max_num; i++)
		a[i] = gPlayerArray[i].ip_address != undefined;
	outlet(0,a);
}
