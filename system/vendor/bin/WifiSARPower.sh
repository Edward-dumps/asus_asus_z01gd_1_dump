ReceiverOn=`getprop sys.asus.sar.audio`
Wifion=`getprop wlan.driver.status`
CellCountry=`getprop gsm.operator.iso-country`
FactoryCountry=`getprop ro.config.versatility`
CustomerID=`getprop ro.config.CID`

log -t WifiSARPower enter ReceiverOn=$ReceiverOn Wifion=$Wifion CellCountry=$CellCountry FactoryCountry=$FactoryCountry CustomerID=$CustomerID

case "$ReceiverOn" in
    "1")
        if [ "$Wifion" == "ok" ] ; then
            case "$CustomerID" in
                "VF_IT")
                    vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 1 --NUM_SPECS 0 --END_CMD
                    log -t WifiSARPower SAR_SET ENABLE 1 VF_IF | WIND
                ;;
                *)
                    case "$CellCountry" in
                        *"us"* | *"ca"* | *"mx"* | *"co"* | *"in"* | *"th"*)
                            vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 1 --NUM_SPECS 0 --END_CMD
                            log -t WifiSARPower SAR_SET ENABLE 1 us ca mx co in
                        ;;
                        *)
                            if [ "$FactoryCountry" == "US" ] || [ "$FactoryCountry" == "IN" ] || [ "$FactoryCountry" == "TH" ] ; then
                                vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 1 --NUM_SPECS 0 --END_CMD
                                log -t WifiSARPower SAR_SET ENABLE 1 US IN
                            fi
                        ;;
                    esac
                ;;
            esac
        fi
    ;;
    "0")
        case "$Wifion" in
            "ok")
                vendor_cmd_tool -f /data/data/sar-vendor-cmd.xml -i wlan0 --START_CMD --SAR_SET --ENABLE 5 --NUM_SPECS 0 --END_CMD
                log -t WifiSARPower SAR_SET ENABLE 5
            ;;
        esac      
    ;;
esac
