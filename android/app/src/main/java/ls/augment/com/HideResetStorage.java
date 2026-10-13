package ls.augment.com;

/** Exact allowlist cleanup after all recorded package states have been verified. */
final class HideResetStorage {
    private HideResetStorage() { }
    static String stamp() {
        RootShell.Result result = HidePrivateStorage.run(command(""), null, 30, 4096);
        return result != null && result.isSuccess() && result.output.trim().matches("[0-9a-f]{64}")
                ? result.output.trim() : "";
    }
    static RootShell.Result clear(String expected) {
        if (expected == null || !expected.matches("[0-9a-f]{64}"))
            return new RootShell.Result(74, "缺少完整恢复后的记录摘要，未清除", false);
        RootShell.Result result = HidePrivateStorage.run(command(expected), null, 30, 4096);
        return result != null && result.isSuccess() && "LSA_HIDE_RESET_CLEARED".equals(result.output.trim())
                ? result : new RootShell.Result(74, "隐藏记录清除或持久确认失败，不能报告全部重置完成", false);
    }
    static String command(String expected) {
        if (expected == null || !expected.isEmpty() && !expected.matches("[0-9a-f]{64}"))
            throw new IllegalArgumentException("Invalid reset digest");
        return "EXPECTED=" + RootShell.quote(expected) + "\n" + """
                umask 077
                export LC_ALL=C
                ROOT="${LSA_PRIVATE_ROOT:?}/v2"
                APP="${LSA_PRIVATE_ROOT:?}"
                MANIFEST=''
                INVENTORY=''
                fail() { printf '%s\\n' "hide_reset:$1" >&2; exit 74; }
                cleanup() { [ -z "$MANIFEST" ] || rm -f "$MANIFEST"; [ -z "$INVENTORY" ] || rm -f "$INVENTORY"; }
                trap cleanup EXIT
                trap 'exit 74' HUP INT TERM
                OWNER="$(id -u):$(id -g)"
                set -o pipefail || fail pipefail_unavailable
                parent="$ROOT"
                while [ "$parent" != / ]; do
                  [ ! -L "$parent" ] || fail symlink_parent
                  parent=${parent%/*}; [ -n "$parent" ] || parent=/
                done
                [ -d "$APP" ] && [ ! -L "$APP" ] || fail app_directory_unavailable
                [ "$(stat -c '%u:%g:%a' "$APP")" = "$OWNER:700" ] || fail app_directory_permissions
                [ -d "$ROOT" ] && [ ! -L "$ROOT" ] || fail root_directory_unavailable
                [ "$(stat -c '%u:%g:%a' "$ROOT")" = "$OWNER:700" ] || fail root_directory_permissions
                MANIFEST=$(mktemp "$APP/.hide-reset-manifest.XXXXXXXX") || fail manifest_create
                INVENTORY=$(mktemp "$APP/.hide-reset-inventory.XXXXXXXX") || fail inventory_create
                paths() {
                  printf '%s\\n' manual-targets-v1 recovery-journal-v1 recovery-history-v1 root-transactions-v1 restore-grants-v1 targets.conf targets.backup.conf emergency_restore.sh
                }
                # The target store uses this same flock. A stale process cannot replace its
                # document between the exact-byte comparison and its allowlisted removal.
                if [ -e "$ROOT/manual-targets-v1/lock" ]; then
                  LOCK="$ROOT/manual-targets-v1/lock"
                  [ ! -L "$LOCK" ] && [ -f "$LOCK" ] || fail invalid_target_lock
                  command -v flock >/dev/null 2>&1 || fail flock_unavailable
                  exec 9<>"$LOCK" || fail lock_open
                  flock -x -n 9 9>&9 2>/dev/null || fail lock_busy
                fi
                inventory() {
                  : >"$MANIFEST" || fail manifest_write
                  for name in $(paths); do
                    path="$ROOT/$name"
                    [ ! -L "$path" ] || fail symlink_source
                    if [ ! -e "$path" ]; then
                      printf 'A|%s\\n' "$name" >>"$MANIFEST" || fail manifest_write
                      continue
                    fi
                    find "$path" -print | sort >"$INVENTORY" || fail source_inventory
                    count=$(wc -l <"$INVENTORY") || fail inventory_size
                    [ "$count" -le 65536 ] || fail inventory_too_large
                    while IFS= read -r file; do
                      case "$file" in "$path"|"$path/"*) ;; *) fail outside_allowlist ;; esac
                      relative=${file#"$ROOT/"}
                      case "$relative" in ''|*[!A-Za-z0-9_./-]*) fail invalid_source_name ;; esac
                      [ ! -L "$file" ] || fail symlink_record
                      metadata=$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$file") || fail source_stat
                      if [ -d "$file" ]; then
                        [ "$(stat -c '%u:%g:%a' "$file")" = "$OWNER:700" ] || fail directory_permissions
                        printf 'D|%s|%s\\n' "$relative" "$metadata" >>"$MANIFEST" || fail manifest_write
                      else
                        [ -f "$file" ] && [ -r "$file" ] || fail invalid_record
                        owner=$(stat -c '%u:%g:%a' "$file") || fail file_stat
                        case "$owner" in "$OWNER":600|"$OWNER":700) ;; *) fail file_permissions ;; esac
                        size=$(wc -c <"$file") || fail source_size
                        [ "$size" -le 1048576 ] || fail source_too_large
                        hash=$(sha256sum "$file") || fail source_hash
                        hash=${hash%% *}
                        [ "$metadata" = "$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$file")" ] || fail source_changed
                        printf 'F|%s|%s|%s\\n' "$relative" "$metadata" "$hash" >>"$MANIFEST" || fail manifest_write
                      fi
                    done <"$INVENTORY"
                  done
                  hash=$(sha256sum "$MANIFEST") || fail manifest_hash
                  HASH=${hash%% *}
                }
                inventory
                if [ -z "$EXPECTED" ]; then printf '%s\\n' "$HASH"; exit 0; fi
                [ "$HASH" = "$EXPECTED" ] || fail records_changed
                command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
                # All final targets are fixed descendants of the checked absolute ROOT.
                # No PackageManager enable/install command belongs to this cleanup.
                for name in $(paths); do
                  path="$ROOT/$name"
                  case "$path" in "$ROOT/"*) ;; *) fail outside_allowlist ;; esac
                  [ ! -L "$path" ] || fail symlink_source
                  rm -rf -- "$path" || fail clear_failed
                  [ ! -e "$path" ] && [ ! -L "$path" ] || fail clear_not_confirmed
                done
                fsync "$ROOT" "$APP" "${APP%/*}" || fail cleanup_sync
                printf '%s\\n' 'LSA_HIDE_RESET_CLEARED'
                """;
    }
}
