package ls.augment.com;

/** Replaces legacy automatic unhide scripts with a read-only recovery notice. */
final class HideRecoveryEmergency {
    private static final String SUCCESS = "LSA_RECOVERY_EMERGENCY_OK";
    private HideRecoveryEmergency() { }

    static RootShell.Result install() {
        RootShell.Result archived = HideRecoveryArchive.preserve("");
        if (!archived.isSuccess()) return archived;
        return verified(RootShell.run(command(), null, 30, 4096));
    }

    /** Current selections remain replaceable; immutable archive history does not. */
    static RootShell.Result writeTargets(String selection) {
        RootShell.Result installed = install();
        if (!installed.isSuccess()) return installed;
        return verified(RootShell.run(targetCommand(), selection.isEmpty() ? "" : selection + "\n", 30, 4096));
    }

    private static RootShell.Result verified(RootShell.Result result) {
        if (result == null) return new RootShell.Result(74, "恢复入口结果未知，已保留历史", false);
        if (!result.isSuccess()) return result;
        return SUCCESS.equals(result.output.trim()) ? result
                : new RootShell.Result(74, "恢复入口校验未完成，已保留历史", false);
    }

    static String command() {
        return base() + """
                DEST="$ROOT/emergency_restore.sh"
                MODE=0700
                destination
                INPUT=$(mktemp "$ROOT/.emergency-input.XXXXXXXX") || fail input_create
                cat >"$INPUT" <<'LSA_RECOVERY_NOTICE'
                #!/system/bin/sh
                printf '%s\n' 'LS Augment recovery requires review.'
                printf '%s\n' 'Open the app recovery page and verify each package, Android user and user serial.'
                printf '%s\n' 'This script is read-only. Showing an app requires a new explicit confirmation in the app.'
                printf '%s\n' 'Old selections and pending operations are never replayed to show an app.'
                printf '%s\n' "Root records beside this script: ${0%/*}/recovery-history-v1 and ${0%/*}/recovery-journal-v1."
                printf '%s\n' 'After uninstalling, reinstall the current APK, open History and Recovery, and review each user.'
                printf '%s\n' 'After clearing data or reinstalling, reopen recovery review; Root history is retained.'
                printf '%s\n' 'Disabling or uninstalling the module does not automatically show hidden apps.'
                printf '%s\n' 'If Root is unavailable, keep all records and retry after granting Root access.'
                printf '%s\n' 'This script changes no app state and deletes no recovery evidence.'
                exit 2
                LSA_RECOVERY_NOTICE
                [ "$?" = 0 ] || fail input_write
                publish
                """;
    }

    static String targetCommand() {
        return base() + """
                DEST="$ROOT/targets.conf"
                MODE=0600
                destination
                INPUT=$(mktemp "$ROOT/.targets-input.XXXXXXXX") || fail input_create
                cat >"$INPUT" || fail input_read
                publish
                """;
    }

    private static String base() {
        return """
                umask 077
                export LC_ALL=C
                ROOT='/data/adb/ls_augment/v2'
                ROOT_PARENT=${ROOT%/*}
                STORAGE=${ROOT_PARENT%/*}
                INPUT=''
                STAGING=''
                fail() { printf '%s\n' "recovery_emergency:$1" >&2; exit 74; }
                cleanup() {
                  [ -z "$INPUT" ] || rm -f "$INPUT"
                  [ -z "$STAGING" ] || rm -f "$STAGING"
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
                [ ! -L "$ROOT" ] || fail symlink_root
                mkdir -p "$ROOT" || fail mkdir
                [ -d "$ROOT" ] && [ ! -L "$ROOT" ] || fail invalid_directory
                chmod 0700 "$ROOT" || fail directory_permissions
                bounded() {
                  [ ! -L "$1" ] && [ -f "$1" ] && [ -r "$1" ] || fail invalid_file
                  bytes=$(wc -c <"$1") || fail file_size
                  case "$bytes" in ''|*[!0-9]*) fail file_size ;; esac
                  [ "$bytes" -le 1048576 ] || fail file_too_large
                }
                destination() {
                  [ ! -L "$DEST" ] || fail symlink_destination
                  if [ -e "$DEST" ]; then bounded "$DEST";
                  else
                    entries=$(ls -a1 "$ROOT") || fail destination_inventory
                    case "
                $entries
                " in *"
                ${DEST##*/}
                "*) fail destination_unavailable ;; esac
                  fi
                }
                publish() {
                  bounded "$INPUT"
                  chmod 0600 "$INPUT" || fail input_permissions
                  STAGING=$(mktemp "$ROOT/.recovery-write.XXXXXXXX") || fail staging_create
                  cp "$INPUT" "$STAGING" || fail staging_copy
                  bounded "$STAGING"
                  chmod "$MODE" "$STAGING" || fail staging_permissions
                  cmp -s "$INPUT" "$STAGING" || fail staging_compare
                  fsync "$STAGING" || fail staging_sync
                  destination
                  mv -f "$STAGING" "$DEST" || fail publish
                  STAGING=''
                  bounded "$DEST"
                  cmp -s "$INPUT" "$DEST" || fail final_compare
                  fsync "$DEST" || fail file_sync
                  cmp -s "$INPUT" "$DEST" || fail final_reread
                  fsync "$ROOT" "$ROOT_PARENT" "$STORAGE" || fail directory_sync
                  printf '%s\n' 'LSA_RECOVERY_EMERGENCY_OK'
                }
                """;
    }
}
