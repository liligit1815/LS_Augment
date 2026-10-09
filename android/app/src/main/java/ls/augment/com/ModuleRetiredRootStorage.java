package ls.augment.com;

/** Retires exact historical Root files only after their live device effect has been restored. */
final class ModuleRetiredRootStorage {
    private ModuleRetiredRootStorage() { }

    /** Call after BatteryLifeControl.restore() succeeds, before clearing any recovery records. */
    static Result clearAfterBatteryRestore(RootShell.Result restored) {
        if (restored == null || !restored.isSuccess()) return new Result(false, 0, "旧电池策略尚未恢复，保留原恢复文件");
        // The source inode check must run in PID 1's mount namespace, just like the original bind mount.
        RootShell.Result clear = RootShell.run("nsenter -t 1 -m -- sh -c " + RootShell.quote(command()), null, 12, 2048);
        if (!clear.isSuccess() || clear.capture == null || !clear.capture.reliable()
                || !clear.output.matches("LSA_RETIRED_BATTERY_CLEARED:[01]"))
            return new Result(false, 0, "旧电池策略恢复文件未能安全清理，请检查 Root 权限及文件状态");
        int count = clear.output.endsWith(":1") ? 1 : 0;
        return new Result(true, count, "旧电池策略恢复文件已清理");
    }

    static String command() {
        return """
                set -e
                fail() { printf '%s\n' "retired_battery:$1" >&2; exit 74; }
                [ "$(id -u)" = 0 ] || fail root_required
                APP='/data/adb/ls_augment'
                ROOT='/data/adb/ls_augment/v2'
                DIRECTORY='/data/adb/ls_augment/v2/battery'
                FILE='/data/adb/ls_augment/v2/battery/life.conf'
                ORIGINAL='/vendor/etc/.tp/zte_battery_life.conf'
                # Never infer ownership from other files named runtime.properties or from directory proximity.
                for parent in /data /data/adb "$APP" "$ROOT" "$DIRECTORY"; do
                  [ ! -L "$parent" ] || fail symlink_parent
                  [ ! -e "$parent" ] || [ -d "$parent" ] || fail invalid_parent
                done
                for owned in "$APP" "$ROOT" "$DIRECTORY"; do
                  if [ -e "$owned" ]; then
                    owner=$(stat -c '%u:%g:%a' "$owned") || fail parent_stat
                    case "$owner" in 0:0:700|0:0:750) ;; *) fail parent_ownership ;; esac
                  fi
                done
                [ ! -L "$FILE" ] || fail symlink_file
                count=0
                if [ -e "$FILE" ]; then
                  [ -f "$FILE" ] && [ -r "$FILE" ] || fail invalid_file
                  owner=$(stat -c '%u:%g:%a' "$FILE") || fail file_stat
                  case "$owner" in 0:0:600|0:0:644|0:0:700) ;; *) fail file_ownership ;; esac
                  [ "$(stat -c %h "$FILE")" = 1 ] || fail hardlinked_file
                  [ "$(stat -c %s "$FILE")" -le 65536 ] || fail oversized_file
                  [ "$(readlink -f "$FILE")" = "$FILE" ] || fail unexpected_path
                  before=$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$FILE") || fail file_metadata
                  # restore() can have returned before a concurrent legacy process rebinds the overlay.
                  # A live bind still sharing the source inode must retain its only restoration copy.
                  if [ -e "$ORIGINAL" ]; then
                    source=$(stat -c '%d:%i' "$FILE") || fail source_inode
                    destination=$(stat -c '%d:%i' "$ORIGINAL") || fail destination_inode
                    [ "$source" != "$destination" ] || fail overlay_still_mounted
                  fi
                  [ "$before" = "$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$FILE")" ] || fail file_changed
                  [ ! -L "$FILE" ] || fail symlink_file
                  rm -f -- "$FILE" || fail remove_failed
                  [ ! -e "$FILE" ] && [ ! -L "$FILE" ] || fail removal_not_confirmed
                  command -v fsync >/dev/null 2>&1 || fail fsync_unavailable
                  fsync "$DIRECTORY" "$ROOT" "$APP" /data/adb || fail removal_not_durable
                  count=1
                fi
                # Leave the battery directory and every unknown sibling intact; only this file has proven provenance.
                printf 'LSA_RETIRED_BATTERY_CLEARED:%s\n' "$count"
                """;
    }

    static final class Result {
        final boolean success; final int count; final String message;
        Result(boolean success, int count, String message) { this.success = success; this.count = count; this.message = message; }
    }
}
