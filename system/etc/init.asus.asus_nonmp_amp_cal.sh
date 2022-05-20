#!/system/bin/sh
mkdir /persist/audio/
chmod 777 /persist/audio
/system/bin/factorytest -t 25 -l /system/etc/speaker_l.ftcfg -r /system/etc/speaker_r.ftcfg -v

tinymix 'Stereo Calibration' '255'
