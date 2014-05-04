# This file includes all definitions that apply to ALL find7a devices, and
# are also specific to find7a devices
#
# Everything in this directory will become public

# Inherit commom repo
$(call inherit-product, device/oppo/msm8974-common/oppo.mk)

PRODUCT_PACKAGES += \
    charger_res_images_find7a \
    charger_find7a

# Ramdisk
PRODUCT_COPY_FILES += \
    device/oppo/find7a/rootdir/init.find7a.rc:root/init.qcom.rc \
    device/oppo/find7a/rootdir/init.find7a.usb.rc:root/init.find7a.usb.rc \
    device/oppo/find7a/rootdir/ueventd.find7a.rc:root/ueventd.qcom.rc \
    device/oppo/find7a/rootdir/fstab.find7a:root/fstab.qcom \
    device/oppo/find7a/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# Config files for touch and input
PRODUCT_COPY_FILES += \
    device/oppo/find7a/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/oppo/find7a/configs/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    device/oppo/find7a/configs/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/oppo/find7a/configs/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl

# Media config files
PRODUCT_COPY_FILES += \
    device/oppo/find7a/media_codecs.xml:system/etc/media_codecs.xml \
    device/oppo/find7a/media_profiles.xml:system/etc/media_profiles.xml

# Audio config files
PRODUCT_COPY_FILES += \
    device/oppo/find7a/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/oppo/find7a/mixer_paths.xml:/system/etc/mixer_paths.xml


# qcom init stuff
PRODUCT_COPY_FILES += \
    device/oppo/find7a/init.qcom.syspart_fixup.sh:system/etc/init.qcom.syspart_fixup.sh \
    device/oppo/find7a/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

#sdcard permissions fix
PRODUCT_COPY_FILES += \
    device/oppo/find7a/configs/init.sdcard_perms.sh:system/etc/init.sdcard_perms.sh \

#thermal-engine
PRODUCT_COPY_FILES += \
        device/oppo/find7a/configs/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf

# Wifi config
PRODUCT_COPY_FILES += \
    device/oppo/find7a/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    device/oppo/find7a/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/oppo/find7a/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    device/oppo/find7a/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/oppo/find7a/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

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
    device/oppo/find7a/rootdir/etc/init.find7a.bt.sh:system/etc/init.find7a.bt.sh

# recursively chown media_rw script
PRODUCT_COPY_FILES += \
    device/oppo/find7a/rootdir/etc/init.d/mountsd:system/etc/init.d/mountsd

PRODUCT_COPY_FILES += \
    device/oppo/find7a/rootdir/etc/init.d/mvcache:system/etc/init.d/mvcache

# Sensor configuration from Oppo
PRODUCT_COPY_FILES += \
    device/oppo/find7a/sensor/sensor_def_qcomdev.conf:system/etc/sensor_def_qcomdev.conf

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
    device/oppo/find7a/sensor/libsensor_thresh.so:/vendor/lib/libsensor_thresh.so
