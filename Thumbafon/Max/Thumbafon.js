autowatch = 1;

var gNumVoices = 5;
var gKey = 0;
var gMode = 0;
var gDefaultName = "<device_name>";

/***target_pos_array is client_ip's indexed by target_pos***/
/***to conform to poly~ all for-loops that check this array should start with 1***///
var target_pos_array = []; 

/***player_array is of thumbafonists objects indexed by client_ip***/
var player_array = [];

function loadbang() {
    messnamed("thum_msg_1","voices",gNumVoices);
    messnamed("thum_msg_1","target",0);
    messnamed("thum_msg_2","dev","set", gDefaultName);
    messnamed("display_msg","drawto", "keydisplay");
    messnamed("display_msg","font","Helvetica");
    messnamed("display_msg","size", 36);
}

function clear_players() {
	
	send_all("alert","Unfortunately, the system needed to be reset. Please turn your Network power switch OFF & then ON again to rejoin the performance.\n");
	messnamed("report","clear");

	for (i = 1; i < gNumVoices; i++) {
		
		if (target_pos_array[i] != undefined) {
			messnamed("thum_msg_1","target",i);
			messnamed("thum_msg_2", "kill");
			messnamed("thum_msg_2","dump","bang");
			messnamed("thum_msg_2","ip", "0.0.0.0");
			messnamed("thum_msg_2","dev", "set",gDefaultName);
			player_array[target_pos_array[i]] = undefined;
			target_pos_array[i] = undefined;
			}
		}
	player_report();
}

function player_report() {
	var totalPlayers = 0;
	post("players:");
	messnamed("report","clear");
	messnamed("report","set","players:","\n");
	for (var i = 1; i < gNumVoices; i++) {
		var client_ip = target_pos_array[i];
		if (target_pos_array[i] != undefined) {
		post("/",player_array[target_pos_array[i]].device_name);
		messnamed("report","append",player_array[target_pos_array[i]].device_name,"poly~target:",player_array[target_pos_array[i]].target_pos+"\n");
		totalPlayers++;
		}
	}
	post("\nTotal current players is:",totalPlayers,"\n");
}

function Thumbafonist(target_pos, device_name) {
    
    this.target_pos = target_pos;
    this.device_name = device_name;
    this.velocity = 100;
    this.octave = 4; //corresponding with C4
    this.present = true; 
}

function add_player(client_ip, device_name) {
	
	for (var target_pos = 1; target_pos < gNumVoices; target_pos++) {
		if (target_pos_array[target_pos] == undefined || target_pos_array[target_pos] == client_ip) break;
	}
	
	if (target_pos < gNumVoices) {
	
		target_pos_array[target_pos] = client_ip;
		player_array[client_ip] = new Thumbafonist(target_pos, device_name);
		messnamed("thum_msg_1","target",target_pos);
		messnamed("thum_msg_2","ip", client_ip);
		messnamed("thum_msg_2","dev","set", device_name);
		messnamed("thum_msg_2","midi", target_pos);
		send_key(client_ip, gKey);
		post(player_array[client_ip].device_name,"has joined the performance at target",player_array[client_ip].target_pos,"\n");
	}
	else if (target_pos >= gNumVoices) {
		post("Could not add", device_name,". Too many Thumbafonists right now.\n");
	}
}

function remove_player(client_ip) {

	messnamed("thum_msg_1","target", player_array[client_ip].target_pos);
	messnamed("thum_msg_2","dump","bang");
	messnamed("thum_msg_2","ip","0.0.0.0");
	messnamed("thum_msg_2","dev","set",gDefaultName);
	
	post(player_array[client_ip].device_name,"has left the performance.\n");
	
	target_pos_array[player_array[client_ip].target_pos] = undefined;
	player_array[client_ip] = undefined;
}

function parse() {
	
	var client_ip = arguments[1];
		
	if (arguments[0] == "/thum/join") {
		add_player(client_ip, arguments[2]);
		send_mode(client_ip, arguments[3]);
	}
	
	// a guard against messages from non-assigned ip addresses
	for (i in target_pos_array) {
		var player = target_pos_array[i];
		
		if (player == client_ip) {
		
			if (arguments[0] == "/thum/butt") {    
				receive_butt(client_ip,parseInt(arguments[2]),parseInt(arguments[3]));
			}
			else if (arguments[0] == "/thum/mode") {
				send_mode(client_ip, arguments[3]);
			}
			else if (arguments[0] == "/thum/hint") {
				send_2butt(client_ip, "this is a just a test string.\n");
			}
			else if (arguments[0] == "/thum/prev") {
				send_2butt(player_array[client_ip].target_pos, client_ip, 1);
			}
			else if (arguments[0] == "/thum/leave") {
				remove_player(client_ip);
			}
		}
	}
}

function receive_butt(client_ip, button_num, state) {
    
    messnamed("thum_msg_1","target",player_array[client_ip].target_pos);
	messnamed("thum_msg_2","button", button_num, state == 0 ? 0 : player_array[client_ip].velocity);
	//post(player_array[client_ip].device_name, button_num, state == 0 ? 0 : player_array[client_ip].velocity,"\n");
}

function send_key(client_ip, key) {
    
    gKey = key;
	messnamed("thum_msg_1","target",player_array[client_ip].target_pos);
	messnamed("thum_msg_2","key",gKey);
	switch (key) {
        case -5: messnamed("display_msg","text", "G"); break;
        case -4: messnamed("display_msg","text", "G#/Ab"); break;
        case -3: messnamed("display_msg","text", "A"); break;
        case -2: messnamed("display_msg","text", "A#/Bb"); break;
        case -1: messnamed("display_msg","text", "B"); break;
        case 0: messnamed("display_msg","text", "C"); break;
        case 1: messnamed("display_msg","text", "C#/Db"); break;
        case 2: messnamed("display_msg","text", "D"); break;
        case 3: messnamed("display_msg","text", "D#/Eb"); break;
        case 4: messnamed("display_msg","text", "E"); break;
        case 5: messnamed("display_msg","text", "F"); break;
        case 6: messnamed("display_msg","text", "F#/Gb"); break;
        case 7: messnamed("display_msg","text", "G"); break;
    }
}

function send_mode(client_ip, mode) {
	messnamed("thum_msg_1","target",player_array[client_ip].target_pos);
	messnamed("thum_msg_2","mode", mode);
}

function set_magic_mode(client_ip, state) {
	messnamed("thum_msg_1","target",player_array[client_ip].target_pos);
	messnamed("thum_msg_2","magic",state);
}

function send_magic_notes(client_ip, notes) {
	messnamed("thum_msg_1","target",player_array[client_ip].target_pos);
	messnamed("thum_msg_2","notes",notes);
}

function send_1butt(client_ip, string) {

	messnamed("thum_msg_1","target",player_array[client_ip].target_pos); 
	messnamed("thum_msg_2","msg", "/thum/1butt", string);
}

function send_2butt(client_ip, string) {
		
	post(client_ip,"wants a clue. Send it to target", player_array[client_ip].target_pos,"\n");
	messnamed("thum_msg_1","target",player_array[client_ip].target_pos);
	messnamed("thum_msg_2","msg", "/thum/2butt", string);
}

function send_marq(client_ip, string) {

	messnamed("thum_msg_1","target",player_array[client_ip].target_pos);
	messnamed("thum_msg_2","msg", "/thum/marq", string);
}

function send_all(type, msg) {
		
	if (type == "key") {
		gKey = msg;
		for(i = 1; i < gNumVoices; i++) {
			if (player_array[target_pos_array[i]] != undefined) send_key(target_pos_array[i], msg);
		}
	}
	else if (type == "mode") {
		gMode = msg;
		for(i = 1; i < gNumVoices; i++) {
			if (player_array[target_pos_array[i]]  != undefined) send_mode(target_pos_array[i], msg);
		}
	}
	else if (type == "magic") {
		for(i = 1; i < gNumVoices; i++) {
			if (player_array[target_pos_array[i]]  != undefined) set_magic_mode(target_pos_array[i], msg);
		}
	}
	else if (type == "notes") {
		for(i = 1; i < gNumVoices; i++) {
			if (player_array[target_pos_array[i]]  != undefined) send_magic_notes(target_pos_array[i], msg);
		}
	}
	else if (type == "alert") {
		for(i = 1; i < gNumVoices; i++) {
			if (player_array[target_pos_array[i]]  != undefined) send_1butt(target_pos_array[i],msg);
		}
	}
	else if (type == "hint") {
		for(i = 1; i < gNumVoices; i++) {
			if (player_array[target_pos_array[i]]  != undefined) send_2butt(target_pos_array[i], msg);
		}
	}
	else if (type == "marq") {
		for(i = 0; i < gNumVoices; i++) {
			if (player_array[target_pos_array[i]]  != undefined) send_marq(target_pos_array[i], msg);
		}
	}
}