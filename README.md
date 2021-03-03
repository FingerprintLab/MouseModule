# MouseModule

This is an eurorack module that processes mouse events through the [Raspberry Pi Zero](https://www.raspberrypi.org/documentation/hardware/raspberrypi/spi/README.md) and [MCP4922](http://ww1.microchip.com/downloads/en/DeviceDoc/22250A.pdf) and outputs 2 CV signals (for the X and Y coordinates) a GATE signal (controlled by the left button) and a TRIGGER signal (controlled by the roght button). It has also recording and playback capabilities with more complex mice.  

## Software schedule

- Open the browser (bettere in kiosk mode) and navigate to `localhost:3000` (this step should be automated).
- The page contains the js program that collects all mouse events and send them to the local server.
- The server uses the [rpio](https://www.npmjs.com/package/rpio) library to send data to the DAC or the GPIO pins.

## Functions

The software is written in javascript and mainly contains the following functions:

- `move`: mouse movements change the `Vx` and `Vy` values.
- `record`: record all events.
- `erase`: erase recording.
- `gate`: start/stop `GATE` signal.
- `trigger`: send `TRIGGER` pulse.
- `changeMode`: change the scroll wheel behavior between attenuation and offset.
- `wheel`: increase/decrease attenuation or offset

## Hardware

![hardware](hardware.svg)