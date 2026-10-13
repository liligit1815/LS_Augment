#!/system/bin/sh
# Fixed-name legacy module data only. The caller supplies verified Android identities.
set -eu
fail(){ printf 'HEALTH_LEDGER_ERROR=%s\n' "$1"; exit 73; }
case "$expected_uid:$expected_user:$module_uid" in *[!0-9:]*|:*|*:) fail identity ;; esac
[ "$(id -u)" = 0 ] || fail root
[ "$base" = "/data/user/$expected_user/com.mi.health" ] || fail source_path
case "$stage" in /data/user/$expected_user/ls.augment.com/cache/health-ledger-migrate-*) ;; *) fail stage_path ;; esac
[ -d "$stage" ] && [ ! -L "$stage" ] && [ "$(stat -c %u "$stage")" = "$module_uid" ] || fail stage_identity
canonical_stage=$(readlink -f "$stage") || fail stage_canonical
if [ "$canonical_stage" != "$stage" ]; then
 [ "$expected_user" = 0 ] || fail stage_canonical
 case "$canonical_stage" in /data/data/ls.augment.com/cache/health-ledger-migrate-*) ;; *) fail stage_canonical ;; esac
fi
if [ "$phase" = discard_stage ];then
 # This UUID directory was created by this migration attempt. A Root timeout
 # may leave an app-owned copy with an unfinished SELinux label; remove only
 # the five known copies after validating the entire directory inventory.
 for file in "$stage"/* "$stage"/.[!.]* "$stage"/..?*;do
  [ -e "$file" ] || [ -L "$file" ] || continue
  case "${file##*/}" in ls_augment_steps_v1.db|ls_augment_steps_v1.db-wal|ls_augment_steps_v1.db-shm|ls_augment_steps_v1.db-journal|ls_augment_steps.lock) ;;*) fail staging_unknown_entry;;esac
  [ -f "$file" ] && [ ! -L "$file" ] && [ "$(stat -c %u "$file")" = "$module_uid" ] && [ "$(stat -c %h "$file")" = 1 ] || fail staging_identity
  [ "$(readlink -f "$file")" = "$canonical_stage/${file##*/}" ] || fail staging_canonical
 done
 for name in ls_augment_steps_v1.db ls_augment_steps_v1.db-wal ls_augment_steps_v1.db-shm ls_augment_steps_v1.db-journal ls_augment_steps.lock;do rm -f -- "$stage/$name" || fail staging_delete;done
 rmdir "$stage" || fail staging_remains
 printf 'HEALTH_LEDGER_STAGE_REMOVED=1\n'
 exit 0
fi
files='databases/ls_augment_steps_v1.db databases/ls_augment_steps_v1.db-wal databases/ls_augment_steps_v1.db-shm databases/ls_augment_steps_v1.db-journal files/ls_augment_steps.lock'
if [ ! -e "$base" ] && [ ! -L "$base" ]; then printf 'HEALTH_LEDGER_ABSENT=1\n'; exit 0; fi
[ -d "$base" ] && [ ! -L "$base" ] && [ "$(stat -c %u "$base")" = "$expected_uid" ] || fail source_identity
canonical_base=$(readlink -f "$base") || fail source_canonical
if [ "$canonical_base" != "$base" ]; then [ "$expected_user" = 0 ] && [ "$canonical_base" = /data/data/com.mi.health ] || fail source_canonical;fi
identity(){
 [ "$(readlink -f "$base")" = "$canonical_base" ] && [ "$(stat -c %u "$base")" = "$expected_uid" ] || fail changed_source_identity
 cmd package list packages --user "$expected_user" -U com.mi.health | grep -Fx "package:com.mi.health uid:$expected_uid" >/dev/null || fail package_identity
}
identity
validate(){
 identity
 total_size=0
 for directory in "$base/databases" "$base/files"; do
  if [ -e "$directory" ] || [ -L "$directory" ]; then [ -d "$directory" ] && [ ! -L "$directory" ] && [ "$(stat -c %u "$directory")" = "$expected_uid" ] || fail directory_identity; fi
 done
 present=0
 for relative in $files; do
  file="$base/$relative"
  if [ -e "$file" ] || [ -L "$file" ]; then
   [ -f "$file" ] && [ ! -L "$file" ] && [ "$(stat -c %u "$file")" = "$expected_uid" ] || fail file_identity
   [ "$(stat -c %h "$file")" = 1 ] || fail file_hardlink
   [ "$(readlink -f "$file")" = "$canonical_base/$relative" ] || fail file_canonical
   size=$(stat -c %s "$file") || fail file_size
   case "$size" in ''|*[!0-9]*) fail file_size ;; esac
   [ "$size" -le 268435456 ] || fail file_too_large
   total_size=$((total_size+size));[ "$total_size" -le 536870912 ] || fail ledger_too_large
   present=$((present+1))
  fi
 done
}
sync_directories(){
 command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
 for directory in "$base/databases" "$base/files"; do if [ -d "$directory" ];then fsync "$directory" || fail removal_not_durable;fi;done
}
validate
if [ "$present" = 0 ]; then sync_directories;printf 'HEALTH_LEDGER_ABSENT=1\n'; exit 0; fi
am force-stop --user "$expected_user" com.mi.health >/dev/null 2>&1 || fail force_stop
sleep 1
stopped(){
 for process in /proc/[0-9]*; do
  [ -d "$process" ] || continue
  # Avoid spawning an awk process for every Android process at each safety check.
  owner=
  if ! { while read -r key real rest;do
   if [ "$key" = Uid: ];then owner=$real;break;fi
  done < "$process/status"; } 2>/dev/null;then
   [ ! -d "$process" ] || fail process_identity
   continue
  fi
  [ -n "$owner" ] && [ "$owner" != "$expected_uid" ] || fail process_running
 done
}
stopped
validate
manifest(){
 for relative in $files; do
  if [ -f "$base/$relative" ]; then
   value=$(sha256sum "$base/$relative") || fail hash
   printf '%s:%s\n' "$relative" "${value%% *}"
  fi
 done
}
before=$(manifest) || fail manifest
digest=$(printf '%s' "$before" | sha256sum);digest=${digest%% *}
case "$phase" in
 snapshot)
  set --
  for relative in $files; do
   if [ -f "$base/$relative" ]; then
    name=${relative##*/}
    [ ! -e "$stage/$name" ] && [ ! -L "$stage/$name" ] || fail staging_target_exists
    cp "$base/$relative" "$stage/$name" || fail copy
    [ -f "$stage/$name" ] && [ ! -L "$stage/$name" ] && [ "$(stat -c %h "$stage/$name")" = 1 ] || fail staging_target_type
    chown "$module_uid:$module_uid" "$stage/$name" && chmod 600 "$stage/$name" || fail private_owner
    set -- "$@" "$stage/$name"
    original=$(sha256sum "$base/$relative");copy=$(sha256sum "$stage/$name")
    [ "${original%% *}" = "${copy%% *}" ] || fail copy_verification
   fi
  done
  [ "$#" -gt 0 ] || fail source_changed
  # Load Android SELinux policy once for the verified, fixed staging targets.
  # Its normal progress logs must not contaminate the one-line protocol.
  restorecon -D -F "$@" >/dev/null 2>&1 || fail private_label
  [ "$(manifest)" = "$before" ] || fail source_changed
  stopped
  printf 'HEALTH_LEDGER_DIGEST=%s\n' "$digest"
  ;;
 cleanup)
  case "$expected_digest" in ''|*[!a-f0-9]*) fail digest_format ;; esac
  [ "${#expected_digest}" = 64 ] && [ "$digest" = "$expected_digest" ] || fail source_changed
  # Recheck the complete inventory before the first deletion.
  validate
  [ "$(manifest)" = "$before" ] || fail source_changed
  stopped
  for relative in $files; do rm -f -- "$base/$relative" || fail delete;[ ! -e "$base/$relative" ] && [ ! -L "$base/$relative" ] || fail remains;done
  sync_directories
  printf 'HEALTH_LEDGER_CLEANED=1\n'
  ;;
 *) fail phase ;;
esac
