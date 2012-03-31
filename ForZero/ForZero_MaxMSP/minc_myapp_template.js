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

/* change the OSC address as needed */
var gOSCAdd_PlayerLeave = "/minc/leave";

function osc()
{
    var osc_add = arguments[0];
    var ip_add = arguments[1];
    
    i = gPlayers.ip_address.indexOf(ip_add);
    
    if (pos != -1)
    {
    	do_msg(osc_add,i);
    }
}

function do_msg(osc_add,i)
{
	if (osc_add == gOSCAdd_PlayerLeave)
	{
		messnamed("minc_pm_msg","player_leave",i);
	}
}
