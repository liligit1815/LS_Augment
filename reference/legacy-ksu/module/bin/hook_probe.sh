#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh
getv() {
  hp_val="$(settings get global "$1" 2>/dev/null)"
  [ "$hp_val" = null ] && hp_val=''
  printf '%s' "$hp_val"
}
yn() { [ "$1" = 1 ] && printf 'yes' || printf 'no'; }

ver="$(getv "$PROBE_VERSION_KEY")"
api="$(getv "$PROBE_API_KEY")"
framework="$(getv "$PROBE_FRAMEWORK_KEY")"
module_loaded="$(getv "$PROBE_MODULE_LOADED_KEY")"
package_ready="$(getv "$PROBE_PACKAGE_READY_KEY")"
context_ready="$(getv "$PROBE_CONTEXT_READY_KEY")"
class_found="$(getv "$PROBE_CLASS_FOUND_KEY")"
rebuild_hook="$(getv "$PROBE_REBUILD_HOOK_KEY")"
remove_hook="$(getv "$PROBE_REMOVE_HOOK_KEY")"
hook_installed="$(getv "$PROBE_HOOK_INSTALLED_KEY")"
filter_called="$(getv "$PROBE_FILTER_CALLED_KEY")"
probe_error="$(getv "$PROBE_ERROR_KEY")"

printf 'probe_version|%s\n' "$ver"
printf 'api_version|%s\n' "$api"
printf 'framework|%s\n' "$framework"
printf 'module_loaded|%s\n' "$(yn "$module_loaded")"
printf 'package_ready|%s\n' "$(yn "$package_ready")"
printf 'context_ready|%s\n' "$(yn "$context_ready")"
case "$class_found" in
  1) echo 'adapter_class|found' ;;
  0) echo 'adapter_class|missing' ;;
  *) echo 'adapter_class|unknown' ;;
esac
printf 'hook_onRebuildComplete|%s\n' "$(yn "$rebuild_hook")"
printf 'hook_removeHideApk|%s\n' "$(yn "$remove_hook")"
printf 'hook_installed|%s\n' "$(yn "$hook_installed")"
printf 'filter_called|%s\n' "$(yn "$filter_called")"
printf 'probe_error|%s\n' "$probe_error"
printf 'shoulder_active|%s\n' "$(getv 'ls_augment_shoulder_active')"
printf 'shoulder_installed|%s\n' "$(getv 'ls_augment_shoulder_installed')"
printf 'shoulder_last_hit|%s\n' "$(getv 'ls_augment_shoulder_last_hit')"
printf 'shoulder_last_error|%s\n' "$(getv 'ls_augment_shoulder_last_error')"
printf 'mirror|%s\n' "$(getv "$HOOK_MIRROR_KEY")"
printf 'hook_version|%s\n' "$(getv "$HOOK_VERSION_KEY")"
printf 'hook_strategy|%s\n' "$(getv "$HOOK_STRATEGY_KEY")"
printf 'hook_last_filter|%s\n' "$(getv "$HOOK_LAST_FILTER_KEY")"
printf 'hook_last_error|%s\n' "$(getv "$HOOK_LAST_ERROR_KEY")"
