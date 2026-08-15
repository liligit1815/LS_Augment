package ls.augment.com.hook;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/** Creates a private, disposable motion file with scaled MotionEvent times. */
final class ComboMotionFileScaler {
    private static final long MAX_FILE_BYTES = 16L * 1024L * 1024L;
    private static final String CACHE_DIRECTORY = "ls_augment_combo";
    private static final String CACHE_FILE_PREFIX = "motion-v2-";

    private ComboMotionFileScaler() { }

    static synchronized Result scale(File cacheDir, String sourcePath, float rate) {
        if (cacheDir == null || sourcePath == null || sourcePath.trim().isEmpty()) {
            return Result.failure("missing_path");
        }
        if (!ComboSpeedPolicy.isValidRate(rate)) {
            return Result.failure("invalid_rate");
        }

        File source = new File(sourcePath);
        if (!source.isFile()) return Result.failure("source_missing");
        long fileLength = source.length();
        if (fileLength <= 0L || fileLength > MAX_FILE_BYTES) {
            return Result.failure("source_size_" + fileLength);
        }
        long modifiedTime = source.lastModified();
        String identity = ComboSpeedPolicy.cacheIdentity(
                source.getName(), modifiedTime, rate);
        String fileIdentity = ComboSpeedPolicy.cacheFileIdentity(source.getName());
        if (identity == null || fileIdentity == null) {
            return Result.failure("cache_identity");
        }

        try {
            File directory = new File(cacheDir, CACHE_DIRECTORY);
            if ((!directory.isDirectory() && !directory.mkdirs())
                    || !directory.isDirectory()) {
                return Result.failure("cache_unavailable");
            }
            File destination = new File(
                    directory, CACHE_FILE_PREFIX + identity + ".json");
            File pending = new File(
                    directory, CACHE_FILE_PREFIX + identity + ".pending");
            String sourcePrefix = CACHE_FILE_PREFIX + fileIdentity + "-m";
            String currentRevisionPrefix = sourcePrefix + modifiedTime + "-x";
            cleanupLegacyFiles(directory);
            cleanupSupersededFiles(directory, sourcePrefix,
                    currentRevisionPrefix, destination, pending);
            if (isUsableCache(destination)) {
                if (pending.exists()) pending.delete();
                return Result.cacheHit(destination.getAbsolutePath(), identity);
            }

            JSONObject root = new JSONObject(readUtf8(source));
            JSONArray events = root.optJSONArray("events");
            if (events == null || events.length() == 0) {
                return Result.failure("events_missing");
            }

            long origin = Long.MAX_VALUE;
            long sourceLastSample = Long.MIN_VALUE;
            for (int index = 0; index < events.length(); index++) {
                JSONObject event = events.optJSONObject(index);
                if (event == null || !event.has("sampleEventTime")
                        || !event.has("downTime")) {
                    return Result.failure("event_schema_" + index);
                }
                long sampleTime = event.getLong("sampleEventTime");
                long downTime = event.getLong("downTime");
                if (sampleTime < 0L || downTime < 0L) {
                    return Result.failure("event_time_" + index);
                }
                origin = Math.min(origin, Math.min(sampleTime, downTime));
                sourceLastSample = Math.max(sourceLastSample, sampleTime);
            }

            long outputLastSample = Long.MIN_VALUE;
            for (int index = 0; index < events.length(); index++) {
                JSONObject event = events.getJSONObject(index);
                long scaledDownTime = ComboSpeedPolicy.scaleTimestamp(
                        event.getLong("downTime"), origin, rate);
                long scaledSampleTime = ComboSpeedPolicy.scaleTimestamp(
                        event.getLong("sampleEventTime"), origin, rate);
                event.put("downTime", scaledDownTime);
                event.put("sampleEventTime", scaledSampleTime);
                outputLastSample = Math.max(outputLastSample, scaledSampleTime);
            }

            writeUtf8(pending, root.toString());
            if (destination.exists() && !destination.delete()) {
                pending.delete();
                return Result.failure("cache_replace");
            }
            if (!pending.renameTo(destination)) {
                pending.delete();
                return Result.failure("cache_commit");
            }

            long sourceSpan = Math.max(0L, sourceLastSample - origin);
            long outputSpan = Math.max(0L, outputLastSample - origin);
            cleanupSupersededFiles(directory, sourcePrefix,
                    currentRevisionPrefix, destination, pending);
            return Result.generated(destination.getAbsolutePath(), identity,
                    events.length(), sourceSpan, outputSpan);
        } catch (Throwable error) {
            return Result.failure(error.getClass().getSimpleName());
        }
    }

    private static boolean isUsableCache(File file) {
        return file.isFile() && file.length() > 0L && file.length() <= MAX_FILE_BYTES;
    }

    /** Remove files created by the pre-cache implementation. */
    private static void cleanupLegacyFiles(File directory) {
        File[] files = directory.listFiles();
        if (files == null) return;
        for (File file : files) {
            String name = file.getName();
            if (file.isFile() && name.startsWith("motion-")
                    && !name.startsWith(CACHE_FILE_PREFIX)) {
                file.delete();
            }
        }
    }

    /**
     * A new recording with the same file name gets a new modification time.
     * Keep all integer-rate variants for the current revision and discard
     * only variants that belong to an older revision of that same recording.
     */
    private static void cleanupSupersededFiles(
            File directory, String sourcePrefix, String currentRevisionPrefix,
            File destination, File pending) {
        File[] files = directory.listFiles();
        if (files == null) return;
        for (File file : files) {
            if (!file.isFile() || file.equals(destination) || file.equals(pending)) continue;
            String name = file.getName();
            if (name.endsWith(".pending")
                    || (name.startsWith(sourcePrefix)
                    && !name.startsWith(currentRevisionPrefix))) {
                file.delete();
            }
        }
    }

    private static String readUtf8(File source) throws IOException {
        try (FileInputStream input = new FileInputStream(source);
             ByteArrayOutputStream output = new ByteArrayOutputStream(
                     (int) Math.min(source.length(), 64L * 1024L))) {
            byte[] buffer = new byte[8192];
            long total = 0L;
            int read;
            while ((read = input.read(buffer)) != -1) {
                total += read;
                if (total > MAX_FILE_BYTES) throw new IOException("motion_too_large");
                output.write(buffer, 0, read);
            }
            return new String(output.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    private static void writeUtf8(File destination, String value) throws IOException {
        byte[] data = value.getBytes(StandardCharsets.UTF_8);
        try (FileOutputStream output = new FileOutputStream(destination, false)) {
            output.write(data);
            output.flush();
            output.getFD().sync();
        }
    }

    static final class Result {
        final boolean success;
        final boolean cacheHit;
        final String outputPath;
        final String cacheIdentity;
        final int eventCount;
        final long sourceSpanMs;
        final long outputSpanMs;
        final String error;

        private Result(boolean success, boolean cacheHit, String outputPath,
                String cacheIdentity, int eventCount, long sourceSpanMs,
                long outputSpanMs, String error) {
            this.success = success;
            this.cacheHit = cacheHit;
            this.outputPath = outputPath;
            this.cacheIdentity = cacheIdentity;
            this.eventCount = eventCount;
            this.sourceSpanMs = sourceSpanMs;
            this.outputSpanMs = outputSpanMs;
            this.error = error;
        }

        static Result generated(String outputPath, String cacheIdentity, int eventCount,
                long sourceSpanMs, long outputSpanMs) {
            return new Result(true, false, outputPath, cacheIdentity, eventCount,
                    sourceSpanMs, outputSpanMs, "");
        }

        static Result cacheHit(String outputPath, String cacheIdentity) {
            return new Result(true, true, outputPath, cacheIdentity,
                    0, 0L, 0L, "");
        }

        static Result failure(String error) {
            return new Result(false, false, "", "", 0, 0L, 0L, error);
        }
    }
}
