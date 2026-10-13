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
# Only the verified wake-capable driver has a global hardware session. Other
# devices continue to drain their read-only private leases without this tool.
driver=/vendor_dlkm/lib/modules/aw9620x.ko
driver_sum=$(sha256sum "$driver" 2>/dev/null || :)
hardware_lock=0
hardware_locked=0
if [ "${driver_sum%% *}" = 3211fdc4b97aabe3c0db8f06f3ec07da8c3c382a6273412adb089940e9d4b532 ]; then
  command -v flock >/dev/null || fail missing_flock
  exec 9< "$driver" || fail hardware_lock_open
  opened_sum=$(sha256sum "/proc/$$/fd/9" 2>/dev/null) || fail hardware_lock_identity
  [ "${opened_sum%% *}" = "${driver_sum%% *}" ] || fail hardware_lock_identity
  hardware_lock=1
  if flock -x -n 9 9>&9; then hardware_locked=1; else had_lock=1; fi
fi
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
  if [ "$hardware_lock" = 1 ] && [ "$hardware_locked" = 0 ]; then
    if flock -x -n 9 9>&9; then hardware_locked=1; else pending=1; fi
  fi
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
# These are durable responsibility records, not runtime locks. Empty records
# never reached a wake write; a different boot has reset the hardware. Retain
# current-boot or malformed records rather than guess after both processes die.
recovery="$actual_base/files/rapid-capture-v1"
if [ -e "$recovery" ] || [ -L "$recovery" ]; then
  for directory in "$actual_base/files" "$recovery"; do
    [ -d "$directory" ] && [ ! -L "$directory" ] || fail recovery_type
    [ "$(readlink -f "$directory")" = "$directory" ] || fail recovery_canonical
    [ "$(stat -c %u "$directory")" = "$expected_uid" ] || fail recovery_owner
  done
  boot_id=$(cat /proc/sys/kernel/random/boot_id 2>/dev/null) || fail boot_identity
  printf '%s\n' "$boot_id" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' || fail boot_identity
  for state in "$recovery"/*; do
    [ -e "$state" ] || [ -L "$state" ] || continue
    name=${state##*/}
    printf '%s\n' "$name" | grep -Eq '^rapid-input-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\.lease\.recorder$' || fail recovery_unknown
    [ -f "$state" ] && [ ! -L "$state" ] || fail recovery_file_type
    [ "$(stat -c %u "$state")" = "$expected_uid" ] && [ "$(stat -c %h "$state")" = 1 ] || fail recovery_file_owner
    [ "$(readlink -f "$state")" = "$state" ] || fail recovery_file_canonical
    if [ -s "$state" ]; then
      [ "$(stat -c %s "$state")" -le 96 ] || fail recovery_format
      saved=$(cat "$state") || fail recovery_read
      printf '%s\n' "$saved" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}:[0-9]{1,10}:[0-9]{1,20}$' || fail recovery_format
      [ "${saved%%:*}" != "$boot_id" ] || fail recovery_unconfirmed
    fi
    rm -f -- "$state" || fail recovery_remove
    [ ! -e "$state" ] && [ ! -L "$state" ] || fail recovery_remains
  done
fi
printf 'RAPID_CAPTURE_DRAINED:%s:%s\n' "$signals" "$had_lock"
