# MouseModule
Mouse controlled eurorack module. Software written in Python using [evdev](https://python-evdev.readthedocs.io). Hardware powered by Raspberry Pi Zero and MCP4922.

## Functions:
Interact with the mouse in order to trigger events monitored by the script in an asynchronous for loop. Already implemented functions are:
* `showCoord(x, y, t=0)`: shows the mouse coordinates and optionally the timestamp.
* `record(t)`: triggered by the `BTN_EXTRA`, this function should start the recording. Takes as argument the timestamp of the event wich triggered the function. When `playback()` is on, triggering this function will stop the playback to start recording.
* `playback()`: triggered by the `BTN_SIDE`, this function wich should start the playback. When `record(t)` is on, triggering this function will stop the recording to start the playback.
* `gate()`: triggered by the `BTN_RIGHT`, this function should send a gate signal as long as the button is hold.
* `trigger()`: triggered by the `BTN_LEFT`, this function sends a trigger pulse.
* `wheel(plus)`: triggered by scrolling the wheel, this function should increase or decrease the CV attenuation (if in attenuation mode) or the offset (if in offset mode). The mode can be changed by pressing `BTN_MIDDLE`.

## To do:
- [x] Find a Python library for mouse events
- [ ] Check for mouses
- [x] Monitor the mouse events
- [ ] Find a Python SPI library
- [ ] Implement the SPI interface
- [ ] Complete the functions
- [x] Design the DAC board
- [ ] Build the DAC board


## Hardware:
<p><img src='./Mouse%20module.svg'></p>
