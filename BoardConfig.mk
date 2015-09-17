#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

-include vendor/motorola/lux/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/lux

BOARD_VENDOR := motorola-qcom

TARGET_CYANOGEN_COMMON := msm8939

TARGET_SPECIFIC_HEADER_PATH := device/motorola/lux/include

# Platform
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno405

# Properties
TARGET_SYSTEM_PROP += device/motorola/lux/system.prop

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8916
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53

# CPU
TARGET_CPU_CORTEX_A53 := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := device/motorola/lux/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x3F ehci-hcd.park=3 vmalloc=400M androidboot.bootdevice=soc.0 utags.blkdev=/dev/block/platform/soc.0/by-name/utags utags.backup=/dev/block/platform/soc.0/by-name/utagsBackup movablecore=160M
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_KERNEL_SOURCE := kernel/motorola/msm8916
TARGET_KERNEL_CONFIG := msm8916-lux_defconfig

KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-linux-androideabi-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := arm-linux-androideabi-

BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Asserts
TARGET_OTA_ASSERT_DEVICE := lux,xt1563,xt1562

# Audio
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/motorola/lux/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += hardware/cyanogen

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_HAVE_NEW_GRALLOC := true
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# FM
TARGET_QCOM_NO_FM_FIRMWARE := true
AUDIO_FEATURE_ENABLED_FM := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
TARGET_NO_RPC := true
TARGET_GPS_HAL_PATH := $(LOCAL_PATH)/gps
TARGET_PROVIDES_GPS_LOC_API := true

# Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_lux.c

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Malloc
MALLOC_IMPL := dlmalloc

# Motorola
TARGET_USES_MOTOROLA_LOG := true

#NFC
BOARD_NFC_HAL_SUFFIX := 8916

# QCRIL
PROTOBUF_SUPPORTED := true
TARGET_RIL_VARIANT := caf

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432	# 32768 * 1024 mmcblk0p31
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432	# 32768 * 1024 mmcblk0p32
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2852126720	# 2785280 * 1024 mmcblk0p41
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8388608 	# 8192 * 1024 mmcblk0p29
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11815223296 # 11538304 * 1024 mmcblk0p42

# Power
TARGET_POWERHAL_VARIANT := qcom

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

# Quickboot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/QuickBoot.apk:system/priv-app/QuickBoot/QuickBoot.apk

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# SELinux

include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/motorola/lux/sepolicy

BOARD_SEPOLICY_UNION += \
    akmd09912.te \
    atfwd.te \
    atvc.te \
    batt_health.te \
    bluetooth_loader.te \
    device.te \
    file.te \
    file_contexts \
    healthd.te \
    init.te \
    init_shell.te \
    mm-qcamerad.te \
    property.te \
    property_contexts \
    qseecomd.te \
    rild.te \
    rmt_storage.te \
    stml0xx.te \
    surfaceflinger.te \
    system_server.te \
    tee.te \
    ueventd.te \
    vold.te \
    wcnss_service.te

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X
