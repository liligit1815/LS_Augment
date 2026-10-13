package ls.augment.com;

import ls.augment.com.hook.ComboSpeedPolicy;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.AtomicMoveNotSupportedException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Comparator;

/** Worker-side transformation for one-key-combo recordings. */
final class ComboMotionPrivateScaler {
    static final long MAX_FILE_BYTES = 16L * 1024L * 1024L;
    static final String ALGORITHM_VERSION = "motion-time-v3";
    private static final String CACHE_DIRECTORY = "ls_augment_combo";
    private static final String CACHE_FILE_PREFIX = "motion-v3-";

    private ComboMotionPrivateScaler() { }

    /** This method is called only by the private module provider's serialized worker. */
    static Result scale(File cacheDir, Request request) {
        if (cacheDir == null || request == null || !request.valid) {
            return Result.failure("invalid_request");
        }
        if (!ComboSpeedPolicy.isValidRate(request.rate)) {
            return Result.failure("invalid_rate");
        }

        File source = new File(request.normalizedPath);
        if (!source.isFile()) return Result.failure("source_missing");
        if (source.length() != request.size || source.lastModified() != request.modifiedAt) {
            return Result.failure("source_changed_before_read");
        }

        File pending = null;
        try {
            File directory = new File(cacheDir, CACHE_DIRECTORY);
            if ((!directory.isDirectory() && !directory.mkdirs()) || !directory.isDirectory()) {
                return Result.failure("cache_unavailable");
            }

            byte[] sourceBytes = readBytes(source, MAX_FILE_BYTES);
            if (source.length() != request.size || source.lastModified() != request.modifiedAt) {
                return Result.failure("source_changed_during_read");
            }
            String contentDigest = sha256(sourceBytes);
            if (!contentDigest.equals(request.contentDigest)) {
                return Result.failure("source_digest_changed");
            }
            String identity = sha256((ALGORITHM_VERSION + "\n"
                    + request.normalizedPath + "\n" + request.size + "\n"
                    + request.modifiedAt + "\n" + request.contentDigest + "\n"
                    + Math.round(request.rate)).getBytes(StandardCharsets.UTF_8));
            File destination = new File(directory, CACHE_FILE_PREFIX + identity + ".json");
            cleanupWorkerSide(directory, destination);
            JSONObject root = new JSONObject(new String(sourceBytes, StandardCharsets.UTF_8));
            JSONArray events = root.optJSONArray("events");
            if (events == null || events.length() == 0) {
                return Result.failure("events_missing");
            }

            long origin = Long.MAX_VALUE;
            long sourceLastSample = Long.MIN_VALUE;
            for (int index = 0; index < events.length(); index++) {
                JSONObject event = events.optJSONObject(index);
                if (event == null || !event.has("sampleEventTime") || !event.has("downTime")) {
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

            // Inspect old caches on this worker too. Their filenames contain the
            // source identity, but a valid JSON schema alone does not prove the
            // timestamps were scaled once from that source.
            Result cached = inspectCache(destination, identity, root, events, origin,
                    Math.max(0L, sourceLastSample - origin), request.rate);
            if (cached != null) return cached;

            long outputLastSample = Long.MIN_VALUE;
            for (int index = 0; index < events.length(); index++) {
                JSONObject event = events.getJSONObject(index);
                long scaledDown = ComboSpeedPolicy.scaleTimestamp(
                        event.getLong("downTime"), origin, request.rate);
                long scaledSample = ComboSpeedPolicy.scaleTimestamp(
                        event.getLong("sampleEventTime"), origin, request.rate);
                event.put("downTime", scaledDown);
                event.put("sampleEventTime", scaledSample);
                outputLastSample = Math.max(outputLastSample, scaledSample);
            }

            byte[] output = root.toString().getBytes(StandardCharsets.UTF_8);
            if (output.length <= 0 || output.length > MAX_FILE_BYTES * 2L) {
                return Result.failure("output_size_" + output.length);
            }
            pending = new File(directory, CACHE_FILE_PREFIX + identity + ".pending-"
                    + Long.toUnsignedString(System.nanoTime()));
            writeAndSync(pending, output);
            publishAtomically(pending, destination);
            pending = null;
            cleanupWorkerSide(directory, destination);

            long sourceSpan = Math.max(0L, sourceLastSample - origin);
            long outputSpan = Math.max(0L, outputLastSample - origin);
            return Result.generated(destination.getAbsolutePath(), identity,
                    events.length(), sourceSpan, outputSpan);
        } catch (Throwable error) {
            return Result.failure(error.getClass().getSimpleName());
        } finally {
            if (pending != null && pending.isFile()) pending.delete();
        }
    }

    private static byte[] readBytes(File source, long maximumBytes) throws IOException {
        try (FileInputStream input = new FileInputStream(source);
             ByteArrayOutputStream output = new ByteArrayOutputStream(
                     (int) Math.min(source.length(), 64L * 1024L))) {
            byte[] buffer = new byte[8192];
            long total = 0L;
            int read;
            while ((read = input.read(buffer)) != -1) {
                total += read;
                if (total > maximumBytes) throw new IOException("motion_too_large");
                output.write(buffer, 0, read);
            }
            return output.toByteArray();
        }
    }

    /** Worker-side source fingerprint used as part of every in-memory and disk cache key. */
    static String contentDigest(File source, long maximumBytes) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        try (FileInputStream input = new FileInputStream(source)) {
            byte[] buffer = new byte[8192];
            long total = 0L;
            int read;
            while ((read = input.read(buffer)) != -1) {
                total += read;
                if (total > maximumBytes) throw new IOException("motion_too_large");
                digest.update(buffer, 0, read);
            }
        }
        return hex(digest.digest());
    }

    private static void writeAndSync(File file, byte[] value) throws IOException {
        try (FileOutputStream output = new FileOutputStream(file, false)) {
            output.write(value);
            output.flush();
            output.getFD().sync();
        }
    }

    private static void publishAtomically(File pending, File destination) throws IOException {
        try {
            Files.move(pending.toPath(), destination.toPath(),
                    StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
        } catch (AtomicMoveNotSupportedException unsupported) {
            // Publishing through a copy/non-atomic fallback could expose a
            // truncated JSON file after power loss. Keep this playback on the
            // OEM source instead.
            throw new IOException("atomic_move_unsupported", unsupported);
        }
    }

    private static Result inspectCache(File file, String identity, JSONObject sourceRoot, JSONArray sourceEvents,
            long origin, long sourceSpan, float rate) {
        if (!file.isFile() || file.length() <= 0L
                || file.length() > MAX_FILE_BYTES * 2L) return null;
        try {
            JSONObject root = new JSONObject(new String(
                    readBytes(file, MAX_FILE_BYTES * 2L), StandardCharsets.UTF_8));
            JSONArray events = root.optJSONArray("events");
            if (events == null || events.length() != sourceEvents.length()) return null;
            if (!matchingPayload(sourceRoot, root, "events", "")) return null;
            long outputLastSample = origin;
            for (int index = 0; index < events.length(); index++) {
                JSONObject event = events.optJSONObject(index);
                if (event == null || !event.has("sampleEventTime")
                        || !event.has("downTime")
                        || event.getLong("sampleEventTime") < 0L
                        || event.getLong("downTime") < 0L) return null;
                JSONObject source = sourceEvents.getJSONObject(index);
                if (!matchingPayload(source, event, "sampleEventTime", "downTime")) return null;
                long expectedSample = ComboSpeedPolicy.scaleTimestamp(
                        source.getLong("sampleEventTime"), origin, rate);
                long expectedDown = ComboSpeedPolicy.scaleTimestamp(
                        source.getLong("downTime"), origin, rate);
                if (event.getLong("sampleEventTime") != expectedSample
                        || event.getLong("downTime") != expectedDown) return null;
                outputLastSample = Math.max(outputLastSample, expectedSample);
            }
            return Result.cacheHit(file.getAbsolutePath(), identity, events.length(),
                    sourceSpan, Math.max(0L, outputLastSample - origin));
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** A valid cache also preserves release actions, coordinates and OEM metadata. */
    private static boolean matchingPayload(JSONObject source, JSONObject cached,
            String ignoreFirst, String ignoreSecond) throws Exception {
        if (source.length() != cached.length()) return false;
        java.util.Iterator<String> keys = source.keys();
        while (keys.hasNext()) {
            String key = keys.next();
            if (!cached.has(key)) return false;
            if (!key.equals(ignoreFirst) && !key.equals(ignoreSecond)
                    && !sameJsonValue(source.get(key), cached.get(key))) return false;
        }
        return true;
    }

    private static boolean sameJsonValue(Object source, Object cached) throws Exception {
        if (source == cached) return true;
        if (source instanceof JSONObject && cached instanceof JSONObject)
            return matchingPayload((JSONObject) source, (JSONObject) cached, "", "");
        if (source instanceof JSONArray && cached instanceof JSONArray) {
            JSONArray a = (JSONArray) source, b = (JSONArray) cached;
            if (a.length() != b.length()) return false;
            for (int index = 0; index < a.length(); index++)
                if (!sameJsonValue(a.get(index), b.get(index))) return false;
            return true;
        }
        if (source instanceof Number && cached instanceof Number)
            return new java.math.BigDecimal(source.toString())
                    .compareTo(new java.math.BigDecimal(cached.toString())) == 0;
        return source != null && source.equals(cached);
    }

    /** Cache cleanup is intentionally worker-only and never runs in a playback Hook. */
    private static void cleanupWorkerSide(File directory, File keep) {
        File[] files = directory.listFiles();
        if (files == null) return;
        long now = System.currentTimeMillis();
        for (File file : files) {
            if (!file.isFile() || file.equals(keep)) continue;
            String name = file.getName();
            if (name.contains(".pending-") || name.startsWith("motion-v2-")
                    || (now - file.lastModified()) > 7L * 24L * 60L * 60L * 1000L) {
                file.delete();
            }
        }
        files = directory.listFiles((dir, name) -> name.startsWith(CACHE_FILE_PREFIX)
                && name.endsWith(".json"));
        if (files == null) return;
        Arrays.sort(files, Comparator.comparingLong(File::lastModified).reversed());
        int retained = keep.isFile() ? 1 : 0;
        long bytes = keep.isFile() ? keep.length() : 0;
        for (File file : files) {
            if (file.equals(keep)) continue;
            if (retained >= 32 || bytes + file.length() > 128L * 1024L * 1024L) file.delete();
            else { retained++; bytes += file.length(); }
        }
    }

    private static String sha256(byte[] value) throws Exception {
        return hex(MessageDigest.getInstance("SHA-256").digest(value));
    }

    private static String hex(byte[] digest) {
        StringBuilder out = new StringBuilder(digest.length * 2);
        for (byte item : digest) {
            int value = item & 0xff;
            if (value < 0x10) out.append('0');
            out.append(Integer.toHexString(value));
        }
        return out.toString();
    }

    static final class Request {
        final boolean valid;
        final String normalizedPath, contentDigest;
        final long size, modifiedAt;
        final float rate;
        private Request(String path, long size, long modified, String digest, float rate) {
            this.valid=true; this.normalizedPath=path; this.size=size;
            this.modifiedAt=modified; this.contentDigest=digest; this.rate=rate;
        }
        static Request capture(File directory, String path, float rate, long ignored) throws Exception {
            File source = new File(path).getCanonicalFile();
            if (!source.isFile() || source.length() <= 0 || source.length() > MAX_FILE_BYTES
                    || !ComboSpeedPolicy.isValidRate(rate)) throw new IOException("invalid_source");
            long size = source.length(), modified = source.lastModified();
            String digest = contentDigest(source, MAX_FILE_BYTES);
            if (source.length() != size || source.lastModified() != modified)
                throw new IOException("source_changed");
            return new Request(source.getPath(), size, modified, digest, rate);
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
        final String evidenceSource;
        final String error;

        private Result(boolean success, boolean cacheHit, String outputPath,
                String cacheIdentity, int eventCount, long sourceSpanMs,
                long outputSpanMs, String evidenceSource, String error) {
            this.success = success;
            this.cacheHit = cacheHit;
            this.outputPath = outputPath;
            this.cacheIdentity = cacheIdentity;
            this.eventCount = eventCount;
            this.sourceSpanMs = sourceSpanMs;
            this.outputSpanMs = outputSpanMs;
            this.evidenceSource = evidenceSource;
            this.error = error;
        }

        Result asPublishedHit() {
            return success ? new Result(true, true, outputPath, cacheIdentity,
                    eventCount, sourceSpanMs, outputSpanMs, "MEMORY_CACHE", "") : this;
        }

        static Result generated(String outputPath, String cacheIdentity, int eventCount,
                long sourceSpanMs, long outputSpanMs) {
            return new Result(true, false, outputPath, cacheIdentity, eventCount,
                    sourceSpanMs, outputSpanMs, "GENERATED", "");
        }

        static Result cacheHit(String outputPath, String cacheIdentity, int eventCount,
                long sourceSpanMs, long outputSpanMs) {
            return new Result(true, true, outputPath, cacheIdentity, eventCount,
                    sourceSpanMs, outputSpanMs, "DISK_CACHE_VERIFIED", "");
        }

        static Result failure(String error) {
            return new Result(false, false, "", "", 0, 0L, 0L, "UNKNOWN", error);
        }
    }
}
