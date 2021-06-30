// --------------- EXPRESS --------------- //
const path = require("path");
const express = require('express');
const bodyParser = require("body-parser");

const port = 3000;
const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname + '/client')));

app.get("/", function(req, res) {
    res.sendFile(path.join(__dirname + 'index.html'));
});

app.post("/", (req, res) => {
    //console.log("Request:");
    //console.log(req.body);
    if (req.body.type === "mousedown") {
        if (req.body.buttons === 1) {
            console.log("trigger pulse requested");
            trigger();
        } else if (req.body.buttons === 2) {
            console.log("gate on requested");
            gate(true);
        }
    } else if (req.body.type === "mouseup" && req.body.buttons === 2) {
        console.log("gate off requested");
        gate(false);
    } else if (req.body.type === "mousemove") {
        console.log("mouse moved to X: " + req.body.clientX + ", Y: " + req.body.clientY);
        move(req.body.clientX, req.body.clientY);
    }
    res.send("communication succeeded");
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`)
});
// ----------------- RPIO ---------------- //
const PIN_PWM_X = 12;
const PIN_GATE = 29;
const PIN_TRIG = 31;
const PIN_PWM_Y = 33;
const range = 1024;
const clockdiv = 8;
const rpio = require("rpio");

rpio.open(PIN_PWM_X, rpio.PWM);
rpio.open(PIN_PWM_Y, rpio.PWM);
rpio.pwmSetClockDivider(clockdiv);
rpio.pwmSetRange(PIN_PWM_X, range);
rpio.pwmSetRange(PIN_PWM_Y, range);
rpio.open(PIN_GATE, rpio.OUTPUT, rpio.LOW);
rpio.open(PIN_TRIG, rpio.OUTPUT, rpio.LOW);

function trigger() {
    rpio.write(PIN_TRIG, rpio.HIGH);
    rpio.usleep(500);
    rpio.write(PIN_TRIG, rpio.LOW); 
}

function gate(on) {
    rpio.write(PIN_GATE, on ? rpio.HIGH : rpio.LOW);
}

function move(clientX, clientY) {
    const x = Math.round((clientX + 0.5) * range);
    const y = Math.round((clientY + 0.5) * range);
    rpio.pwmSetData(PIN_PWM_X, x);
    rpio.pwmSetData(PIN_PWM_Y, y);
}
// --------------------------------------- //
