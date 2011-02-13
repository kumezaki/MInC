autowatch = 1;

var gNumVoices = 8;
var player_pos_array = [];
var player_array = [];


function loadbang() {
    
    messnamed("thum_msg_1","voices",gNumVoices);
}

function osc() {
	
	var client_ip = arguments[1];
	if (arguments[0] == "/thum/butt") {
	    
	    doThumButt(client_ip,parseInt(arguments[2]),parseInt(arguments[3]));
	}
	else if (arguments[0] == "/thum/join") {
	
		setClientIP(client_ip);
	}
	else if (arguments[0] == "/thum/leave") {
	
		removeClientIP(client_ip);
	}
}

function setClientIP(client_ip) {

	for (var target_pos = 0; target_pos < gNumVoices; target_pos++) {
		
		if (player_pos_array[target_pos] == undefined) {
			messnamed("thum_msg_1","target",target_pos + 1);
    		messnamed("thum_msg_2",client_ip);
    		player_pos_array[target_pos] = client_ip;
			post(target_pos + 1,player_pos_array[target_pos],"has joined the show.\n");
			break;
		}
	}
}

function removeClientIP(client_ip) {

	for (var target_pos = 0; target_pos < gNumVoices; target_pos++) {
		
		if (player_pos_array[target_pos] == client_ip) {
			post(target_pos + 1,player_pos_array[target_pos],"has left the show.\n");
			player_pos_array[target_pos] = undefined;
			break;
		}
	}
}

function doThumButt(client_ip,butt_num,on) {
    
    post(client_ip,butt_num,on,"\n");
}