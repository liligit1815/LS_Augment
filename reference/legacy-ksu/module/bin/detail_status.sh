#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
refresh_runtime_state >/dev/null 2>&1 || { echo 'error|0|0|0|0|1'; exit 1; }
read_runtime_summary
