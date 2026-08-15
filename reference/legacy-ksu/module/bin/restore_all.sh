#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
acquire_action_lock RESTORE || exit 30
ensure_data_dirs
ra_snap="$RUNTIME_DIR/.restore.$$"
trap 'rm -f "$ra_snap"; release_action_lock' 0 1 2 15
snapshot_targets "$ra_snap"
ra_rc=$?
case "$ra_rc" in
  10|12) clear_hook_runtime; refresh_runtime_state >/dev/null 2>&1 || true; echo 'STATE|empty'; exit 0 ;;
  0) ;;
  *) print_config_error "$ra_rc"; exit "$ra_rc" ;;
esac
apply_snapshot visible "$ra_snap"
ra_action_rc=$?
sync_hook_mirror >/dev/null 2>&1 || ra_action_rc=1
ra_final="$(read_runtime_summary)"
IFS='|' read -r ra_state ra_total ra_visible ra_hidden ra_missing ra_error <<EOT
$ra_final
EOT
echo "STATE|$ra_state"
exit "$ra_action_rc"
