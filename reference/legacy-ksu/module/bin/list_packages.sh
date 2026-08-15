#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
lp_uid="$1"; lp_mode="$2"
is_valid_uid "$lp_uid" || exit 2
ensure_data_dirs
lp_out="$RUNTIME_DIR/.list.out.$$"
lp_snap="$RUNTIME_DIR/.list.cfg.$$"
trap 'rm -f "$lp_out" "$lp_snap"' 0 1 2 15
: >"$lp_out" || exit 3

if [ "$lp_mode" = all ]; then
  pm list packages --user "$lp_uid" 2>/dev/null | sed 's/^package://' >>"$lp_out"
else
  pm list packages -3 --user "$lp_uid" 2>/dev/null | sed 's/^package://' >>"$lp_out"
fi

# Hidden packages may disappear from ordinary PM list output. Merge managed
# targets back so the WebUI always retains a recovery path.
if snapshot_targets "$lp_snap"; then
  while IFS=: read -r lp_cfg_uid lp_pkg || [ -n "$lp_cfg_uid$lp_pkg" ]; do
    [ -z "$lp_cfg_uid$lp_pkg" ] && continue
    [ "$lp_cfg_uid" = "$lp_uid" ] && printf '%s\n' "$lp_pkg" >>"$lp_out"
  done <"$lp_snap"
fi
sort -u "$lp_out"
