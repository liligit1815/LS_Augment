#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh

ensure_automation_config() {
  ensure_data_dirs
  [ -d "$AUTOMATION_RUNTIME_DIR" ] || mkdir -p "$AUTOMATION_RUNTIME_DIR"
  chmod 0700 "$AUTOMATION_RUNTIME_DIR" 2>/dev/null || true
  if [ ! -f "$AUTOMATION_CONF" ]; then
    printf 'enabled=0\nscope=current\n' >"$AUTOMATION_CONF"
  fi
  chmod 0600 "$AUTOMATION_CONF" 2>/dev/null || true
}

automation_value() {
  sed -n "s/^$1=//p" "$AUTOMATION_CONF" 2>/dev/null | head -n 1
}

is_enabled() { [ "$(automation_value enabled)" = 1 ]; }

current_user() {
  au_user="$(cmd activity get-current-user 2>/dev/null | head -n 1)"
  case "$au_user" in ''|*[!0-9]*) au_user="$(am get-current-user 2>/dev/null | head -n 1)" ;; esac
  case "$au_user" in ''|*[!0-9]*) au_user=0 ;; esac
  printf '%s' "$au_user"
}

screen_power_state() {
  # MyOS enters DOZE while locking, even though the backlight attribute can
  # still report 0. Prefer the framework display state over backlight.
  au_display="$(dumpsys display 2>/dev/null | sed -n 's/.*Display State=\(ON\|DOZE\|OFF\).*/\1/p')"
  case "$au_display" in
    *'Display State=ON'*) printf 'on' ;;
    *'Display State=DOZE'*|*'Display State=OFF'*) printf 'off' ;;
    *)
      # Fallback for ROMs without the standard display dump line.
      au_bl="$(cat /sys/class/backlight/panel0-backlight/bl_power 2>/dev/null)"
      case "$au_bl" in
        0) printf 'on' ;;
        4) printf 'off' ;;
        *) printf 'unknown' ;;
      esac
      ;;
  esac
}

auto_hide() {
  is_enabled || return 0
  [ -f "$AUTOMATION_ACTIVE" ] && return 0
  acquire_action_lock AUTO_HIDE || return 30
  au_rc=0
  trap 'release_action_lock' 0 1 2 15
  au_targets="$AUTOMATION_RUNTIME_DIR/.targets-hide.$$"
  if snapshot_targets "$au_targets" >/dev/null 2>&1; then
    au_scope="$(automation_value scope)"; au_user="$(current_user)"
    while IFS=: read -r au_uid au_pkg || [ -n "$au_uid$au_pkg" ]; do
      [ -z "$au_uid$au_pkg" ] && continue
      [ "$au_scope" = all ] || [ "$au_uid" = "$au_user" ] || continue
      hide_one "$au_uid" "$au_pkg" >/dev/null 2>&1 || au_rc=1
    done <"$au_targets"
  else
    au_rc=1
  fi
  rm -f "$au_targets"
  sync_hook_mirror >/dev/null 2>&1 || au_rc=1
  touch "$AUTOMATION_ACTIVE"
  chmod 0600 "$AUTOMATION_ACTIVE" 2>/dev/null || true
  printf 'screen_off\n' >"$AUTOMATION_LAST_EVENT"
  log_result AUTO_HIDE 0 automation "$([ "$au_rc" -eq 0 ] && echo SUCCESS || echo FAIL)" "scope=$(automation_value scope)" 2>/dev/null || true
  release_action_lock
  trap - 0 1 2 15
  return "$au_rc"
}

ensure_automation_config
if [ "$(automation_value enabled)" != 1 ]; then
  # Disabled means no resident watcher and no periodic screen-state reads.
  exit 0
fi
old_pid="$(cat "$AUTOMATION_PID_FILE" 2>/dev/null)"
if [ -n "$old_pid" ] && [ "$old_pid" != "$$" ] && kill -0 "$old_pid" 2>/dev/null; then exit 0; fi
printf '%s\n' "$$" >"$AUTOMATION_PID_FILE"
chmod 0600 "$AUTOMATION_PID_FILE" 2>/dev/null || true
cleanup_daemon() { [ "$(cat "$AUTOMATION_PID_FILE" 2>/dev/null)" = "$$" ] && rm -f "$AUTOMATION_PID_FILE"; }
trap 'cleanup_daemon; exit 0' 0 1 2 15

# If the phone rebooted while non-interactive, apply the policy once at boot.
if is_enabled && [ "$(screen_power_state)" = off ]; then
  auto_hide >/dev/null 2>&1 || true
fi

# The target MyOS build does not emit the standard screen_toggled event-log
# record. Read the kernel backlight power state at a low frequency instead of
# polling dumpsys or keeping a wake lock. The action is still edge-triggered:
# only an on -> off transition invokes pm hide.
au_last_state="$(screen_power_state)"
if [ "$au_last_state" = on ] && [ -f "$AUTOMATION_ACTIVE" ]; then
  # A reboot can apply the boot-time hide while the panel is off, then finish
  # booting with the panel on. Treat that as a completed screen cycle.
  rm -f "$AUTOMATION_ACTIVE"
  printf 'screen_on\n' >"$AUTOMATION_LAST_EVENT"
fi
while :; do
  [ "$(automation_value enabled)" = 1 ] || exit 0
  au_state="$(screen_power_state)"
  if [ "$au_state" = on ] && [ -f "$AUTOMATION_ACTIVE" ] && [ "$au_last_state" != off ]; then
    # If boot completed after the initial screen-state read, clear a stale
    # boot-time marker once the panel is confirmed on.
    rm -f "$AUTOMATION_ACTIVE"
    printf 'screen_on\n' >"$AUTOMATION_LAST_EVENT"
  elif [ "$au_state" = off ] && [ "$au_last_state" = on ]; then
    auto_hide >/dev/null 2>&1 || true
  elif [ "$au_state" = on ] && [ "$au_last_state" = off ]; then
    # Unlock never restores applications; this only arms the next lock cycle.
    rm -f "$AUTOMATION_ACTIVE"
    printf 'screen_on\n' >"$AUTOMATION_LAST_EVENT"
  fi
  [ "$au_state" = unknown ] || au_last_state="$au_state"
  sleep 2
done
