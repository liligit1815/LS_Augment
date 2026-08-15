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
  av_key="$1"
  sed -n "s/^${av_key}=//p" "$AUTOMATION_CONF" 2>/dev/null | head -n 1
}

automation_running() {
  ar_pid="$(cat "$AUTOMATION_PID_FILE" 2>/dev/null)"
  case "$ar_pid" in
    ''|*[!0-9]*) return 1 ;;
    *) [ "$ar_pid" != "$$" ] && kill -0 "$ar_pid" 2>/dev/null ;;
  esac
}

automation_stop() {
  as_pid="$(cat "$AUTOMATION_PID_FILE" 2>/dev/null)"
  case "$as_pid" in
    ''|*[!0-9]*) ;;
    *) [ "$as_pid" != "$$" ] && kill "$as_pid" 2>/dev/null || true ;;
  esac
  rm -f "$AUTOMATION_PID_FILE" "$AUTOMATION_ACTIVE" 2>/dev/null || true
}

automation_start() {
  automation_running && return 0
  rm -f "$AUTOMATION_PID_FILE" 2>/dev/null || true
  "$MODDIR/bin/automation_daemon.sh" >/dev/null 2>&1 &
}

automation_get() {
  ensure_automation_config
  ag_enabled="$(automation_value enabled)"
  ag_scope="$(automation_value scope)"
  case "$ag_enabled" in 1) ;; *) ag_enabled=0 ;; esac
  case "$ag_scope" in current|all) ;; *) ag_scope=current ;; esac
  ag_running=0
  automation_running && ag_running=1
  ag_active=0
  [ -f "$AUTOMATION_ACTIVE" ] && ag_active=1
  printf 'enabled|%s\nscope|%s\nrunning|%s\nactive|%s\ntrigger|screen_state\n' \
    "$ag_enabled" "$ag_scope" "$ag_running" "$ag_active"
  [ -f "$AUTOMATION_LAST_EVENT" ] && printf 'last|%s\n' "$(cat "$AUTOMATION_LAST_EVENT" 2>/dev/null)"
  return 0
}

automation_set() {
  as_enabled="$1"; as_scope="$2"
  case "$as_enabled" in 0|1) ;; *) echo 'BAD_ENABLED'; return 2 ;; esac
  case "$as_scope" in current|all) ;; *) echo 'BAD_SCOPE'; return 2 ;; esac
  ensure_automation_config
  as_tmp="$AUTOMATION_CONF.tmp.$$"
  printf 'enabled=%s\nscope=%s\n' "$as_enabled" "$as_scope" >"$as_tmp" || { rm -f "$as_tmp"; echo 'WRITE_FAILED'; return 5; }
  chmod 0600 "$as_tmp" 2>/dev/null || true
  mv -f "$as_tmp" "$AUTOMATION_CONF" || { rm -f "$as_tmp"; echo 'WRITE_FAILED'; return 5; }
  if [ "$as_enabled" -eq 0 ]; then automation_stop; else automation_start; fi
  echo 'OK|automation-saved'
}

case "$1" in
  get|'') automation_get ;;
  set) shift; [ "$#" -eq 2 ] || { echo 'BAD_ARGUMENTS'; exit 2; }; automation_set "$1" "$2" ;;
  *) echo 'BAD_COMMAND'; exit 2 ;;
esac
