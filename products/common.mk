-include vendor/rascarlo/products/bootanimations.mk

# Generic product
PRODUCT_NAME := MinimalUI
PRODUCT_BRAND := MinimalUI
PRODUCT_DEVICE := generic

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# Tweaks for build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hw_quickpoweron=true \
    ro.config.hw_fast_dormancy=1 \
    persist.adb.notify=0 \
    profiler.force_disable_err_rpt=1 \
    profiler.force_disable_ulog=1 \
    ro.ril.hep=0 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=12 \
    ro.ril.enable.dtm=1 \
    ro.ril.hsdpa.category=8 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.3g.prefix=1 \
    ro.ril.htcmaskw1.bitmask=4294967295 \
    ro.ril.htcmaskw1=14449 \
    ro.ril.hsupa.category=6

# Launcher3 supported devices
ifneq ($(filter mako hammerhead,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    Launcher3
# Auto-rotate
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/rascarlo/overlay/Launcher3
endif

# STK: overlay common to all devices with telephony
ifneq ($(filter mako hammerhead,$(TARGET_PRODUCT)),)
# Build SimToolKit
PRODUCT_PACKAGES += \
    Stk
endif

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/rascarlo/overlay/common

# Latin IME lib
PRODUCT_COPY_FILES += \
    vendor/rascarlo/proprietary/common/system/lib/libjni_latinime.so:system/lib/libjni_latinime.so

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
