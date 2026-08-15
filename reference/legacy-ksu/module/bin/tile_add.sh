#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
component="$COMPANION_PKG/.AugmentTileService"
setup="$COMPANION_PKG/.TileSetupActivity"
if ! pm path "$COMPANION_PKG" >/dev/null 2>&1; then
  echo 'COMPANION_MISSING'
  exit 2
fi
sdk="$(getprop ro.build.version.sdk 2>/dev/null)"
case "$sdk" in ''|*[!0-9]*) sdk=0 ;; esac

# Android 13+ official Quick Settings Placement API requires an app foreground
# context. Launch the tiny Companion trampoline; SystemUI presents the user's
# add-tile confirmation and owns the final result.
if [ "$sdk" -ge 33 ]; then
  am start --user 0 -W -n "$setup" </dev/null 2>&1
  rc=$?
  if [ "$rc" -eq 0 ]; then
    echo "OK|tile-placement-request|$component"
    exit 0
  fi
  echo "FAIL|tile-placement-launch|rc=$rc|$setup"
  exit 1
fi

# Legacy fallback for Android 12L and older.
cmd statusbar add-tile "$component" </dev/null 2>&1
rc=$?
if [ "$rc" -eq 0 ]; then
  echo "OK|tile-shell-request|$component"
  exit 0
fi
echo "FAIL|tile-shell-request|rc=$rc|$component"
exit 1
