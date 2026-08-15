#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh

apk="$MODDIR/apk/LS_Augment.apk"
tmp_apk="/data/local/tmp/LS_Augment-${MODID}.apk"
state_file="$DATA_DIR/runtime/companion_install.state"
mode="${1:-update}"

[ -f "$apk" ] || { echo 'APK_MISSING'; exit 2; }
ensure_data_dirs >/dev/null 2>&1 || true

module_version="$(sed -n 's/^version=//p' "$MODDIR/module.prop" | head -n 1)"
module_version_code="$(sed -n 's/^versionCode=//p' "$MODDIR/module.prop" | head -n 1)"

# Return success only if PackageManager currently has the Companion package
# registered. Do not use dumpsys' process exit code: dumpsys may itself exit 0
# even when the requested package is absent.
companion_registered() {
  dumpsys package "$COMPANION_PKG" 2>/dev/null | \
    /system/bin/toybox grep -Fq "Package [$COMPANION_PKG]"
}

# A newer standalone Companion may remain compatible with an older Core. Do
# not replace it with the older APK bundled in the KernelSU module unless the
# user explicitly requests clean signature recovery.
if companion_registered && [ "$mode" != "--clean" ] && [ "$mode" != "clean" ]; then
  current_version="$(dumpsys package "$COMPANION_PKG" 2>/dev/null | sed -n 's/^[[:space:]]*versionName=//p' | head -n 1)"
  current_version_code="$(dumpsys package "$COMPANION_PKG" 2>/dev/null | sed -n 's/^[[:space:]]*versionCode=\([0-9][0-9]*\).*/\1/p' | head -n 1)"
  case "$module_version_code:$current_version_code" in
    *[!0-9:]*|:*|*:) : ;;
    *)
      if [ "$current_version_code" -gt "$module_version_code" ]; then
        printf 'OK|compatible-newer|version=%s|versionCode=%s|module=%s|moduleCode=%s\n' \
          "$current_version" "$current_version_code" "$module_version" "$module_version_code" | tee "$state_file"
        exit 0
      fi
      ;;
  esac
fi

# Remove only LS_Augment's historical standalone tile helper. Never touch a
# configured target package.
cmd statusbar remove-tile "$OLD_BRIDGE_PKG/.HideTileService" </dev/null >/dev/null 2>&1 || true
pm uninstall --user 0 "$OLD_BRIDGE_PKG" </dev/null >/dev/null 2>&1 || true

cp -f "$apk" "$tmp_apk" 2>/dev/null || { echo 'COPY_FAILED'; exit 1; }
chmod 0644 "$tmp_apk" 2>/dev/null || true

if [ "$mode" = "--clean" ] || [ "$mode" = "clean" ]; then
  # Signature-rotation recovery applies ONLY to LS_Augment Companion.
  cmd statusbar remove-tile "$COMPANION_PKG/.AugmentTileService" </dev/null >/dev/null 2>&1 || true

  if companion_registered; then
    echo "CLEAN|uninstalling|package=$COMPANION_PKG"
    /system/bin/pm uninstall "$COMPANION_PKG"
    uninstall_rc=$?

    if companion_registered; then
      printf 'FAIL|stage=uninstall|rc=%s|package=%s|still_registered=yes\n' \
        "$uninstall_rc" "$COMPANION_PKG" | tee "$state_file"
      echo "RECOVERY_APK|$tmp_apk"
      exit 1
    fi

    # Some vendor PackageManager builds can return a non-zero uninstall status
    # even though the package registration has already disappeared. Treat the
    # verified post-state as authoritative and continue to install.
    if [ "$uninstall_rc" -ne 0 ]; then
      printf 'WARN|stage=uninstall|rc=%s|package=%s|post_state=absent|continuing=yes\n' \
        "$uninstall_rc" "$COMPANION_PKG"
    else
      echo "CLEAN|uninstalled|package=$COMPANION_PKG"
    fi
  else
    echo "CLEAN|skip-uninstall|package=$COMPANION_PKG|reason=not-registered"
  fi
fi

# IMPORTANT: Do not redirect/capture PackageManager stdout/stderr here.
# This MyOS build has demonstrated Binder shellCommand sensitivity to FD
# transport. Inheriting caller FDs also preserves the real installer error.
echo "INSTALL|begin|apk=$tmp_apk|module=$module_version|moduleCode=$module_version_code"
/system/bin/pm install -r --user 0 "$tmp_apk"
rc=$?

installed_version="$(dumpsys package "$COMPANION_PKG" 2>/dev/null | sed -n 's/^[[:space:]]*versionName=//p' | head -n 1)"
installed_version_code="$(dumpsys package "$COMPANION_PKG" 2>/dev/null | sed -n 's/^[[:space:]]*versionCode=\([0-9][0-9]*\).*/\1/p' | head -n 1)"
installed_path="$(pm path --user 0 "$COMPANION_PKG" 2>/dev/null | head -n 1)"

if [ "$rc" -eq 0 ] && [ "$installed_version" = "$module_version" ] && [ "$installed_version_code" = "$module_version_code" ] && [ -n "$installed_path" ]; then
  rm -f "$tmp_apk" 2>/dev/null || true
  printf 'OK|installed|version=%s|versionCode=%s|path=%s\n' "$installed_version" "$installed_version_code" "$installed_path" | tee "$state_file"
  exit 0
fi

printf 'FAIL|stage=install|rc=%s|installed=%s|installedCode=%s|module=%s|moduleCode=%s|tmp=%s\n' \
  "$rc" "${installed_version:-missing}" "${installed_version_code:-missing}" "$module_version" "$module_version_code" "$tmp_apk" | tee "$state_file"
printf 'RETRY_COMMAND|/system/bin/pm install -r --user 0 %s\n' "$tmp_apk"
exit 1
