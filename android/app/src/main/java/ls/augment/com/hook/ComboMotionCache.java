package ls.augment.com.hook;

import java.io.File;
import java.util.Objects;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.function.Supplier;

/** Single-worker cache coordinator; playback callers only consume published files. */
final class ComboMotionCache {
    static final long MAX_COLD_WAIT_MS = 200L;
    private static final long PUBLISHED_TTL_NANOS = TimeUnit.HOURS.toNanos(6L);
    private static final int MAX_PUBLISHED_ENTRIES = 24;

    private final ConcurrentHashMap<String, CompletableFuture<ComboMotionFileScaler.Result>> jobs =
            new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, Published> published = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, Long> generations = new ConcurrentHashMap<>();
    private final ThreadPoolExecutor worker = new ThreadPoolExecutor(
            1, 1, 30L, TimeUnit.SECONDS, new LinkedBlockingQueue<>(32),
            new CacheThreadFactory(), new ThreadPoolExecutor.AbortPolicy());

    ComboMotionCache() {
        worker.allowCoreThreadTimeOut(true);
    }

    void prepare(File cacheDir, String sourcePath, float rate, boolean invalidate) {
        String alias = Request.alias(sourcePath, rate);
        if (alias.isEmpty() || cacheDir == null || !ComboSpeedPolicy.isValidRate(rate)) return;
        long generation = generations.getOrDefault(alias, 0L);
        if (invalidate) {
            generation = generations.merge(alias, 1L, Long::sum);
            published.remove(alias);
        }
        schedule(cacheDir, sourcePath, rate, alias, generation);
    }

    /** Even resolving Android's cache directory may touch disk, so do that on the worker. */
    CompletableFuture<ComboMotionFileScaler.Result> prepareAsync(
            Supplier<File> cacheDirectory, String sourcePath, float rate) {
        CompletableFuture<ComboMotionFileScaler.Result> result = new CompletableFuture<>();
        try {
            worker.execute(() -> {
                try {
                    prepareAsync(cacheDirectory.get(), sourcePath, rate)
                            .whenComplete((ready, error) -> result.complete(error == null
                                    ? ready : ComboMotionFileScaler.Result.failure("cache_worker_failed")));
                } catch (Throwable error) {
                    result.complete(ComboMotionFileScaler.Result.failure("cache_worker_failed"));
                }
            });
        } catch (RejectedExecutionException rejected) {
            result.complete(ComboMotionFileScaler.Result.failure("queue_full"));
        }
        return result;
    }

    private CompletableFuture<ComboMotionFileScaler.Result> prepareAsync(
            File cacheDir, String sourcePath, float rate) {
        String alias = Request.alias(sourcePath, rate);
        if (alias.isEmpty() || cacheDir == null || !ComboSpeedPolicy.isValidRate(rate)) {
            return CompletableFuture.completedFuture(
                    ComboMotionFileScaler.Result.failure("invalid_request"));
        }
        long generation = generations.getOrDefault(alias, 0L);
        CompletableFuture<ComboMotionFileScaler.Result> future =
                schedule(cacheDir, sourcePath, rate, alias, generation);
        if (future == null) return CompletableFuture.completedFuture(
                ComboMotionFileScaler.Result.failure("queue_full"));
        return future.thenApply(result -> generations.getOrDefault(alias, 0L) == generation
                ? result : ComboMotionFileScaler.Result.failure("cache_invalidated"));
    }

    ComboMotionFileScaler.Result lookupPublished(String sourcePath, float rate) {
        String alias = Request.alias(sourcePath, rate);
        if (alias.isEmpty()) return ComboMotionFileScaler.Result.failure("invalid_request");
        long generation = generations.getOrDefault(alias, 0L);
        Published hot = published.get(alias);
        if (hot != null && hot.request.generation == generation && hot.isFresh()) {
            return hot.result.asPublishedHit();
        }
        if (hot != null) published.remove(alias, hot);
        return ComboMotionFileScaler.Result.failure("cold_cache");
    }

    void post(Runnable task) {
        if (task == null) return;
        try {
            worker.execute(() -> {
                try { task.run(); } catch (Throwable ignored) { }
            });
        } catch (RejectedExecutionException ignored) {
            // Diagnostics and cleanup are optional; playback must remain OEM-safe.
        }
    }

    ComboMotionFileScaler.Result lookupOrSchedule(File cacheDir, String sourcePath,
            float rate, boolean mayWait) {
        final long startedAt = System.nanoTime();
        String alias = Request.alias(sourcePath, rate);
        if (alias.isEmpty() || cacheDir == null || !ComboSpeedPolicy.isValidRate(rate)) {
            return ComboMotionFileScaler.Result.failure("invalid_request");
        }
        long generation = generations.getOrDefault(alias, 0L);
        Published hot = published.get(alias);
        if (!mayWait && hot != null && hot.request.generation == generation && hot.isFresh()) {
            return hot.result.asPublishedHit();
        }
        if (hot != null && (!hot.isFresh() || hot.request.generation != generation)) {
            published.remove(alias, hot);
        }

        // A playback call on the main thread performs no path canonicalization,
        // stat or content read. The caller may defer its OEM notification until
        // preparation completes, or retain its original source on failure.
        if (!mayWait) {
            prepare(cacheDir, sourcePath, rate, false);
            return ComboMotionFileScaler.Result.failure("cold_cache");
        }

        CompletableFuture<ComboMotionFileScaler.Result> future =
                schedule(cacheDir, sourcePath, rate, alias, generation);
        if (future == null) return ComboMotionFileScaler.Result.failure("queue_full");
        try {
            long elapsedNanos = System.nanoTime() - startedAt;
            long remainingNanos = TimeUnit.MILLISECONDS.toNanos(MAX_COLD_WAIT_MS) - elapsedNanos;
            if (remainingNanos <= 0L) {
                return ComboMotionFileScaler.Result.failure("cold_cache_timeout");
            }
            ComboMotionFileScaler.Result result = future.get(remainingNanos, TimeUnit.NANOSECONDS);
            if (generations.getOrDefault(alias, 0L) != generation) {
                return ComboMotionFileScaler.Result.failure("cache_invalidated");
            }
            return result.success ? result : ComboMotionFileScaler.Result.failure(result.error);
        } catch (TimeoutException timeout) {
            return ComboMotionFileScaler.Result.failure("cold_cache_timeout");
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            return ComboMotionFileScaler.Result.failure("cold_cache_interrupted");
        } catch (ExecutionException failed) {
            return ComboMotionFileScaler.Result.failure("cache_worker_failed");
        }
    }

    /**
     * Capture, hash, parse, scale, sync, cleanup and publication all execute on
     * the same worker. Callers only enqueue and optionally wait for the part of
     * the fixed 200 ms budget that remains after entering lookupOrSchedule.
     */
    private CompletableFuture<ComboMotionFileScaler.Result> schedule(File cacheDir,
            String sourcePath, float rate, String alias, long generation) {
        String key = alias + '\u0000' + cacheDir.getAbsolutePath() + '\u0000' + generation;
        CompletableFuture<ComboMotionFileScaler.Result> existing = jobs.get(key);
        if (existing != null) return existing;
        CompletableFuture<ComboMotionFileScaler.Result> created = new CompletableFuture<>();
        existing = jobs.putIfAbsent(key, created);
        if (existing != null) return existing;
        try {
            worker.execute(() -> {
                ComboMotionFileScaler.Result result;
                try {
                    if (generations.getOrDefault(alias, 0L) != generation) {
                        result = ComboMotionFileScaler.Result.failure("cache_invalidated");
                    } else {
                        Request request = Request.capture(
                                cacheDir, sourcePath, rate, generation);
                        if (!request.valid) {
                            result = ComboMotionFileScaler.Result.failure(request.error);
                        } else {
                            Published ready = published.get(alias);
                            if (ready != null && ready.isFresh()
                                    && ready.request.equals(request)) {
                                result = ready.result.asPublishedHit();
                            } else {
                                if (ready != null) published.remove(alias, ready);
                                result = ComboMotionFileScaler.scale(cacheDir, request);
                                long currentGeneration = generations.getOrDefault(alias, 0L);
                                if (result.success && currentGeneration == generation) {
                                    published.put(alias, new Published(request, result));
                                    trimPublished(alias);
                                } else if (result.success) {
                                    result = ComboMotionFileScaler.Result.failure(
                                            "cache_invalidated");
                                }
                            }
                        }
                    }
                } catch (Throwable error) {
                    result = ComboMotionFileScaler.Result.failure(
                            error.getClass().getSimpleName());
                }
                created.complete(result);
                jobs.remove(key, created);
            });
            return created;
        } catch (RejectedExecutionException rejected) {
            jobs.remove(key, created);
            created.complete(ComboMotionFileScaler.Result.failure("queue_full"));
            return null;
        }
    }

    private void trimPublished(String keepAlias) {
        if (published.size() <= MAX_PUBLISHED_ENTRIES) return;
        for (String alias : published.keySet()) {
            if (published.size() <= MAX_PUBLISHED_ENTRIES) return;
            if (!alias.equals(keepAlias)) published.remove(alias);
        }
    }

    static final class Request {
        final boolean valid;
        final String error;
        final String cachePath;
        final String normalizedPath;
        final long size;
        final long modifiedAt;
        final String contentDigest;
        final float rate;
        final String logicalKey;
        final String inputAlias;
        final long generation;

        private Request(boolean valid, String error, String cachePath,
                String normalizedPath, long size, long modifiedAt, String contentDigest, float rate,
                String inputAlias, long generation) {
            this.valid = valid;
            this.error = error;
            this.cachePath = cachePath;
            this.normalizedPath = normalizedPath;
            this.size = size;
            this.modifiedAt = modifiedAt;
            this.contentDigest = contentDigest;
            this.rate = rate;
            this.logicalKey = ComboMotionFileScaler.ALGORITHM_VERSION + '\u0000'
                    + normalizedPath + '\u0000' + size + '\u0000' + modifiedAt + '\u0000'
                    + contentDigest + '\u0000' + Math.round(rate);
            this.inputAlias = inputAlias;
            this.generation = generation;
        }

        static Request capture(File cacheDir, String sourcePath, float rate, long generation) {
            if (cacheDir == null || sourcePath == null || sourcePath.trim().isEmpty()) {
                return invalid("missing_path", generation);
            }
            if (!ComboSpeedPolicy.isValidRate(rate)) return invalid("invalid_rate", generation);
            try {
                File source = new File(sourcePath).getCanonicalFile();
                long size = source.length();
                if (!source.isFile()) return invalid("source_missing", generation);
                if (size <= 0L || size > ComboMotionFileScaler.MAX_FILE_BYTES) {
                    return invalid("source_size_" + size, generation);
                }
                long modifiedAt = source.lastModified();
                String contentDigest = ComboMotionFileScaler.contentDigest(
                        source, ComboMotionFileScaler.MAX_FILE_BYTES);
                if (source.length() != size || source.lastModified() != modifiedAt) {
                    return invalid("source_changed_during_fingerprint", generation);
                }
                return new Request(true, "", cacheDir.getCanonicalPath(),
                        source.getPath(), size, modifiedAt, contentDigest, rate,
                        alias(sourcePath, rate), generation);
            } catch (Throwable error) {
                return invalid(error.getClass().getSimpleName(), generation);
            }
        }

        static String alias(String sourcePath, float rate) {
            if (sourcePath == null || sourcePath.trim().isEmpty()
                    || !ComboSpeedPolicy.isValidRate(rate)) return "";
            try {
                String path = new File(sourcePath.trim()).getAbsoluteFile()
                        .toPath().normalize().toString();
                return path + '\u0000' + Math.round(rate);
            } catch (Throwable ignored) {
                return "";
            }
        }

        private static Request invalid(String error, long generation) {
            return new Request(false, error, "", "", -1L, -1L, "", 1f,
                    "", generation);
        }

        Request withGeneration(long value) {
            return new Request(valid, error, cachePath, normalizedPath,
                    size, modifiedAt, contentDigest, rate, inputAlias, value);
        }

        boolean sameSourceVersion(Request other) {
            return other != null && valid && other.valid && size == other.size
                    && modifiedAt == other.modifiedAt && Float.compare(rate, other.rate) == 0
                    && cachePath.equals(other.cachePath)
                    && normalizedPath.equals(other.normalizedPath)
                    && contentDigest.equals(other.contentDigest);
        }

        @Override public boolean equals(Object other) {
            if (!(other instanceof Request)) return false;
            Request value = (Request) other;
            return valid == value.valid && size == value.size && modifiedAt == value.modifiedAt
                    && generation == value.generation
                    && Float.compare(rate, value.rate) == 0
                    && cachePath.equals(value.cachePath)
                    && normalizedPath.equals(value.normalizedPath)
                    && contentDigest.equals(value.contentDigest);
        }

        @Override public int hashCode() {
            return Objects.hash(valid, cachePath, normalizedPath, size, modifiedAt,
                    contentDigest, rate, generation);
        }
    }

    private static final class Published {
        final Request request;
        final ComboMotionFileScaler.Result result;
        final long publishedAtNanos;
        Published(Request request, ComboMotionFileScaler.Result result) {
            this.request = request;
            this.result = result;
            this.publishedAtNanos = System.nanoTime();
        }

        boolean isFresh() {
            long age = System.nanoTime() - publishedAtNanos;
            return age >= 0L && age <= PUBLISHED_TTL_NANOS;
        }
    }

    private static final class CacheThreadFactory implements ThreadFactory {
        @Override public Thread newThread(Runnable runnable) {
            Thread thread = new Thread(runnable, "LSA-ComboCache");
            thread.setDaemon(true);
            thread.setPriority(Thread.NORM_PRIORITY - 1);
            return thread;
        }
    }
}
