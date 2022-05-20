#!/system/bin/sh

/system/bin/log -t "dts" -p e  "check_dts"
ori_version=`getprop persist.asus.version`
/system/bin/log -t "dts" -p e  "$ori_version"
new_version=`getprop ro.build.version.incremental`
/system/bin/log -t "dts" -p e  "$new_version"


if [ "$ori_version" = "" ]; then
    #when ori_version is null, this is from clean boot, initialize the value from ro.build.version.incremental
	rm  /data/misc/dts/current_bluetooth44k
	rm  /data/misc/dts/current_bluetooth48k
	
	rm  /data/misc/dts/current_lineout
	rm  /data/misc/dts/current_speaker_off
	rm  /data/misc/dts/current_speaker_on
	rm  /data/misc/dts/dts_hpx_settings
	cp  /system/etc/dts/current_bluetooth48k /data/misc/dts/
	cp  /system/etc/dts/current_bluetooth44k /data/misc/dts/
	cp  /system/etc/dts/current_lineout /data/misc/dts/
	cp  /system/etc/dts/current_speaker_off /data/misc/dts/
	cp  /system/etc/dts/current_speaker_on /data/misc/dts/

	setprop persist.asus.version "$new_version"
	/system/bin/log -t "dts" -p e  "is null"
	/system/bin/log -t "dts" -p e  "$new_version"
	
else
    #when ori_version has value, check if the value equals to ro.build.version.incremental.
    #if not, remove old settings of DTS
    
    /system/bin/log -t "dts" -p e  "not null"
	
    if [ "$ori_version" != "$new_version" ]; then
		
		rm  /data/misc/dts/current_bluetooth44k
		rm  /data/misc/dts/current_bluetooth48k
		
		rm  /data/misc/dts/current_lineout
		rm  /data/misc/dts/current_speaker_off
		rm  /data/misc/dts/current_speaker_on
		rm  /data/misc/dts/dts_hpx_settings
		cp  /system/etc/dts/current_bluetooth48k /data/misc/dts/
		cp  /system/etc/dts/current_bluetooth44k /data/misc/dts/
		cp  /system/etc/dts/current_lineout /data/misc/dts/
		cp  /system/etc/dts/current_speaker_off /data/misc/dts/
		cp  /system/etc/dts/current_speaker_on /data/misc/dts/

		setprop persist.asus.version "$new_version"
		
		/system/bin/log -t "dts" -p e  "not equal"
		/system/bin/log -t "dts" -p e  "$new_version"
    fi
fi

	chown system:audio /data/misc/dts/current_bluetooth48k
	chown system:audio /data/misc/dts/current_bluetooth44k
	chown system:audio /data/misc/dts/current_lineout
	chown system:audio /data/misc/dts/current_speaker_off
	chown system:audio /data/misc/dts/current_speaker_on

