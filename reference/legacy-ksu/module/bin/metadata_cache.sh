#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh

ensure_data_dirs
[ -f "$METADATA_FILE" ] || : >"$METADATA_FILE"
chmod 0600 "$METADATA_FILE" 2>/dev/null || true

mc_lock() {
  mc_n=0
  while ! mkdir "$METADATA_LOCK" 2>/dev/null; do
    mc_n=$((mc_n + 1))
    [ "$mc_n" -lt 20 ] || { echo 'METADATA_BUSY'; return 1; }
    sleep 0.05 2>/dev/null || sleep 1
  done
  printf '%s\n' "$$" >"$METADATA_LOCK/pid" 2>/dev/null || true
}
mc_unlock() { rm -rf "$METADATA_LOCK" 2>/dev/null || true; }

mc_valid_b64() {
  case "$1" in
    ''|*[!A-Za-z0-9+/=]*) return 1 ;;
    *) [ "${#1}" -le 4096 ] ;;
  esac
}

case "$1" in
  list)
    cat "$METADATA_FILE" 2>/dev/null
    ;;

  put)
    shift
    [ $(( $# % 4 )) -eq 0 ] || { echo 'BAD_METADATA_ARGS'; exit 2; }
    mc_lock || exit 30
    trap 'mc_unlock' 0 1 2 15
    mc_work="$RUNTIME_DIR/.metadata.work.$$"
    cp -f "$METADATA_FILE" "$mc_work" 2>/dev/null || : >"$mc_work"

    while [ "$#" -gt 0 ]; do
      mc_uid="$1"; mc_pkg="$2"; mc_label="$3"; mc_system="$4"; shift 4
      is_valid_uid "$mc_uid" || { echo "BAD_UID|$mc_uid|$mc_pkg"; exit 2; }
      is_valid_pkg "$mc_pkg" || { echo "BAD_PACKAGE|$mc_uid|$mc_pkg"; exit 2; }
      mc_valid_b64 "$mc_label" || { echo "BAD_LABEL|$mc_uid|$mc_pkg"; exit 2; }
      case "$mc_system" in 0|1) ;; *) echo "BAD_SYSTEM_FLAG|$mc_uid|$mc_pkg"; exit 2 ;; esac

      mc_next="$RUNTIME_DIR/.metadata.next.$$"
      : >"$mc_next"
      while IFS='|' read -r mc_old_uid mc_old_pkg mc_old_label mc_old_system || [ -n "$mc_old_uid$mc_old_pkg$mc_old_label$mc_old_system" ]; do
        [ -z "$mc_old_uid$mc_old_pkg" ] && continue
        [ "$mc_old_uid" = "$mc_uid" ] && [ "$mc_old_pkg" = "$mc_pkg" ] && continue
        printf '%s|%s|%s|%s\n' "$mc_old_uid" "$mc_old_pkg" "$mc_old_label" "$mc_old_system" >>"$mc_next"
      done <"$mc_work"
      printf '%s|%s|%s|%s\n' "$mc_uid" "$mc_pkg" "$mc_label" "$mc_system" >>"$mc_next"
      mv -f "$mc_next" "$mc_work" || exit 5
    done

    sort -t '|' -k1,1n -k2,2 -u "$mc_work" -o "$mc_work" 2>/dev/null || true
    chmod 0600 "$mc_work" 2>/dev/null || true
    mv -f "$mc_work" "$METADATA_FILE" || exit 5
    chmod 0600 "$METADATA_FILE" 2>/dev/null || true
    echo 'OK'
    ;;

  clear)
    mc_lock || exit 30
    trap 'mc_unlock' 0 1 2 15
    : >"$METADATA_FILE" || exit 5
    chmod 0600 "$METADATA_FILE" 2>/dev/null || true
    echo 'OK'
    ;;

  *)
    echo 'Usage: metadata_cache.sh {list|put UID PKG LABEL_B64 SYSTEM ...|clear}'
    exit 2
    ;;
esac
