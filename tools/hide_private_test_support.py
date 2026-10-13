"""Offline transport adapter; preserves each fixture's existing I/O fault model.

Command probes never invoke this adapter. Wrapper tests forward to their own
RootShell double. Production HidePrivateStorage and its UID/migration boundary
are exercised separately by test-hide-private-migration.py.
"""
from pathlib import Path

PRIVATE_STORAGE_STUB = '''package ls.augment.com;
final class HidePrivateStorage {
 static void configure(java.io.File directory, boolean primaryUser) {}
 static RootShell.Result run(String command, String input, long timeout, int limit) {
  return RootShell.run(command, input, timeout, limit);
 }
}
'''


def private_storage_stub(package):
    path = Path(package) / 'HidePrivateStorage.java'
    path.write_text(PRIVATE_STORAGE_STUB, encoding='utf-8')
    return path


# Git Bash has neither Android mode reporting nor flock. Keep the real generated
# shell, mv, cmp and filesystem bytes; explicitly model flock with a per-path
# interprocess mutex held until the shell exits. This is not an Android SELinux
# or SIGKILL/power-loss test. Android app-UID instrumentation covers that boundary.
PUBLICATION_HOST_SHIM = r'''
LSA_PUBLICATION_HOST_OWNER="$(command id -u):$(command id -g)"
ln() { printf '%s\n' 'hard links forbidden by app-domain fixture' >&2; return 77; }
stat() {
  if [ "$1" = -c ]; then
    case "$2" in
      '%u:%g:%a'|'%u:%g:%a:%h'|'%u:%g:%a:%h:%s')
        local task_owner task_mode task_links task_size
        task_owner="$LSA_PUBLICATION_HOST_OWNER"
        [ -z "${LSA_TEST_WRONG_OWNER:-}" ] || task_owner='-1:-1'
        if [ -d "$3" ]; then task_mode=700; else task_mode=600; fi
        if [ "$2" = '%u:%g:%a' ]; then printf '%s:%s\n' "$task_owner" "$task_mode"; return; fi
        task_links=$(command stat -c '%h' "$3") || return
        if [ "$2" = '%u:%g:%a:%h' ]; then printf '%s:%s:%s\n' "$task_owner" "$task_mode" "$task_links"; return; fi
        task_size=$(command stat -c '%s' "$3") || return
        printf '%s:%s:%s:%s\n' "$task_owner" "$task_mode" "$task_links" "$task_size"
        return ;;
    esac
  fi
  command stat "$@"
}
flock() {
  [ -z "${LSA_TEST_LOCK_FAIL:-}" ] || return 74
  LSA_TEST_GUARD="$LOCK.host-flock-guard"
  while ! command mkdir "$LSA_TEST_GUARD" 2>/dev/null; do sleep 1; done
  local task_trap
  task_trap=$(trap -p EXIT)
  task_trap=${task_trap#trap -- }; task_trap=${task_trap% EXIT}
  eval "LSA_TEST_PREVIOUS_EXIT=$task_trap"
  trap 'task_exit=$?; eval "$LSA_TEST_PREVIOUS_EXIT"; command rmdir "$LSA_TEST_GUARD"; exit "$task_exit"' EXIT
}
'''
