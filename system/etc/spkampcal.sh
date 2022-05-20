#!/system/bin/sh

factorytest -t 25 -l /system/etc/speaker_l.ftcfg -r /system/etc/speaker_r.ftcfg -v >/data/data/tas2557s_cal_err_log.txt

result=`cat /data/data/cal_s_speaker0_log.txt`

if [ "$result" != "0" ] && [ "$result" != "" ]; then
    echo "PASS"
else
    echo "FAIL"
fi
