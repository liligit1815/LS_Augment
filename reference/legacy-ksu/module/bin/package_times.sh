#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh

pt_uid="$1"
shift 2>/dev/null || true
is_valid_uid "$pt_uid" || exit 2

# firstInstallTime is package-level on Android. userId is kept in the public
# interface so the WebUI API remains target-oriented and can be extended later.
for pt_pkg in "$@"; do
  is_valid_package "$pt_pkg" || continue
  pt_time="$(dumpsys package "$pt_pkg" 2>/dev/null \
    | /system/bin/toybox sed -n 's/^[[:space:]]*firstInstallTime=//p' \
    | /system/bin/toybox head -n 1)"
  printf '%s|%s\n' "$pt_pkg" "$pt_time"
done
