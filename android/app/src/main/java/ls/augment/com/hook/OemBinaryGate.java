package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.io.File;
import java.io.FileInputStream;
import java.security.MessageDigest;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/** Exact binary verification on a worker; hooks only consume a published memory verdict. */
final class OemBinaryGate {
    private static final long REFRESH_MS = 30_000L, VALID_MS = 60_000L;
    private static final ConcurrentHashMap<String, Entry> ENTRIES = new ConcurrentHashMap<>();
    private static final ScheduledExecutorService WORKER = Executors.newSingleThreadScheduledExecutor(r -> {
        Thread thread = new Thread(r, "LSA-OemBinaryCheck");
        thread.setDaemon(true);
        return thread;
    });
    private OemBinaryGate() { }

    /** Start before the first user interaction, even if Application is not attached yet. */
    static void prepare(String pkg, long version, String expected) { entry(null, pkg, version, expected); }

    static boolean matches(Context context, String pkg, long version, String expected) {
        if (context == null) return false;
        Entry entry = entry(context, pkg, version, expected);
        Verdict value = entry.verdict;
        if (SystemClock.elapsedRealtime() >= value.expiresAt) entry.request();
        return value.allowed && SystemClock.elapsedRealtime() < value.expiresAt;
    }

    static void addListener(Context context, String pkg, long version, String expected, Runnable listener) {
        Entry entry = entry(context, pkg, version, expected);
        if (entry.listeners.addIfAbsent(listener) && entry.verdict.checked) entry.dispatch(listener);
    }

    static void removeListener(String pkg, long version, String expected, Runnable listener) {
        Entry entry = ENTRIES.get(key(pkg, version, expected));
        if (entry != null) entry.listeners.remove(listener);
    }

    private static Entry entry(Context context, String pkg, long version, String expected) {
        Entry entry = ENTRIES.computeIfAbsent(key(pkg, version, expected), ignored -> new Entry(pkg, version, expected));
        if (context != null) entry.remember(context);
        if (entry.started.compareAndSet(false, true))
            WORKER.scheduleWithFixedDelay(entry::request, 0, REFRESH_MS, TimeUnit.MILLISECONDS);
        return entry;
    }

    private static String key(String pkg, long version, String expected) { return pkg + ':' + version + ':' + expected; }

    private static final class Verdict {
        static final Verdict UNKNOWN = new Verdict(false, false, 0);
        final boolean allowed, checked;
        final long expiresAt;
        Verdict(boolean allowed, boolean checked, long expiresAt) {
            this.allowed = allowed; this.checked = checked; this.expiresAt = expiresAt;
        }
    }

    private static final class Entry {
        final String pkg, expected;
        final long version;
        final AtomicBoolean started = new AtomicBoolean(), pending = new AtomicBoolean();
        final CopyOnWriteArrayList<Runnable> listeners = new CopyOnWriteArrayList<>();
        final Object publication = new Object();
        volatile Context context;
        volatile Verdict verdict = Verdict.UNKNOWN;
        long generation;
        // Only the verification worker accesses the fingerprint and receiver state.
        Stamp verifiedStamp;
        boolean verifiedMatch, observing;
        long verifiedGeneration = -1;
        int contextAttempts;
        Entry(String pkg, long version, String expected) { this.pkg = pkg; this.version = version; this.expected = expected; }

        void remember(Context value) {
            Context app = value.getApplicationContext();
            context = app == null ? value : app;
        }

        void request() { if (pending.compareAndSet(false, true)) WORKER.execute(this::refresh); }

        void invalidate() {
            boolean changed;
            synchronized (publication) {
                generation++;
                changed = verdict.checked;
                verdict = Verdict.UNKNOWN;
            }
            if (changed) notifyListeners();
            request();
        }

        void refresh() {
            long observed;
            synchronized (publication) { observed = generation; }
            try {
                Context app = context;
                if (app == null) {
                    app = FeatureSettings.from(null);
                    if (app != null && pkg.equals(app.getPackageName())) remember(app);
                    else {
                        if (contextAttempts++ < 30) WORKER.schedule(this::request, 1000L, TimeUnit.MILLISECONDS);
                        return;
                    }
                }
                app = context;
                observe(app);
                Stamp current = Stamp.read(app, pkg);
                boolean allowed = false;
                if (current.version == version) {
                    if (current.equals(verifiedStamp) && observed == verifiedGeneration) allowed = verifiedMatch;
                    else {
                        String digest = digest(current.path);
                        // Never publish a digest for a file/package that changed while being read.
                        Stamp after = Stamp.read(app, pkg);
                        if (!current.equals(after)) throw new IllegalStateException("binary_changed_during_verification");
                        allowed = expected.equals(digest);
                    }
                }
                verifiedStamp = current;
                verifiedGeneration = observed;
                verifiedMatch = allowed;
                publish(observed, allowed);
            } catch (Exception unavailable) {
                // Failure/unknown is conservative; no saved boolean can replace the binary check.
                verifiedStamp = null;
                publish(observed, false);
            } finally {
                pending.set(false);
                boolean invalidated;
                synchronized (publication) { invalidated = observed != generation; }
                if (invalidated) request();
            }
        }

        void publish(long observed, boolean allowed) {
            boolean changed;
            synchronized (publication) {
                if (observed != generation) return;
                Verdict old = verdict;
                verdict = new Verdict(allowed, true, SystemClock.elapsedRealtime() + VALID_MS);
                changed = !old.checked || old.allowed != allowed;
            }
            if (changed) notifyListeners();
        }

        void observe(Context app) {
            if (observing) return;
            IntentFilter filter = new IntentFilter();
            filter.addAction(Intent.ACTION_PACKAGE_ADDED);
            filter.addAction(Intent.ACTION_PACKAGE_REMOVED);
            filter.addAction(Intent.ACTION_PACKAGE_REPLACED);
            filter.addAction(Intent.ACTION_PACKAGE_CHANGED);
            filter.addDataScheme("package");
            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override public void onReceive(Context c, Intent intent) {
                    if (intent != null && intent.getData() != null
                            && pkg.equals(intent.getData().getSchemeSpecificPart())) invalidate();
                }
            };
            // The process-lifetime gate is not hot reloadable. Package broadcasts revoke
            // its positive verdict immediately; periodic checks recover missed broadcasts.
            if (Build.VERSION.SDK_INT >= 33) app.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
            else app.registerReceiver(receiver, filter);
            observing = true;
        }

        void notifyListeners() { for (Runnable listener : listeners) dispatch(listener); }
        void dispatch(Runnable listener) {
            Looper main = Looper.getMainLooper();
            if (main == null) return;
            new Handler(main).post(() -> {
                if (!listeners.contains(listener)) return;
                try { listener.run(); } catch (RuntimeException ignored) { }
            });
        }
    }

    private static String digest(String path) throws Exception {
        MessageDigest hash = MessageDigest.getInstance("SHA-256");
        byte[] buffer = new byte[65536];
        try (FileInputStream input = new FileInputStream(path)) {
            int count;
            while ((count = input.read(buffer)) != -1) hash.update(buffer, 0, count);
        }
        StringBuilder value = new StringBuilder();
        for (byte b : hash.digest()) value.append(Character.forDigit((b & 255) >>> 4, 16))
                .append(Character.forDigit(b & 15, 16));
        return value.toString();
    }

    private static final class Stamp {
        final String path;
        final long version, size, modified;
        Stamp(String path, long version, long size, long modified) {
            this.path = path; this.version = version; this.size = size; this.modified = modified;
        }
        static Stamp read(Context app, String pkg) throws Exception {
            PackageInfo info = app.getPackageManager().getPackageInfo(pkg, 0);
            if (info.applicationInfo == null) throw new IllegalStateException("application_info_missing");
            File apk = new File(info.applicationInfo.sourceDir);
            if (!apk.isFile()) throw new IllegalStateException("apk_missing");
            return new Stamp(apk.getCanonicalPath(), info.getLongVersionCode(), apk.length(), apk.lastModified());
        }
        @Override public boolean equals(Object other) {
            if (!(other instanceof Stamp)) return false;
            Stamp value = (Stamp) other;
            return path.equals(value.path) && version == value.version && size == value.size && modified == value.modified;
        }
        @Override public int hashCode() { return Objects.hash(path, version, size, modified); }
    }
}
