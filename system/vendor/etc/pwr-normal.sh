#!/bin/sh
#This is normal mode!
setprop persist.asus.power.mode  normal
echo "performance mode" > /dev/kmsg
