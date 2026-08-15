#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
refresh_runtime_state >/dev/null 2>&1
st_rc=$?
if [ "$st_rc" -ne 0 ]; then
  printf 'ERROR|0|0|0|0|1\n'
  exit 1
fi
st_agg="$(read_runtime_summary)"
IFS='|' read -r st_state st_total st_visible st_hidden st_missing st_error <<EOT
$st_agg
EOT
printf '%s|%s|%s|%s|%s|%s\n' \
  "$(summary_public_name "$st_state")" "$st_total" "$st_visible" "$st_hidden" "$st_missing" "$st_error"
