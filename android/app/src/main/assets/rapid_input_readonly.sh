#!/system/bin/sh
# Read only the discovered shoulder sources. No driver writes or version gate.
owner_pid=$1
lease=$2
shift 2
fail() { echo "LSA_READONLY_ERROR=$1"; exit 2; }
case "$owner_pid" in ''|*[!0-9]*) fail owner;; esac
case "$lease" in
 /data/user/*/ls.augment.com/cache/rapid-input-*.lease|/data/data/ls.augment.com/cache/rapid-input-*.lease) ;;
 *) fail lease;;
esac
[ "$#" -gt 0 ] && [ "$#" -le 16 ] || fail sources
for source in "$@"; do
 number=${source#/dev/input/event}
 case "$number" in ''|*[!0-9]*) fail source;; esac
 [ "$source" = "/dev/input/event$number" ] && [ -c "$source" ] || fail source
 name=$(cat "/sys/class/input/event$number/device/name" 2>/dev/null | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z0-9')
 case "$name" in *tgk*|*shoulder*|*airtrigger*|*gametrigger*) ;; *) fail identity;; esac
done
[ -f "$lease" ] && [ -d "/proc/$owner_pid" ] || exit 130
command -v getevent >/dev/null || fail tools
umask 077
capture_dir=$(mktemp -d "$lease.read.XXXXXX") || fail directory
controller=$$
readers=
watchdog=
reason=interrupted
stop_readers() {
 for reader in $readers; do kill -TERM "$reader" 2>/dev/null; done
 for reader in $readers; do wait "$reader" 2>/dev/null; done
}
remove_buffers() {
 for source in "$@"; do rm -f "$capture_dir/${source##*/}"; done
 rmdir "$capture_dir" 2>/dev/null
}
cleanup() {
 trap - EXIT
 trap '' HUP INT TERM
 stop_readers
 [ -z "$watchdog" ] || kill -TERM "$watchdog" 2>/dev/null
 for source in "$@"; do
   # Readers have exited, so this cannot contain a later release or a new run.
   sed "s|^|$source: |" "$capture_dir/${source##*/}"
 done
 echo "LSA_READONLY_END=$reason"
 remove_buffers "$@"
}
trap 'cleanup "$@"' EXIT
trap 'reason=cancelled; exit 130' HUP INT TERM
for source in "$@"; do
 echo "LSA_READONLY_SOURCE=$source"
 getevent -t "$source" > "$capture_dir/${source##*/}" 2>/dev/null &
 readers="$readers $!"
done
(
 trap - EXIT HUP INT TERM
 sleep 12
 if kill -0 "$controller" 2>/dev/null; then kill -TERM "$controller" 2>/dev/null
 else stop_readers; remove_buffers "$@"; fi
) &
watchdog=$!
echo LSA_READONLY_READY=1
ticks=0
while [ "$ticks" -lt 80 ]; do
 [ -f "$lease" ] && [ -d "/proc/$owner_pid" ] || { reason=cancelled; exit 130; }
 for reader in $readers; do kill -0 "$reader" 2>/dev/null || { reason=reader_failed; exit 2; }; done
 sleep 0.1
 ticks=$((ticks + 1))
done
reason=window_elapsed
exit 0
