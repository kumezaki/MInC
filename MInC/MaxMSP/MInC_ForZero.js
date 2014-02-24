autowatch = 1;

/*----------------------------------------------------------------------------*/

var gPlayers = new Global("minc_pm");

/*----------------------------------------------------------------------------*/

var gPortNum_Client_TCP = 41337;

var gSeqFileName = "";

/*----------------------------------------------------------------------------*/

function loadbang()
{
    reset();
}

function reset()
{
}

function set_seq(filename)
{
	post("setting sequence file to",filename,"\n");
	gSeqFileName = filename;
}

/*** FUNCTIONS FOR HANDING INCOMING OSC MESSAGES ***/

function anything()
{
//	post(messagename,arguments[0],arguments[1],"\n");
 
    var ip_add = arguments[0];
    
    var pos = gPlayers.ip_address.indexOf(ip_add);
//	post(pos,gPlayers.ip_address[pos],"\n");
    
    var osc_add = messagename;
    if (osc_add.search("/minc/") != 0)
    	return;
	osc_add = osc_add.slice(5);

    if (pos != -1)
    {
    	do_msg(osc_add,pos,arguments[1]);
    }
}

function do_msg(osc_add,pos,val)
{
//    post(osc_add+"\n");

    if (osc_add == "/content")
        osc_msg_content(pos);
}

function osc_msg_content(pos)
{
    if (pos != -1)
    {
        f = new File("fz_download.txt","write","TEXT");
		f.open();
		post("fz_download.txt created for pos:",pos,"\n");

		f.writeline(gPlayers.ip_address[pos]+", "+gPortNum_Client_TCP+", ./"+gSeqFileName);
        post("script file written for pos:",pos,"\n");

        f.close();
		post("txt file closed for pos:",pos,"\n");
    }		
}

/*** MISCELLANEOUS FUNCTIONS ***/

var gParentPath = "";

function parent_path(v)
{
	gParentPath = v;
	post(gParentPath+"\n");
}

function exit_tcp_script()
{
    f = new File(gParentPath+"fz_download.txt","w");
    f.writeline("exit");
    f.close();
}
