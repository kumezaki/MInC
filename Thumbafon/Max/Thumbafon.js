autowatch = 1;

var gNumVoices = 8;
var gOffset = 0;
var gOffsetState = 1;

function Thumbafonist(target_pos) {
    this.target_pos = target_pos+1;
    this.off_set_state = 1
    this.present = true; 
    
    set_offset_state(target_pos, gOffsetState);
	send_offset(target_pos, gOffset);
}

var player_pos_array = [];
var player_array = [];

function loadbang() {
    messnamed("thum_msg_1","voices",gNumVoices);
    messnamed("display_msg","drawto", "keydisplay");
    messnamed("display_msg","font","Helvetica");
    messnamed("display_msg","size", 36);
    messnamed("offset_state", gOffsetState);
}

function clear_players() {
	player_pos_array = [];
	player_report();
}

function player_report() {

	var totalPlayers = 0;
	for (var i = 0; i <= gNumVoices; i++) {
		if (player_pos_array[i] != undefined) totalPlayers += 1;
	}
	post("Total current players is:",totalPlayers,"\n");
}

function parse() {
	
	var client_ip = arguments[1];
	if (arguments[0] == "/thum/butt") {    
	    do_thum_butt(client_ip,parseInt(arguments[2]),parseInt(arguments[3]));
	}
	else if (arguments[0] == "/thum/hints") {
		send_hints(player_array[client_ip].target_pos, client_ip, 0);
	}
	else if (arguments[0] == "/thum/prevhint") {
		send_hints(player_array[client_ip].target_pos, client_ip, 1);
	}
	else if (arguments[0] == "/thum/join") {
		add_player(client_ip);
	}
	else if (arguments[0] == "/thum/leave") {
		remove_player(client_ip);
	}
}

function add_player(client_ip) {
	
	var player = client_ip;
	for (var target_pos = 0; target_pos < gNumVoices; target_pos++) {
		
		if (player_pos_array[target_pos] == undefined) {
			//post(target_pos + 1,player_pos_array[target_pos],"\n");
			break;
		}
	}
	if (target_pos < gNumVoices) {
	
		player_pos_array[target_pos] = player;
		player_array[player] = new Thumbafonist(target_pos);
		messnamed("thum_msg_1","target",target_pos + 1);
		messnamed("thum_msg_2",player);
		post(target_pos + 1,player_pos_array[target_pos],"has joined the performance.\n");
	}
	else if (target_pos >= gNumVoices) {
		post("Could not add",player,". Too many Thumbafonists right now.\n");
	}
}


function remove_player(client_ip) {

	for (var target_pos = 0; target_pos < gNumVoices; target_pos++) {
		
		if (player_pos_array[target_pos] == client_ip) {
			post(target_pos + 1,player_pos_array[target_pos],"has left the performance.\n");
			player_pos_array[target_pos] = undefined;
			break;
		}
	}
}

function do_thum_butt(client_ip,butt_num,on) {
    
    post(client_ip,butt_num,on,"\n");
}

function set_offset_state(target_pos, state) {
	
	gOffsetState = state;
	messnamed("thum_msg_1","target",target_pos);
	messnamed("thum_msg_3","offset","activate", gOffsetState);
}

function send_offset(target_pos, current_off_set) {
	gOffset = current_off_set;
	messnamed("thum_msg_1","target",target_pos);
	messnamed("thum_msg_3","offset",gOffset);
	switch (gOffset) {
        case -5: messnamed("display_msg","text", "G"); break;
        case -4: messnamed("display_msg","text", "G#/Ab"); break;
        case -3: messnamed("display_msg","text", "A"); break;
        case -2: messnamed("display_msg","text", "A#/Bb"); break;
        case -2: messnamed("display_msg","text", "B"); break;
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

function send_hints(target_pos, client_ip, arg) {
		
	if (arg == 0) {
		post(client_ip,"wants a clue. Send it to target", target_pos,"\n");
		messnamed("thum_msg_1","target",target_pos);
		messnamed("thum_msg_3","msg", "/thum/hints", "This is hints test message #1");
	}
	else if (arg == 1) {
		post(client_ip,"wants another clue.\n");
		messnamed("thum_msg_1","target",target_pos);
		messnamed("thum_msg_3","msg", "/thum/hints", "This is hints test message #2");
	}
}
