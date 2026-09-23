package ls.augment.com;

import java.io.File;
import java.io.FileInputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;

/** Root-owned, local-only bootstrap snapshot for system_server before providers are ready. */
public final class BootConfigMirror {
    public static final String DIRECTORY = "/data/system/ls_augment";
    public static final String PATH = DIRECTORY + "/boot-config-v1";
    private static final int LIMIT = 256 * 1024;
    private BootConfigMirror() { }

    public static ConfigSnapshot read() { return read(new File(PATH)); }

    static ConfigSnapshot read(File file) {
        try {
            if (!file.isFile() || file.length() <= 0 || file.length() > LIMIT) return null;
            try (FileInputStream input = new FileInputStream(file)) {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int count;
                while ((count = input.read(buffer)) != -1) {
                    if (bytes.size() + count > LIMIT) return null;
                    bytes.write(buffer, 0, count);
                }
                return ConfigSnapshot.parse(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
            }
        } catch (Exception ignored) { return null; }
    }

    /** Called only through the existing Root mirror worker, never from a system hook. */
    static String shellWrite(ConfigSnapshot snapshot) {
        if (snapshot == null || snapshot.serialize().length() > LIMIT)
            throw new IllegalArgumentException("invalid_boot_snapshot");
        String temporary = PATH + ".tmp";
        return " if [ -L " + DIRECTORY + " ] || [ -L " + PATH + " ] || [ -L " + temporary
                + " ]; then exit 41; fi; mkdir -p " + DIRECTORY
                + "; chown root:system " + DIRECTORY + "; chmod 750 " + DIRECTORY
                // The snapshot is passed through stdin. Repeating it in su's command
                // argument can exceed Android's per-argument limit for candidate backups.
                + "; umask 0077; cat > " + temporary
                + "; chown root:system " + temporary + "; chmod 640 " + temporary
                + "; restorecon " + DIRECTORY + " " + temporary + "; mv -f " + temporary + " " + PATH + ";";
    }
}
