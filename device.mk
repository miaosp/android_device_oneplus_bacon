# This file includes all definitions that apply to ALL find7a devices, and
# are also specific to find7a devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/oneplus/bacon/overlay
    
# Ramdisk
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/configs/init.bacon.rc:root/init.qcom.rc \
    device/oneplus/bacon/configs/fstab.bacon:root/fstab.qcom

# qcom init stuff
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/init.qcom.syspart_fixup.sh:system/etc/init.qcom.syspart_fixup.sh

#sdcard permissions fix
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/configs/init.sdcard_perms.sh:system/etc/init.sdcard_perms.sh

# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

# Sensor configuration from Oppo
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/sensor/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.speaker=true

# Inherit from msm8974-common
$(call inherit-product, device/oppo/msm8974-common/common.mk)
