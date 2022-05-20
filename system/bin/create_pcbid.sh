#!/system/bin/sh

echo "PCBID TEST: +++"

rm /data/data/pcbid_status_str_tmp

PROP_STAGE=$(getprop ro.boot.id.stage)
PROP_PROJECT=$(getprop ro.boot.id.prj)

STAGE=
PROJECT=

case $PROP_PROJECT in
	"3" )
		PROJECT='ZS551KL'
		echo "PCBID TEST: PROJECT="$PROJECT
		;;
	*)
		PROJECT='UNKNOW('$PROP_PROJECT')'
		echo "PCBID TEST: PROJECT="$PROJECT
		;;
esac

case $PROP_STAGE in
	"15" )
		STAGE='EVB'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	"0" )
		STAGE='EVB3'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	"1" )
		STAGE='SR1'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	"2" )
		STAGE='EVB5'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	"3" )
		STAGE='ER1'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	"4" )
		STAGE='ER2'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	"5" )
		STAGE='PREPR'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	"6" )
		STAGE='PR1'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	"7" )
		STAGE='MP'
		echo "PCBID TEST: STAGE="$STAGE
		;;
	*)
		STAGE='UNKNOW('$PROP_STAGE')'
		echo "PCBID TEST: STAGE="$STAGE
		;;
esac

echo $PROJECT"_"$STAGE > /data/data/pcbid_status_str_tmp
chmod 00777 /data/data/pcbid_status_str_tmp

echo "PCBID TEST: ---"
