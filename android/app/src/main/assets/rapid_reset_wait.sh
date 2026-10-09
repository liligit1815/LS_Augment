#!/system/bin/sh
# Removing a private lease requests cancellation; only the original controller restores its saved modes.
set -eu
fail() { printf 'RAPID_RESET_ERROR=%s\n' "$1" >&2; exit 73; }
case "$expected_uid:$expected_user" in *[!0-9:]*|:*|*:) fail identity_format ;; esac
[ "$((expected_uid / 100000))" = "$expected_user" ] || fail wrong_user
[ "$(id -u)" = 0 ] || fail root_required
base="/data/user/$expected_user/ls.augment.com"
cache="$base/cache"
[ -d "$base" ] && [ ! -L "$base" ] || fail base_type
actual_base=$(readlink -f "$base") || fail base_canonical
if [ "$actual_base" != "$base" ]; then
  [ "$expected_user" = 0 ] && [ "$actual_base" = /data/data/ls.augment.com ] || fail base_canonical
fi
[ "$(stat -c %u "$base")" = "$expected_uid" ] || fail base_owner
[ -d "$cache" ] && [ ! -L "$cache" ] || fail cache_type
[ "$(readlink -f "$cache")" = "$actual_base/cache" ] || fail cache_canonical
[ "$(stat -c %u "$cache")" = "$expected_uid" ] || fail cache_owner
lock=/dev/.lsaugment_rapid_input_capture
had_lock=0
if [ -e "$lock" ] || [ -L "$lock" ]; then had_lock=1; fi
leases=
for lease in "$cache"/rapid-input-*.lease; do
  name=${lease##*/}
  printf '%s\n' "$name" | grep -Eq '^rapid-input-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\.lease$' || continue
  [ -e "$lease" ] || [ -L "$lease" ] || continue
  [ -f "$lease" ] && [ ! -L "$lease" ] || fail lease_type
  [ "$(stat -c %u "$lease")" = "$expected_uid" ] || fail lease_owner
  [ "$(stat -c %h "$lease")" = 1 ] || fail lease_hardlink
  [ "$(readlink -f "$lease")" = "$actual_base/cache/$name" ] || fail lease_canonical
  leases="$leases$name
"
done
signals=0
while IFS= read -r name; do
  [ -n "$name" ] || continue
  lease="$cache/$name"
  [ -f "$lease" ] && [ ! -L "$lease" ] || fail lease_changed
  [ "$(stat -c %u "$lease")" = "$expected_uid" ] && [ "$(stat -c %h "$lease")" = 1 ] || fail lease_changed
  [ "$(readlink -f "$lease")" = "$actual_base/cache/$name" ] || fail lease_changed
  rm -f -- "$lease" || fail lease_signal
  [ ! -e "$lease" ] && [ ! -L "$lease" ] || fail lease_remains
  signals=$((signals + 1))
done <<EOF
$leases
EOF
ticks=0
while :; do
  pending=0
  if [ -e "$lock" ] || [ -L "$lock" ]; then
    [ -d "$lock" ] && [ ! -L "$lock" ] || fail external_lock_type
    [ "$(readlink -f "$lock")" = "$lock" ] || fail external_lock_canonical
    [ "$(stat -c %u "$lock")" = 0 ] || fail external_lock_owner
    pending=1
  fi
  # The read-only script also owns live getevent buffers; wait for its cleanup, never remove them while active.
  for buffer in "$cache"/rapid-input-*.lease.read.*; do
    [ -e "$buffer" ] || [ -L "$buffer" ] || continue
    pending=1
  done
  [ "$pending" = 1 ] || break
  ticks=$((ticks + 1))
  [ "$ticks" -lt 150 ] || fail session_still_running
  sleep 0.1
done
printf 'RAPID_CAPTURE_DRAINED:%s:%s\n' "$signals" "$had_lock"
