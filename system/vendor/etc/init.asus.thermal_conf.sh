#!/vendor/bin/sh
# Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of The Linux Foundation nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#

# No path is set up at this point so we have to do it here.
export PATH=/vendor/bin

THERMAL_LINK=`getprop sys.create.thermal_link`

if [ "$THERMAL_LINK" == "1" ]; then
	#ASUS_BSP +++ Show_Cai create symbolic link to vadc                                                                                                    
	SOC_PATH="/sys/devices/soc/"
	SEARCH_CPU_TEMP="asus_cpu_therm"                             
	SEARCH_PA_THERM1="asus_pa_therm1" 
	SEARCH_PA_THERM2="asus_pa_therm2"
	SEARCH_PM8998_THERM="asus_pm8998_therm"
	SEARCH_SKIN_TEMP="in_temp_skin_temp_input" 

	therm_check(){
		THERM_FILE=`find $SOC_PATH -name $1`
		if [ -f "$THERM_FILE" ]; then
			ln -s $THERM_FILE $2
			echo "[Thermal] link '$1' to '$2'"
		else
			echo "[Thermal] '$1' not found!!"
		fi
	}

	mkdir -p "/dev/therm/"                                                     
	chmod 755 "/dev/therm/"                                                   
	mkdir -p "/dev/therm/vadc"                                                
	chmod 755 "/dev/therm/vadc"
	therm_check $SEARCH_CPU_TEMP "/dev/therm/vadc/cpu_temp"
	therm_check $SEARCH_PA_THERM1 "/dev/therm/vadc/pa_therm1_temp"
	therm_check $SEARCH_PA_THERM2 "/dev/therm/vadc/pa_therm2_temp"
	therm_check $SEARCH_PM8998_THERM "/dev/therm/vadc/pm8998_temp"
	therm_check $SEARCH_SKIN_TEMP "/dev/therm/vadc/skin_temp"                   

	ln -s /sys/class/thermal/thermal_zone6/mtemp /dev/therm/vadc/msm_therm
	ln -s /sys/class/power_supply/parallel/charger_mtemp /dev/therm/vadc/smb1381_temp                                                                        
	#ASUS_BSP --- Show_Cai create symbolic link to vadc  

	#ASUS_BSP +++ Show_Cai create symbolic link for run-in test
	ln -s /system/vendor/bin/thermalAtdTool /data/data/Thermal
	sleep 10
	#ASUS_BSP --- Show_Cai creat symbolic link for run-in test
	setprop sys.create.thermal_link 0
fi

THERMAL_RESET=`getprop sys.thermal_engine.reset`
if [ "$THERMAL_RESET" == "1" ]; then
	stop thermal-engine
	start thermal-engine
	setprop sys.thermal_engine.reset 0
fi
