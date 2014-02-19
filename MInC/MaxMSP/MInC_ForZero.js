autowatch = 1;

/*----------------------------------------------------------------------------*/

var gPlayers = new Global("minc_pm");

/*----------------------------------------------------------------------------*/

var gPortNum_Client_TCP = 41337;

/*----------------------------------------------------------------------------*/

function loadbang()
{
    reset();
}

function reset()
{
}

/*** FUNCTIONS FOR HANDING INCOMING OSC MESSAGES ***/

function anything()
{
//	post(messagename,arguments[0],arguments[1],"\n");
 
    var ip_add = arguments[0];
    
    var pos = 0;
//    var pos = gPlayers.ip_address.indexOf(ip_add);
    
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

    if (osc_add == "/download")
        osc_msg_download(pos);
}

function osc_msg_download(pos)
{
    if (pos != -1)
    {
//        var file_name = "fz_buf_"+(pos+1);
//        var file_name = "A_seq_TCP_variation.txt";
        var file_name = "A_seq_TCP.txt";
        
        messnamed("fz_poly_in_1_msg","target",pos+1);
        messnamed("fz_poly_in_2_msg","write","samptype","int16");
        messnamed("fz_poly_in_2_msg","write","writeraw",file_name);                
		post("raw audio file created for pos:",pos,"\n");

        f = new File("fz_download.txt","write","TEXT");
		f.open();
		post("fz_download.txt created for pos:",pos,"\n");

//		f.writeline(gPlayers.ip_address[pos]+", "+gPortNum_Client_TCP+", ./"+file_name);
//		f.writeline(gPlayers.ip_address[pos]+", "+gPortNum_Client_TCP+", ../ForZero_MaxMSP/"+file_name);
		f.writeline("10.0.1.4"+", "+gPortNum_Client_TCP+", ./"+file_name);
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
