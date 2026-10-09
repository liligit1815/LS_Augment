#!/system/bin/sh
# Config is already paused and synchronized. This app alone creates motion-v3 derivatives.
set -eu
fail() { printf 'GAMEHELPER_CACHE_ERROR=%s\n' "$1" >&2; exit 73; }
package=cn.nubia.gamehelpmodule
case "$expected_uid:$expected_user" in *[!0-9:]*|:*|*:) fail identity_format ;; esac
[ "$((expected_uid / 100000))" = "$expected_user" ] || fail wrong_user
[ "$(id -u)" = 0 ] || fail root_required
[ "$base" = "/data/user/$expected_user/$package" ] || fail data_path
for parent in /data /data/user; do [ -d "$parent" ] && [ ! -L "$parent" ] || fail parent_type; done
[ -d "$base" ] && [ ! -L "$base" ] || fail data_type
actual_base=$(readlink -f "$base") || fail canonical_path
if [ "$actual_base" != "$base" ]; then
  [ "$expected_user" = 0 ] && [ "$actual_base" = "/data/data/$package" ] || fail canonical_path
  [ -d /data/data ] && [ ! -L /data/data ] || fail canonical_parent
fi
[ "$(stat -c %u "$base")" = "$expected_uid" ] || fail data_owner
package_matches() {
  cmd package list packages --user "$expected_user" -U "$package" 2>/dev/null |
    grep -Fx "package:$package uid:$expected_uid" >/dev/null
}
package_matches || fail package_identity
am force-stop --user "$expected_user" "$package" >/dev/null 2>&1 || fail force_stop
sleep 1
for process in /proc/[0-9]*; do
  [ -d "$process" ] || continue
  owner=$(awk '/^Uid:/{print $2; exit}' "$process/status" 2>/dev/null) || {
    [ ! -d "$process" ] || fail process_identity_unavailable
    continue
  }
  [ -n "$owner" ] || fail process_identity_unavailable
  [ "$owner" != "$expected_uid" ] || fail process_still_running
done
package_matches || fail changed_package_identity
[ "$(stat -c %u "$base")" = "$expected_uid" ] || fail changed_data_owner
[ "$(readlink -f "$base")" = "$actual_base" ] || fail changed_canonical_path
cache="$base/cache"
directory="$cache/ls_augment_combo"
for folder in "$cache" "$directory"; do
  if [ -e "$folder" ] || [ -L "$folder" ]; then
    [ -d "$folder" ] && [ ! -L "$folder" ] || fail cache_type
    [ "$(stat -c %u "$folder")" = "$expected_uid" ] || fail cache_owner
  fi
done
if [ ! -e "$directory" ]; then printf 'GAMEHELPER_CACHE_CLEARED:0\n'; exit 0; fi
[ "$(readlink -f "$cache")" = "$actual_base/cache" ] || fail cache_canonical
[ "$(readlink -f "$directory")" = "$actual_base/cache/ls_augment_combo" ] || fail directory_canonical
snapshot=
count=0
for file in "$directory"/motion-v3-*; do
  name=${file##*/}
  printf '%s\n' "$name" | grep -Eq '^motion-v3-[0-9a-f]{64}(\.json|\.pending-[0-9]{1,20})$' || continue
  [ -e "$file" ] || [ -L "$file" ] || continue
  [ -f "$file" ] && [ ! -L "$file" ] || fail file_type
  [ "$(stat -c %u "$file")" = "$expected_uid" ] || fail file_owner
  [ "$(stat -c %h "$file")" = 1 ] || fail file_hardlink
  [ "$(stat -c %s "$file")" -le 33554432 ] || fail file_size
  [ "$(readlink -f "$file")" = "$actual_base/cache/ls_augment_combo/$name" ] || fail file_canonical
  stamp=$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$file") || fail file_stat
  snapshot="$snapshot$name|$stamp
"
done
# All candidates pass preflight before the first deletion. No recursive cache removal.
while IFS='|' read -r name stamp; do
  [ -n "$name" ] || continue
  file="$directory/$name"
  [ ! -L "$file" ] && [ -f "$file" ] || fail file_changed
  [ "$(readlink -f "$file")" = "$actual_base/cache/ls_augment_combo/$name" ] || fail file_changed
  [ "$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$file")" = "$stamp" ] || fail file_changed
  package_matches || fail changed_package_identity
  rm -f -- "$file" || fail file_remove
  [ ! -e "$file" ] && [ ! -L "$file" ] || fail file_remains
  count=$((count + 1))
done <<EOF
$snapshot
EOF
if [ "$count" -gt 0 ]; then
  command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
  fsync "$directory" "$cache" || fail removal_not_durable
fi
printf 'GAMEHELPER_CACHE_CLEARED:%s\n' "$count"
