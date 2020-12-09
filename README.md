# MouseModule
Mouse controlled eurorack module, both 2 and 1 mouse version. Software written in Python using [evdev](https://python-evdev.readthedocs.io) and [spidev](https://github.com/lthiery/SPI-Py). Hardware powered by [Raspberry Pi Zero](https://www.raspberrypi.org/documentation/hardware/raspberrypi/spi/README.md) and [MCP4922](http://ww1.microchip.com/downloads/en/DeviceDoc/22250A.pdf).

## Functions:
Interact with the mouse in order to trigger events monitored by the script in an asynchronous for loop. Already implemented functions are:
* `showCoord(x, y, t=0)`: shows the mouse coordinates and optionally the timestamp.
* `record(t)`: triggered by the `BTN_EXTRA`, this function should start the recording and stop the recording (thus starting the playback). Takes as argument the timestamp of the event wich triggered the function. When this function is active, triggering the `erase()` function will stop and erase the recording.
* `erase()`: triggered by the `BTN_SIDE`, this function erase the recorded automation. When `record(t)` is on, triggering this function will stop and erase the recording.
* `gate()`: triggered by the `BTN_RIGHT`, this function should send a gate signal as long as the button is hold.
* `trigger()`: triggered by the `BTN_LEFT`, this function sends a trigger pulse.
* `wheel(plus)`: triggered by scrolling the wheel, this function should increase or decrease the CV attenuation (if in attenuation mode) or the offset (if in offset mode). The mode can be changed by pressing `BTN_MIDDLE`.

## To do:
- [x] Find a Python library for mouse events
- [x] Check for mice
- [x] Monitor the mice events
- [x] Find a Python SPI library
- [ ] Implement the SPI interface
- [ ] Complete the functions
- [x] Design the DAC board
- [ ] Prototype


## Hardware:
2 mice version
<p><img src='./Mouse%20module.svg'></p>
1 mouse version
<p><img src='./OneMouse/Mouse%20module%202.svg'></p>
