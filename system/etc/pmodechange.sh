#!/system/bin/sh

pmode=`getprop sys.cpu.pmode`

if [ "$pmode" != "0" ]; then
	setprop sys.cpu.pmodeset 1

	echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
	echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
	echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
	echo performance > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
	echo performance > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
	echo performance > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
	echo performance > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
else
	pmodeset=`getprop sys.cpu.pmodeset`

	if [ "$pmodeset" == "1" ]; then
		setprop sys.cpu.pmodeset 0
	
		echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
		echo interactive > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
		echo interactive > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
		echo interactive > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
		echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
		echo interactive > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
		echo interactive > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
		echo interactive > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
	fi
fi

