package ls.augment.com;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.*;

/** Leases survive Activity recreation; only module-named, unleased files are disposable. */
final class LogExportCache {
    static final long MAX_FILE_BYTES = 64L * 1024 * 1024, MAX_AGE_MS = 24L * 60 * 60 * 1000;
    static final int MAX_FILES = 2;
    private static final Set<File> ACTIVE = new HashSet<>();
    private LogExportCache() { }
    static synchronized void clean(File directory, long now) throws IOException {
        prune(directory, null, now);
    }
    static synchronized File acquire(File directory, String name, long now) throws IOException {
        if (!name.matches("duo-log-[a-f0-9-]+\\.txt")) throw new IOException("invalid_export_name");
        File file = new File(directory.getCanonicalFile(), name);
        if (Files.isSymbolicLink(file.toPath()) || !file.getCanonicalFile().equals(file))
            throw new IOException("invalid_export_path");
        if (file.exists() && (!file.isFile() || file.length() > MAX_FILE_BYTES)) throw new IOException("invalid_export_file");
        if (ACTIVE.contains(file) || ACTIVE.size() >= MAX_FILES) throw new IOException("export_busy");
        prune(directory, file, now);
        ACTIVE.add(file); return file;
    }
    static synchronized void release(File file) {
        if (file == null) return;
        // Do not follow a replaced symbolic link. delete only removes this directory entry.
        file.delete(); ACTIVE.remove(file);
    }
    private static void prune(File directory, File reserved, long now) throws IOException {
        File root = directory.getCanonicalFile();
        File[] listed = root.listFiles(f -> f.getName().matches("duo-log-[a-f0-9-]+\\.txt"));
        if (listed == null) { if (root.exists()) throw new IOException("export_cache_unreadable"); return; }
        Arrays.sort(listed, Comparator.comparingLong(File::lastModified).reversed());
        int kept = ACTIVE.size() + (reserved == null ? 0 : 1);
        for (File file : listed) {
            if (file.equals(reserved) || ACTIVE.contains(file)) continue;
            boolean invalid = Files.isSymbolicLink(file.toPath()) || !file.isFile();
            boolean expired = file.lastModified() > now || now - file.lastModified() >= MAX_AGE_MS;
            if (!invalid && !expired && file.length() <= MAX_FILE_BYTES && kept < MAX_FILES) { kept++; continue; }
            if (!file.isDirectory() && file.delete()) continue;
            throw new IOException("export_cache_cleanup_failed");
        }
    }
}
