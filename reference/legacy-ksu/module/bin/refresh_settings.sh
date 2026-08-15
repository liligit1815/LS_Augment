#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
# Keep the authoritative hidden-target mirror. Clear only diagnostics so the
# next cold Settings launch proves that the API 102 Companion loaded now.
for key in \
  "$HOOK_ACTIVE_KEY" "$HOOK_VERSION_KEY" "$HOOK_STRATEGY_KEY" \
  "$HOOK_LAST_FILTER_KEY" "$HOOK_LAST_ERROR_KEY" \
  "$PROBE_VERSION_KEY" "$PROBE_API_KEY" "$PROBE_FRAMEWORK_KEY" \
  "$PROBE_MODULE_LOADED_KEY" "$PROBE_PACKAGE_READY_KEY" \
  "$PROBE_CONTEXT_READY_KEY" "$PROBE_CLASS_FOUND_KEY" \
  "$PROBE_REBUILD_HOOK_KEY" "$PROBE_REMOVE_HOOK_KEY" \
  "$PROBE_HOOK_INSTALLED_KEY" "$PROBE_FILTER_CALLED_KEY" "$PROBE_ERROR_KEY"
do
  settings delete global "$key" >/dev/null 2>&1 || true
done
am force-stop --user 0 com.android.settings >/dev/null 2>&1 || am force-stop com.android.settings >/dev/null 2>&1 || true
echo 'OK|settings-stopped|reopen Settings -> Apps to verify API102 hook'
