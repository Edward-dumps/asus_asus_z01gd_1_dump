#!/bin/sh

TAG="BMS"
ret=`/system/bin/batt_type 1`
if [ "$ret" == "ascent_100K" ];	then
	log -t "$TAG" "set batt property as 1 for 100K.."
	setprop atd.batteryid.status 1
	echo "ok 1"
else
	log -t "$TAG" "set batt property as 0.."
	setprop atd.batteryid.status 0
	echo "ok 0"
fi

if [ "$ret" == "ascent_51K" ];	then
	log -t "$TAG" "set batt property as 1 for 51K.."
	setprop atd.batteryid.status 1
	echo "ok 1"
fi