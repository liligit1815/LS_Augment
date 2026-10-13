#!/system/bin/sh
# A bounded hardware lease, independent of the Activity/process lifetime.
# aw9620x mode 1=active, 2=sleep; no raw register writes or unknown driver layouts.
owner_pid=$1
lease=$2
device0=$3
device1=$4
target=$5
expected_uid=$6
recorder_state=$7
fail() { echo "LSA_CAPTURE_ERROR=$1"; exit 2; }
case "$owner_pid" in ''|*[!0-9]*) fail invalid_owner;; esac
case "$expected_uid" in ''|*[!0-9]*) fail invalid_uid;; esac
[ "$(id -u)" = 0 ] || fail invalid_root
user=$((expected_uid / 100000))
base="/data/user/$user/ls.augment.com"
[ -d "$base" ] && [ ! -L "$base" ] || fail invalid_base
actual_base=$(readlink -f "$base") || fail invalid_base
if [ "$actual_base" != "$base" ]; then
    [ "$user" = 0 ] && [ "$actual_base" = /data/data/ls.augment.com ] || fail invalid_base
fi
[ "$(stat -c %u "$base")" = "$expected_uid" ] || fail invalid_base_owner
cache="$actual_base/cache"
[ -d "$cache" ] && [ ! -L "$cache" ] && [ "$(readlink -f "$cache")" = "$cache" ] || fail invalid_cache
[ "$(stat -c %u "$cache")" = "$expected_uid" ] || fail invalid_cache_owner
name=${lease##*/}
printf '%s\n' "$name" | grep -Eq '^rapid-input-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\.lease$' || fail invalid_lease
[ "$lease" = "$cache/$name" ] || fail invalid_lease
private_file() {
    [ -f "$1" ] && [ ! -L "$1" ] && [ "$(readlink -f "$1")" = "$1" ] \
        && [ "$(stat -c %u "$1")" = "$expected_uid" ] && [ "$(stat -c %h "$1")" = 1 ]
}
private_file "$lease" || fail invalid_lease
recovery="$actual_base/files/rapid-capture-v1"
for directory in "$actual_base/files" "$recovery"; do
    [ -d "$directory" ] && [ ! -L "$directory" ] && [ "$(readlink -f "$directory")" = "$directory" ] \
        && [ "$(stat -c %u "$directory")" = "$expected_uid" ] || fail invalid_recovery
done
[ "$recorder_state" = "$recovery/$name.recorder" ] || fail invalid_recorder
private_file "$recorder_state" && [ ! -s "$recorder_state" ] || fail invalid_recorder
boot_id=$(cat /proc/sys/kernel/random/boot_id 2>/dev/null)
printf '%s\n' "$boot_id" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$' || fail invalid_boot
case "$device0" in /dev/input/event*) ;; *) fail invalid_device0;; esac
case "$device1" in /dev/input/event*) ;; *) fail invalid_device1;; esac
[ "$(cat /sys/class/input/${device0##*/}/device/name 2>/dev/null)" = nubia_tgk_aw_sar0_ch0 ] || fail device0_changed
[ "$(cat /sys/class/input/${device1##*/}/device/name 2>/dev/null)" = nubia_tgk_aw_sar1_ch0 ] || fail device1_changed
case "$target" in "$device0"|"$device1") ;; *) fail invalid_target;; esac

driver=/vendor_dlkm/lib/modules/aw9620x.ko
driver_sum=$(sha256sum "$driver" 2>/dev/null)
if [ "${driver_sum%% *}" != 3211fdc4b97aabe3c0db8f06f3ec07da8c3c382a6273412adb089940e9d4b532 ]; then
    echo LSA_CAPTURE_ERROR=unverified_driver
    exit 2
fi
command -v getevent >/dev/null || fail missing_tools
command -v fsync >/dev/null || fail missing_tools
command -v flock >/dev/null || fail missing_flock
# Lock an existing, verified, read-only inode: the same kernel lock serves every
# Android user. No lock directory is created outside the module's private cache.
exec 9< "$driver" || fail lock_unavailable
opened_sum=$(sha256sum "/proc/$$/fd/9" 2>/dev/null)
[ "${opened_sum%% *}" = "${driver_sum%% *}" ] || fail lock_unavailable
flock -x -n 9 9>&9 || fail busy
# An old controller loaded before this upgrade still owns its legacy lease.
# It alone removes that directory; reboot also clears the old tmpfs directory.
[ ! -e /dev/.lsaugment_rapid_input_capture ] && [ ! -L /dev/.lsaugment_rapid_input_capture ] || fail busy
for previous in "$recovery"/rapid-input-*.lease.recorder; do
    [ "$previous" != "$recorder_state" ] && [ -s "$previous" ] || continue
    private_file "$previous" || fail recovery_pending
    [ "$(stat -c %s "$previous")" -le 96 ] || fail recovery_pending
    previous_value=$(cat "$previous") || fail recovery_pending
    printf '%s\n' "$previous_value" | grep -Eq '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}:[0-9]{1,10}:[0-9]{1,20}$' || fail recovery_pending
    IFS=: read -r previous_boot previous_pid previous_start previous_extra < "$previous"
    [ "$previous_boot" != "$boot_id" ] || fail recovery_pending
done
mode0=/sys/class/leds/sar0/mode_operation
mode1=/sys/class/leds/sar1/mode_operation
read_mode() { sed -n 's/^mode : \([12]\), .*/\1/p' "$1"; }
old0=$(read_mode "$mode0")
old1=$(read_mode "$mode1")
case "$old0:$old1" in 1:1|1:2|2:1|2:2) ;; *) echo LSA_CAPTURE_ERROR=unknown_mode; exit 2;; esac
[ -f "$lease" ] && [ -d "/proc/$owner_pid" ] || exit 130

umask 077
controller=$$
recorder=
recorder_start=
watchdog=
reason=interrupted
started=0
process_start() {
    process_stat=$(cat "/proc/$1/stat" 2>/dev/null) || return 1
    process_fields=${process_stat##*) }
    set -- $process_fields
    [ "$#" -ge 20 ] || return 1
    [ "$1" != Z ] || return 1
    shift 19
    printf '%s\n' "$1"
}
write_state() {
    private_file "$recorder_state" || return 1
    printf '%s:%s:%s\n' "$boot_id" "$1" "$2" > "$recorder_state" \
        && fsync "$recorder_state" && fsync "$recovery"
}
restore_one() {
    [ "$2" = 2 ] || return 0
    current=$(read_mode "$1")
    case "$current" in
        1) printf '2\n' > "$1" || return 1;;
        2) return 0;;
        *) return 1;;
    esac
    [ "$(read_mode "$1")" = 2 ]
}
restore_modes() {
    ok=1
    restore_one "$mode0" "$old0" || ok=0
    restore_one "$mode1" "$old1" || ok=0
    [ "$ok" = 1 ]
}
stop_recorder() {
    reader=$recorder
    reader_start=$recorder_start
    if [ -z "$reader" ]; then
        private_file "$recorder_state" || return 1
        IFS=: read -r saved_boot reader reader_start saved_extra < "$recorder_state" || return 1
        [ "$saved_boot" = "$boot_id" ] && [ -z "$saved_extra" ] || return 1
    fi
    case "$reader:$reader_start" in *[!0-9:]*|:*|*:) return 1;; 0:0) return 0;; esac
    [ "$(process_start "$reader")" = "$reader_start" ] || return 0
    kill -TERM "$reader" 2>/dev/null
    stop_ticks=0
    while [ "$(process_start "$reader")" = "$reader_start" ]; do
        stop_ticks=$((stop_ticks + 1))
        [ "$stop_ticks" -lt 20 ] || { kill -KILL "$reader" 2>/dev/null; break; }
        sleep 0.05
    done
    [ "$(process_start "$reader")" != "$reader_start" ]
}
cleanup() {
    trap - EXIT
    trap '' HUP INT TERM
    reader_stopped=1
    if [ -n "$recorder" ]; then
        stop_recorder || { reader_stopped=0; echo LSA_CAPTURE_ERROR=reader_stop_failed; }
        [ "$reader_stopped" = 0 ] || wait "$recorder" 2>/dev/null
    fi
    # Fence the stream AFTER the reader exits, BEFORE restoring sleep can emit UP.
    [ "$started" = 0 ] || echo "LSA_CAPTURE_END=$reason"
    if restore_modes; then
        if [ "$reader_stopped" = 1 ]; then
            echo "LSA_CAPTURE_RESTORED=$old0:$old1"
            rm -f "$recorder_state"
        fi
    else
        echo LSA_CAPTURE_ERROR=restore_failed
    fi
    [ -z "$watchdog" ] || kill -TERM "$watchdog" 2>/dev/null
    # Do not explicitly unlock: the watchdog shares this open file description
    # and must retain its kernel lock if this controller exits unexpectedly.
}
trap cleanup EXIT
trap 'reason=interrupted; exit 130' HUP INT TERM
write_state 0 0 || fail invalid_recorder_write

# Arm recovery BEFORE either wake write. It also handles SIGKILL of the root
# controller or loss of the app; cancellation removes the private lease file.
(
    trap - EXIT HUP INT TERM
    ticks=0
    while [ "$ticks" -lt 120 ] && [ -f "$lease" ] \
            && [ -d "/proc/$owner_pid" ] && kill -0 "$controller" 2>/dev/null; do
        sleep 0.1
        ticks=$((ticks + 1))
    done
    if kill -0 "$controller" 2>/dev/null; then
        kill -TERM "$controller" 2>/dev/null
        # Normal controller cleanup terminates us. If it instead dies during
        # cleanup, retain this inherited lock and complete its recovery.
        while kill -0 "$controller" 2>/dev/null; do sleep 0.1; done
    fi
    reader_stopped=1
    stop_recorder || { reader_stopped=0; echo LSA_CAPTURE_ERROR=reader_stop_failed; }
    if restore_modes; then
        [ "$reader_stopped" = 0 ] || rm -f "$recorder_state"
    else
        echo LSA_CAPTURE_ERROR=restore_failed
    fi
) &
watchdog=$!

[ -f "$lease" ] && [ -d "/proc/$owner_pid" ] || exit 130
if [ "$old0" = 2 ]; then printf '1\n' > "$mode0" || exit 2; fi
[ -f "$lease" ] && [ -d "/proc/$owner_pid" ] || exit 130
if [ "$old1" = 2 ]; then printf '1\n' > "$mode1" || exit 2; fi
[ "$(read_mode "$mode0")" = 1 ] && [ "$(read_mode "$mode1")" = 1 ] \
    || { echo LSA_CAPTURE_ERROR=wake_failed; exit 2; }

# An explicit device omits its path in getevent output. Publish the validated
# source first; Java restores the identity only for raw event lines in this stream.
# No awk pipe/process group: cancellation owns precisely this one reader PID.
echo "LSA_CAPTURE_SOURCE=$target"
getevent -t "$target" 9<&- 2>/dev/null &
recorder=$!
recorder_start=$(process_start "$recorder")
case "$recorder_start" in ''|*[!0-9]*) reason=reader_failed; exit 2;; esac
write_state "$recorder" "$recorder_start" || { reason=reader_failed; exit 2; }
started=1
echo "LSA_CAPTURE_READY=$old0:$old1"
ticks=0
reason=window_elapsed
while [ "$ticks" -lt 80 ]; do
    [ -f "$lease" ] && [ -d "/proc/$owner_pid" ] || { reason=cancelled; exit 130; }
    kill -0 "$recorder" 2>/dev/null || { reason=reader_failed; exit 2; }
    if [ -f "$lease.complete" ]; then reason=pair_received; break; fi
    sleep 0.1
    ticks=$((ticks + 1))
done
exit 0
