// GLOBAL VARIABLES //
var mode = true, rec = false, pb = false;
var attenuation = 0, offset = 0;
var recording = new Array();
var pointer = document.getElementById("pointer");
var range = document.getElementById("range");
var timeouts = new Array(), interval;

// -------- ONLY FOR DEBUGGING PURPOSES -------- //
document.addEventListener("keydown", (e) => {
    if (e.key === "r" || e.key === "R") {
        record(e);
    }
    else if (e.key === "e" || e.key === "E") {
        erase();
    }
});
// --------------------------------------------- //



// X & Y MOVEMENTS  TODO: Constrain movements within the grey box (attenuation & offset)
document.addEventListener("mousemove", (e) => {
    document.getElementById("coordinates").innerHTML = "X: " + (e.x / main.clientWidth - 0.5) + ", Y: " + (0.5 - e.y / main.clientHeight);
    if (!pb) {
        pointer.style.top = (e.y - 5) + "px";
        pointer.style.left = (e.x - 5) + "px";
    }
    if (rec) {
        recording.push(e);
    }
});

// MOUSE BUTTONS
document.addEventListener("mousedown", (e) => {
    e.preventDefault();
    mouseDown(e);
});
document.addEventListener("mouseup", (e) => {
    e.preventDefault();
    if (e.button !== 2) return;
    gate(false);
});

function mouseDown(e) {
    var button = e.buttons;
    if (button === 1) {
        trigger();
    }
    else if (button === 2) {
        gate(true)
    }
    else if (button === 4) {
        changeMode();
    }
    else if (button === 8) {
	    erase();
    }
    else if (button === 16) {
        record(e);
    }
    else return button;
}

function trigger() {
    debug("TRIGGER PULSE");
}

function gate(active) {
    if (active)
        debug("GATE ON");
    else
        debug("GATE OFF");
}

function changeMode() {
    mode = !mode;
    debug("CHANGE MODE TO " + (mode ? "ATTENUATION" : "OFFSET"));
}

function record(e) {
    if (pb)
        erase();
    rec = !rec;
    if (!rec && recording.length !== 0)
        playback();
	else
	    recording.push(e);
    debug(rec ? "START RECORDING" : "PLAYBACK");
}

function erase() {
    if (rec)
        rec = false;
    for (let i = 0; i < timeouts.length; i++) {
        clearTimeout(timeouts[i]);
    }
    clearInterval(interval);

    recording.splice(0,recording.length);
    pb = false;
    debug("ERASE");
}

function playback() {
    pb = true;
    pointer.style.top = (recording[0].y - 5) + "px";
    pointer.style.left = (recording[0].x - 5) + "px";
    timeouts.push(recursiveTimeout(1));
    interval = setInterval(function() {
       timeouts.push(recursiveTimeout(1));
    }, (recording[recording.length-1].timeStamp - recording[0].timeStamp));
}

function recursiveTimeout(i) {
    if (i<recording.length) {
        setTimeout(function() {
            try {
                pointer.style.top = (recording[i].y - 5) + "px";
                pointer.style.left = (recording[i].x - 5) + "px";
            }
            catch(error) {
                console.warn(error);
            }
            timeouts.push(recursiveTimeout(i+1));
        }, (recording[i].timeStamp - recording[i-1].timeStamp));
    }
}

function debug(message) {
    var tag = document.createElement("p");
    var text = document.createTextNode(message);
    tag.appendChild(text);

    var element = document.getElementById("console");
    if (element.firstChild != null)
        element.removeChild(element.firstChild);
    element.appendChild(tag);
}

// SCROLL WHEEL
document.getElementById("main").onwheel = function(e) {
    e.preventDefault();
    wheel(e.deltaY);
};

function wheel(delta) {
    var message;
    if (delta > 0) {
        if (mode) {
            if (attenuation > -10)
                message = "Attenuation: " + (--attenuation);
            else message = "Attenuation: " + (attenuation);
        }
        else {
            if (offset > attenuation)
                message = "Offset: " + (--offset);
            else message = "Offset: " + (offset);
        }
    }
    else {
        if (mode) {
            if (attenuation < (-Math.abs(offset)))
                message = "Attenuation: " + (++attenuation);
            else message = "Attenuation: " + (attenuation);
        }
        else {
            if (offset < -(attenuation))
                message = "Offset: " + (++offset);
            else message = "Offset: " + (offset);
        }
    }
    changeRange();
    debug(message);
}

function changeRange() {
    let att = (10 + attenuation) * 10;
    range.style.width = att + "%";
    range.style.height = att + "%";

    let off = offset * 10;
    range.style.bottom = ((100-att)/2 + off/2) + "%";
    range.style.left = ((100-att)/2 + off/2) + "%";
}