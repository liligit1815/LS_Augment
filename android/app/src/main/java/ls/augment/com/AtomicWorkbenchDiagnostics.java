package ls.augment.com;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Process;
import android.os.SystemClock;
import java.io.File;
import java.io.PrintStream;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONObject;

/** Root emits to its pipe; only the application UID persists these bounded diagnostics. */
public final class AtomicWorkbenchDiagnostics {
    static final String FILE_NAME = "atomic-workbench.log";
    static final String STAT = "atomic_workbench";
    static final String PREFIX = "DUO_ATOMIC_EVENT ";
    static final int MAX_BYTES = 256 * 1024, KEEP_BYTES = 128 * 1024;
    static final int MAX_WIRE_CHARS = 16 * 1024;
    static final int ROOT_QUEUE_CAPACITY = 64;
    private static final ArrayBlockingQueue<JSONObject> rootQueue = new ArrayBlockingQueue<>(ROOT_QUEUE_CAPACITY);
    private static final Object emitLock = new Object(), flushLock = new Object();
    private static final AtomicBoolean writerStarted = new AtomicBoolean();
    private static final AtomicInteger rootPending = new AtomicInteger();
    private static final AtomicLong rootSequence = new AtomicLong(), rootDropped = new AtomicLong(), rootPipeFailures = new AtomicLong();
    // Diagnostic correlation only: unrelated to the authenticated workbench lease/token.
    private static final String rootSessionId = java.util.UUID.randomUUID().toString();
    private static long writeFailures, lastWriteErrorAt;
    private static String lastWriteError = "";
    private static boolean failureMetadataPersisted = true;

    private AtomicWorkbenchDiagnostics() { }
    static void resetLogFailures(){writeFailures=0;lastWriteErrorAt=0;lastWriteError="";failureMetadataPersisted=true;}

    /** Never opens app storage or waits for pipe capacity on a task/recovery thread. */
    public static void emit(String event, int windowId, int userId, String component,
            int displayId, String detail, Throwable error) {
        try {
            JSONObject value = event("ROOT", event, windowId, userId, component, displayId, detail, error);
            synchronized (emitLock) {
                value.put("rootSequence", rootSequence.incrementAndGet());
                value.put("rootSessionId", rootSessionId);
                if (rootPending.get() >= ROOT_QUEUE_CAPACITY) { rootDropped.incrementAndGet(); return; }
                rootPending.incrementAndGet();
                if (!rootQueue.offer(value)) {
                    rootPending.decrementAndGet(); rootDropped.incrementAndGet(); return;
                }
                startWriter();
            }
        } catch (Throwable ignored) { rootDropped.incrementAndGet(); }
    }

    private static void startWriter() {
        if (!writerStarted.compareAndSet(false, true)) return;
        try {
            Thread writer = new Thread(() -> {
                for (;;) {
                    JSONObject value;
                    try { value = rootQueue.take(); }
                    catch (InterruptedException ignored) { continue; }
                    try {
                        // Count losses at actual delivery, including drops while the pipe was blocked.
                        value.put("rootDroppedEvents", rootDropped.get());
                        value.put("rootPipeFailures", rootPipeFailures.get());
                        value.put("rootQueueCapacity", ROOT_QUEUE_CAPACITY);
                        PrintStream output = System.out;
                        output.println(PREFIX + value);
                        output.flush();
                        if (output.checkError()) throw new java.io.IOException("root diagnostic pipe unavailable");
                    } catch (Throwable ignored) {
                        rootPipeFailures.incrementAndGet(); rootDropped.incrementAndGet();
                    } finally {
                        rootPending.decrementAndGet();
                        synchronized (flushLock) { flushLock.notifyAll(); }
                    }
                }
            }, "atomic-workbench-diagnostics");
            writer.setDaemon(true);
            writer.start();
        } catch (Throwable ignored) {
            writerStarted.set(false);
            int lost = rootQueue.size(); rootQueue.clear(); rootPending.addAndGet(-lost);
            rootDropped.addAndGet(lost); rootPipeFailures.incrementAndGet();
        }
    }

    /** Best-effort shutdown drain; false means delivery remains incomplete. Never wait on stdout. */
    public static boolean flush(long timeoutMs) {
        long duration = TimeUnit.MILLISECONDS.toNanos(Math.max(0, Math.min(timeoutMs, 2000L)));
        long deadline = System.nanoTime() + duration;
        synchronized (flushLock) {
            while (rootPending.get() != 0) {
                long left = deadline - System.nanoTime();
                if (left <= 0) return false;
                try { TimeUnit.NANOSECONDS.timedWait(flushLock, left); }
                catch (InterruptedException ignored) { Thread.currentThread().interrupt(); return false; }
            }
            return true;
        }
    }

    static void record(Context context, long generation, String event, int windowId, int userId,
            String component, int displayId, String detail, Throwable error) {
        try { append(context, generation, event("CLIENT", event, windowId, userId,
                component, displayId, detail, error)); }
        catch (Throwable ignored) { }
    }

    /** Parses an allowlist, never copying unknown JSON fields or malformed payloads to disk. */
    static void retainOutput(Context context, long generation, int userId, String line,
            String token, boolean truncated) {
        try {
            String raw = line == null ? "" : line;
            if (raw.startsWith(PREFIX)) {
                if (truncated || raw.length() > MAX_WIRE_CHARS) {
                    record(context, generation, "ROOT_EVENT_TRUNCATED", -1, userId, "", -1,
                            "pipe_record_exceeded_limit", null);
                    return;
                }
                try {
                    JSONObject source = new JSONObject(raw.substring(PREFIX.length()));
                    if (source.getInt("schema") != 1 || source.getLong("wall") <= 0
                            || source.getInt("pid") <= 0 || !validEvent(source.getString("event")))
                        throw new IllegalArgumentException("invalid diagnostic record");
                    JSONObject value = event("ROOT", source.getString("event"), source.optInt("window", -1),
                            source.optInt("user", userId), source.optString("component", ""),
                            source.optInt("display", -1), safe(source.optString("detail", ""), token, 1536), null);
                    value.put("wall", source.getLong("wall"));
                    value.put("elapsed", source.optLong("elapsed", -1));
                    value.put("pid", source.getInt("pid"));
                    value.put("uid", source.optInt("uid", -1));
                    value.put("process", "AtomicWorkbenchRoot");
                    value.put("moduleVersion", safe(source.optString("moduleVersion", ""), token, 80));
                    value.put("rootSequence", source.optLong("rootSequence", -1));
                    String session = source.optString("rootSessionId", "");
                    value.put("rootSessionId", session.matches("[a-f0-9]{8}(-[a-f0-9]{4}){3}-[a-f0-9]{12}") ? session : "");
                    value.put("rootDroppedEvents", source.optLong("rootDroppedEvents", -1));
                    value.put("rootPipeFailures", source.optLong("rootPipeFailures", -1));
                    value.put("rootQueueCapacity", source.optInt("rootQueueCapacity", -1));
                    value.put("errorType", safe(source.optString("errorType", ""), token, 160));
                    value.put("errorStack", safe(source.optString("errorStack", ""), token, 4096));
                    value.put("receivedAt", System.currentTimeMillis());
                    value.put("transport", "child_stdout");
                    append(context, generation, value);
                } catch (Throwable invalid) {
                    record(context, generation, "ROOT_EVENT_MALFORMED", -1, userId, "", -1,
                            "payload_omitted", invalid);
                }
                return;
            }
            // stderr is merged into this pipe by ProcessBuilder. It is not global logcat.
            // A cut token at the line limit must not leave a credential fragment behind.
            if (truncated && raw.length() > 128) raw = raw.substring(0, raw.length() - 128);
            JSONObject value = event("ROOT_BOOTSTRAP", "ROOT_OUTPUT", -1, userId, "", -1,
                    safe(raw, token, 2048), null);
            value.put("truncated", truncated);
            value.put("transport", "child_stdout_stderr");
            value.put("pid", -1); // emitter PID is unknown for unstructured su / VM output
            value.put("uid", -1);
            value.put("process", "root_bootstrap");
            append(context, generation, value);
        } catch (Throwable ignored) { }
    }

    private static JSONObject event(String source, String event, int windowId, int userId,
            String component, int displayId, String detail, Throwable error) throws Exception {
        JSONObject value = new JSONObject();
        String target = component == null ? "" : component;
        if (target.length() > 512 || !target.matches("[A-Za-z0-9_.$/]*")) target = "[invalid_component]";
        value.put("schema", 1).put("source", source);
        value.put("event", validEvent(event) ? event : "INVALID_EVENT");
        value.put("wall", System.currentTimeMillis()).put("elapsed", SystemClock.elapsedRealtime());
        value.put("pid", Process.myPid()).put("uid", Process.myUid());
        value.put("process", "ROOT".equals(source) ? "AtomicWorkbenchRoot" : "ls.augment.com");
        value.put("moduleVersion", BuildConfig.VERSION_NAME);
        value.put("window", windowId).put("user", userId).put("display", displayId);
        value.put("component", target);
        value.put("package", target.contains("/") ? target.substring(0, target.indexOf('/')) : target);
        value.put("detail", safe(detail, null, 2048));
        value.put("errorType", error == null ? "" : safe(error.getClass().getName(), null, 160));
        value.put("errorStack", stack(error));
        return value;
    }

    private static boolean validEvent(String value) {
        return value != null && value.matches("[A-Za-z0-9_.-]{1,80}");
    }

    /** Exception messages can contain Intent extras; preserve types and frames only. */
    private static String stack(Throwable error) {
        StringBuilder out = new StringBuilder();
        for (int cause = 0; error != null && cause < 4; cause++) {
            if (cause > 0) out.append(" <- ");
            out.append(error.getClass().getName());
            StackTraceElement[] frames = error.getStackTrace();
            for (int i = 0; i < Math.min(16, frames.length); i++) out.append(" at ").append(frames[i]);
            if (frames.length > 16) out.append(" [frames_truncated]");
            Throwable next = error.getCause();
            if (next == error) break;
            error = next;
        }
        return safe(out.toString(), null, 4096);
    }

    static String safe(String text, String token, int limit) {
        String value = text == null ? "" : text;
        if (token != null && !token.isEmpty()) value = value.replace(token, "[redacted]");
        value = value.replaceAll("(?i)[0-9a-f]{64}", "[redacted]")
                .replaceAll("(?i)(token|password|secret|authorization)([\\\"'\\s]*[:=][\\\"'\\s]*)[^\\s,;}]+", "$1=[redacted]")
                .replaceAll("(?i)(Intent|Bundle)\\s*\\{.*", "$1{[omitted]}")
                .replaceAll("(?i)(extras|clipdata)\\s*[:=].*", "$1=[omitted]")
                .replaceAll("[\\p{Cntrl}]", " ");
        return value.length() <= limit ? value : value.substring(0, limit) + " [TRUNCATED]";
    }

    private static void append(Context context, long generation, JSONObject value) {
        synchronized(ResetWriteFence.class){synchronized(LogHistory.LOCK){appendCurrent(context,generation,value);}}
    }
    private static void appendCurrent(Context context,long generation,JSONObject value){
        if(context!=null&&LogHistory.old(context,value.optLong("wall")))return;
        // Synchronize with begin/end so reset cannot race a check and recreate a deleted file.
        synchronized (ResetWriteFence.class) {
            if (context == null || Process.myUid() == 0 || ResetWriteFence.active()
                    || ResetWriteFence.stale(generation)) return;
            try {
                File file = new File(context.getFilesDir(), FILE_NAME);
                boolean rotated = BoundedLog.append(file, value.toString(), MAX_BYTES, KEEP_BYTES);
                if (rotated) {
                    SharedPreferences stats = context.getSharedPreferences("diagnostic-retention", 0);
                    if (!stats.edit().putLong(STAT + "_rotations", stats.getLong(STAT + "_rotations", 0) + 1).commit())
                        throw new java.io.IOException("retention metadata write failed");
                }
            } catch (Throwable error) { writeFailure(context, error); }
        }
    }

    private static void writeFailure(Context context, Throwable error) {
        writeFailures++;
        lastWriteErrorAt = System.currentTimeMillis();
        lastWriteError = error.getClass().getSimpleName();
        failureMetadataPersisted = false;
        try {
            SharedPreferences stats = context.getSharedPreferences("diagnostic-retention", 0);
            writeFailures = Math.max(writeFailures, stats.getLong(STAT + "_write_failures", 0) + 1);
            failureMetadataPersisted = stats.edit().putLong(STAT + "_write_failures", writeFailures)
                    .putLong(STAT + "_last_write_error_at", lastWriteErrorAt)
                    .putString(STAT + "_last_write_error", lastWriteError).commit();
        } catch (Throwable ignored) { }
        try { android.util.Log.e("DuoAtomic", "DIAGNOSTIC_WRITE_FAILED type=" + lastWriteError); }
        catch (Throwable ignored) { }
    }

    static String writeState(Context context) {
        synchronized (ResetWriteFence.class) {
            long count = writeFailures, at = lastWriteErrorAt;
            String error = lastWriteError, metadata = "READ";
            try {
                SharedPreferences stats = context.getSharedPreferences("diagnostic-retention", 0);
                long stored = stats.getLong(STAT + "_write_failures", 0);
                if (stored > count || at == 0) {
                    count = Math.max(count, stored);
                    at = stats.getLong(STAT + "_last_write_error_at", 0);
                    error = stats.getString(STAT + "_last_write_error", "");
                }
            } catch (Throwable ignored) { metadata = "UNAVAILABLE"; }
            return "writeFailures=" + count + ";lastWriteErrorAt=" + at + ";lastWriteError=" + error
                    + ";failureMetadata=" + metadata + ";latestFailureMetadataPersisted=" + failureMetadataPersisted;
        }
    }

    /** Describes only the retained evidence; a missing terminal record never proves a crash. */
    static String sessionSummary(Context context) {
        try {
            File file = new File(context.getFilesDir(), FILE_NAME);
            if (!file.isFile()) return "NOT_COLLECTED";
            return summarizeSessions(new String(BoundedLog.tail(file, MAX_BYTES), java.nio.charset.StandardCharsets.UTF_8));
        } catch (Throwable error) { return "READ_FAILED:" + error.getClass().getSimpleName(); }
    }

    static String summarizeSessions(String lines) {
        java.util.LinkedHashMap<String, JSONObject> sessions = new java.util.LinkedHashMap<>();
        int malformed = 0, omitted = 0;
        for (String line : lines.split("\\r?\\n")) {
            if (line.isBlank()) continue;
            try {
                JSONObject event = new JSONObject(line);
                if (!"ROOT".equals(event.optString("source"))) continue;
                String id = event.optString("rootSessionId", "");
                boolean identified = id.matches("[a-f0-9]{8}(-[a-f0-9]{4}){3}-[a-f0-9]{12}");
                // Legacy PID groups cannot disambiguate PID reuse; explicitly flag that limitation.
                String key = identified ? id : "legacy-pid-" + event.optInt("pid", -1);
                JSONObject summary = sessions.get(key);
                if (summary == null) {
                    if (sessions.size() >= 16) { sessions.remove(sessions.keySet().iterator().next()); omitted++; }
                    summary = new JSONObject().put("session", key).put("identity", identified ? "SESSION_ID" : "LEGACY_PID_ONLY")
                            .put("pid", event.optInt("pid", -1)).put("moduleVersion", safe(event.optString("moduleVersion"), null, 80))
                            .put("firstWall", event.optLong("wall", -1)).put("firstSequence", event.optLong("rootSequence", -1))
                            .put("startRetained", false).put("terminalRetained", false);
                    sessions.put(key, summary);
                }
                long sequence = event.optLong("rootSequence", -1), previous = summary.optLong("lastSequence", -1);
                if (sequence > 0 && previous > 0 && sequence > previous + 1)
                    summary.put("sequenceGaps", summary.optLong("sequenceGaps") + sequence - previous - 1);
                if (sequence > 0 && previous > 0 && sequence <= previous)
                    summary.put("nonIncreasingSequences", summary.optInt("nonIncreasingSequences") + 1);
                String name = event.optString("event");
                if ("ROOT_START".equals(name)) summary.put("startRetained", true);
                if ("ROOT_LOOP_EXIT".equals(name) || "ROOT_PROCESS_SHUTDOWN".equals(name)) summary.put("terminalRetained", true);
                summary.put("lastWall", event.optLong("wall", -1)).put("lastSequence", sequence)
                        .put("lastEvent", validEvent(name) ? name : "INVALID_EVENT")
                        .put("retainedEvents", summary.optInt("retainedEvents") + 1)
                        .put("reportedDropped", Math.max(summary.optLong("reportedDropped"), event.optLong("rootDroppedEvents")))
                        .put("reportedPipeFailures", Math.max(summary.optLong("reportedPipeFailures"), event.optLong("rootPipeFailures")));
            } catch (Throwable error) { malformed++; }
        }
        StringBuilder out = new StringBuilder("scope=RETAINED_LOG_ONLY; terminal event is not recovery proof; terminalRetained=false means UNKNOWN (running, lost pipe, death or rotation); no crash inference; malformed=")
                .append(malformed).append("; omittedOlderSessionGroups=").append(omitted).append('\n');
        for (JSONObject value : sessions.values()) out.append(value).append('\n');
        return out.toString();
    }
}
