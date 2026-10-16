#!/sbin/sh

# Load flashlight kernel module
load_flashlight_module()
{
	insmod /vendor/lib/modules/sprd_flash_drv.ko
	insmod /vendor/lib/modules/flash_ic_ocp8137.ko
    insmod /vendor/lib/modules/flash_ic_aw3641.ko
    insmod /vendor/lib/modules/flash_ic_sc2703.ko
    insmod /vendor/lib/modules/flash_ic_syx378duc.ko
}


load_flashlight_module
sleep 1
setprop modules.loaded 1
exit 0
