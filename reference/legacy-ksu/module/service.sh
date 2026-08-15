#!/system/bin/sh
MODID=ls_augment
MODDIR=${0%/*}
export KSU_MODULE="$MODID"
. "$MODDIR/bin/common.sh"
ensure_log_dir
ensure_data_dirs

n=0
while [ "$(getprop sys.boot_completed)" != 1 ] && [ "$n" -lt 120 ]; do
  sleep 2
  n=$((n + 1))
done

# dev2 boot policy: never force-hide targets. PM state is authoritative and is
# only re-read to rebuild runtime cache + Settings mirror.
ensure_targets_file >/dev/null 2>&1 || restore_backup_if_missing >/dev/null 2>&1 || true
if [ ! -f "$TARGETS_CONF" ]; then
  : >"$TARGETS_CONF"
  chmod 0600 "$TARGETS_CONF" 2>/dev/null || true
fi
backup_config >/dev/null 2>&1 || true
sync_hook_mirror >/dev/null 2>&1 || true

# Full release bundles the Companion APK. Request an update when Companion is
# missing or older than the module. A newer standalone Companion is retained as
# compatible so an older KernelSU bundle never prompts a downgrade.
if [ -f "$MODDIR/apk/LS_Augment.apk" ]; then
  module_version="$(sed -n 's/^version=//p' "$MODDIR/module.prop" | head -n 1)"
  module_version_code="$(sed -n 's/^versionCode=//p' "$MODDIR/module.prop" | head -n 1)"
  installed_version="$(dumpsys package "$COMPANION_PKG" 2>/dev/null | sed -n 's/^[[:space:]]*versionName=//p' | head -n 1)"
  installed_version_code="$(dumpsys package "$COMPANION_PKG" 2>/dev/null | sed -n 's/^[[:space:]]*versionCode=\([0-9][0-9]*\).*/\1/p' | head -n 1)"
  case "$module_version_code:$installed_version_code" in
    *[!0-9:]*|:*|*:) relation=unknown ;;
    *)
      if [ "$installed_version_code" -gt "$module_version_code" ]; then
        relation=module_older
      elif [ "$installed_version_code" -lt "$module_version_code" ]; then
        relation=companion_older
      elif [ "$installed_version" = "$module_version" ]; then
        relation=match
      else
        relation=name_mismatch
      fi
      ;;
  esac
  case "$relation" in
    match) : ;;
    module_older)
      printf 'COMPATIBLE|installed=%s|installedCode=%s|module=%s|moduleCode=%s|reason=companion_newer\n' "$installed_version" "$installed_version_code" "$module_version" "$module_version_code" >"$DATA_DIR/runtime/companion_install.state"
      ;;
    *)
      printf 'NEEDS_UPDATE|installed=%s|installedCode=%s|module=%s|moduleCode=%s|action=install_companion\n' "${installed_version:-missing}" "${installed_version_code:-missing}" "$module_version" "$module_version_code" >"$DATA_DIR/runtime/companion_install.state"
      ;;
  esac
fi

# Keep presentation mirror available to the unprivileged TileService.
/data/adb/modules/ls_augment/bin/tile_config.sh sync >/dev/null 2>&1 || true

# Low-frequency lock-screen automation. The watcher reads a lightweight screen
# power state and does not use a foreground service or wake lock.
if [ -x "$MODDIR/bin/automation_daemon.sh" ] && [ "$(sed -n 's/^enabled=//p' "$DATA_DIR/automation.conf" 2>/dev/null | head -n 1)" = 1 ]; then
  "$MODDIR/bin/automation_daemon.sh" >/dev/null 2>&1 &
fi
