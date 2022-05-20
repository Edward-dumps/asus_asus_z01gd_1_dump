#!/system/bin/sh
gesture_type=`getprop persist.asus.gesture.type`
echo "$gesture_type" > /sys/bus/i2c/devices/i2c-5/5-0038/gesture_mode

