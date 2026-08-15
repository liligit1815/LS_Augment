#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
component="$COMPANION_PKG/.AugmentTileService"
cmd statusbar remove-tile "$component" </dev/null >/dev/null 2>&1 || true
echo "OK|tile-removed|$component"
