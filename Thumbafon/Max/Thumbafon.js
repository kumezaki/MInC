autowatch = 1;

var gNumVoices = 8;
var gOffset = 0;
var gOffsetState = 1;

var target_pos_array = [];
var player_array = [];

function loadbang() {
    messnamed("thum_msg_1","voices",gNumVoices);
    messnamed("display_msg","drawto", "keydisplay");
    messnamed("display_msg","font","Helvetica");
    messnamed("display_msg","size", 36);
    messnamed("offset_state", gOffsetState);
}

function clear_players() {
	target_pos_array = [];
	player_report();
}

function player_report() {

	var totalPlayers = 0;
	for (var i = 0; i <= gNumVoices; i++) {
		if (target_pos_array[i] != undefined) totalPlayers += 1;
	}
	post("Total current players is:",totalPlayers,"\n");
}

function Thumbafonist(target_pos, device_name) {
    this.target_pos = target_pos+1;
    this.device_name = device_name;
    this.off_set_state = 1
    this.present = true; 
    
    set_offset_state(target_pos, gOffsetState);
	send_offset(target_pos, gOffset);
}

function add_player(client_ip, device_name) {
	
	for (var target_pos = 0; target_pos < gNumVoices; target_pos++) {
		
		if (target_pos_array[target_pos] == undefined) {
			//post(target_pos + 1,target_pos_array[target_pos],"\n");
			break;
		}
	}
	if (target_pos < gNumVoices) {
	
		target_pos_array[target_pos] = client_ip;
		player_array[client_ip] = new Thumbafonist(target_pos, device_name);
		messnamed("thum_msg_1","target",target_pos + 1);
		messnamed("thum_msg_2",client_ip);
		post(target_pos + 1, device_name,"has joined the performance.\n");
	}
	else if (target_pos >= gNumVoices) {
		post("Could not add", device_name,". Too many Thumbafonists right now.\n");
	}
}

function remove_player(client_ip) {

	for (var target_pos = 0; target_pos < gNumVoices; target_pos++) {
		
		if (target_pos_array[target_pos] == client_ip) {
			post(target_pos + 1, player_array[client_ip].device_name,"has left the performance.\n");
			target_pos_array[target_pos] = undefined;
			break;
		}
	}
}

function parse() {
	
	var client_ip = arguments[1];
	var device_name = arguments[2];
	
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
		add_player(client_ip, device_name);
	}
	else if (arguments[0] == "/thum/leave") {
		remove_player(client_ip);
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
		messnamed("thum_msg_3","msg", "/thum/hints", "The device in your hands will be a way for you to contribute to the performance.  Go ahead and experiment with it for a minute.  With a little creativity it can be a nifty little musical instrument.");
	}
	else if (arg == 1) {
		post(client_ip,"wants another clue.\n");
		messnamed("thum_msg_1","target",target_pos);
		messnamed("thum_msg_3","msg", "/thum/hints", "You can control your own volume with the volume buttons on the side of the device.  Or you could also monitor your own sound via an ear piece");
	}
}

function send_interstitial(target_pos, arg) {
		
	switch(arg) {
		case 0: messnamed("thum_msg_1","target",target_pos); messnamed("thum_msg_3","msg", "/thum/interstitial", "Welcome to my recital and thank you for participating! I will use messages such as this one to guide everyone through the performance.\n\nIf you accidentally touch the screen before you are done reading you can select the HINTS button to see all past messages. Try it out to find out what to do next...");break;
        case 1: messnamed("thum_msg_1","target",target_pos); messnamed("thum_msg_3","msg", "/thum/interstitial This is a test.");break;
        case 2: messnamed("thum_msg_1","target",target_pos); messnamed("thum_msg_3","msg", "/thum/interstitial This is a test.");break;
        case 3: messnamed("thum_msg_1","target",target_pos); messnamed("thum_msg_3","msg", "/thum/interstitial This is a test.");break;
        case 4: messnamed("thum_msg_1","target",target_pos); messnamed("thum_msg_3","msg", "/thum/interstitial This is a test.");break;
        case 5: messnamed("thum_msg_1","target",target_pos); messnamed("thum_msg_3","msg", "/thum/interstitial This is a test.");break;
        case 6: messnamed("thum_msg_1","target",target_pos); messnamed("thum_msg_3","msg", "/thum/interstitial This is a test.");break;
	}
}