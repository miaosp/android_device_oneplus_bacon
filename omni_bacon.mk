# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/bacon/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_bacon
PRODUCT_DEVICE := bacon
PRODUCT_BRAND := oneplus
PRODUCT_MODEL := One
BOARD_VENDOR := oppo
PRODUCT_MANUFACTURER := OnePlus

TARGET_VENDOR_PRODUCT_NAME := bacon
TARGET_VENDOR_DEVICE_NAME := A0001
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=A0001 PRODUCT_NAME=bacon

TARGET_CONTINUOUS_SPLASH_ENABLED := true

#get from w7ds thanks 
TARGET_USE_PREBUILT := false

ifeq ($(TARGET_USE_PREBUILT),true)
TARGET_PREBUILT_KERNEL := device/oneplus/bacon/prebuilt/kernel
BOARD_MKBOOTIMG_ARGS    += --dt device/oneplus/bacon/prebuilt/dt.img
else
# Inline kernel
TARGET_KERNEL_SOURCE := kernel/oppo/msm8974
TARGET_KERNEL_CONFIG := msm8974_find7op_defconfig
endif

# Inherit from proprietary blobs
$(call inherit-product-if-exists, vendor/oneplus/bacon/bacon-vendor.mk)

