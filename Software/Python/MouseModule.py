import os
import asyncio
import evdev
from evdev import InputDevice, categorize, ecodes
## import spi

os.system("cls" if os.name == "nt" else "clear")

def showCoord(x, y, time=0):
    if time == 0:
        print ("X=", x, " Y=", y)
    else:
        print ("X=", x, " Y=", y, " T=", time)

def record(t):
    if rec:
        print("Start recording")
        # Record using timestamps
        
    else:
        print("Stop recording, start playback")
        # Stop record
        
def erase():
    print("Erase recording")
    # Erase recorded automation

def gate():
    if gt:
        print("Start gate signal")
        # Start gate
        
        
    else:
        print("Stop gate signal")
        # Stop gate

def trigger():
    print("Trigger pulse")
    # Send pulse

def wheel(plus):
    if os:
        if plus:
            print("Increase offset")
        else:
            print("Decrease offset")
    else:
        if plus:
            print("Increase range")
        else:
            print("Decrease range")

rec = False
gt = False
os = False
#device = evdev.InputDevice("/dev/input/event2")
devices = [evdev.InputDevice(path) for path in evdev.list_devices()]
for dev in devices:
    if "mouse" in dev.name or "Mouse" in dev.name:
        device = dev
        print (device)
        #a = dev.capabilities(True, True)
        #print(a)

## device_0 = spi.openSPI(device="/dev/spidev0.0",mode=0,speed=20000000,bits=12,delay=0)

async def helper(device):
    async for event in device.async_read_loop():

        time = event.timestamp()
        
        if event.type == ecodes.EV_ABS: 
            absX = float((device.absinfo(ecodes.ABS_X)).value) / float((device.absinfo(ecodes.ABS_X)).max)
            absY = float((device.absinfo(ecodes.ABS_Y)).value) / float((device.absinfo(ecodes.ABS_Y)).max)
            showCoord(absX, absY)

        elif event.type == ecodes.EV_KEY:
            keyEvent = categorize(event)
            if isinstance(keyEvent.keycode, list):
                keyCode = keyEvent.keycode[0]
                keyState = keyEvent.keystate
            else:
                keyCode = keyEvent.keycode
                keyState = keyEvent.keystate
            
            global rec
            global gt
            global os
            
            if keyCode == "BTN_EXTRA" and keyState == 1:
                rec = not rec
                record(time)
                
            elif keyCode == "BTN_SIDE" and keyState == 1:
                if rec:
                    rec = False
                    record(time)
                erase()
                
            elif keyCode == "BTN_LEFT" and keyState == 1:
                trigger()
                
            elif keyCode == "BTN_RIGHT":
                if keyState == 1:
                    gt = True
                    gate()
                else:
                    gt = False
                    gate()
                    
            elif keyCode == "BTN_MIDDLE" and keyState == 1:
                if os:
                    print("Attenuator mode")
                    os = False
                else:
                    print("Offset mode")
                    os = True
                
        elif event.type == ecodes.EV_REL:
            if event.code == 0 or event.code == 1:
                print("Mouse moved")
                #x = dev.absinfo(ecodes.REL_X)
                #print(x)
                
            elif event.code == 8:
                if event.value == -1:
                    wheel(True)
                else:
                    wheel(False)
                

loop = asyncio.get_event_loop()
loop.run_until_complete(helper(device))
## spi.closeSPI(device_0)
