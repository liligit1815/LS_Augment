#!/system/bin/sh
MODID=ls_augment
export KSU_MODULE="$MODID"

ui_print '- LS_Augment v1.0.0-rc1-test10040'
ui_print '- Milestone: Settings Perfect Hide'
ui_print '- Persistent targets + unified augmentctl + state engine'
ui_print '- Core backend: am force-stop + pm hide/unhide --user'

set_perm_recursive "$MODPATH/bin" 0 0 0755 0755
set_perm "$MODPATH/bin/augmentctl" 0 0 0755
set_perm_recursive "$MODPATH/apk" 0 0 0755 0644
mkdir -p "$MODPATH/logs"
if [ -d /data/adb/modules/ls_augment/logs ]; then
  cp -f /data/adb/modules/ls_augment/logs/*.log "$MODPATH/logs/" 2>/dev/null || true
fi
touch "$MODPATH/logs/action.log" "$MODPATH/logs/error.log"
set_perm_recursive "$MODPATH/logs" 0 0 0700 0600

DATA_DIR=/data/adb/ls_augment
TARGETS_CONF=$DATA_DIR/targets.conf
mkdir -p "$DATA_DIR" "$DATA_DIR/runtime"
chmod 0700 "$DATA_DIR" "$DATA_DIR/runtime" 2>/dev/null || true
touch "$DATA_DIR/app_metadata.tsv" 2>/dev/null || true
chmod 0600 "$DATA_DIR/app_metadata.tsv" 2>/dev/null || true

normalize_conf() {
  nc_src="$1"; nc_dst="$2"
  : >"$nc_dst"
  while IFS= read -r nc_line || [ -n "$nc_line" ]; do
    nc_line="$(printf '%s' "$nc_line" | tr -d '\r' | sed 's/#.*$//' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
    [ -z "$nc_line" ] && continue
    case "$nc_line" in
      [0-9]*:*) nc_uid="${nc_line%%:*}"; nc_pkg="${nc_line#*:}" ;;
      [0-9]*' '*) nc_uid="${nc_line%% *}"; nc_pkg="${nc_line#* }"; nc_pkg="$(printf '%s' "$nc_pkg" | tr -d '[:space:]')" ;;
      [0-9]*'|'*) nc_uid="${nc_line%%|*}"; nc_pkg="${nc_line#*|}" ;;
      *) continue ;;
    esac
    case "$nc_uid" in ''|*[!0-9]*) continue ;; esac
    case "$nc_pkg" in ''|*[!A-Za-z0-9._]*) continue ;; esac
    case "$nc_pkg" in android|com.android.systemui|com.android.settings|io.github.lsf.augment|io.github.lsf.frigoratile|me.weishu.kernelsu|me.weishu.kernelsu.debug|com.rifsxd.ksunext|org.lsposed.manager|com.topjohnwu.magisk) continue ;; esac
    printf '%s:%s\n' "$nc_uid" "$nc_pkg" >>"$nc_dst"
  done <"$nc_src"
  sort -u "$nc_dst" -o "$nc_dst" 2>/dev/null || true
}

# Persistent targets are authoritative. On first migration, prefer persistent
# backups and non-empty legacy files. A freshly unpacked module may contain an
# empty config.conf and must never mask a real pre-upgrade backup.
if [ ! -f "$TARGETS_CONF" ]; then
  mig_tmp="$DATA_DIR/.targets.install.$$"
  : >"$mig_tmp"
  if [ -s /data/adb/ls_augment/targets.backup.conf ]; then
    normalize_conf /data/adb/ls_augment/targets.backup.conf "$mig_tmp"
    ui_print '- Migrated persistent targets backup -> targets.conf'
  elif [ -s /data/adb/ls_augment/config.backup.conf ]; then
    normalize_conf /data/adb/ls_augment/config.backup.conf "$mig_tmp"
    ui_print '- Migrated dev1 backup -> persistent targets.conf'
  elif [ -s /data/adb/modules/ls_augment/config.conf ]; then
    normalize_conf /data/adb/modules/ls_augment/config.conf "$mig_tmp"
    ui_print '- Migrated dev1 module config.conf -> persistent targets.conf'
  elif [ -s /data/adb/modules/ls_frigora/config.conf ]; then
    normalize_conf /data/adb/modules/ls_frigora/config.conf "$mig_tmp"
    touch /data/adb/modules/ls_frigora/disable 2>/dev/null || true
    ui_print '- Migrated LS_Frigora config and disabled the old module'
  fi
  mv -f "$mig_tmp" "$TARGETS_CONF" 2>/dev/null || true
fi
chmod 0600 "$TARGETS_CONF" 2>/dev/null || true
if [ -s "$TARGETS_CONF" ]; then
  cp -f "$TARGETS_CONF" "$DATA_DIR/targets.backup.conf" 2>/dev/null || true
  cp -f "$TARGETS_CONF" "$DATA_DIR/config.backup.conf" 2>/dev/null || true
else
  # Empty targets can be intentional, but keep any previous non-empty backup as
  # a diagnostic/recovery source instead of destroying it during installation.
  [ -f "$DATA_DIR/targets.backup.conf" ] || : >"$DATA_DIR/targets.backup.conf"
  [ -f "$DATA_DIR/config.backup.conf" ] || : >"$DATA_DIR/config.backup.conf"
fi
chmod 0600 "$DATA_DIR/targets.backup.conf" "$DATA_DIR/config.backup.conf" 2>/dev/null || true

if [ ! -f "$DATA_DIR/automation.conf" ]; then
  printf 'enabled=0\nscope=current\n' >"$DATA_DIR/automation.conf"
fi
chmod 0600 "$DATA_DIR/automation.conf" 2>/dev/null || true

# Keep a non-authoritative module-local snapshot only for downgrade/debug compatibility.
cp -f "$TARGETS_CONF" "$MODPATH/config.conf" 2>/dev/null || : >"$MODPATH/config.conf"
chmod 0600 "$MODPATH/config.conf" 2>/dev/null || true

if [ -d /data/adb/modules/ksu_apphide_qs ]; then
  touch /data/adb/modules/ksu_apphide_qs/disable 2>/dev/null || true
fi

ui_print '- Targets: /data/adb/ls_augment/targets.conf'
ui_print '- Runtime: /data/adb/ls_augment/runtime/'
ui_print '- Lock-screen automation: disabled means no resident watcher'
ui_print '- Target format: USER_ID:PACKAGE_NAME'
ui_print '- SAFETY: target apps are never uninstalled or reinstalled'
if [ -f "$MODPATH/apk/LS_Augment.apk" ]; then
  ui_print '- Companion APK bundled; it will be installed after boot if needed'
else
  ui_print '- Core-only development package: Companion APK is not bundled'
fi
