#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh

acquire_action_lock SAVE_CONFIG || exit 30
ensure_data_dirs
new_tmp="$RUNTIME_DIR/.save.new.$$"
old_tmp="$RUNTIME_DIR/.save.old.$$"
trap 'rm -f "$new_tmp" "$old_tmp"; release_action_lock' 0 1 2 15
: >"$new_tmp" || { echo 'WRITE_CONFIG_FAILED'; exit 5; }

while [ "$#" -gt 0 ]; do
  sv_uid="$1"; shift
  [ "$#" -gt 0 ] || { echo "BAD_PAIR|$sv_uid"; exit 2; }
  sv_pkg="$1"; shift
  is_valid_uid "$sv_uid" || { echo "BAD_UID|$sv_uid|$sv_pkg"; exit 2; }
  is_valid_pkg "$sv_pkg" || { echo "BAD_PACKAGE|$sv_uid|$sv_pkg"; exit 2; }
  is_protected_pkg "$sv_pkg" && { echo "PROTECTED_PACKAGE|$sv_uid|$sv_pkg"; exit 2; }
  printf '%s:%s\n' "$sv_uid" "$sv_pkg" >>"$new_tmp"
done
sort -u "$new_tmp" -o "$new_tmp" 2>/dev/null || true

# Removing a managed target is safe-by-default: restore exactly that user/package
# before removing it from management, so WebUI can never orphan a hidden target.
if snapshot_targets "$old_tmp"; then
  while IFS=: read -r sv_old_uid sv_old_pkg || [ -n "$sv_old_uid$sv_old_pkg" ]; do
    [ -z "$sv_old_uid$sv_old_pkg" ] && continue
    grep -Fxq "$sv_old_uid:$sv_old_pkg" "$new_tmp" && continue
    sv_restore="$(show_one "$sv_old_uid" "$sv_old_pkg" CONFIG_RESTORE 2>&1)"; sv_rc=$?
    if [ "$sv_rc" -ne 0 ]; then
      printf 'RESTORE_REMOVED_TARGET_FAILED|%s|%s|%s\n' "$sv_old_uid" "$sv_old_pkg" "$sv_restore"
      exit 7
    fi
  done <"$old_tmp"
fi

write_targets_atomic "$new_tmp" || { echo 'WRITE_CONFIG_FAILED'; exit 5; }
sync_hook_mirror >/dev/null 2>&1 || { echo 'MIRROR_UPDATE_FAILED'; exit 8; }
sv_count="$(grep -c '^[0-9][0-9]*:[A-Za-z0-9._][A-Za-z0-9._]*$' "$new_tmp" 2>/dev/null || true)"
[ -n "$sv_count" ] || sv_count=0
echo "OK|$sv_count|$TARGETS_CONF"
