#!/sbin/sh

load_panel()
{
        insmod /vendor/lib/modules/nt36xxx_ss.ko
        insmod /vendor/lib/modules/chipone-tddi_ss.ko
        insmod /vendor/lib/modules/chipone-tddi.ko
        insmod /vendor/lib/modules/gcore_ss.ko
        insmod /vendor/lib/modules/gcore_7202h.ko
        insmod /vendor/lib/modules/ilitek-tddi.ko
        insmod /vendor/lib/modules/focaltech_ts.ko
        insmod /vendor/lib/modules/tcs3430.ko

        # default
        chown system system /dev/tspio
        chown system system /sys/class/sec/tsp/input/enabled

        # enable
        echo 1 > /sys/class/sec/tsp/input/enabled

}


load_panel
wait 1
setprop modules.loaded 1
exit 0
