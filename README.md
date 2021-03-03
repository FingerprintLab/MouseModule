# MouseModule

This is an eurorack module that processes mouse events through the [Raspberry Pi Zero](https://www.raspberrypi.org/documentation/hardware/raspberrypi/spi/README.md) and [MCP4922](http://ww1.microchip.com/downloads/en/DeviceDoc/22250A.pdf) and outputs 2 CV signals (for the X and Y coordinates) a GATE signal (controlled by the left button) and a TRIGGER signal (controlled by the roght button). It has also recording and playback capabilities with more complex mice.  

## Functions

Interact with the mouse in order to trigger events monitored by the script in an asynchronous `for` loop. Already implemented functions are:

- `showCoord(x, y, t=0)`: shows the mouse coordinates and optionally the timestamp.
- `record(t)`: triggered by the `BTN_EXTRA`, this function should start the recording and stop the recording (thus starting the playback). Takes as argument the timestamp of the event wich triggered the function. When this function is active, triggering the `erase()` function will stop and erase the recording.
- `erase()`: triggered by the `BTN_SIDE`, this function erase the recorded automation. When `record(t)` is on, triggering this function will stop and erase the recording.
- `gate()`: triggered by the `BTN_RIGHT`, this function should send a gate signal as long as the button is hold.
- `trigger()`: triggered by the `BTN_LEFT`, this function sends a trigger pulse.
- `wheel(plus)`: triggered by scrolling the wheel, this function should increase or decrease the CV attenuation (if in attenuation mode) or the offset (if in offset mode). The mode can be changed by pressing `BTN_MIDDLE`.

## Hardware

<p><img src='hardware.svg'></p>
