# This file includes all definitions that apply to ALL bacon devices, and
# are also specific to bacon devices
#
# Everything in this directory will become public

# Inherit commom repo
$(call inherit-product, device/oppo/msm8974-common/oppo.mk)
# Inherit from proprietary blobs
$(call inherit-product-if-exists, vendor/oneplus/bacon/bacon-vendor.mk)

# Device specific overlays
DEVICE_PACKAGE_OVERLAYS := device/oneplus/bacon/overlay

PRODUCT_PACKAGES += \
    charger_res_images_bacon \
    charger_bacon

# Ramdisk
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/rootdir/init.bacon.rc:root/init.bacon.rc \
    device/oneplus/bacon/rootdir/init.qcom-common.rc:root/init.qcom-common.rc \
    device/oneplus/bacon/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/oneplus/bacon/rootdir/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    device/oneplus/bacon/rootdir/ueventd.bacon.rc:root/ueventd.bacon.rc \
    device/oneplus/bacon/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/oneplus/bacon/rootdir/fstab.bacon:root/fstab.bacon \
    device/oneplus/bacon/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# Config files for touch and input
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/oneplus/bacon/configs/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/oneplus/bacon/configs/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/oneplus/bacon/configs/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl

# Media config files
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/media_codecs.xml:system/etc/media_codecs.xml \
    device/oneplus/bacon/media_profiles.xml:system/etc/media_profiles.xml

# Audio config files
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/oneplus/bacon/mixer_paths.xml:/system/etc/mixer_paths.xml


# qcom init stuff
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/init.qcom.syspart_fixup.sh:system/etc/init.qcom.syspart_fixup.sh \
    device/oneplus/bacon/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

#sdcard permissions fix
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/configs/init.sdcard_perms.sh:system/etc/init.sdcard_perms.sh \

#thermal-engine
PRODUCT_COPY_FILES += \
        device/oneplus/bacon/configs/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf

# Wifi config
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    device/oneplus/bacon/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/oneplus/bacon/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    device/oneplus/bacon/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/oneplus/bacon/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Hardware modules to build
PRODUCT_PACKAGES += \
    hwcomposer.msm8974 \
    gralloc.msm8974 \
    copybit.msm8974 \
    memtrack.msm8974 \
    lights.qcom \
    camera-wrapper.msm8974

PRODUCT_PACKAGES += \
    audio.primary.msm8974 \
    audio_policy.msm8974 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw \
    libc2dcolorconvert

# wifi
PRODUCT_PACKAGES += \
    mac-update \
    wcnss_service \
    WCNSS_qcom_cfg.ini \
    WCNSS_qcom_wlan_nv.bin \
    regulatory.bin \
    crda

PRODUCT_COPY_FILES += \
    device/oneplus/bacon/rootdir/etc/init.bacon.bt.sh:system/etc/init.bacon.bt.sh

# recursively chown media_rw script
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/rootdir/etc/init.d/mountsd:system/etc/init.d/mountsd

PRODUCT_COPY_FILES += \
    device/oneplus/bacon/rootdir/etc/init.d/mvcache:system/etc/init.d/mvcache

# Sensor configuration from Oppo
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/sensor/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

# Properties

# bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=480 \
    persist.hwc.mdpcomp.enable=true

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.eons.enabled=false

# Ril
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ril.subscription.types=NV,RUIM \
    ro.telephony.ril_class=OppoRIL

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.recordable.rgba8888=1

# Oppo-specific
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oppo.version=US \
    ro.xxversion=V1.0 \
    ro.bootversion=V1.1

# qcom
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.sensors.gestures=false \
    ro.qc.sdk.camera.facialproc=true \
    ro.qc.sdk.gestures.camera=false

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

#Sensor test
PRODUCT_COPY_FILES += \
    device/oneplus/bacon/sensor/libsensor_thresh.so:/vendor/lib/libsensor_thresh.so
    
# Inherit from proprietary blobs
$(call inherit-product-if-exists, vendor/oneplus/bacon/bacon-vendor.mk)
