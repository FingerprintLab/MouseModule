# MouseModule

This is an eurorack module that processes mouse events through the [Raspberry Pi Zero](https://www.raspberrypi.org/documentation/hardware/raspberrypi/spi/README.md) and [MCP4922](http://ww1.microchip.com/downloads/en/DeviceDoc/22250A.pdf) and outputs 2 CV signals (for the X and Y coordinates) a GATE signal (controlled by the left button) and a TRIGGER signal (controlled by the roght button). It has also recording and playback capabilities with more complex mice.  

## Software schedule

- Run the shell script by typing `./command.sh` to open the browser (Chromium) in kiosk mode and navigate to `localhost:3000` (this step should be automated).  
- The HTML page contains the js program that collects all mouse events and send them to the local server.
- The server uses the [rpio](https://www.npmjs.com/package/rpio) library to send data to the DAC or the GPIO pins.

## Functions

The software is written in javascript and mainly contains the following functions:

- `move`  
- `record`  
- `erase`  
- `gate`  
- `trigger`  
- `changeMode`
- `wheel(plus)`  

## Hardware

![hardware](hardware.svg)