// GLOBAL VARIABLES //
var mode = true, rec = false;
var attenuation = 0, offset = 0;
var recording = new Array();

// ONLY FOR DEBUGGING PURPOSES
document.addEventListener("keydown", (e) => {
    e.preventDefault();
    if (e.key === "r" || e.key === "R") {
        rec = !rec;
        if (!rec && recording.length !== 0)
            playback();
	    else
	        recording.push(e);
         (rec ? "START RECORDING" : "PLAYBACK");
    }
    else if (e.key === "e" || e.key === "E") {
        if (rec)
            rec = false;
        recording.splice(0,recording.length);
        return "ERASE";
    }
});

document.addEventListener("mousemove", (e) => {
    document.getElementById("coordinates").innerHTML = "X: " + e.x + ", Y: " + e.y;
    if (rec) {
        recording.push(e);
    }
})
document.addEventListener("mousedown", (e) => {
    e.preventDefault()
    var tag = document.createElement("p");
    var text = document.createTextNode(mouseDown(e));
    tag.appendChild(text);

    var element = document.getElementById("console");
    if (element.firstChild != null)
        element.removeChild(element.firstChild);
    element.appendChild(tag);
})
document.addEventListener("mouseup", (e) => {
    e.preventDefault()
    var tag = document.createElement("p");
    if (e.button !== 2) return
    var text = document.createTextNode("STOP GATE");
    tag.appendChild(text);

    var element = document.getElementById("console");
    if (element.firstChild != null)
        element.removeChild(element.firstChild);
    element.appendChild(tag);
})
document.getElementById("main").onwheel = function(e) {wheel(e)};


function wheel(e) {
    e.preventDefault();
    var tag = document.createElement("p");
    var text;
    if (e.deltaY > 0) {
        if (mode)
            text = document.createTextNode("Attenuation: " + (--attenuation)); //attenuation = attenuation - 1
        else
            text = document.createTextNode("Offset: " + (--offset));
    }
    else {
        if (mode)
            text = document.createTextNode("Attenuation: " + (++attenuation));
        else
            text = document.createTextNode("Offset: " + (++offset));
    }
    
    tag.appendChild(text);

    var element = document.getElementById("console");
    if (element.firstChild != null)
        element.removeChild(element.firstChild);
    element.appendChild(tag);
}


function mouseDown(e) {
    var button = e.buttons;
    if (button === 1) {
        return "TRIGGER PLUSE";
    }
    else if (button === 2) {
        return "START GATE";
    }
    else if (button === 4) {
        mode = !mode;
        return "CHANGE MODE TO " + (mode ? "ATTENUATION" : "OFFSET");
    }
    else if (button === 8) {
	    if (rec)
            rec = false;
        recording.splice(0,recording.length);
        return "ERASE";
    }
    else if (button === 16) {
        rec = !rec;
        if (!rec && recording.length !== 0)
            playback();
	    else
	        recording.push(e);
        return (rec ? "START RECORDING" : "PLAYBACK");
    }
    else return button;
}

function playback() {
    let pointer = document.getElementById("pointer");
    pointer.style.top = (recording[0].y - 5) + "px";
    pointer.style.left = (recording[0].x - 5) + "px";
    recursiveTimeout(1);
    setInterval(function() {
       recursiveTimeout(1);
    }, (recording[recording.length-1].timeStamp - recording[0].timeStamp));
}

function recursiveTimeout(i) {
    if (i<recording.length) {
        setTimeout(function() {
            pointer.style.top = (recording[i].y - 5) + "px";
            pointer.style.left = (recording[i].x - 5) + "px";
            recursiveTimeout(i+1);
        }, (recording[i].timeStamp - recording[i-1].timeStamp));
    }
}