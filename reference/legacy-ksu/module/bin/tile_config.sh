#!/system/bin/sh
. /data/adb/modules/ls_augment/bin/common.sh

sanitize_tile_text() {
  printf '%s' "$1" | tr '\r\n' '  '
}
decode_b64() {
  printf '%s' "$1" | /system/bin/toybox base64 -d 2>/dev/null
}
encode_b64() {
  printf '%s' "$1" | /system/bin/toybox base64 2>/dev/null | tr -d '\r\n'
}
ensure_tile_config() {
  ensure_data_dirs
  [ -f "$TILE_CONF" ] || {
    printf 'label=%s\ndescription=%s\n' "$TILE_DEFAULT_LABEL" "$TILE_DEFAULT_DESCRIPTION" >"$TILE_CONF"
    chmod 0600 "$TILE_CONF" 2>/dev/null || true
  }
}
read_value() {
  sed -n "s/^$1=//p" "$TILE_CONF" 2>/dev/null | head -n 1
}
sync_tile_presentation() {
  ensure_tile_config
  tc_label="$(read_value label)"
  tc_desc="$(read_value description)"
  [ -n "$tc_label" ] || tc_label="$TILE_DEFAULT_LABEL"
  [ -n "$tc_desc" ] || tc_desc="$TILE_DEFAULT_DESCRIPTION"
  settings put global "$TILE_LABEL_KEY" "$tc_label" >/dev/null 2>&1 || return 1
  settings put global "$TILE_DESCRIPTION_KEY" "$tc_desc" >/dev/null 2>&1 || return 1
}

case "$1" in
  get|'')
    ensure_tile_config
    tc_label="$(read_value label)"; [ -n "$tc_label" ] || tc_label="$TILE_DEFAULT_LABEL"
    tc_desc="$(read_value description)"; [ -n "$tc_desc" ] || tc_desc="$TILE_DEFAULT_DESCRIPTION"
    printf 'label64|%s\n' "$(encode_b64 "$tc_label")"
    printf 'description64|%s\n' "$(encode_b64 "$tc_desc")"
    ;;
  set)
    shift
    [ "$#" -eq 2 ] || { echo 'BAD_ARGS|expected label64 description64'; exit 2; }
    tc_label="$(sanitize_tile_text "$(decode_b64 "$1")")"
    tc_desc="$(sanitize_tile_text "$(decode_b64 "$2")")"
    [ -n "$tc_label" ] || tc_label="$TILE_DEFAULT_LABEL"
    [ -n "$tc_desc" ] || tc_desc="$TILE_DEFAULT_DESCRIPTION"
    tc_tmp="$RUNTIME_DIR/.tile.conf.$$"
    printf 'label=%s\ndescription=%s\n' "$tc_label" "$tc_desc" >"$tc_tmp" || exit 5
    chmod 0600 "$tc_tmp" 2>/dev/null || true
    mv -f "$tc_tmp" "$TILE_CONF" || exit 5
    sync_tile_presentation || { echo 'MIRROR_UPDATE_FAILED'; exit 8; }
    echo 'OK|tile-config-saved'
    ;;
  sync)
    sync_tile_presentation || exit 8
    echo 'OK|tile-config-synced'
    ;;
  *) echo 'BAD_COMMAND'; exit 2 ;;
esac
