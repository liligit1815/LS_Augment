package ls.augment.com;

/** Exact-path retirement shared by upgrade migration and the external reset phase. */
final class RetiredBootCache {
    private RetiredBootCache() { }

    static String command(boolean reportRemoved) {
        return "set -e\nboot_cache_report_removed=" + (reportRemoved ? "1\n" : "0\n") + """
            boot_cache_fail(){ echo "boot_cache:$1" >&2;exit 74; }
            boot_cache_parents(){
              for parent in /data /data/system /data/system/ls_augment; do
                [ ! -L "$parent" ] || boot_cache_fail linked_parent
                [ ! -e "$parent" ] || [ -d "$parent" ] || boot_cache_fail parent_type
              done
              if [ -d /data/system/ls_augment ]; then
                case "$(stat -c '%u:%g:%a' /data/system/ls_augment)" in 0:1000:750|0:0:750|0:0:700) ;; *) boot_cache_fail parent_owner ;; esac
              fi
            }
            boot_cache_stamp(){
              file=$1
              [ ! -L "$file" ] || boot_cache_fail linked_file
              if [ ! -e "$file" ]; then echo absent;return;fi
              [ -f "$file" ] && [ "$(stat -c %h "$file")" = 1 ] || boot_cache_fail file_type
              case "$(stat -c '%u:%g:%a' "$file")" in 0:1000:640|0:0:600|0:0:640) ;; *) boot_cache_fail file_owner ;; esac
              [ "$(stat -c %s "$file")" -le 262144 ] || boot_cache_fail size
              stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$file"
            }
            boot_cache_parents
            directory=/data/system/ls_augment
            if [ -d "$directory" ]; then
              boot_cache_directory=$(stat -c '%d:%i:%u:%g:%a' "$directory")
              boot_cache_primary=$(boot_cache_stamp "$directory/boot-config-v1")
              boot_cache_pending=$(boot_cache_stamp "$directory/boot-config-v1.tmp")
              for file in /data/system/ls_augment/boot-config-v1 /data/system/ls_augment/boot-config-v1.tmp; do
                boot_cache_parents
                [ "$boot_cache_directory" = "$(stat -c '%d:%i:%u:%g:%a' "$directory")" ] || boot_cache_fail changed_parent
                case "$file" in *.tmp) stamp=$boot_cache_pending ;; *) stamp=$boot_cache_primary ;; esac
                [ "$stamp" = "$(boot_cache_stamp "$file")" ] || boot_cache_fail changed
                [ "$stamp" != absent ] || continue
                rm -- "$file"
                [ ! -e "$file" ] && [ ! -L "$file" ] || boot_cache_fail remains
                if [ "$boot_cache_report_removed" = 1 ]; then printf 'LSA_RESET_REMOVED:%s\\n' "$file";fi
              done
              fsync "$directory"
              rmdir "$directory" 2>/dev/null || true
              fsync /data/system
            fi
            """;
    }
}
