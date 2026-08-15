#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh

module_version="$(sed -n 's/^version=//p' "$MODDIR/module.prop" 2>/dev/null | head -n 1)"
module_version_code="$(sed -n 's/^versionCode=//p' "$MODDIR/module.prop" 2>/dev/null | head -n 1)"
if pm path "$COMPANION_PKG" >/dev/null 2>&1; then
  companion_state=installed
  companion_version="$(dumpsys package "$COMPANION_PKG" 2>/dev/null | sed -n 's/^[[:space:]]*versionName=//p' | head -n 1)"
  companion_version_code="$(dumpsys package "$COMPANION_PKG" 2>/dev/null | sed -n 's/^[[:space:]]*versionCode=\([0-9][0-9]*\).*/\1/p' | head -n 1)"
else
  companion_state=missing
  companion_version=''
  companion_version_code=''
fi

echo "companion|$companion_state"
echo "module_version|$module_version"
echo "module_version_code|$module_version_code"
echo "companion_version|$companion_version"
echo "companion_version_code|$companion_version_code"
if [ "$companion_state" = installed ] && [ -n "$module_version" ] \
    && [ "$companion_version" = "$module_version" ] \
    && [ "$companion_version_code" = "$module_version_code" ]; then
  echo 'companion_match|1'
  echo 'version_relation|match'
else
  echo 'companion_match|0'
  case "$module_version_code:$companion_version_code" in
    *[!0-9:]*|:*|*:) echo 'version_relation|unknown' ;;
    *)
      if [ "$companion_version_code" -gt "$module_version_code" ]; then
        echo 'version_relation|module_older'
      elif [ "$companion_version_code" -lt "$module_version_code" ]; then
        echo 'version_relation|companion_older'
      else
        echo 'version_relation|name_mismatch'
      fi
      ;;
  esac
fi

read_global() {
  hs_val="$(settings get global "$1" 2>/dev/null)"
  [ "$hs_val" = null ] && hs_val=''
  printf '%s' "$hs_val"
}

echo "mirror|$(read_global "$HOOK_MIRROR_KEY")"
echo "tile_state|$(read_global "$TILE_STATE_KEY")"
echo "hook|$(read_global "$HOOK_ACTIVE_KEY")"
echo "hook_version|$(read_global "$HOOK_VERSION_KEY")"
echo "hook_strategy|$(read_global "$HOOK_STRATEGY_KEY")"
echo "hook_last_filter|$(read_global "$HOOK_LAST_FILTER_KEY")"
echo "hook_last_error|$(read_global "$HOOK_LAST_ERROR_KEY")"
echo "probe_version|$(read_global "$PROBE_VERSION_KEY")"
echo "probe_api|$(read_global "$PROBE_API_KEY")"
echo "probe_framework|$(read_global "$PROBE_FRAMEWORK_KEY")"
echo "probe_module_loaded|$(read_global "$PROBE_MODULE_LOADED_KEY")"
echo "probe_package_ready|$(read_global "$PROBE_PACKAGE_READY_KEY")"
echo "probe_context_ready|$(read_global "$PROBE_CONTEXT_READY_KEY")"
echo "probe_class_found|$(read_global "$PROBE_CLASS_FOUND_KEY")"
echo "probe_rebuild_hook|$(read_global "$PROBE_REBUILD_HOOK_KEY")"
echo "probe_remove_hook|$(read_global "$PROBE_REMOVE_HOOK_KEY")"
echo "probe_hook_installed|$(read_global "$PROBE_HOOK_INSTALLED_KEY")"
echo "probe_filter_called|$(read_global "$PROBE_FILTER_CALLED_KEY")"
echo "probe_error|$(read_global "$PROBE_ERROR_KEY")"
echo "shoulder_active|$(read_global 'ls_augment_shoulder_active')"
echo "shoulder_installed|$(read_global 'ls_augment_shoulder_installed')"
echo "shoulder_last_hit|$(read_global 'ls_augment_shoulder_last_hit')"
echo "shoulder_last_error|$(read_global 'ls_augment_shoulder_last_error')"
echo "recents_enabled|$(read_global "$RECENTS_ENABLED_KEY")"
echo "recents_compression|$(read_global "$RECENTS_COMPRESSION_KEY")"
echo "recents_active|$(read_global "$RECENTS_ACTIVE_KEY")"
echo "recents_installed|$(read_global "$RECENTS_INSTALLED_KEY")"
echo "recents_last_layout|$(read_global "$RECENTS_LAST_LAYOUT_KEY")"
echo "recents_last_error|$(read_global "$RECENTS_LAST_ERROR_KEY")"
echo "doubleapp_active|$(read_global "$DOUBLE_ACTIVE_KEY")"
echo "doubleapp_installed|$(read_global "$DOUBLE_INSTALLED_KEY")"
echo "doubleapp_last_hit|$(read_global "$DOUBLE_LAST_HIT_KEY")"
echo "doubleapp_last_error|$(read_global "$DOUBLE_LAST_ERROR_KEY")"
echo "systemui_active|$(read_global "$SYSTEMUI_ACTIVE_KEY")"
echo "systemui_installed|$(read_global "$SYSTEMUI_INSTALLED_KEY")"
echo "systemui_compat|$(read_global "$SYSTEMUI_COMPAT_KEY")"
echo "systemui_last_error|$(read_global "$SYSTEMUI_LAST_ERROR_KEY")"
echo "beautify_compat|$(read_global "$BEAUTIFY_COMPAT_KEY")"
echo "beautify_active|$(read_global "$BEAUTIFY_ACTIVE_KEY")"
echo "beautify_installed|$(read_global "$BEAUTIFY_INSTALLED_KEY")"
echo "beautify_last_hit|$(read_global "$BEAUTIFY_LAST_HIT_KEY")"
echo "beautify_last_error|$(read_global "$BEAUTIFY_LAST_ERROR_KEY")"

install_state_file="$DATA_DIR/runtime/companion_install.state"
if [ -f "$install_state_file" ]; then
  echo "companion_install|$(tail -n 1 "$install_state_file" 2>/dev/null)"
else
  echo "companion_install|"
fi
