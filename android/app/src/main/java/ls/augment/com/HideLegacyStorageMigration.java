package ls.augment.com;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/** Exact, bounded import of module-owned recovery evidence; never changes package visibility. */
final class HideLegacyStorageMigration {
    private static final int LIMIT = 48 * 1024 * 1024;
    private static final String COMPLETE = "LSA_HIDE_PRIVATE1\n";
    private HideLegacyStorageMigration() { }

    static void migrate(File directory, boolean primaryUser) throws Exception {
        File base = directory.getAbsoluteFile();
        if (!base.getCanonicalFile().equals(base)) throw new IOException("private path is not canonical");
        privateDirectory(base);
        privateDirectory(new File(base, "v2"));
        File completed = new File(base, ".migration-complete-v1");
        if (Files.exists(completed.toPath(), LinkOption.NOFOLLOW_LINKS)) {
            if (Files.isSymbolicLink(completed.toPath()) || !completed.isFile()
                    || completed.length() != COMPLETE.length()
                    || !COMPLETE.equals(new String(Files.readAllBytes(completed.toPath()), StandardCharsets.UTF_8)))
                throw new IOException("invalid private migration receipt");
            privateFile(completed);
            syncDirectory(base);
            syncDirectory(base.getParentFile());
            return;
        }
        // Historical root storage was global. Only the primary module user may claim it.
        if (!primaryUser) { complete(base, completed); return; }
        RootShell.Result source = RootShell.run(exportCommand(), null, 45, LIMIT);
        if (!source.isSuccess() || source.capture == null || !source.capture.reliable())
            throw new IOException("legacy inventory unavailable");
        String raw = source.capture.text();
        if (!raw.startsWith("LSA_HIDE_IMPORT1\n") || !raw.endsWith("LSA_HIDE_IMPORT_END\n"))
            throw new IOException("incomplete legacy inventory");
        String[] rows = raw.substring(17, raw.length() - 20).split("\n");
        List<String> manifest = new ArrayList<>();
        long total = 0;
        for (String row : rows) {
            if (row.isEmpty()) continue;
            String[] fields = row.split("\\|", -1);
            if (fields.length != 4 && fields.length != 6) throw new IOException("invalid legacy row");
            String relative = fields[1];
            if (!relative.matches("[A-Za-z0-9_.-]+(?:/[A-Za-z0-9_.-]+){0,8}")
                    || relative.contains("..") || !allowed(relative)) throw new IOException("unknown legacy path");
            File target = new File(base, "v2/" + relative);
            if (!target.getCanonicalFile().equals(target)) throw new IOException("linked private path");
            if ("D".equals(fields[0]) && fields.length == 4) {
                privateDirectory(target);
                manifest.add(row);
            } else if ("F".equals(fields[0]) && fields.length == 6) {
                byte[] bytes = Base64.getDecoder().decode(fields[5]);
                total += bytes.length;
                if (bytes.length > 1048576 || total > 32 * 1024 * 1024 || !hex(bytes).equals(fields[4]))
                    throw new IOException("legacy content mismatch");
                privateDirectory(target.getParentFile());
                if (Files.exists(target.toPath(), LinkOption.NOFOLLOW_LINKS)) {
                    if (!target.isFile() || !MessageDigest.isEqual(Files.readAllBytes(target.toPath()), bytes))
                        throw new IOException("private and legacy recovery records conflict");
                } else {
                    File temp = File.createTempFile(".import-", ".tmp", target.getParentFile());
                    try {
                        privateFile(temp);
                        try (FileOutputStream out = new FileOutputStream(temp)) { out.write(bytes); out.getFD().sync(); }
                        Files.move(temp.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE);
                    } finally { Files.deleteIfExists(temp.toPath()); }
                }
                privateFile(target);
                if (!hex(Files.readAllBytes(target.toPath())).equals(fields[4])) throw new IOException("private verification failed");
                manifest.add(String.join("|", java.util.Arrays.copyOf(fields, 5)));
            } else throw new IOException("invalid legacy file type");
            if (manifest.size() > 65536) throw new IOException("legacy inventory too large");
        }
        // fsync every imported directory before any legacy deletion; fsync is Android toybox.
        String sync = syncCommand(base);
        RootShell.Result durable = RootShell.runProcess(new ProcessBuilder("/system/bin/sh", "-c", sync)
                .directory(base).redirectErrorStream(true), null, 30, 4096, null);
        if (!durable.isSuccess()) throw new IOException("private directory sync failed");
        RootShell.Result cleaned = RootShell.run(cleanupCommand(), String.join("\n", manifest) + "\n", 45, 4096);
        if (!cleaned.isSuccess() || cleaned.capture == null || !cleaned.capture.reliable()
                || !"LSA_HIDE_IMPORT_CLEAN".equals(cleaned.output))
            throw new IOException("legacy cleanup not confirmed");
        complete(base, completed);
    }

    /** Propagate each failed fsync; find -exec's false result alone is not a command failure. */
    static String syncCommand(File base) {
        return "set -e\nset -o pipefail\nfind " + RootShell.quote(base.getPath())
                + " -depth -type d | while IFS= read -r directory; do\n"
                + "  fsync \"$directory\" || exit 74\ndone\n"
                // The parent owns the first creation of hide-recovery itself.
                + "fsync " + RootShell.quote(base.getParentFile().getPath()) + "\n";
    }

    private static void complete(File base, File completed) throws Exception {
        File temp = File.createTempFile(".migration-", ".tmp", base);
        try {
            privateFile(temp);
            try (FileOutputStream out = new FileOutputStream(temp)) {
                out.write(COMPLETE.getBytes(StandardCharsets.UTF_8)); out.getFD().sync();
            }
            Files.move(temp.toPath(), completed.toPath(), StandardCopyOption.ATOMIC_MOVE);
            syncDirectory(base);
            syncDirectory(base.getParentFile());
        } finally { Files.deleteIfExists(temp.toPath()); }
    }
    private static void syncDirectory(File directory) throws IOException {
        RootShell.Result synced = RootShell.runProcess(new ProcessBuilder("/system/bin/sh", "-c",
                "fsync " + RootShell.quote(directory.getPath())).directory(directory)
                .redirectErrorStream(true), null, 10, 4096, null);
        if (!synced.isSuccess()) throw new IOException("private receipt sync failed");
    }

    private static boolean allowed(String relative) {
        String first = relative.split("/", 2)[0];
        return java.util.Set.of("manual-targets-v1", "recovery-journal-v1", "recovery-history-v1",
                "root-transactions-v1", "restore-grants-v1", "targets.conf", "targets.backup.conf",
                "emergency_restore.sh").contains(first);
    }
    private static void privateDirectory(File file) throws IOException {
        if (!file.getCanonicalFile().equals(file.getAbsoluteFile())) throw new IOException("linked private directory");
        if (!file.isDirectory() && !file.mkdirs()) throw new IOException("private directory creation failed");
        if (!file.setReadable(false, false) || !file.setWritable(false, false) || !file.setExecutable(false, false)
                || !file.setReadable(true, true) || !file.setWritable(true, true) || !file.setExecutable(true, true))
            throw new IOException("private directory permissions failed");
    }
    private static void privateFile(File file) throws IOException {
        if (!file.setReadable(false, false) || !file.setWritable(false, false) || !file.setExecutable(false, false)
                || !file.setReadable(true, true) || !file.setWritable(true, true)) throw new IOException("private file permissions failed");
    }
    private static String hex(byte[] bytes) throws Exception {
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(bytes);
        StringBuilder result = new StringBuilder();
        for (byte value : digest) result.append(String.format(java.util.Locale.ROOT, "%02x", value & 255));
        return result.toString();
    }

    private static final String PREFLIGHT = """
        set -e
        set -o pipefail
        export LC_ALL=C
        ROOT=/data/adb/ls_augment/v2
        fail() { echo "legacy_hide:$1" >&2; exit 74; }
        [ "$(id -u)" = 0 ] || fail root_required
        for parent in /data /data/adb /data/adb/ls_augment "$ROOT"; do
          [ ! -L "$parent" ] || fail symlink_parent
          [ ! -e "$parent" ] || [ -d "$parent" ] || fail parent_type
        done
        for owned in /data/adb/ls_augment "$ROOT"; do
          [ -e "$owned" ] || continue
          case "$(stat -c '%u:%g:%a' "$owned")" in 0:0:700|0:0:750) ;; *) fail parent_ownership ;; esac
        done
        paths() { printf '%s\\n' manual-targets-v1 recovery-journal-v1 recovery-history-v1 root-transactions-v1 restore-grants-v1 targets.conf targets.backup.conf emergency_restore.sh; }
        inventory() {
          for name in $(paths); do
            path="$ROOT/$name"
            [ ! -L "$path" ] || fail symlink_source
            [ -e "$path" ] || continue
            find "$path" -print
          done | sort
        }
        check() {
          case "$relative" in ''|*[!A-Za-z0-9_./-]*|*..*|/*) fail invalid_name ;; esac
          case "$relative" in manual-targets-v1|manual-targets-v1/*|recovery-journal-v1|recovery-journal-v1/*|recovery-history-v1|recovery-history-v1/*|root-transactions-v1|root-transactions-v1/*|restore-grants-v1|restore-grants-v1/*|targets.conf|targets.backup.conf|emergency_restore.sh) ;; *) fail unknown_source ;; esac
          file="$ROOT/$relative"
          [ ! -L "$file" ] && [ "$(readlink -f "$file")" = "$file" ] || fail linked_source
          meta=$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$file") || fail metadata
          owner=$(stat -c '%u:%g:%a' "$file") || fail owner
          case "$owner" in 0:0:600|0:0:700|0:0:750) ;; *) fail source_ownership ;; esac
          if [ -f "$file" ]; then
            [ "$(stat -c %h "$file")" = 1 ] || fail linked_file
            [ "$(stat -c %s "$file")" -le 1048576 ] || fail file_size
          else [ -d "$file" ] || fail source_type; fi
        }
        if [ -e "$ROOT/manual-targets-v1/lock" ]; then
          relative=manual-targets-v1/lock; check
          exec 9<>"$file"
          flock -x -n 9 9>&9 || fail old_writer_busy
        fi
        """;

    static String exportCommand() {
        return PREFLIGHT + """
            echo LSA_HIDE_IMPORT1
            total=0; count=0
            inventory | while IFS= read -r path; do
              relative=${path#"$ROOT/"}; check
              count=$((count+1)); [ "$count" -le 65536 ] || fail too_many_files
              if [ -d "$file" ]; then printf 'D|%s|%s|%s\\n' "$relative" "$owner" "$meta"; continue; fi
              size=$(stat -c %s "$file"); total=$((total+size)); [ "$total" -le 33554432 ] || fail total_size
              hash=$(sha256sum "$file"); hash=${hash%% *}
              encoded=$(base64 <"$file" | tr -d '\\n')
              after=$(sha256sum "$file"); [ "$hash" = "${after%% *}" ] && [ "$meta" = "$(stat -c '%d:%i:%u:%g:%a:%h:%s:%Y:%Z' "$file")" ] || fail source_changed
              printf 'F|%s|%s|%s|%s|%s\\n' "$relative" "$owner" "$meta" "$hash" "$encoded"
            done
            echo LSA_HIDE_IMPORT_END
            """;
    }

    static String cleanupCommand() {
        return PREFLIGHT + """
            # The manifest is app-owned verified data passed on stdin. No files are created outside the app.
            expected=$(cat); wanted=''; files=''; dirs=''
            while IFS='|' read -r type relative old_owner old_meta hash extra; do
              [ -n "$type" ] || continue
              [ -z "$extra" ] || fail invalid_manifest
              check
              [ "$owner" = "$old_owner" ] && [ "$meta" = "$old_meta" ] || fail source_changed
              case "$type" in
                F) [ -f "$file" ] && [ "${#hash}" = 64 ] || fail file_type
                   actual=$(sha256sum "$file"); [ "${actual%% *}" = "$hash" ] || fail source_changed
                   files="$files $relative" ;;
                D) [ -d "$file" ] && [ -z "$hash" ] || fail directory_type; dirs="$relative $dirs" ;;
                *) fail manifest_type ;;
              esac
              wanted="$wanted$ROOT/$relative
            "
            done <<EOF
            $expected
            EOF
            actual=$(inventory)
            [ "$actual" = "$(printf '%s' "$wanted" | sed '/^$/d' | sort)" ] || fail inventory_changed
            for relative in $files; do
              check
              row=$(printf '%s\\n' "$expected" | awk -F '|' -v key="$relative" '$1=="F" && $2==key {print $4 "|" $5}')
              actual=$(sha256sum "$file")
              [ "$row" = "$meta|${actual%% *}" ] || fail source_changed
              rm -- "$file"
              [ ! -e "$file" ] && [ ! -L "$file" ] || fail removal_failed
              fsync "${file%/*}"
            done
            for relative in $dirs; do rmdir "$ROOT/$relative" || fail directory_not_empty; done
            [ ! -d "$ROOT" ] || fsync "$ROOT"
            echo LSA_HIDE_IMPORT_CLEAN
            """;
    }
}
