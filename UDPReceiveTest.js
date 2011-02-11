autowatch = 1;

function osc()
{
	var ip_add_client = arguments[1];
	if (arguments[0] == "/thum/butt")
	{
	    do_thum_butt(ip_add_client,parseInt(arguments[2]),parseInt(arguments[3]));
	}
}

function do_thum_butt(ip_add_client,butt_num,on)
{
    post(ip_add_client,butt_num,on,"\n");
}
