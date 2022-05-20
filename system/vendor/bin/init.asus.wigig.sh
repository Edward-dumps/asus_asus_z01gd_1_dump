#!/system/bin/sh
LOG_TAG=wigig-support
id=`getprop ro.boot.id.rf`
CustomerID=`getprop ro.config.CID`
MultisimID=`getprop persist.radio.multisim.config`
debug=`getprop persist.debug.wigig.support`
log -t $LOG_TAG ro.boot.id.rf=$id, persist.radio.multisim.config=$MultisimID

setprop persist.vendor.wigig.enable 1
enable=`getprop persist.vendor.wigig.enable`
log -t $LOG_TAG persist.vendor.wigig.enable=$enable

if [ "$MultisimID" == "dsds" ] || [ "$MultisimID" == "dsda" ]; then
    setprop persist.asus.wigig.support 0
    log -t $LOG_TAG ADX persist.asus.wigig.support 0
else
    if [[ "$id" -ge "1"  &&  "$id" -le "4" ]] ; then
        setprop persist.asus.wigig.support 0
        log -t $LOG_TAG rf.id persist.asus.wigig.support 0
    elif [ "$id" -eq "0" ] || [[ "$id" -ge "5" && "$id" -le "7" ]] ; then
        setprop persist.asus.wigig.support 1
        log -t $LOG_TAG rf.id persist.asus.wigig.support 1
    else
        setprop persist.asus.wigig.support 0
        log -t $LOG_TAG else persist.asus.wigig.support 0
    fi
fi

if [ "$debug" == "1" ] ; then
    setprop persist.asus.wigig.support 1
    log -t $LOG_TAG debug persist.asus.wigig.support 1
fi
