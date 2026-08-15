#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
ensure_data_dirs
gc_snap="$RUNTIME_DIR/.get_config.$$"
trap 'rm -f "$gc_snap"' 0 1 2 15
snapshot_targets "$gc_snap"
gc_rc=$?
if [ "$gc_rc" -eq 0 ]; then
  gc_agg="$(aggregate_state_file "$gc_snap")"
  IFS='|' read -r gc_state gc_total gc_visible gc_hidden gc_missing gc_error <<EOT
$gc_agg
EOT
  gc_unknown=$((gc_missing + gc_error))
  echo "state|$gc_state|$gc_total|$gc_visible|$gc_hidden|$gc_unknown"
  echo "config|$TARGETS_CONF"
  while IFS=: read -r gc_uid gc_pkg || [ -n "$gc_uid$gc_pkg" ]; do
    [ -z "$gc_uid$gc_pkg" ] && continue
    echo "target|$gc_uid|$gc_pkg"
    gc_st="$(package_state "$gc_uid" "$gc_pkg")"
    [ "$gc_st" = missing ] && gc_st=unknown
    [ "$gc_st" = error ] && gc_st=unknown
    echo "target_state|$gc_uid|$gc_pkg|$gc_st"
  done <"$gc_snap"
  exit 0
fi
case "$gc_rc" in
  10|12)
    echo 'state|empty|0|0|0|0'
    echo "config|$TARGETS_CONF"
    exit 0 ;;
  *)
    echo 'state|error|0|0|0|0'
    echo "config|$TARGETS_CONF"
    print_config_error "$gc_rc"
    exit "$gc_rc" ;;
esac
