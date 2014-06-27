# Inherit from MSM8974 common
-include device/oppo/msm8974-common/BoardConfigCommon.mk

LOCAL_PATH := device/oneplus/bacon

TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_OTA_ASSERT_DEVICE := bacon,A0001

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DOPPO_CAMERA_HARDWARE

# Recovery:Start
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/configs/fstab.bacon

# don't complier webviewchromium
PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

# inherit from the proprietary version
-include vendor/oneplus/bacon/BoardConfigVendor.mk
