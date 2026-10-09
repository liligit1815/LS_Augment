#!/system/bin/sh
# Variables are set by HealthResetController from checked Android identities.
# Only the module's exact ledger/lock names are candidates; native health stores
# and every other health preference/file are deliberately outside this operation.
set -eu
fail() { printf 'HEALTH_RESET_ERROR=%s\n' "$1"; exit 73; }
case "$expected_uid:$expected_user" in *[!0-9:]*|:*|*:) fail identity_format ;; esac
[ "$(id -u)" = 0 ] || fail root_required
[ "$base" = "/data/user/$expected_user/com.mi.health" ] || fail data_path
[ -d "$base" ] || fail data_unavailable
actual_base=$(readlink -f "$base") || fail canonical_path
if [ "$actual_base" != "$base" ]; then
    [ "$expected_user" = 0 ] && [ "$actual_base" = /data/data/com.mi.health ] || fail canonical_path
fi
[ "$(stat -c %u "$base")" = "$expected_uid" ] || fail data_owner
package_matches() {
    cmd package list packages --user "$expected_user" -U com.mi.health 2>/dev/null |
        grep -Fx "package:com.mi.health uid:$expected_uid" >/dev/null
}
package_matches || fail package_identity
check_directories() {
    for directory in "$base/databases" "$base/files"; do
        if [ -e "$directory" ] || [ -L "$directory" ]; then
            [ -d "$directory" ] && [ ! -L "$directory" ] || fail directory_type
            [ "$(stat -c %u "$directory")" = "$expected_uid" ] || fail directory_owner
        fi
    done
}
check_directories
present=0
ledger_present=0
for relative in databases/ls_augment_steps_v1.db databases/ls_augment_steps_v1.db-wal databases/ls_augment_steps_v1.db-shm databases/ls_augment_steps_v1.db-journal files/ls_augment_steps.lock; do
    file="$base/$relative"
    if [ -e "$file" ] || [ -L "$file" ]; then
        [ -f "$file" ] && [ ! -L "$file" ] || fail file_type
        [ "$(stat -c %u "$file")" = "$expected_uid" ] || fail file_owner
        present=$((present + 1))
        case "$relative" in databases/*) ledger_present=1 ;; esac
    fi
done
am force-stop --user "$expected_user" com.mi.health >/dev/null 2>&1 || fail force_stop
# Stop even with no files yet: an initializing health hook must not create its
# first ledger between an empty inventory and successful reset completion.
# Reject surviving processes rather than delete a live WAL.
sleep 1
package_matches || fail changed_package_identity
[ "$(stat -c %u "$base")" = "$expected_uid" ] || fail changed_data_owner
[ "$(readlink -f "$base")" = "$actual_base" ] || fail changed_canonical_path
check_directories
for process in /proc/[0-9]*; do
    # A non-dumpable process may expose a root-owned /proc directory. Read its
    # real UID from status instead of treating directory ownership as identity.
    [ -d "$process" ] || continue
    owner=$(awk '/^Uid:/{print $2; exit}' "$process/status" 2>/dev/null) || {
        [ ! -d "$process" ] || fail process_identity_unavailable
        continue
    }
    [ -n "$owner" ] || fail process_identity_unavailable
    [ "$owner" != "$expected_uid" ] || fail process_still_running
done
# Validate every file again after shutdown, before removing any file. Include
# files created by a hook during shutdown in the final removal count.
present=0
for relative in databases/ls_augment_steps_v1.db databases/ls_augment_steps_v1.db-wal databases/ls_augment_steps_v1.db-shm databases/ls_augment_steps_v1.db-journal files/ls_augment_steps.lock; do
    file="$base/$relative"
    if [ -e "$file" ] || [ -L "$file" ]; then
        [ -f "$file" ] && [ ! -L "$file" ] || fail changed_file_type
        [ "$(stat -c %u "$file")" = "$expected_uid" ] || fail changed_file_owner
        present=$((present + 1))
        case "$relative" in databases/*) ledger_present=1 ;; esac
    fi
done
for relative in databases/ls_augment_steps_v1.db databases/ls_augment_steps_v1.db-wal databases/ls_augment_steps_v1.db-shm databases/ls_augment_steps_v1.db-journal files/ls_augment_steps.lock; do
    rm -f -- "$base/$relative" || fail file_remove
    [ ! -e "$base/$relative" ] && [ ! -L "$base/$relative" ] || fail file_remains
done
printf 'HEALTH_RESET_FILES=%s\nHEALTH_RESET_LEDGER_PRESENT=%s\n' "$present" "$ledger_present"
