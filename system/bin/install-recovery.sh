#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:19649784:43fcf6a9212c562a510aa4cdd8524805d39729a5; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:16192756:ea8cf74dff2b7f15dc452b9eec306386c4081237 EMMC:/dev/block/bootdevice/by-name/recovery 43fcf6a9212c562a510aa4cdd8524805d39729a5 19649784 ea8cf74dff2b7f15dc452b9eec306386c4081237:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
