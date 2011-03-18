autowatch = 1;
outlets = 2;

var gmaxlinelength = 36; // max. number of characters per line
var glineheight = 35; // dependent on your font size
var gstartingxposition = 2; // left margin x offset
var gstartingyposition = 30; // first y offset
var gxposition = gstartingxposition;
var gyposition = gstartingyposition;
var gtypinginterval = 30; // ms between characters
var gTypeALine = new Task();

function loadbang() {
    outlet(0, "font", "Monaco", 22);
    outlet(0, "brgb", 0, 0, 0);
    outlet(0,"color", 0);
}

function clear() {
	gTypeALine.cancel();
	outlet(0, "clear");
	outlet(0, "bang");
}

function interval(msinterval) {
    gtypinginterval = msinterval;
} // you could make more methods like this if you want to be able to set global parameters

function text(txt) { // type whatever comes in
    gTypeALine.cancel(); // cancel the current line, in case it's still working on the last message
    gyposition = gstartingyposition; // reset the starting position
    outlet(0, "clear"); // erase the previous stuff
    typeline( txt ); // type the new message
}

typeline.local = 1;
function typeline( themessage ) {
    
    var thelength = themessage.length;
    var theslice;
    var slicelength = 0;

    if (thelength > 0) { // if there is some message left to type
        if ( gmaxlinelength > thelength ) { // get a slice of it
            slicelength = thelength;
        }
        else slicelength = gmaxlinelength;
        
        theslice = themessage.slice(0, slicelength);
        if (slicelength >= gmaxlinelength ) { // if it will need a line break
            slicelength  = theslice.lastIndexOf(" ")+1; // find the last white space in the slice
        }
    }
    else outlet(1, "bang"); // signal that typing is completed
    
    //post("1", slicelength, themessage, "\n");
    gyposition += glineheight; // move to new y position
    gTypeALine = new Task( writeslice, this, themessage, slicelength); // define the task
    gTypeALine.interval = gtypinginterval; // set the rate of the task repetitions
    gTypeALine.repeat(slicelength); // start typing
}

writeslice.local = 1;
function writeslice( theslice, slicelength ) {  // type successively long slices
        outlet(0, "moveto", gxposition, gyposition);
        outlet(0, "write", theslice.slice(0, arguments.callee.task.iterations));
        outlet(0, "bang"); // show the jit.lcd contents
        messnamed("bang_drunk","bang");
        
        arguments.callee.task.interval = gtypinginterval;
        
        if ( arguments.callee.task.iterations == slicelength ) { // when we're done with that line
        	//post("2", slicelength, theslice, "\n");
            typeline( theslice.slice(slicelength) ); // do it again with the remainder of the message
        }
}
