// GLOBAL VARIABLES //
let mode = true, rec = false, pb = false;
let attenuation = 0, offset = 0, maxAttenuation = 20, border = 0.5;
let startAtt, startOff, startMode;
let width = main.clientWidth, height = main.clientHeight;
let ev;
let posX, posY;
let recording = new Array();
const pointer = document.getElementById("pointer");
const range = document.getElementById("range");
let timeouts = new Array(), interval;
function EventData(type, buttons, clientX, clientY, deltaY, timeStamp) {
    this.type = type;
    this.buttons = buttons;
    this.clientX = clientX;
    this.clientY = clientY;
    this.deltaY = deltaY;
    this.timeStamp = timeStamp;
}

// TODO
// BUG: attenuation problem in playback

addListeners();

function handleMouseMove(e) {
    posX = e.clientX;
    posY = height - e.clientY;
    ev = new EventData(e.type, e.buttons, e.clientX / width - 0.5, (height - e.clientY) / height - 0.5, e.deltaY, Math.round(e.timeStamp));
    move(ev);
}

function handleMouseDown(e) {
    e.preventDefault();
    ev = new EventData(e.type, e.buttons, e.clientX / width - 0.5, (height - e.clientY) / height - 0.5, e.deltaY, Math.round(e.timeStamp));
    mouseDown(ev);
}

function handleMouseUp(e) {
    e.preventDefault();
    if (e.button !== 2) return;
    ev = new EventData(e.type, e.button, e.clientX / width - 0.5, (height - e.clientY) / height - 0.5, e.deltaY, Math.round(e.timeStamp));
    gate(ev);
}

function handleWheel(e) {
    //e.preventDefault();
    ev = new EventData(e.type, e.buttons, e.clientX / width - 0.5, (height - e.clientY) / height - 0.5, e.deltaY, Math.round(e.timeStamp));
    wheel(ev);
}

function handleKeyDown(e) {
    if (e.key === "r" || e.key === "R") {
        console.log(e);
        ev = new EventData("mousedown", 16, posX, posY, 0, Math.round(e.timeStamp));
        record(ev);
    }
    else if (e.key === "e" || e.key === "E") {
        erase();
    }
}

function addListeners() {
    document.addEventListener("mousemove", handleMouseMove);
    document.addEventListener("mousedown", handleMouseDown);
    document.addEventListener("mouseup", handleMouseUp);
    document.addEventListener("wheel", handleWheel);

    // Only for debug
    document.addEventListener("keydown", handleKeyDown);
    removed = false;
}

function removeListeners() {
    document.removeEventListener("mousemove", handleMouseMove);
    document.removeEventListener("mousedown", handleMouseDown);
    document.removeEventListener("mouseup", handleMouseUp);
    document.removeEventListener("wheel", handleWheel);
    document.removeEventListener("keydown", handleKeyDown);

    document.addEventListener("mousedown", handleErase);
    // Only for debug
    document.addEventListener("keydown", handleEraseKey);

    removed = true;
}

function handleErase(e) {
    e.preventDefault();
    if (e.buttons === 8) {
        erase();
    }
    else if (e.buttons === 16) {
        erase();
        ev = new EventData("mousedown", 16, e.clientX, height - e.clientY, 0, Math.round(e.timeStamp));
        record(ev);
    }
}

function handleEraseKey(e) {
    if (e.key === "e" || e.key === "E") {
        erase();
    }

    // This is not working properly
    else if (e.key === "r" || e.key === "R") {
        erase();
        ev = new EventData("mousedown", 16, 0, 0, 0, Math.round(e.timeStamp));
        record(ev);
    }
}

function move(e) {
    constrain(e);
    document.getElementById("coordinates").innerHTML = "X: " + e.clientX + ", Y: " + e.clientY;
    pointer.style.bottom = ((e.clientY + 0.5) * height - 5) + "px";
    pointer.style.left = ((e.clientX + 0.5) * width - 5) + "px";
    if (rec) {
        recording.push(e);
    }
    sendServer(e);
}

function constrain(e) {
    let max = border + (offset / (maxAttenuation * 2));
    let min = -border + (offset / (maxAttenuation * 2));
    if (e.clientX > max)
        e.clientX = max;
    else if (e.clientX < min)
        e.clientX = min;

    if (e.clientY > max)
        e.clientY = max;
    else if (e.clientY < min)
        e.clientY = min;
}

function mouseDown(e) {
    const button = e.buttons;
    if (button === 1) {
        trigger(e);
    }
    else if (button === 2) {
        gate(e)
    }
    else if (button === 4) {
        changeMode(e);
    }
    else if (button === 8) {
        erase();
    }
    else if (button === 16) {
        record(e);
    }
    else debug(button);
}

function trigger(e) {
    if (rec) {
        recording.push(e);
    }
    debug("TRIGGER PULSE");
    sendServer(e)
    .then((res) => {console.log("response: " + res)})
    .catch((err) => {console.warn(err)});
}

function gate(e) {
    if (rec)
        recording.push(e);
    if (e.type === "mousedown") {
        debug("GATE ON");
    }
    else {
        debug("GATE OFF");
    }
    sendServer(e)
    .then((res) => {console.log("response: " + res)})
    .catch((err) => {console.warn(err)});
}

function changeMode(e) {
    if (rec)
        recording.push(e);
    mode = !mode;
    debug("CHANGE MODE TO " + (mode ? "ATTENUATION" : "OFFSET"));
    sendServer(e);
}

function record(e) {
    rec = !rec;
    if (!rec && recording.length !== 0) { // start playback
        removeListeners();
        playback();
    }
    else { // start recording
        startAtt = attenuation;
        startOff = offset;
        startMode = mode;
        recording.push(e);
    }
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

    if (removed) {
        // remove listeners inserted in playback mode
        document.removeEventListener("mousedown", handleErase);
        document.removeEventListener("keydown", handleEraseKey);
        // add standard listeners
        addListeners();
    }
    pb = false;
    debug("ERASE");
}

function playback() {
    pb = true;
    // for (let i in recording) console.log(recording[i]);
    animationPlayback();
    interval = setInterval(animationPlayback, (recording[recording.length-1].timeStamp - recording[0].timeStamp));
}

function animationPlayback() {
    attenuation = startAtt;
    offset = startOff;
    mode = startMode;
    changeRange();
    move(recording[0]);
    timeouts.push(recursiveTimeout(1));
}

function recursiveTimeout(i) {
    if (i < recording.length) {
        setTimeout(function() {
            try {
                playbackEventHandler(recording[i]);
            }
            catch(error) {
                console.warn("Erased while handling playback event");
            }
            timeouts.push(recursiveTimeout(i+1));
        }, (recording[i].timeStamp - recording[i-1].timeStamp));
    }
}

function playbackEventHandler(e) {
    let type = e.type;
    if (type === "mousemove") {
        move(e);
    }
    else if (type === "mousedown") {
        if (e.buttons !== 16) mouseDown(e);
    }
    else if (type === "mouseup") {
        if (e.buttons !== 2) return;
        gate(e);
    }
    else if (type === "wheel") {
        wheel(e);
    }
    else console.warn("ERROR: Event not recognized");
}

function debug(message) {
    const tag = document.createElement("p");
    const text = document.createTextNode(message);
    tag.appendChild(text);

    const element = document.getElementById("console");
    if (element.firstChild != null)
        element.removeChild(element.firstChild);
    element.appendChild(tag);
}

// BUG: In playback mode there's an undesired attenuation offset
function wheel(e) {
    let message;
    if (e.deltaY > 0) {
        if (mode) {
            if (attenuation > -maxAttenuation) {
                attenuation -= 1;
                message = "Attenuation: " + (attenuation);
                sendServer(e);
            }
            else message = "Attenuation: " + (attenuation);
        }
        else {
            if (offset > attenuation) {
                message = "Offset: " + (--offset);
                sendServer(e);
            }
            else message = "Offset: " + (offset);
        }
    }
    else {
        if (mode) {
            if (attenuation < (-Math.abs(offset))) {
                message = "Attenuation: " + (++attenuation);
                sendServer(e);
            }
            else message = "Attenuation: " + (attenuation);
        }
        else {
            if (offset < -(attenuation)) {
                message = "Offset: " + (++offset);
                sendServer(e);
            }
            else message = "Offset: " + (offset);
        }
    }
    changeRange();
    move(e);
    debug(message);
}

// BUG: ↑
function changeRange() {
    border = 0.5 + (attenuation / (maxAttenuation * 2));
    // let att = (maxAttenuation + attenuation) * (100/maxAttenuation);
    const att = 100 * ((attenuation / maxAttenuation) + 1);
    range.style.width = att + "%";
    range.style.height = att + "%";

    const off = offset * (100/maxAttenuation);
    range.style.bottom = ((100-att)/2 + off/2) + "%";
    range.style.left = ((100-att)/2 + off/2) + "%";
}

async function sendServer(e) {
    const options = {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(e)
    }
    const response = await fetch("/", options);
    return await response.text();
    return;
}
