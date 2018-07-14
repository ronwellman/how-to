# Disable Touchpad
I love my XPS13.  It is my daily driver running Ubuntu Mate 18.04.  However, my biggest complaint is that when I type, more times than not, my palm hits the touchpad and causes the cursor to click.  This means that I'm typing somewhere else in a file or I just highlighted a bunch of text and typed over it.  I've tried to adjust sensitivity settings for the touchpad and even have it turn off while typing.  Either the settings in Ubuntu are not going into effect or they're not good enough.  Either way, I find myself constantly having to stop working to undo something I typed into or over.  Its frustrating and I began looking for additional options.

### Get the Touchpad's ID

```bash
xinput
```

returns

```
⎡ Virtual core pointer                    	id=2	[master pointer  (3)]
⎜   ↳ Virtual core XTEST pointer              	id=4	[slave  pointer  (2)]
⎜   ↳ DLL082A:01 06CB:76AF Touchpad           	id=11	[slave  pointer  (2)]
⎣ Virtual core keyboard                   	id=3	[master keyboard (2)]
    ↳ Virtual core XTEST keyboard             	id=5	[slave  keyboard (3)]
    ↳ Power Button                            	id=6	[slave  keyboard (3)]
    ↳ Video Bus                               	id=7	[slave  keyboard (3)]
    ↳ Power Button                            	id=8	[slave  keyboard (3)]
    ↳ Sleep Button                            	id=9	[slave  keyboard (3)]
    ↳ Integrated_Webcam_HD: Integrate         	id=10	[slave  keyboard (3)]
    ↳ Intel Virtual Button driver             	id=12	[slave  keyboard (3)]
    ↳ Intel HID events                        	id=13	[slave  keyboard (3)]
    ↳ Dell WMI hotkeys                        	id=14	[slave  keyboard (3)]
    ↳ AT Translated Set 2 keyboard            	id=15	[slave  keyboard (3)]
```

My XPS13 (9360) has a device id of 11 for Ubuntu Mate 18.04.

### Write a script to disable it
```bash
#! /bin/bash

# device 11 found with xinput command
device=11

# get state
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

# toggle the state
if [ $state == '1' ];then
  xinput --disable $device
else
  xinput --enable $device
fi
```

Save this file in ~/touchpad.sh and ensure it is executable.
```bash
chmod u+x touchpad.sh
```

### Keyboard Shortcut
Using the keyboard shortcuts menu, I was able to create a custom command mapped to the touchpad.sh file you just created.  I mapped my key to **\<CTRL\>+\<ALT\>+K**.  Now whenever I hit this sequence my touchpad is automatically disabled.  This allows me to write/develop without distractions.  This does not stop me from runnind a USB mouse if I need to and all I need to do is hit **<CTRL>+<ALT>+K** again to re-enable it.  I couldn't be happier with the effect.
