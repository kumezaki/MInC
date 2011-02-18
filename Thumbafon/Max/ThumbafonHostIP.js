autowatch = 1;

function networkInterface() {

	var net_interface = arguments[1];
	if (net_interface == "en0") {
    	messnamed("en0",net_interface);
	    post(net_interface,"is the network interface being used.\n");
	}
}

function serverIP() {	
	var server_ip = arguments[1];
	if (arguments[1] != undefined) {
		var a = arguments[1].split(".");
		if (a[2] != undefined) {
			if (a[4] == undefined) {
			messnamed("serverIP",server_ip);
			post(server_ip,"is the server IP.\n");
			}
		}
	}
}