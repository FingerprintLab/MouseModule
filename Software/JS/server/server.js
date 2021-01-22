//var childProcess = require('child_process'); 
//childProcess.exec('chromium-browser -kiosk ../client/window.htm');
const PIN_OUT = 31;
const PIN_IN = 29;
var rpio = require("rpio");

rpio.open(PIN_OUT, rpio.OUTPUT, rpio.LOW);
rpio.open(PIN_IN, rpio.INPUT, rpio.PULL_UP);

var buttonPressed = false;

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
