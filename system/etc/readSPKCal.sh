#!/system/bin/sh
if [ "$1" == "0" -o "$1" == "1" ]; then
	cat /data/data/cal_s_speaker$1_log.txt
fi
