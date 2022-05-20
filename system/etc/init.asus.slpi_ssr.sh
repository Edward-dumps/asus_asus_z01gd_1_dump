#!/system/bin/sh

#ASUS_BSP +++ Shawn_Huang slpi ssr
echo slpi_ssr > /sys/power/wake_lock
sns_dump_pm
sns_dump_request
sns_restart
sleep 1
setprop sys.asus.ssc.reset 0
echo slpi_ssr > /sys/power/wake_unlock
#ASUS_BSP --- Shawn_Huang slpi ssr
