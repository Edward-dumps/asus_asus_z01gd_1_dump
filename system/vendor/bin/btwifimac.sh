setprop ro.btmac `btnvtool -x 2>&1`
setprop bt.version.driver `grep "Bluetooth Contoller SU Build info" /data/vendor/bluetooth/bt_fw_version.txt | sed 's/^.*: //g'`
wifi_mac=`grep "Intf0MacAddress" /factory/wlan_mac.bin`
wifi_mac=${wifi_mac//Intf0MacAddress=/ }
setprop ro.wifimac $wifi_mac
wifi_mac=`grep "Intf1MacAddress" /factory/wlan_mac.bin`
wifi_mac=${wifi_mac//Intf1MacAddress=/ }
setprop ro.wifimac_2 $wifi_mac

MultisimID=`getprop persist.radio.multisim.config`
target=`getprop ro.boot.id.rf`
if [ "$MultisimID" == "dsds" ] || [ "$MultisimID" == "dsda" ]; then
    wifi_version=`grep "wifi_version" /asusfw/wifi/open_wifi_version`
else
    if [[ "$id" -ge "1"  &&  "$id" -le "4" ]] ; then
        wifi_version=`grep "wifi_version" /asusfw/wifi/open_wifi_version`
    elif [ "$id" -eq "0" ] || [[ "$id" -ge "5" && "$id" -le "7" ]] ; then
        wifi_version=`grep "wifi_version" /asusfw/wifi/operator_wifi_version`
    else
        wifi_version=`grep "wifi_version" /asusfw/wifi/open_wifi_version`
    fi
fi

wifi_version=${wifi_version//wifi_version=/ }
setprop wifi.version.driver $wifi_version
wigig_mac=`cat /factory/wigig_mac.bin`
setprop ro.wigigmac $wigig_mac
