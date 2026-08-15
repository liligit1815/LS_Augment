package ls.augment.com;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

final class AuditLog {
    private static final int MAX_BYTES = 192 * 1024;
    private static final int KEEP_BYTES = 96 * 1024;

    private AuditLog() { }

    static synchronized void write(Context context, String category, String message) {
        if (context == null) return;
        try {
            File file = new File(context.getFilesDir(), "ls_augment.log");
            if (file.length() > MAX_BYTES) compact(file);
            String clean = message == null ? "" : message.replace('\r', ' ').replace('\n', ' ');
            if (clean.length() > 800) clean = clean.substring(0, 800);
            String line = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US).format(new Date())
                    + " [" + category + "] " + clean + "\n";
            try (FileOutputStream output = new FileOutputStream(file, true)) {
                output.write(line.getBytes(StandardCharsets.UTF_8));
            }
        } catch (Throwable ignored) { }
    }

    static synchronized String read(Context context) {
        try {
            File file = new File(context.getFilesDir(), "ls_augment.log");
            if (!file.isFile()) return "";
            byte[] data = new byte[(int) Math.min(file.length(), MAX_BYTES)];
            try (FileInputStream input = new FileInputStream(file)) {
                int read = input.read(data);
                return read <= 0 ? "" : new String(data, 0, read, StandardCharsets.UTF_8);
            }
        } catch (Throwable error) { return "log_read_failed:" + error.getClass().getSimpleName(); }
    }

    private static void compact(File file) throws Exception {
        byte[] data = new byte[(int) Math.min(file.length(), MAX_BYTES)];
        int read;
        try (FileInputStream input = new FileInputStream(file)) { read = input.read(data); }
        int start = Math.max(0, read - KEEP_BYTES);
        while (start < read && data[start] != '\n') start++;
        if (start < read) start++;
        try (FileOutputStream output = new FileOutputStream(file, false)) {
            output.write(data, start, read - start);
        }
    }
}
