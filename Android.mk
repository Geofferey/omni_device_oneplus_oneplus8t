#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),$(filter $(TARGET_DEVICE),oneplus8t))

subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
$(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))


include $(CLEAR_VARS)
LOCAL_MODULE       := fake-wlan_mac.bin
LOCAL_MODULE_TAGS  := optional
$(shell mkdir -p $(TARGET_OUT_PRODUCT)/vendor_overlay/30/firmware/wlan/qca_cld)
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/qca_cld)
$(shell ln -sf /mnt/vendor/persist/qca6390/wlan_mac.bin $(TARGET_OUT_PRODUCT)/vendor_overlay/30/firmware/wlan/qca_cld/wlan_mac.bin)
$(shell ln -sf /mnt/vendor/persist/qca6390/wlan_mac.bin $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/wlan_mac.bin)

include $(CLEAR_VARS)

endif
