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
            String clean = message == null ? "" : message.replace('\r', ' ').replace('\n', ' ');
            if (clean.length() > 800) clean = clean.substring(0, 800);
            String line = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US).format(new Date())
                    + " [" + category + "] " + clean;
            if(BoundedLog.append(file,line,MAX_BYTES,KEEP_BYTES)){
                android.content.SharedPreferences stats=context.getSharedPreferences("diagnostic-retention",0);
                stats.edit().putLong("basic_rotations",stats.getLong("basic_rotations",0)+1).apply();
            }
        } catch (Throwable ignored) { }
    }

    static synchronized String read(Context context) {
        try {
            File file = new File(context.getFilesDir(), "ls_augment.log");
            if (!file.isFile()) return "";
            return new String(BoundedLog.tail(file,MAX_BYTES),StandardCharsets.UTF_8);
        } catch (Throwable error) { return "log_read_failed:" + error.getClass().getSimpleName(); }
    }

}
