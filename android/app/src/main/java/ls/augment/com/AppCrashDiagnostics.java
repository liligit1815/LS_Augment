package ls.augment.com;

import android.app.Application;
import android.content.Context;
import android.os.Process;
import android.os.SystemClock;
import android.system.Os;
import android.system.OsConstants;
import android.system.StructStat;
import java.io.File;
import java.io.FileDescriptor;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.atomic.AtomicBoolean;

/** Last app-process fatal stack only. No exception messages, intents or ordinary stack sampling. */
final class AppCrashDiagnostics {
    static final String FILE_NAME = "app-crash.log";
    static final int MAX_BYTES = 32 * 1024;
    private static final int MAX_CHARS = 24 * 1024, MAX_CAUSES = 6, MAX_FRAMES = 24;
    private static final String PACKAGE = "ls.augment.com";
    private static volatile FatalHandler installed;
    private static volatile String phase = "app_attach", installState = "NOT_INSTALLED";

    private AppCrashDiagnostics() { }

    /** Memory only. An unknown phase cannot retain arbitrary caller text or break startup. */
    static void stage(String value) {
        try {
            if (value == null) return;
            switch (value) {
                case "app_attach": phase = "app_attach"; break;
                case "app_create": phase = "app_create"; break;
                case "app_private_storage": phase = "app_private_storage"; break;
                case "app_framework_sync": phase = "app_framework_sync"; break;
                case "app_scope": phase = "app_scope"; break;
                case "app_visibility": phase = "app_visibility"; break;
                case "app_automation": phase = "app_automation"; break;
                case "app_ready": phase = "app_ready"; break;
                case "app_activity": phase = "app_activity"; break;
                case "atomic_workbench_create": phase = "atomic_workbench_create"; break;
                case "atomic_workbench_content": phase = "atomic_workbench_content"; break;
                case "atomic_workbench_returned": phase = "atomic_workbench_returned"; break;
                case "atomic_workbench_started": phase = "atomic_workbench_started"; break;
                case "atomic_workbench_focused": phase = "atomic_workbench_focused"; break;
                case "atomic_workbench_new_intent": phase = "atomic_workbench_new_intent"; break;
                case "atomic_workbench_reentered": phase = "atomic_workbench_reentered"; break;
                default: break;
            }
        } catch (Throwable ignored) { /* A diagnostic phase must never affect a lifecycle callback. */ }
    }

    /** Install before Provider/Application.onCreate. Opening does not truncate a previous fatal. */
    static synchronized void install(Context context) {
        if (installed != null) return;
        FileDescriptor descriptor = null;
        try {
            if (!owner(context) || ResetWriteFence.active()) return;
            Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
            // Android installs its fatal handler before Application attachment. If it is absent,
            // leave the VM/ThreadGroup fallback untouched instead of replacing its behavior.
            if (previous == null) { installState = "NO_PREVIOUS_HANDLER"; return; }
            long generation = ResetWriteFence.generation();
            File file = privateFile(context);
            descriptor = Os.open(file.getPath(), OsConstants.O_RDWR | OsConstants.O_CREAT
                    | OsConstants.O_CLOEXEC | OsConstants.O_NOFOLLOW | OsConstants.O_NONBLOCK, 0600);
            if (!ownedFile(Os.fstat(descriptor), Process.myUid())) throw new SecurityException("crash_file_owner");
            Os.fchmod(descriptor, 0600);
            if (ResetWriteFence.active() || generation != ResetWriteFence.generation()) return;
            FatalHandler handler = new FatalHandler(descriptor, previous, generation);
            Thread.setDefaultUncaughtExceptionHandler(handler);
            installed = handler; descriptor = null; installState = "ARMED";
        } catch (Throwable unavailable) {
            installState = "UNAVAILABLE";
        } finally { close(descriptor); }
    }

    private static boolean owner(Context context) {
        if (context == null || Process.myUid() % 100000 < 10000
                || !PACKAGE.equals(context.getPackageName()) || context.getApplicationInfo().uid != Process.myUid()) return false;
        return PACKAGE.equals(Application.getProcessName());
    }

    private static File privateFile(Context context) throws Exception {
        File data = context.getDataDir().getCanonicalFile(), files = context.getFilesDir();
        if (!files.getCanonicalFile().equals(new File(data, "files"))) throw new SecurityException("crash_file_path");
        StructStat folder = Os.lstat(files.getPath());
        if (!OsConstants.S_ISDIR(folder.st_mode) || folder.st_uid != Process.myUid()) throw new SecurityException("crash_directory_owner");
        return new File(files, FILE_NAME);
    }

    private static boolean ownedFile(StructStat stat, int uid) {
        return OsConstants.S_ISREG(stat.st_mode) && stat.st_uid == uid && stat.st_nlink == 1;
    }

    private static void close(FileDescriptor descriptor) {
        if (descriptor != null) try { Os.close(descriptor); } catch (Throwable ignored) { }
    }

    private static final class FatalHandler implements Thread.UncaughtExceptionHandler {
        final FileDescriptor descriptor;
        final Thread.UncaughtExceptionHandler previous;
        final long generation;
        final int uid = Process.myUid(), pid = Process.myPid();
        final Thread attachThread = Thread.currentThread();
        final AtomicBoolean captured = new AtomicBoolean();
        final ThreadLocal<Boolean> handling = new ThreadLocal<>();
        // Reserve bounded formatting space during healthy startup, rather than at an OOM.
        final StringBuilder text = new StringBuilder(MAX_CHARS);
        final byte[] bytes = new byte[MAX_BYTES];
        final Throwable[] seen = new Throwable[MAX_CAUSES];

        FatalHandler(FileDescriptor descriptor, Thread.UncaughtExceptionHandler previous, long generation) {
            this.descriptor = descriptor; this.previous = previous; this.generation = generation;
        }

        @Override public void uncaughtException(Thread thread, Throwable error) {
            boolean entered = false, recursive = false;
            try {
                if (Boolean.TRUE.equals(handling.get())) { recursive = true; return; } // The outer invocation delegates the original error.
                handling.set(Boolean.TRUE); entered = true;
                if (captured.compareAndSet(false, true) && current()) capture(thread, error);
            } catch (Throwable ignored) {
                // Diagnostics, including an OOM or damaged descriptor, never replace the fatal.
            } finally {
                if (!recursive) try { previous.uncaughtException(thread, error); }
                finally { if (entered) try { handling.remove(); } catch (Throwable ignored) { } }
            }
        }

        private boolean current() {
            return Process.myUid() == uid && !ResetWriteFence.active() && generation == ResetWriteFence.generation();
        }

        private void capture(Thread thread, Throwable error) throws Exception {
            text.setLength(0);
            text.append("APP_FATAL schema=1 build=").append(BuildConfig.VERSION_CODE).append(" version=")
                    .append(symbol(BuildConfig.VERSION_NAME, 100)).append(" wall=").append(System.currentTimeMillis())
                    .append(" elapsed=").append(SystemClock.elapsedRealtime()).append(" pid=").append(pid).append(" uid=").append(uid)
                    .append(" thread_role=").append(thread == attachThread ? "app_attach_thread" : "other")
                    .append(" phase=").append(phase).append(" phase_semantics=last_observed\n");
            Throwable cause = error;
            outer: for (int depth = 0; cause != null && depth < MAX_CAUSES; depth++) {
                if (text.length() > MAX_CHARS - 512) { text.append("STACK_TRUNCATED\n"); break; }
                for (int i = 0; i < depth; i++) if (seen[i] == cause) { text.append("CAUSE_CYCLE\n"); break outer; }
                seen[depth] = cause;
                text.append("exception[").append(depth).append("]=").append(symbol(cause.getClass().getName(), 160)).append('\n');
                try {
                    StackTraceElement[] frames = cause.getStackTrace();
                    for (int i = 0; i < Math.min(MAX_FRAMES, frames.length); i++) {
                        if (text.length() > MAX_CHARS - 512) { text.append("STACK_TRUNCATED\n"); break outer; }
                        StackTraceElement frame = frames[i];
                        if (frame == null) continue;
                        text.append(" at ").append(symbol(frame.getClassName(), 160)).append('#')
                                .append(symbol(frame.getMethodName(), 100)).append('(')
                                .append(symbol(frame.getFileName(), 100)).append(':').append(frame.getLineNumber()).append(")\n");
                    }
                    if (frames.length > MAX_FRAMES) text.append("FRAMES_TRUNCATED\n");
                } catch (Throwable unavailable) { text.append("STACK_UNAVAILABLE\n"); }
                try { cause = cause.getCause(); }
                catch (Throwable unavailable) { text.append("CAUSE_UNAVAILABLE\n"); cause = null; }
                if (depth + 1 == MAX_CAUSES && cause != null) text.append("CAUSES_TRUNCATED\n");
            }
            text.append("END_APP_FATAL\n");
            for (int i = 0; i < seen.length; i++) seen[i] = null;
            int length = text.length();
            for (int i = 0; i < length; i++) bytes[i] = (byte) text.charAt(i); // All variable symbols are ASCII allowlisted.
            if (!current() || !ownedFile(Os.fstat(descriptor), uid)) return;
            // No new path, directory, log lock or preference write on this fatal thread. If a
            // reset unlinks the preopened inode, this descriptor cannot resurrect its pathname.
            Os.ftruncate(descriptor, 0L); Os.lseek(descriptor, 0L, OsConstants.SEEK_SET);
            int offset = 0;
            for (int attempt = 0; offset < length && attempt < 64; attempt++) {
                int count = Os.write(descriptor, bytes, offset, length - offset);
                if (count <= 0) return;
                offset += count;
            }
            if (offset == length) Os.fsync(descriptor);
        }
    }

    private static String symbol(String value, int limit) {
        if (value == null || value.isEmpty() || value.length() > limit) return "unknown";
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (!(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9'
                    || c == '_' || c == '$' || c == '.' || c == '<' || c == '>' || c == '-')) return "unknown";
        }
        return value;
    }

    /** The retained file is revalidated too; an arbitrary private file is not sanitized evidence. */
    private static boolean validRecord(String value) {
        if (!value.endsWith("END_APP_FATAL\n")) return false;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c != '\n' && (c < 32 || c > 126)) return false;
        }
        String[] lines = value.split("\n", -1);
        if (lines.length < 3 || lines.length > MAX_CAUSES * (MAX_FRAMES + 3) + 8) return false;
        if (!lines[0].matches("APP_FATAL schema=1 build=[0-9]{1,10} version=[A-Za-z0-9_.$<>-]{1,100} wall=[0-9]{1,20} elapsed=[0-9]{1,20} pid=[0-9]{1,10} uid=[0-9]{1,10} thread_role=(app_attach_thread|other) phase=(app_(attach|create|private_storage|framework_sync|scope|visibility|automation|ready|activity)|atomic_workbench_(create|content|returned|started|focused|new_intent|reentered)) phase_semantics=last_observed")) return false;
        if (!"END_APP_FATAL".equals(lines[lines.length - 2]) || !lines[lines.length - 1].isEmpty()) return false;
        int depth = -1, frameCount = 0;
        for (int i = 1; i < lines.length - 2; i++) {
            String line = lines[i];
            if (line.startsWith("exception[")) {
                if (++depth >= MAX_CAUSES || !line.matches("exception\\[" + depth + "\\]=[A-Za-z0-9_.$<>-]{1,160}")) return false;
                frameCount = 0;
            } else if (line.startsWith(" at ")) {
                if (depth < 0 || ++frameCount > MAX_FRAMES
                        || !line.matches(" at [A-Za-z0-9_.$<>-]{1,160}#[A-Za-z0-9_.$<>-]{1,100}\\([A-Za-z0-9_.$<>-]{1,100}:-?[0-9]{1,11}\\)")) return false;
            } else if (!("CAUSE_CYCLE".equals(line) || "STACK_TRUNCATED".equals(line) || "FRAMES_TRUNCATED".equals(line)
                    || "STACK_UNAVAILABLE".equals(line) || "CAUSE_UNAVAILABLE".equals(line) || "CAUSES_TRUNCATED".equals(line))) return false;
        }
        return true;
    }

    private static String captureState() {
        FatalHandler handler = installed;
        return handler != null && !handler.current() ? "RESET_INVALIDATED_UNTIL_PROCESS_RESTART" : installState;
    }

    static String readForExport(Context context) {
        String header = "\n===== SOURCE APP_UNCAUGHT_EXCEPTIONS; latest fatal only; phase is last observed, not crash attribution =====\n";
        FileDescriptor descriptor = null;
        long generation = ResetWriteFence.generation();
        try {
            if (!owner(context)) return header + "status=OWNER_REJECTED\n";
            if (ResetWriteFence.active()) return header + "status=RESET_ACTIVE\n";
            File file = privateFile(context);
            if (!file.exists()) return header + "status=NOT_COLLECTED; capture=" + captureState() + "; absence is not proof of no crash\n";
            descriptor = Os.open(file.getPath(), OsConstants.O_RDONLY | OsConstants.O_CLOEXEC
                    | OsConstants.O_NOFOLLOW | OsConstants.O_NONBLOCK, 0);
            StructStat stat = Os.fstat(descriptor);
            if (!ownedFile(stat, Process.myUid()) || stat.st_size < 0 || stat.st_size > MAX_BYTES)
                return header + "status=FILE_REJECTED\n";
            byte[] bytes = new byte[(int) stat.st_size];
            int offset = 0;
            for (int attempt = 0; offset < bytes.length && attempt < 64; attempt++) {
                int count = Os.read(descriptor, bytes, offset, bytes.length - offset);
                if (count <= 0) break;
                offset += count;
            }
            if (ResetWriteFence.active() || generation != ResetWriteFence.generation()) return header + "status=RESET_RACED\n";
            if (offset == 0) return header + "status=NOT_COLLECTED; capture=" + captureState() + "; absence is not proof of no crash\n";
            String value = new String(bytes, 0, offset, StandardCharsets.US_ASCII);
            if (offset != bytes.length || !validRecord(value)) return header + "status=CONTENT_REJECTED; bytes=" + offset + "; captureState=UNVERIFIED\n";
            return header + "status=READ; bytes=" + offset + "; capture=" + captureState() + "; captureState=COMPLETE"
                    + "; retention=latest_fatal_overwrites_previous; native_death_and_kill=NOT_CAPTURED\n" + value;
        } catch (Throwable unavailable) { return header + "status=READ_FAILED\n"; }
        finally { close(descriptor); }
    }
}
