#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
sync_hook_mirror
rc=$?
value="$(settings get global "$HOOK_MIRROR_KEY" 2>/dev/null)"
[ "$value" = null ] && value=''
echo "mirror|$value"
exit "$rc"
