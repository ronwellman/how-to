#! /bin/bash

# device 11 found with xinput command
device=11

# get the state
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

# toggle the state
if [ $state == '1' ];then
  xinput --disable $device
else
  xinput --enable $device
fi
