package ls.augment.com;

/**
 * Append-only raw evidence, independent of the app's current target selection.
 * An archived selection is NOT proof that this module changed a package's state.
 */
final class HideRecoveryArchive {
    private static final String SUCCESS = "LSA_RECOVERY_ARCHIVE_OK";

    private HideRecoveryArchive() { }

    static RootShell.Result preserve(String selection) {
        RootShell.Result result = HidePrivateStorage.run(command(),
                selection.isEmpty() ? "" : selection + "\n", 30, 4096);
        if (!result.isSuccess()) return result;
        // A zero exit from su without the verified script footer is not a commit.
        if (!SUCCESS.equals(result.output.trim()))
            return new RootShell.Result(74, "恢复历史校验未完成", false);
        return result;
    }

    static String command() {
        return """
                umask 077
                ROOT="${LSA_PRIVATE_ROOT:?}/v2"
                ROOT_PARENT=${ROOT%/*}
                STORAGE=${ROOT_PARENT%/*}
                HISTORY="$ROOT/recovery-history-v1"
                SNAP=''
                INPUT=''
                VERIFY=''
                fail() { printf '%s\n' "recovery_archive:$1" >&2; exit 74; }
                cleanup() {
                  [ -z "$SNAP" ] || rm -f "$SNAP"
                  [ -z "$INPUT" ] || rm -f "$INPUT"
                }
                trap cleanup EXIT
                trap 'exit 74' HUP INT TERM
                command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
                parent="$ROOT"
                while [ "$parent" != / ]; do
                  [ ! -L "$parent" ] || fail symlink_parent
                  parent=${parent%/*}
                  [ -n "$parent" ] || parent=/
                done
                [ -d "$STORAGE" ] || fail storage_unavailable
                directory() {
                  [ ! -L "$1" ] || fail symlink_directory
                  mkdir -p "$1" || fail mkdir
                  [ -d "$1" ] && [ ! -L "$1" ] || fail invalid_directory
                  chmod 0700 "$1" || fail directory_permissions
                }
                digest() {
                  sum=$(sha256sum "$1") || return 1
                  sum=${sum%% *}
                  case "$sum" in ''|*[!0-9a-f]*) return 1 ;; esac
                  [ "${#sum}" -eq 64 ] || return 1
                  printf '%s' "$sum"
                }
                bounded_file() {
                  [ ! -L "$1" ] && [ -f "$1" ] && [ -r "$1" ] || fail invalid_source
                  bytes=$(wc -c <"$1") || fail source_size
                  case "$bytes" in ''|*[!0-9]*) fail source_size ;; esac
                  [ "$bytes" -le 1048576 ] || fail source_too_large
                }
                publish() {
                  kind="$1"
                  hash=$(digest "$SNAP") || fail snapshot_hash
                  dest="$HISTORY/$kind/$hash.raw"
                  [ ! -L "$dest" ] || fail symlink_archive
                  fsync "$SNAP" || fail snapshot_sync
                  if [ -e "$dest" ]; then
                    [ -f "$dest" ] || fail invalid_archive
                    cmp -s "$SNAP" "$dest" || fail archive_compare
                  else
                    # The shared immutable lock serializes absence+rename. App
                    # SELinux domains may rename private files but deny link().
                    # Keep abandoned staging outside catalogued categories.
                    [ "$(stat -c '%d' "$SNAP")" = "$(stat -c '%d' "$HISTORY/$kind")" ] || fail cross_filesystem_publish
                    mv -n "$SNAP" "$dest" || fail publish
                    [ ! -e "$SNAP" ] && [ ! -L "$SNAP" ] || fail publish_not_moved
                    SNAP=''
                  fi
                  [ ! -L "$dest" ] && [ -f "$dest" ] || fail invalid_archive
                  [ "$(stat -c '%u:%g:%a:%h' "$dest")" = "$PUBLICATION_OWNER:600:1" ] || fail archive_permissions
                  reread=$(digest "$dest") || fail archive_hash
                  [ "$reread" = "$hash" ] || fail archive_hash_mismatch
                  VERIFY="$VERIFY $kind/$hash.raw"
                  [ -z "$SNAP" ] || rm -f "$SNAP" || fail snapshot_cleanup
                  SNAP=''
                }
                archive() {
                  source="$1"
                  category="$2"
                  [ ! -L "$source" ] || fail symlink_source
                  if [ ! -e "$source" ]; then
                    # test -e alone also returns false on lookup errors. Only
                    # accept absence after a successful parent enumeration.
                    entries=$(LC_ALL=C ls -a1 "${source%/*}") || fail source_inventory
                    case "
                $entries
                " in *"
                ${source##*/}
                "*) fail source_unavailable ;; esac
                    return 0
                  fi
                  bounded_file "$source"
                  SNAP=$(mktemp "$HISTORY/.pending.XXXXXXXX") || fail snapshot_create
                  cp "$source" "$SNAP" || fail snapshot_copy
                  bounded_file "$SNAP"
                  chmod 0600 "$SNAP" || fail snapshot_permissions
                  cmp -s "$source" "$SNAP" || fail source_changed
                  publish "$category"
                }
                directory "$ROOT"
                # Reuse the target-store/reset lock; never unlink or replace its inode.
                PUBLICATION_OWNER="$(id -u):$(id -g)"
                LOCKDIR="${LSA_PRIVATE_ROOT:?}/v2/manual-targets-v1"
                [ ! -L "$LOCKDIR" ] || fail symlink_lock_directory
                if [ ! -e "$LOCKDIR" ]; then mkdir "$LOCKDIR" 2>/dev/null || [ -d "$LOCKDIR" ] || fail lock_directory_create; fi
                [ -d "$LOCKDIR" ] && [ ! -L "$LOCKDIR" ] || fail invalid_lock_directory
                [ "$(stat -c '%u:%g:%a' "$LOCKDIR")" = "$PUBLICATION_OWNER:700" ] || fail lock_directory_permissions
                LOCK="$LOCKDIR/lock"
                [ ! -L "$LOCK" ] || fail symlink_lock
                if [ ! -e "$LOCK" ]; then (set -C; : >"$LOCK") 2>/dev/null || [ -f "$LOCK" ] || fail lock_create; fi
                lockcheck() {
                  [ -f "$LOCK" ] && [ ! -L "$LOCK" ] || fail invalid_lock
                  [ "$(stat -c '%u:%g:%a:%h:%s' "$LOCK")" = "$PUBLICATION_OWNER:600:1:0" ] || fail lock_permissions
                }
                lockcheck
                LOCK_ID=$(stat -c '%d:%i' "$LOCK") || fail lock_stat
                exec 9<>"$LOCK" || fail lock_open
                command -v flock >/dev/null 2>&1 || fail flock_unavailable
                flock -x 9 9>&9 || fail lock_unavailable
                lockcheck
                [ "$(stat -c '%d:%i' "$LOCK")" = "$LOCK_ID" ] || fail lock_replaced
                directory "$HISTORY"
                for kind in targets backup script selection; do directory "$HISTORY/$kind"; done
                INPUT=$(mktemp "$HISTORY/.input.XXXXXXXX") || fail input_create
                cat >"$INPUT" || fail input_read
                bounded_file "$INPUT"
                archive "$ROOT/targets.conf" targets
                archive "$ROOT/targets.backup.conf" backup
                archive "$ROOT/emergency_restore.sh" script
                archive "$INPUT" selection
                # Check durability and read the published files again before the
                # caller is allowed to change PackageManager or target settings.
                for entry in $VERIFY; do
                  dest="$HISTORY/$entry"
                  [ ! -L "$dest" ] && [ -f "$dest" ] || fail archive_disappeared
                  fsync "$dest" || fail file_sync
                  expected=${entry##*/}
                  expected=${expected%.raw}
                  actual=$(digest "$dest") || fail final_hash
                  [ "$actual" = "$expected" ] || fail final_hash_mismatch
                done
                for kind in targets backup script selection; do
                  fsync "$HISTORY/$kind" || fail category_sync
                done
                fsync "$HISTORY" "$ROOT" "$ROOT_PARENT" "$STORAGE" || fail directory_sync
                rm -f "$INPUT" || fail input_cleanup
                INPUT=''
                printf '%s\n' 'LSA_RECOVERY_ARCHIVE_OK'
                """;
    }
}
