#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
ensure_log_dir
kind="$1"; lines="$2"
case "$lines" in ''|*[!0-9]*) lines=100 ;; esac
[ "$lines" -gt 500 ] 2>/dev/null && lines=500
case "$kind" in
  error) tail -n "$lines" "$LOG_DIR/error.log" 2>/dev/null ;;
  *) tail -n "$lines" "$LOG_DIR/action.log" 2>/dev/null ;;
esac
