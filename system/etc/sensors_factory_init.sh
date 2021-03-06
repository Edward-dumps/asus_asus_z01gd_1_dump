#!/system/bin/sh

PROXM_SPEC_FILE="/data/data/proximity_spec"
LIGHT_SPEC_FILE="/data/data/lightsensor_spec"
FRGB_SPEC_FILE="/data/data/frgbsensor_spec"

PROXM_INF_FILE="/factory/psensor_inf.nv"
PROXM_HI_FILE="/factory/psensor_hi.nv"
PROXM_LOW_FILE="/factory/psensor_low.nv"
PROXM_2CM_FILE="/factory/psensor_2cm.nv"
PROXM_3CM_FILE="/factory/psensor_3cm.nv"
PROXM_4CM_FILE="/factory/psensor_4cm.nv"
PROXM_5CM_FILE="/factory/psensor_5cm.nv"
LIGHT_FILE="/factory/lsensor.nv"
LIGHT_100_FILE="/factory/lsensor_100ms.nv"
LIGHT_50_FILE="/factory/lsensor_50ms.nv"
FRGB_LIGHT1_RAW_FILE="/factory/frgbsensor_light1_raw.nv"
FRGB_LIGHT2_RAW_FILE="/factory/frgbsensor_light2_raw.nv"
FRGB_LIGHT3_RAW_FILE="/factory/frgbsensor_light3_raw.nv"
FRGB_RATIO_RED_FILE="/factory/frgbsensor_red.nv"
FRGB_RATIO_GREEN_FILE="/factory/frgbsensor_green.nv"
FRGB_RATIO_BLUE_FILE="/factory/frgbsensor_blue.nv"
GSENSOR_X_FILE="/factory/gsensor_x.nv"
GSENSOR_Y_FILE="/factory/gsensor_y.nv"
GSENSOR_Z_FILE="/factory/gsensor_z.nv"

sensor_chmod()
{
	if [ -f $1 ];
	then
		echo "File $FILE exists"
		chmod 660 $1
		chown system:shell $1
	else
		echo "File $FILE does not exists"
		echo 0 > $1
		chmod 660 $1
		chown system:shell $1
	fi
}

sensor_chmod $PROXM_SPEC_FILE
sensor_chmod $LIGHT_SPEC_FILE
sensor_chmod $FRGB_SPEC_FILE

sensor_chmod $PROXM_INF_FILE
sensor_chmod $PROXM_HI_FILE
sensor_chmod $PROXM_LOW_FILE
sensor_chmod $PROXM_2CM_FILE
sensor_chmod $PROXM_3CM_FILE
sensor_chmod $PROXM_4CM_FILE
sensor_chmod $PROXM_5CM_FILE
sensor_chmod $LIGHT_FILE
sensor_chmod $LIGHT_100_FILE
sensor_chmod $LIGHT_50_FILE
sensor_chmod $FRGB_LIGHT1_RAW_FILE
sensor_chmod $FRGB_LIGHT2_RAW_FILE
sensor_chmod $FRGB_LIGHT3_RAW_FILE
sensor_chmod $FRGB_RATIO_RED_FILE
sensor_chmod $FRGB_RATIO_GREEN_FILE
sensor_chmod $FRGB_RATIO_BLUE_FILE

sensor_chmod $GSENSOR_X_FILE
sensor_chmod $GSENSOR_Y_FILE
sensor_chmod $GSENSOR_Z_FILE

exit 0
