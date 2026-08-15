#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
ensure_log_dir
: >"$LOG_DIR/action.log"
: >"$LOG_DIR/error.log"
echo OK
