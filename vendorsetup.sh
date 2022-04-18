#
# Copyright (C) 2018-2020 OrangeFox Recovery Project
# Please maintain this if you use this script or any part of it
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# See <http://www.gnu.org/licenses/>.
#
FDEVICE="gemini"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}
if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export MISSING_DEPENDENCIES=true
    export LC_ALL="C"

    export FOX_R11=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
   	export PLATFORM_SECURITY_PATCH="2099-12-31"
   	export OF_OTA_RES_DECRYPT=1
   	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
   	export FOX_USE_BASH_SHELL=1
   	export FOX_ASH_IS_BASH=1
   	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_ZIP_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export OF_USE_GREEN_LED=1
   	export FOX_REPLACE_BUSYBOX_PS=1
   	export OF_DISABLE_DM_VERITY_FORCED_ENCRYPTION="1"
   	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
   	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
	export OF_USE_NEW_MAGISKBOOT="1"
   	export OF_USE_MAGISKBOOT="1"
	export OF_FORCE_MAGISKBOOT_BOOT_PATCH_MIUI="1"
   	export OF_NO_MIUI_OTA_VENDOR_BACKUP="1"
   	export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"

   	# quick backup defaults
    export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/vendor_image;"

   	export OF_MAINTAINER="unkl933"
    export FOX_VERSION="R11.1"
    export FOX_BUILD_TYPE="Stable"

OF_TARGET_DEVICES="gemini"
OF_USE_TWRP_SAR_DETECT="1"

	# let's log what are the build VARs that we used
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "PLATFORM_" >> $FOX_BUILD_LOG_FILE
  	fi

	add_lunch_combo omni_"$FDEVICE"-eng
	add_lunch_combo omni_"$FDEVICE"-userdebug
fi
#
