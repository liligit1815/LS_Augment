#!/system/bin/sh
MODID=ls_augment
MODDIR=/data/adb/modules/$MODID
if [ -f /data/adb/ls_augment/runtime/automation/pid ]; then
  kill "$(cat /data/adb/ls_augment/runtime/automation/pid 2>/dev/null)" >/dev/null 2>&1 || true
fi
if [ -x "$MODDIR/bin/restore_all.sh" ]; then
  "$MODDIR/bin/restore_all.sh" >/dev/null 2>&1 || true
fi
if [ -f "$MODDIR/bin/common.sh" ]; then
  . "$MODDIR/bin/common.sh"
  clear_hook_runtime
fi
cmd statusbar remove-tile io.github.lsf.augment/.AugmentTileService >/dev/null 2>&1 || true
# This uninstall applies only to LS_Augment's own Companion APK.
pm uninstall --user 0 io.github.lsf.augment >/dev/null 2>&1 || true
rm -f /data/adb/ls_augment/config.backup.conf 2>/dev/null || true
rm -rf /data/adb/ls_augment/runtime/automation 2>/dev/null || true
rm -f /data/adb/ls_augment/automation.conf 2>/dev/null || true
