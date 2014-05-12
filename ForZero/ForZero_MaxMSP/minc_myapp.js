autowatch = 1;

/*----------------------------------------------------------------------------*/
/* the following are defined in minc_pm.js */

var gPlayers = new Global("minc_pm");
var gPlayersWaiting = new Global("minc_pm_waiting");

/*----------------------------------------------------------------------------*/
/* player joining/leaving messages from minc_pm.js */

function join(i,ip_add,from_wait)
{
}

function leave(i)
{
}

function wait_join(ip_add)
{
}

function wait_leave(ip_add)
{
}

/*----------------------------------------------------------------------------*/
/* incoming osc messages */

function anything()
{
    var ip_add = arguments[0];
    
    var pos = gPlayers.ip_address.indexOf(ip_add);
    
	/* change the "leave" OSC address as needed */
	if (messagename == "/minc/leave")
	{
		if (pos == -1)
			messnamed("minc_pm_msg","player_wait_leave",ip_add);
		else
			messnamed("minc_pm_msg","player_leave",pos);
		return;
	}

    if (pos != -1)
    {
    	do_msg(messagename,pos);
    }
}

function do_msg(osc_add,pos)
{
//	post("do "+osc_add+" here\n");
}
