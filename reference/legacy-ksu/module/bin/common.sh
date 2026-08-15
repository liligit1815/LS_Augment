#!/system/bin/sh

MODID=ls_augment
MODDIR=/data/adb/modules/$MODID
COMPANION_PKG=io.github.lsf.augment
OLD_BRIDGE_PKG=io.github.lsf.frigoratile

DATA_DIR=/data/adb/ls_augment
TARGETS_CONF=$DATA_DIR/targets.conf
# Backward-compatible variable name for dev1 scripts; points to persistent targets.
CONFIG_CONF=$TARGETS_CONF
LEGACY_CONFIG_CONF=$MODDIR/config.conf
LEGACY_BACKUP_CONF=$DATA_DIR/config.backup.conf
BACKUP_CONF=$DATA_DIR/targets.backup.conf
RUNTIME_DIR=$DATA_DIR/runtime
STATE_FILE=$RUNTIME_DIR/state.tsv
SUMMARY_FILE=$RUNTIME_DIR/summary.state
METADATA_FILE=$DATA_DIR/app_metadata.tsv
METADATA_LOCK=$RUNTIME_DIR/metadata.lock
LOG_DIR=$MODDIR/logs
ACTION_LOCK=$RUNTIME_DIR/core.lock

HOOK_MIRROR_KEY=ls_augment_hidden_targets
TILE_STATE_KEY=ls_augment_tile_state
TILE_CONF=$DATA_DIR/tile.conf
TILE_LABEL_KEY=ls_augment_tile_label
TILE_DESCRIPTION_KEY=ls_augment_tile_description
TILE_DEFAULT_LABEL=LS_Augment
TILE_DEFAULT_DESCRIPTION=应用隐藏
AUTOMATION_CONF=$DATA_DIR/automation.conf
FEATURES_CONF=$DATA_DIR/features.conf
AUTOMATION_RUNTIME_DIR=$RUNTIME_DIR/automation
AUTOMATION_ACTIVE=$AUTOMATION_RUNTIME_DIR/active
AUTOMATION_PID_FILE=$AUTOMATION_RUNTIME_DIR/pid
AUTOMATION_LAST_EVENT=$AUTOMATION_RUNTIME_DIR/last-event
HOOK_ACTIVE_KEY=ls_augment_hook_active
HOOK_VERSION_KEY=ls_augment_hook_version
HOOK_STRATEGY_KEY=ls_augment_hook_strategy
HOOK_LAST_FILTER_KEY=ls_augment_hook_last_filter
HOOK_LAST_ERROR_KEY=ls_augment_hook_last_error
PROBE_VERSION_KEY=ls_augment_probe_version
PROBE_API_KEY=ls_augment_probe_api
PROBE_FRAMEWORK_KEY=ls_augment_probe_framework
PROBE_MODULE_LOADED_KEY=ls_augment_probe_module_loaded
PROBE_PACKAGE_READY_KEY=ls_augment_probe_package_ready
PROBE_CONTEXT_READY_KEY=ls_augment_probe_context_ready
PROBE_CLASS_FOUND_KEY=ls_augment_probe_class_found
PROBE_REBUILD_HOOK_KEY=ls_augment_probe_rebuild_hook
PROBE_REMOVE_HOOK_KEY=ls_augment_probe_remove_hook
PROBE_HOOK_INSTALLED_KEY=ls_augment_probe_hook_installed
PROBE_FILTER_CALLED_KEY=ls_augment_probe_filter_called
PROBE_ERROR_KEY=ls_augment_probe_error
RECENTS_ENABLED_KEY=ls_augment_recents_enabled
RECENTS_COMPRESSION_KEY=ls_augment_recents_compression
RECENTS_FRONT_OVERLAP_KEY=ls_augment_recents_front_overlap
RECENTS_ACTIVE_KEY=ls_augment_recents_active
RECENTS_INSTALLED_KEY=ls_augment_recents_installed
RECENTS_LAST_LAYOUT_KEY=ls_augment_recents_last_layout
RECENTS_LAST_ERROR_KEY=ls_augment_recents_last_error
DOUBLE_ACTIVE_KEY=ls_augment_doubleapp_active
DOUBLE_INSTALLED_KEY=ls_augment_doubleapp_installed
DOUBLE_LAST_HIT_KEY=ls_augment_doubleapp_last_hit
DOUBLE_LAST_ERROR_KEY=ls_augment_doubleapp_last_error
SYSTEMUI_ACTIVE_KEY=ls_augment_systemui_active
SYSTEMUI_INSTALLED_KEY=ls_augment_systemui_installed
SYSTEMUI_COMPAT_KEY=ls_augment_systemui_compat
SYSTEMUI_LAST_ERROR_KEY=ls_augment_systemui_last_error
BEAUTIFY_COMPAT_KEY=ls_augment_beautify_compat
BEAUTIFY_ACTIVE_KEY=ls_augment_beautify_active
BEAUTIFY_INSTALLED_KEY=ls_augment_beautify_installed
BEAUTIFY_LAST_HIT_KEY=ls_augment_beautify_last_hit
BEAUTIFY_LAST_ERROR_KEY=ls_augment_beautify_last_error
export KSU_MODULE="$MODID"

ensure_data_dirs() {
  [ -d "$DATA_DIR" ] || mkdir -p "$DATA_DIR"
  [ -d "$RUNTIME_DIR" ] || mkdir -p "$RUNTIME_DIR"
  chmod 0700 "$DATA_DIR" "$RUNTIME_DIR" 2>/dev/null || true
}

ensure_log_dir() {
  [ -d "$LOG_DIR" ] || mkdir -p "$LOG_DIR"
  touch "$LOG_DIR/action.log" "$LOG_DIR/error.log" 2>/dev/null || true
  chmod 0700 "$LOG_DIR" 2>/dev/null || true
  chmod 0600 "$LOG_DIR/action.log" "$LOG_DIR/error.log" 2>/dev/null || true
}

is_valid_uid() {
  case "$1" in ''|*[!0-9]*) return 1 ;; *) return 0 ;; esac
}

is_valid_pkg() {
  case "$1" in
    ''|*[!A-Za-z0-9._]*) return 1 ;;
    .*|*..*|*.) return 1 ;;
    *) return 0 ;;
  esac
}

is_valid_target() {
  iv_target="$1"
  case "$iv_target" in *:*) ;; *) return 1 ;; esac
  iv_uid="${iv_target%%:*}"
  iv_pkg="${iv_target#*:}"
  case "$iv_pkg" in *:*) return 1 ;; esac
  is_valid_uid "$iv_uid" || return 1
  is_valid_pkg "$iv_pkg" || return 1
  is_protected_pkg "$iv_pkg" && return 1
  return 0
}

is_protected_pkg() {
  case "$1" in
    android|com.android.systemui|com.android.settings|io.github.lsf.augment|io.github.lsf.frigoratile|me.weishu.kernelsu|me.weishu.kernelsu.debug|com.rifsxd.ksunext|org.lsposed.manager|com.topjohnwu.magisk) return 0 ;;
    *) return 1 ;;
  esac
}

safe_log_text() {
  printf '%s' "$1" | tr '\r\n' '  ' | cut -c1-500
}

log_result() {
  lr_action="$1"; lr_uid="$2"; lr_pkg="$3"; lr_result="$4"; lr_detail="$5"
  ensure_log_dir
  lr_ts="$(date '+%Y-%m-%d %H:%M:%S' 2>/dev/null || date)"
  lr_clean="$(safe_log_text "$lr_detail")"
  lr_target="$lr_uid:$lr_pkg"
  if [ -n "$lr_clean" ]; then
    printf '[%s] ACTION=%s TARGET=%s RESULT=%s DETAIL=%s\n' "$lr_ts" "$lr_action" "$lr_target" "$lr_result" "$lr_clean" >>"$LOG_DIR/action.log"
  else
    printf '[%s] ACTION=%s TARGET=%s RESULT=%s\n' "$lr_ts" "$lr_action" "$lr_target" "$lr_result" >>"$LOG_DIR/action.log"
  fi
  if [ "$lr_result" != SUCCESS ]; then
    printf '[%s] ACTION=%s TARGET=%s ERROR=%s\n' "$lr_ts" "$lr_action" "$lr_target" "${lr_clean:-unknown}" >>"$LOG_DIR/error.log"
  fi
}

# dev2 persistent target model. /data/adb/ls_augment/targets.conf is authoritative.
# The module-local config.conf is accepted only as a dev1/LS_Frigora migration source.
ensure_targets_file() {
  ensure_data_dirs
  if [ -f "$TARGETS_CONF" ]; then
    chmod 0600 "$TARGETS_CONF" 2>/dev/null || true
    return 0
  fi

  et_src=''
  if [ -s "$BACKUP_CONF" ]; then
    et_src="$BACKUP_CONF"
  elif [ -s "$LEGACY_BACKUP_CONF" ]; then
    et_src="$LEGACY_BACKUP_CONF"
  elif [ -s "$LEGACY_CONFIG_CONF" ]; then
    et_src="$LEGACY_CONFIG_CONF"
  fi

  et_tmp="$DATA_DIR/.targets.migrate.$$"
  : >"$et_tmp" || return 1
  if [ -n "$et_src" ]; then
    cat "$et_src" >"$et_tmp" 2>/dev/null || { rm -f "$et_tmp"; return 1; }
  fi
  chmod 0600 "$et_tmp" 2>/dev/null || true
  mv -f "$et_tmp" "$TARGETS_CONF" || { rm -f "$et_tmp"; return 1; }
  chmod 0600 "$TARGETS_CONF" 2>/dev/null || true
}

# Snapshot format: USER_ID:PACKAGE_NAME. Comments/blank lines ignored.
# 10 missing, 11 unreadable, 12 empty, 13 invalid.
snapshot_targets() {
  st_dest="$1"
  ensure_targets_file || return 11
  [ -e "$TARGETS_CONF" ] || return 10
  [ -f "$TARGETS_CONF" ] || return 11
  [ -r "$TARGETS_CONF" ] || return 11

  st_raw="$RUNTIME_DIR/.targets.raw.$$"
  : >"$st_raw" || return 11
  : >"$st_dest" || { rm -f "$st_raw"; return 11; }
  cat "$TARGETS_CONF" >"$st_raw" 2>/dev/null || { rm -f "$st_raw" "$st_dest"; return 11; }

  st_invalid=0
  while IFS= read -r st_line || [ -n "$st_line" ]; do
    st_line="$(printf '%s' "$st_line" | tr -d '\r' | sed 's/#.*$//' | tr -d '[:space:]')"
    [ -z "$st_line" ] && continue
    if ! is_valid_target "$st_line"; then st_invalid=1; break; fi
    printf '%s\n' "$st_line" >>"$st_dest" || { st_invalid=1; break; }
  done <"$st_raw"
  rm -f "$st_raw"

  [ "$st_invalid" -eq 0 ] || { rm -f "$st_dest"; return 13; }
  [ -s "$st_dest" ] || { rm -f "$st_dest"; return 12; }
  sort -u "$st_dest" -o "$st_dest" 2>/dev/null || true
  return 0
}

# Backward-compatible alias used by dev1 wrapper scripts.
snapshot_config() { snapshot_targets "$1"; }

# Returns success only when the exact userId:packageName is in the managed target set.
is_managed_target() {
  im_target="$1"
  is_valid_target "$im_target" || return 1
  ensure_targets_file >/dev/null 2>&1 || return 1
  [ -f "$TARGETS_CONF" ] || return 1
  grep -Fxq "$im_target" "$TARGETS_CONF" 2>/dev/null
}

print_config_error() {
  case "$1" in
    10) echo 'CONFIG_MISSING' ;;
    11) echo 'CONFIG_UNREADABLE' ;;
    12) echo 'CONFIG_EMPTY' ;;
    13) echo 'CONFIG_INVALID' ;;
    *) echo 'CONFIG_ERROR' ;;
  esac
}

backup_config() {
  ensure_targets_file || return 1
  ensure_data_dirs
  bk_tmp="$DATA_DIR/.targets.backup.$$"
  cp -f "$TARGETS_CONF" "$bk_tmp" 2>/dev/null || return 1
  chmod 0600 "$bk_tmp" 2>/dev/null || true
  mv -f "$bk_tmp" "$BACKUP_CONF" || return 1
  chmod 0600 "$BACKUP_CONF" 2>/dev/null || true
  # Keep legacy backup during dev2 so downgrading to dev1 remains recoverable.
  cp -f "$BACKUP_CONF" "$LEGACY_BACKUP_CONF" 2>/dev/null || true
  chmod 0600 "$LEGACY_BACKUP_CONF" 2>/dev/null || true
}

restore_backup_if_missing() {
  [ -f "$TARGETS_CONF" ] && return 0
  ensure_data_dirs
  if [ -f "$BACKUP_CONF" ]; then
    cp -f "$BACKUP_CONF" "$TARGETS_CONF" 2>/dev/null || return 1
  elif [ -f "$LEGACY_BACKUP_CONF" ]; then
    cp -f "$LEGACY_BACKUP_CONF" "$TARGETS_CONF" 2>/dev/null || return 1
  else
    return 1
  fi
  chmod 0600 "$TARGETS_CONF" 2>/dev/null || true
}

# Atomic directory lock. This removes the dev1 check-then-write race on action.lock.
acquire_action_lock() {
  al_name="$1"
  ensure_data_dirs
  if mkdir "$ACTION_LOCK" 2>/dev/null; then
    printf '%s\n' "$$" >"$ACTION_LOCK/pid"
    printf '%s\n' "$al_name" >"$ACTION_LOCK/action"
    return 0
  fi

  al_pid="$(cat "$ACTION_LOCK/pid" 2>/dev/null)"
  al_action="$(cat "$ACTION_LOCK/action" 2>/dev/null)"
  if [ -n "$al_pid" ] && kill -0 "$al_pid" 2>/dev/null; then
    echo "ACTION_BUSY|${al_action:-$al_name}|$al_pid"
    return 1
  fi

  rm -rf "$ACTION_LOCK" 2>/dev/null || true
  if mkdir "$ACTION_LOCK" 2>/dev/null; then
    printf '%s\n' "$$" >"$ACTION_LOCK/pid"
    printf '%s\n' "$al_name" >"$ACTION_LOCK/action"
    return 0
  fi
  echo "LOCK_FAILED|$al_name"
  return 1
}

release_action_lock() {
  [ -d "$ACTION_LOCK" ] || return 0
  [ "$(cat "$ACTION_LOCK/pid" 2>/dev/null)" = "$$" ] && rm -rf "$ACTION_LOCK" 2>/dev/null || true
}

# Exact per-user state. PM is always authoritative; runtime files are only caches.
# Values: visible, hidden, missing, error.
package_state() {
  ps_uid="$1"; ps_pkg="$2"
  is_valid_uid "$ps_uid" || { printf '%s' error; return 1; }
  is_valid_pkg "$ps_pkg" || { printf '%s' error; return 1; }

  # Never store the full dumpsys output in a shell variable. Some Android shells
  # resolve printf as an external binary; passing a large dumpsys payload then
  # exceeds ARG_MAX (observed on MT Manager terminal as "Argument list too long").
  # Stream directly to grep and retain only the single per-user state line.
  ps_line="$(dumpsys package "$ps_pkg" 2>/dev/null | grep -F "User $ps_uid:" | head -n 1)"
  if [ -n "$ps_line" ]; then
    case "$ps_line" in
      *'installed=false'*) printf '%s' missing; return 0 ;;
      *'hidden=true'*) printf '%s' hidden; return 0 ;;
      *'hidden=false'*) printf '%s' visible; return 0 ;;
    esac
  fi

  # No per-user line means the package is not installed for this user (or is
  # absent globally). Avoid `pm list packages` here: `pm` itself is a Binder
  # shell-command client whose stdio transport is ROM-sensitive on this device.
  printf '%s' missing
  return 0
}

aggregate_state_file() {
  ag_file="$1"
  ag_total=0; ag_visible=0; ag_hidden=0; ag_missing=0; ag_error=0
  while IFS=: read -r ag_uid ag_pkg || [ -n "$ag_uid$ag_pkg" ]; do
    [ -z "$ag_uid$ag_pkg" ] && continue
    ag_total=$((ag_total + 1))
    ag_st="$(package_state "$ag_uid" "$ag_pkg")"
    case "$ag_st" in
      visible) ag_visible=$((ag_visible + 1)) ;;
      hidden) ag_hidden=$((ag_hidden + 1)) ;;
      missing) ag_missing=$((ag_missing + 1)) ;;
      *) ag_error=$((ag_error + 1)) ;;
    esac
  done <"$ag_file"

  if [ "$ag_total" -eq 0 ]; then ag_state=empty
  elif [ "$ag_missing" -gt 0 ] || [ "$ag_error" -gt 0 ]; then ag_state=error
  elif [ "$ag_visible" -eq "$ag_total" ]; then ag_state=visible
  elif [ "$ag_hidden" -eq "$ag_total" ]; then ag_state=hidden
  else ag_state=mixed
  fi
  printf '%s|%s|%s|%s|%s|%s\n' "$ag_state" "$ag_total" "$ag_visible" "$ag_hidden" "$ag_missing" "$ag_error"
}

summary_public_name() {
  case "$1" in
    visible) printf '%s' ALL_VISIBLE ;;
    hidden) printf '%s' ALL_HIDDEN ;;
    mixed) printf '%s' MIXED ;;
    empty) printf '%s' EMPTY ;;
    *) printf '%s' ERROR ;;
  esac
}

target_public_state() {
  case "$1" in
    visible) printf '%s' VISIBLE ;;
    hidden) printf '%s' HIDDEN ;;
    missing) printf '%s' MISSING ;;
    *) printf '%s' ERROR ;;
  esac
}

# Rebuild runtime state cache from PM truth. Empty config is a valid state.
refresh_runtime_state() {
  ensure_data_dirs
  rs_snap="$RUNTIME_DIR/.state.targets.$$"
  rs_tmp="$RUNTIME_DIR/.state.tsv.$$"
  rs_summary_tmp="$RUNTIME_DIR/.summary.state.$$"
  rm -f "$rs_snap" "$rs_tmp" "$rs_summary_tmp" 2>/dev/null || true

  snapshot_targets "$rs_snap"
  rs_rc=$?
  case "$rs_rc" in
    0) ;;
    10|12) : >"$rs_snap" ;;
    *) rm -f "$rs_snap"; return "$rs_rc" ;;
  esac

  : >"$rs_tmp" || { rm -f "$rs_snap"; return 11; }
  rs_total=0; rs_visible=0; rs_hidden=0; rs_missing=0; rs_error=0
  while IFS=: read -r rs_uid rs_pkg || [ -n "$rs_uid$rs_pkg" ]; do
    [ -z "$rs_uid$rs_pkg" ] && continue
    rs_total=$((rs_total + 1))
    rs_st="$(package_state "$rs_uid" "$rs_pkg")"
    printf '%s|%s|%s\n' "$rs_uid" "$rs_pkg" "$rs_st" >>"$rs_tmp"
    case "$rs_st" in
      visible) rs_visible=$((rs_visible + 1)) ;;
      hidden) rs_hidden=$((rs_hidden + 1)) ;;
      missing) rs_missing=$((rs_missing + 1)) ;;
      *) rs_error=$((rs_error + 1)) ;;
    esac
  done <"$rs_snap"
  rm -f "$rs_snap"

  if [ "$rs_total" -eq 0 ]; then rs_state=empty
  elif [ "$rs_missing" -gt 0 ] || [ "$rs_error" -gt 0 ]; then rs_state=error
  elif [ "$rs_visible" -eq "$rs_total" ]; then rs_state=visible
  elif [ "$rs_hidden" -eq "$rs_total" ]; then rs_state=hidden
  else rs_state=mixed
  fi

  printf '%s|%s|%s|%s|%s|%s\n' "$rs_state" "$rs_total" "$rs_visible" "$rs_hidden" "$rs_missing" "$rs_error" >"$rs_summary_tmp"
  chmod 0600 "$rs_tmp" "$rs_summary_tmp" 2>/dev/null || true
  mv -f "$rs_tmp" "$STATE_FILE" || return 11
  mv -f "$rs_summary_tmp" "$SUMMARY_FILE" || return 11
  chmod 0600 "$STATE_FILE" "$SUMMARY_FILE" 2>/dev/null || true
  return 0
}

read_runtime_summary() {
  [ -f "$SUMMARY_FILE" ] || refresh_runtime_state >/dev/null 2>&1 || true
  if [ -f "$SUMMARY_FILE" ]; then cat "$SUMMARY_FILE"; else printf 'error|0|0|0|0|1\n'; fi
}

# Publish only currently hidden managed targets to Settings.Global.
sync_hook_mirror() {
  refresh_runtime_state
  sm_rc=$?
  if [ "$sm_rc" -ne 0 ]; then
    log_result MIRROR 0 "$HOOK_MIRROR_KEY" FAIL "state_rc=$sm_rc"
    return 1
  fi

  sm_value=''
  if [ -f "$STATE_FILE" ]; then
    while IFS='|' read -r sm_uid sm_pkg sm_state || [ -n "$sm_uid$sm_pkg$sm_state" ]; do
      [ "$sm_state" = hidden ] || continue
      if [ -n "$sm_value" ]; then sm_value="$sm_value;$sm_uid:$sm_pkg"; else sm_value="$sm_uid:$sm_pkg"; fi
    done <"$STATE_FILE"
  fi

  if [ -n "$sm_value" ]; then
    settings put global "$HOOK_MIRROR_KEY" "$sm_value" >/dev/null 2>&1 || {
      log_result MIRROR 0 "$HOOK_MIRROR_KEY" FAIL 'settings put failed'; return 1;
    }
  else
    settings delete global "$HOOK_MIRROR_KEY" >/dev/null 2>&1 || true
  fi

  # Publish the aggregate state separately for the Quick Settings Tile. The
  # tile is presentation-only; PackageManager truth remains authoritative.
  sm_summary="$(read_runtime_summary)"
  # Avoid vendor-shell `${value%%|*}` expansion: on MyOS it can yield an
  # empty prefix and publish ERROR even when the runtime summary is valid.
  IFS='|' read -r sm_state sm_total sm_visible sm_hidden sm_missing sm_error <<EOT
$sm_summary
EOT
  sm_public="$(summary_public_name "$sm_state")"
  settings put global "$TILE_STATE_KEY" "$sm_public" >/dev/null 2>&1 || true
  return 0
}

clear_hook_runtime() {
  settings delete global "$HOOK_MIRROR_KEY" >/dev/null 2>&1 || true
  settings delete global "$TILE_STATE_KEY" >/dev/null 2>&1 || true
  settings delete global "$HOOK_ACTIVE_KEY" >/dev/null 2>&1 || true
  settings delete global "$HOOK_VERSION_KEY" >/dev/null 2>&1 || true
  settings delete global "$HOOK_STRATEGY_KEY" >/dev/null 2>&1 || true
  settings delete global "$HOOK_LAST_FILTER_KEY" >/dev/null 2>&1 || true
  settings delete global "$HOOK_LAST_ERROR_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_VERSION_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_API_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_FRAMEWORK_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_MODULE_LOADED_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_PACKAGE_READY_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_CONTEXT_READY_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_CLASS_FOUND_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_REBUILD_HOOK_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_REMOVE_HOOK_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_HOOK_INSTALLED_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_FILTER_CALLED_KEY" >/dev/null 2>&1 || true
  settings delete global "$PROBE_ERROR_KEY" >/dev/null 2>&1 || true
  settings delete global "$RECENTS_ENABLED_KEY" >/dev/null 2>&1 || true
  settings delete global "$RECENTS_COMPRESSION_KEY" >/dev/null 2>&1 || true
  settings delete global "$RECENTS_FRONT_OVERLAP_KEY" >/dev/null 2>&1 || true
  settings delete global "$RECENTS_ACTIVE_KEY" >/dev/null 2>&1 || true
  settings delete global "$RECENTS_INSTALLED_KEY" >/dev/null 2>&1 || true
  settings delete global "$RECENTS_LAST_LAYOUT_KEY" >/dev/null 2>&1 || true
  settings delete global "$RECENTS_LAST_ERROR_KEY" >/dev/null 2>&1 || true
}

# Execute PackageManager hidden-state changes with Binder-safe stdio.
#
# AOSP `cmd` passes its current stdin/stdout/stderr file descriptors directly to
# IBinder::shellCommand(). On the target MyOS device, pm works from an interactive
# root shell, while forwarding WebUI capture FDs or regular files under /data/adb
# can make `cmd package` fail before PackageManagerShellCommand runs with:
#   Failure calling service package: Failed transaction (2147483646)
#
# /dev/null is deliberately used for all three PM descriptors. It prevents WebUI
# pipes/sockets and module-private regular-file descriptors from crossing Binder.
# We do not trust command text as state truth: PackageManager state is read again
# after every attempt and remains authoritative.
PM_EXEC_RC=1
PM_EXEC_OUT=''
PM_EXEC_ATTEMPTS=0
PM_EXEC_STATE=error
PM_EXEC_TRANSPORT='null-fd'
LAST_ACTION_ERROR_CODE=''
LAST_ACTION_TARGET=''
LAST_ACTION_PM_RC=0
LAST_ACTION_ATTEMPTS=0
LAST_ACTION_STATE=''
LAST_ACTION_TRANSPORT=''

reset_action_error() {
  LAST_ACTION_ERROR_CODE=''
  LAST_ACTION_TARGET=''
  LAST_ACTION_PM_RC=0
  LAST_ACTION_ATTEMPTS=0
  LAST_ACTION_STATE=''
  LAST_ACTION_TRANSPORT=''
}

set_action_error() {
  LAST_ACTION_ERROR_CODE="$1"
  LAST_ACTION_TARGET="$2:$3"
  LAST_ACTION_PM_RC="${4:-1}"
  LAST_ACTION_ATTEMPTS="${5:-0}"
  LAST_ACTION_STATE="${6:-error}"
  LAST_ACTION_TRANSPORT="${7:-none}"
}

run_pm_hidden_setting() {
  pe_mode="$1"; pe_uid="$2"; pe_pkg="$3"
  case "$pe_mode" in
    hide) pe_expected=hidden ;;
    unhide) pe_expected=visible ;;
    *) PM_EXEC_RC=2; PM_EXEC_OUT='BAD_PM_MODE'; PM_EXEC_ATTEMPTS=0; PM_EXEC_STATE=error; return 2 ;;
  esac

  pe_pm="${LS_AUGMENT_PM_BIN:-/system/bin/pm}"
  [ -x "$pe_pm" ] || pe_pm=pm

  pe_attempt=1
  PM_EXEC_RC=1
  PM_EXEC_OUT='transport=null-fd'
  PM_EXEC_ATTEMPTS=0
  PM_EXEC_STATE="$(package_state "$pe_uid" "$pe_pkg")"

  while [ "$pe_attempt" -le 3 ]; do
    # Do not redirect to a file under /data/adb and do not inherit caller stdio.
    # The descriptors themselves are transferred in the `cmd package` Binder call.
    "$pe_pm" "$pe_mode" --user "$pe_uid" "$pe_pkg" </dev/null >/dev/null 2>/dev/null
    pe_rc=$?

    # MyOS can complete the remote operation even when the local transport status
    # is non-zero. Verify the actual per-user PackageManager state every time.
    pe_state="$(package_state "$pe_uid" "$pe_pkg")"
    PM_EXEC_RC="$pe_rc"
    PM_EXEC_ATTEMPTS="$pe_attempt"
    PM_EXEC_STATE="$pe_state"

    if [ "$pe_state" = "$pe_expected" ]; then
      return 0
    fi

    case "$pe_attempt" in
      1) sleep 0.2 ;;
      2) sleep 0.5 ;;
    esac
    pe_attempt=$((pe_attempt + 1))
  done

  return "${PM_EXEC_RC:-1}"
}

hide_one() {
  ho_uid="$1"; ho_pkg="$2"
  reset_action_error
  ho_before="$(package_state "$ho_uid" "$ho_pkg")"
  if [ "$ho_before" = hidden ]; then
    log_result HIDE "$ho_uid" "$ho_pkg" SUCCESS 'already hidden'
    printf 'OK|already-hidden|%s|%s\n' "$ho_uid" "$ho_pkg"
    return 0
  fi
  if [ "$ho_before" = missing ]; then
    set_action_error PACKAGE_NOT_FOUND "$ho_uid" "$ho_pkg" 1 0 missing none
    log_result HIDE "$ho_uid" "$ho_pkg" FAIL 'PACKAGE_NOT_FOUND'
    printf 'FAIL|hide|%s|%s|PACKAGE_NOT_FOUND\n' "$ho_uid" "$ho_pkg"
    return 1
  fi

  ho_am="${LS_AUGMENT_AM_BIN:-/system/bin/am}"
  [ -x "$ho_am" ] || ho_am=am
  "$ho_am" force-stop --user "$ho_uid" "$ho_pkg" >/dev/null 2>&1 || true
  run_pm_hidden_setting hide "$ho_uid" "$ho_pkg"
  ho_rc=$?
  ho_after="$PM_EXEC_STATE"
  ho_out="$PM_EXEC_OUT"
  ho_attempts="$PM_EXEC_ATTEMPTS"
  if [ "$ho_rc" -eq 0 ] && [ "$ho_after" = hidden ]; then
    log_result HIDE "$ho_uid" "$ho_pkg" SUCCESS "state=$ho_after attempts=$ho_attempts rc=$PM_EXEC_RC transport=$PM_EXEC_TRANSPORT"
    printf 'OK|hide|%s|%s\n' "$ho_uid" "$ho_pkg"
    return 0
  fi
  set_action_error PM_HIDE_FAILED "$ho_uid" "$ho_pkg" "$PM_EXEC_RC" "$ho_attempts" "$ho_after" "$PM_EXEC_TRANSPORT"
  log_result HIDE "$ho_uid" "$ho_pkg" FAIL "PM_HIDE_FAILED rc=$PM_EXEC_RC attempts=$ho_attempts state=$ho_after transport=$PM_EXEC_TRANSPORT"
  printf 'FAIL|hide|%s|%s|PM_HIDE_FAILED\n' "$ho_uid" "$ho_pkg"
  return 1
}

show_one() {
  so_uid="$1"; so_pkg="$2"; so_action="${3:-SHOW}"
  reset_action_error
  so_before="$(package_state "$so_uid" "$so_pkg")"
  if [ "$so_before" = visible ]; then
    log_result "$so_action" "$so_uid" "$so_pkg" SUCCESS 'already visible'
    printf 'OK|already-visible|%s|%s\n' "$so_uid" "$so_pkg"
    return 0
  fi
  if [ "$so_before" = missing ]; then
    set_action_error PACKAGE_NOT_FOUND "$so_uid" "$so_pkg" 1 0 missing none
    log_result "$so_action" "$so_uid" "$so_pkg" FAIL 'PACKAGE_NOT_FOUND'
    printf 'FAIL|unhide|%s|%s|PACKAGE_NOT_FOUND\n' "$so_uid" "$so_pkg"
    return 1
  fi

  run_pm_hidden_setting unhide "$so_uid" "$so_pkg"
  so_rc=$?
  so_after="$PM_EXEC_STATE"
  so_out="$PM_EXEC_OUT"
  so_attempts="$PM_EXEC_ATTEMPTS"
  if [ "$so_rc" -eq 0 ] && [ "$so_after" = visible ]; then
    log_result "$so_action" "$so_uid" "$so_pkg" SUCCESS "state=$so_after attempts=$so_attempts rc=$PM_EXEC_RC transport=$PM_EXEC_TRANSPORT"
    printf 'OK|unhide|%s|%s\n' "$so_uid" "$so_pkg"
    return 0
  fi
  set_action_error PM_UNHIDE_FAILED "$so_uid" "$so_pkg" "$PM_EXEC_RC" "$so_attempts" "$so_after" "$PM_EXEC_TRANSPORT"
  log_result "$so_action" "$so_uid" "$so_pkg" FAIL "PM_UNHIDE_FAILED rc=$PM_EXEC_RC attempts=$so_attempts state=$so_after transport=$PM_EXEC_TRANSPORT"
  printf 'FAIL|unhide|%s|%s|PM_UNHIDE_FAILED\n' "$so_uid" "$so_pkg"
  return 1
}

apply_snapshot() {
  as_mode="$1"; as_file="$2"
  as_rc=0
  as_err_code=''; as_err_target=''; as_err_pm_rc=0; as_err_attempts=0; as_err_state=''; as_err_transport=''
  while IFS=: read -r as_uid as_pkg || [ -n "$as_uid$as_pkg" ]; do
    [ -z "$as_uid$as_pkg" ] && continue
    case "$as_mode" in
      hidden) hide_one "$as_uid" "$as_pkg" ;;
      visible) show_one "$as_uid" "$as_pkg" ;;
      *) echo 'BAD_MODE'; return 2 ;;
    esac
    as_one_rc=$?
    if [ "$as_one_rc" -ne 0 ]; then
      as_rc=1
      # Preserve the first concrete error. Later successful targets must not
      # erase it by resetting LAST_ACTION_*.
      if [ -z "$as_err_code" ]; then
        as_err_code="$LAST_ACTION_ERROR_CODE"
        as_err_target="$LAST_ACTION_TARGET"
        as_err_pm_rc="$LAST_ACTION_PM_RC"
        as_err_attempts="$LAST_ACTION_ATTEMPTS"
        as_err_state="$LAST_ACTION_STATE"
        as_err_transport="$LAST_ACTION_TRANSPORT"
      fi
    fi
  done <"$as_file"

  if [ "$as_rc" -ne 0 ]; then
    LAST_ACTION_ERROR_CODE="$as_err_code"
    LAST_ACTION_TARGET="$as_err_target"
    LAST_ACTION_PM_RC="$as_err_pm_rc"
    LAST_ACTION_ATTEMPTS="$as_err_attempts"
    LAST_ACTION_STATE="$as_err_state"
    LAST_ACTION_TRANSPORT="$as_err_transport"
  fi
  return "$as_rc"
}

write_targets_atomic() {
  wt_source="$1"
  ensure_data_dirs
  wt_tmp="$DATA_DIR/.targets.conf.$$"
  cp -f "$wt_source" "$wt_tmp" 2>/dev/null || return 1
  chmod 0600 "$wt_tmp" 2>/dev/null || true
  mv -f "$wt_tmp" "$TARGETS_CONF" || { rm -f "$wt_tmp"; return 1; }
  chmod 0600 "$TARGETS_CONF" 2>/dev/null || true
  backup_config >/dev/null 2>&1 || true
  return 0
}
