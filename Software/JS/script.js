// GLOBAL VARIABLES //
var mode = true, rec = false;
var attenuation = 0, offset = 0;
var recording = new Array();


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
    if (rec) {
        recording.push(e);
    }
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
    if (rec) {
        recording.push(e);
    }
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
    if (rec) {
        recording.push(e);
    }
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
        console.log(mode);
        return "CHANGE MODE TO " + (mode ? "ATTENUATION" : "OFFSET");
    }
    else if (button === 8) {
        recording.splice(0,recording.length);
        return "ERASE";
    }
    else if (button === 16) {
        rec = !rec;
        if (!rec && recording.length === 0)
            console.log("Error: no recording to playback");
        else playback();
        return (rec ? "START RECORDING" : "PLAYBACK STOPPED");
    }
    else return button;
}

function playback() {
    console.log("In playback");
    let stop = false;
    while(stop) {
        document.addEventListener("mousedown", (e) => {
            e.preventDefault()
            if (e.buttons === 8)
                stop = true;
        });

        for (let i in recording) {
            console.log(i + ": ");
            console.log(recording[i]);
        }

        document.removeEventListener("mousedown");
    }
}