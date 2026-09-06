#!/system/bin/sh
# A bounded hardware lease, independent of the Activity/process lifetime.
# aw9620x mode 1=active, 2=sleep; no raw register writes or unknown driver layouts.
owner_pid=$1
lease=$2
device0=$3
device1=$4
target=$5
fail() { echo "LSA_CAPTURE_ERROR=$1"; exit 2; }
case "$owner_pid" in ''|*[!0-9]*) fail invalid_owner;; esac
case "$lease" in
    /data/user/*/ls.augment.com/cache/rapid-input-*.lease|/data/data/ls.augment.com/cache/rapid-input-*.lease) ;;
    *) fail invalid_lease;;
esac
case "$device0" in /dev/input/event*) ;; *) fail invalid_device0;; esac
case "$device1" in /dev/input/event*) ;; *) fail invalid_device1;; esac
[ "$(cat /sys/class/input/${device0##*/}/device/name 2>/dev/null)" = nubia_tgk_aw_sar0_ch0 ] || fail device0_changed
[ "$(cat /sys/class/input/${device1##*/}/device/name 2>/dev/null)" = nubia_tgk_aw_sar1_ch0 ] || fail device1_changed
case "$target" in "$device0"|"$device1") ;; *) fail invalid_target;; esac

driver_sum=$(sha256sum /vendor_dlkm/lib/modules/aw9620x.ko 2>/dev/null)
if [ "${driver_sum%% *}" != 3211fdc4b97aabe3c0db8f06f3ec07da8c3c382a6273412adb089940e9d4b532 ]; then
    echo LSA_CAPTURE_ERROR=unverified_driver
    exit 2
fi
command -v getevent >/dev/null || fail missing_tools
mode0=/sys/class/leds/sar0/mode_operation
mode1=/sys/class/leds/sar1/mode_operation
read_mode() { sed -n 's/^mode : \([12]\), .*/\1/p' "$1"; }
old0=$(read_mode "$mode0")
old1=$(read_mode "$mode1")
case "$old0:$old1" in 1:1|1:2|2:1|2:2) ;; *) echo LSA_CAPTURE_ERROR=unknown_mode; exit 2;; esac
[ -f "$lease" ] && [ -d "/proc/$owner_pid" ] || exit 130

# /dev is cleared at reboot. Serialize leases across Activity/process recreation.
lock=/dev/.lsaugment_rapid_input_capture
umask 077
mkdir "$lock" 2>/dev/null || { echo LSA_CAPTURE_ERROR=busy; exit 2; }
controller=$$
recorder=
watchdog=
reason=interrupted
started=0
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
    reader=$(cat "$lock/recorder" 2>/dev/null)
    case "$reader" in ''|*[!0-9]*) return;; esac
    # One direct child, not a setsid/pipe launcher whose PID may not own the reader.
    kill -TERM "$reader" 2>/dev/null
}
cleanup() {
    trap - EXIT
    trap '' HUP INT TERM
    if [ -n "$recorder" ]; then
        stop_recorder
        wait "$recorder" 2>/dev/null
    fi
    # Fence the stream AFTER the reader exits, BEFORE restoring sleep can emit UP.
    [ "$started" = 0 ] || echo "LSA_CAPTURE_END=$reason"
    if restore_modes; then
        echo "LSA_CAPTURE_RESTORED=$old0:$old1"
    else
        echo LSA_CAPTURE_ERROR=restore_failed
    fi
    [ -z "$watchdog" ] || kill -TERM "$watchdog" 2>/dev/null
    rm -f "$lock/recorder"
    rmdir "$lock" 2>/dev/null
}
trap cleanup EXIT
trap 'reason=interrupted; exit 130' HUP INT TERM

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
    else
        stop_recorder
        restore_modes || echo LSA_CAPTURE_ERROR=restore_failed
        rm -f "$lock/recorder"
        rmdir "$lock" 2>/dev/null
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
getevent -t "$target" 2>/dev/null &
recorder=$!
printf '%s\n' "$recorder" > "$lock/recorder"
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
