//var childProcess = require('child_process');
//childProcess.exec('chromium-browser -kiosk ../client/window.htm');


/*
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
        }
        else if (req.body.buttons === 2) {
            console.log("gate on requested");
            gate(true);
        }
    }
    else if (req.body.type === "mouseup" && req.body.buttons === 2) {
        console.log("gate off requested");
        gate(false);
    }
    res.send("communication succeeded");
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`)
});
// --------------------------------------- //
*/


// ----------------- RPIO ---------------- //
var rpio = require('rpio');

var pin = 12;           /* P12/GPIO18 */
var range = 1024;       /* LEDs can quickly hit max brightness, so only use */
var max = 128;          /*   the bottom 8th of a larger scale */
var clockdiv = 8;       /* Clock divider (PWM refresh rate), 8 == 2.4MHz */
var interval = 5;       /* setInterval timer, speed of pulses */
var times = 5;          /* How many times to pulse before exiting */

/*
 * Enable PWM on the chosen pin and set the clock and range.
 */
rpio.open(pin, rpio.PWM);
rpio.pwmSetClockDivider(clockdiv);
rpio.pwmSetRange(pin, range);

/*
 * Repeatedly pulse from low to high and back again until times runs out.
 */
var direction = 1;
var data = 0;
var pulse = setInterval(function() {
        rpio.pwmSetData(pin, data);
        if (data === 0) {
                direction = 1;
                if (times-- === 0) {
                        clearInterval(pulse);
                        rpio.open(pin, rpio.INPUT);
                        return;
                }
        } else if (data === max) {
                direction = -1;
        }
        data += direction;
}, interval, data, direction, times);

//rpio.open(PIN_OUT, rpio.OUTPUT, rpio.LOW);
//rpio.open(PIN_IN, rpio.INPUT, rpio.PULL_UP);

/*
function trigger() {
    rpio.write(PIN_OUT, rpio.HIGH);
    rpio.msleep(5);
    rpio.write(PIN_OUT, rpio.LOW); 
}

function gate(on) {
    rpio.write(PIN_OUT, on ? rpio.HIGH : rpio.LOW);
}
*/






/*
let buttonPressed = false;

function pollcb(pin) {
    rpio.msleep(10);
    if (rpio.read(PIN_IN)) return;
    if(pin === 0) buttonPressed = true;
    console.log(pin);
}

val = true;
setInterval(function() {
    setTimeout(function() {
        rpio.write(PIN_OUT, val ? rpio.HIGH : rpio.LOW);
        val = !val;
    }, 1)
}, 2);
rpio.poll(PIN_IN, pollcb, rpio.POLL_LOW);
*/
// --------------------------------------- //
