# Common path
DEVICE_PATH := device/samsung/a3core

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := sc9863a
TARGET_BOOTLOADER_BOARD_NAME := m168
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true

# Platform
BOARD_USES_SPRD_HARDWARE := true
TARGET_BOARD_PLATFORM := sp9863a
TARGET_BOARD_PLATFORM_GPU := img8322

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# 64-Bit
TARGET_IS_64_BIT := true
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true

# CPU scheduler configuration
TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Kernel-Prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/recovery_dtbo.img
#BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_KERNEL_ARCH := arm64

# Kernel/Boot
BOARD_BOOT_HEADER_VERSION := 2
BOARD_BOOT_HEADER_SIZE := 1660
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := KernelImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01f00000
#BOARD_DTB_SIZE := 89670
BOARD_MKBOOTIMG_ARGS := \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
	--second_offset $(BOARD_KERNEL_SECOND_OFFSET) \
	--header_version $(BOARD_BOOT_HEADER_VERSION) \
	--pagesize $(BOARD_KERNEL_PAGESIZE) \
	--board "SRPUH09A004" \
	--dtb $(TARGET_PREBUILT_DTB) \
        --recovery_dtbo $(BOARD_PREBUILT_DTBOIMAGE) \
	--dtb_offset $(BOARD_DTB_OFFSET)

#BOARD_CUSTOM_BOOTIMG := true
#BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/bootimg.mk

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2

# Security Patch (S9)
PLATFORM_SECURITY_PATCH := 2025-12-01
VENDOR_SECURITY_PATCH := 2025-12-01
PLATFORM_VERSION := 13
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Crypto-Decryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2
#TW_FORCE_KEYMASTER_VER := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_REAL_SDCARD := true

# Modules 
TARGET_RECOVERY_DEVICE_MODULES += \
    libcap \
    libion \
    libxml2 \

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libandroidicu 
    $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/obj/SHARED_LIBRARIES/libandroidicu_intermediates/libandroidicu.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libandroidicu.so

#additional lib for fix decryption
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrusty \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libtrusty \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrustyHalHelper \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libtrustyHalHelper \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libgatekeeper \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk  \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk  \
    $(TARGET_OUT_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils  \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymint  \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkernelbootcp.trusty \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkernelbootcp.trusty  \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0 \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0 \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppbor_external \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcppbor_external \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_portable \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libpuresoftkeymasterdevice \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppcose_rkp \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcppcose_rkp \
$(TARGET_OUT_SHARED_LIBRARIES)/libsoft_attestation_cert \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libsoft_attestation_cert \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk.so\
$(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk.so \
  $(TARGET_OUT_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so  \
     $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/vendor.sprd.hardware.trusty@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/vendor.sprd.hardware.trusty@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppbor_external.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcppbor_external.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppcose_rkp.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcppcose_rkp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoft_attestation_cert.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libsoft_attestation_cert.so \


# Inherit partitions flags
include device/samsung/a3core/partitions.mk

# Inherit recovery flags
include device/samsung/a3core/recovery_flags.mk
