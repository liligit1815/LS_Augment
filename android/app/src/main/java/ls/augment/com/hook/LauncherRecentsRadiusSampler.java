package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import ls.augment.com.BuildConfig;
import ls.augment.com.RecentsCardRadiusRange;

/** Reports native geometry on the phone; never changes saved offsets or rendering. */
final class LauncherRecentsRadiusSampler {
    private static final long SETTLE_MS = 180L, CANDIDATE_AGE_MS = 2_000L;
    private final Method owner, containers, snapshot, rotation;
    private final Field overview;
    private Method modernOutline;
    private final Map<View, Candidate> candidates = new WeakHashMap<>();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable publish = this::publishSafely;
    private boolean queued;
    private long launcherVersion = -1L;
    private LauncherRecentsRadiusPublisher publisher;

    LauncherRecentsRadiusSampler(Method owner, Method containers, Method snapshot)
            throws ReflectiveOperationException {
        this.owner = owner;
        this.containers = containers;
        this.snapshot = snapshot;
        Class<?> recents = owner.getReturnType();
        overview = HookCompatibility.field(recents, boolean.class, false, "mOverviewStateEnabled");
        rotation = HookCompatibility.method(recents, int.class, false, new String[]{"getCurRotation"});
    }

    void observe(View task, float nativeRadius, float progress, float recentsScale, float taskScale) {
        // Sampler compatibility/metadata failure cannot affect the feature hook.
        try {
            if (task == null || progress != 0f) { candidates.remove(task); return; }
            long now = SystemClock.elapsedRealtime();
            Candidate candidate = candidates.get(task);
            if (candidate == null || !candidate.sameNative(nativeRadius, recentsScale, taskScale)) {
                candidate = new Candidate(nativeRadius, recentsScale, taskScale, now);
                candidates.put(task, candidate);
            }
            candidate.observedAt = now;
            // OEM can calculate p=0 BEFORE it enables overview or attaches the
            // card. Keep native numbers, then inspect the real view after entry.
            updateMeasurement(task, candidate, now);
            schedule(SETTLE_MS);
        } catch (Exception | LinkageError unavailable) {
            candidates.remove(task);
        }
    }

    private void schedule(long delay) {
        if (!queued) { queued = true; main.postDelayed(publish, delay); }
    }

    private void updateMeasurement(View task, Candidate candidate, long now) throws Exception {
        Sample sample = measure(task, candidate, now);
        if (sample == null) { candidate.measured = null; return; }
        if (candidate.measured == null || !sample.sameGeometry(candidate.measured)) candidate.stableSince = now;
        candidate.measured = sample;
    }

    private Sample measure(View task, Candidate candidate, long now) throws Exception {
            if (!visible(task)) return null;
            Object recents = owner.invoke(task);
            if (!(recents instanceof View) || !visible((View) recents) || !overview.getBoolean(recents)) return null;
            float shortSide = Float.POSITIVE_INFINITY;
            double area = 0d;
            Rect visible = new Rect();
            for (Object container : (List<?>) containers.invoke(task)) {
                View image = (View) snapshot.invoke(container);
                if (image == null || image.getWidth() <= 0 || image.getHeight() <= 0) continue;
                if (!Float.isFinite(image.getScaleX()) || image.getScaleX() <= 0f
                        || !Float.isFinite(image.getScaleY()) || image.getScaleY() <= 0f) return null;
                float effectiveShortSide = Math.min(image.getWidth(), image.getHeight());
                if (image.getClass().getName().equals("com.android.quickstep.task.thumbnail.TaskThumbnailView")) {
                    // New ThumbnailView divides R by its own X/Y scale before
                    // Path.addRoundRect. Its outline may saturate before the
                    // module's local view-size cap, including custom bounds.
                    if (modernOutline == null) modernOutline = HookCompatibility.method(image.getClass(),
                            Rect.class, false, new String[]{"getOutlineBounds"});
                    Rect outline = (Rect) modernOutline.invoke(image);
                    float width = outline == null ? image.getWidth() : outline.width();
                    float height = outline == null ? image.getHeight() : outline.height();
                    if (width <= 0f || height <= 0f) return null;
                    effectiveShortSide = Math.min(effectiveShortSide,
                            Math.min(width * image.getScaleX(), height * image.getScaleY()));
                }
                shortSide = Math.min(shortSide, effectiveShortSide);
                if (!visible(image) || !image.getGlobalVisibleRect(visible)) continue;
                // Bound the visible bounding box by transformed rectangle area;
                // a rotated/shrunken back card must not win via its bounding box.
                double scale = (double) candidate.recentsScale * candidate.taskScale * image.getScaleX();
                double otherScale = (double) candidate.recentsScale * candidate.taskScale * image.getScaleY();
                area += Math.min((double) visible.width() * visible.height(),
                        image.getWidth() * (double) image.getHeight() * Math.abs(scale * otherScale));
            }
            Context context = task.getContext();
            DisplayMetrics metrics = context.getResources().getDisplayMetrics();
            RecentsCardRadiusRange range = RecentsCardRadiusRange.fromGeometry(candidate.nativeRadius,
                    metrics.density, candidate.recentsScale, candidate.taskScale, shortSide);
            Display display = task.getDisplay();
            if (range == null || !Double.isFinite(area) || area <= 0d || display == null) {
                return null;
            }
            DisplayMetrics real = new DisplayMetrics();
            display.getRealMetrics(real);
            int direction = (Integer) rotation.invoke(recents);
            if (direction < 0 || direction > 3 || metrics.densityDpi <= 0
                    || real.widthPixels <= 0 || real.heightPixels <= 0) return null;
            if (launcherVersion < 0L)
                launcherVersion = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).getLongVersionCode();
            if (launcherVersion <= 0L) return null;
            return new Sample(range, area, metrics.densityDpi, real.widthPixels,
                    real.heightPixels, direction, candidate.observedAt);
    }

    private void publishSafely() {
        queued = false;
        try {
            long now = SystemClock.elapsedRealtime();
            Sample best = null;
            View selected = null;
            long stableSince = 0L;
            boolean pending = false;
            for (Map.Entry<View, Candidate> entry : new ArrayList<>(candidates.entrySet())) {
                View task = entry.getKey();
                Candidate candidate = entry.getValue();
                if (task == null || now < candidate.observedAt || now - candidate.observedAt > CANDIDATE_AGE_MS) continue;
                updateMeasurement(task, candidate, now);
                Sample sample = candidate.measured;
                if (sample == null) { pending = true; continue; }
                if (best == null || sample.area > best.area) {
                    best = sample; selected = task; stableSince = candidate.stableSince;
                }
            }
            if (best == null) { if (pending) schedule(SETTLE_MS); return; }
            long remaining = SETTLE_MS - (now - stableSince);
            if (remaining > 0L) { schedule(remaining); return; }
            String geometry = best.geometry();
            if (publisher == null) publisher = new LauncherRecentsRadiusPublisher(selected.getContext());
            // Successful-delivery deduplication belongs to the background
            // publisher: failed delivery must not suppress later observations.
            publisher.publish(launcherVersion + "," + best.rangeIdentity(),
                    "{\"schema\":2,\"build\":" + BuildConfig.VERSION_CODE + ",\"pid\":" + Process.myPid()
                            + ",\"launcherVersion\":" + launcherVersion + "," + geometry
                            + ",\"observedElapsed\":" + best.observedAt + "}");
        } catch (Exception | LinkageError unavailable) {
            // Absence stays absence; no guessed range is published on failure.
        }
    }

    private static final class Candidate {
        final float nativeRadius, recentsScale, taskScale;
        long observedAt, stableSince;
        Sample measured;

        Candidate(float radius, float recentsScale, float taskScale, long now) {
            nativeRadius = radius; this.recentsScale = recentsScale; this.taskScale = taskScale;
            observedAt = now; stableSince = now;
        }

        boolean sameNative(float radius, float recentsScale, float taskScale) {
            return nativeRadius == radius && this.recentsScale == recentsScale && this.taskScale == taskScale;
        }
    }

    private static boolean visible(View view) {
        return view != null && view.isAttachedToWindow() && view.isShown()
                && view.getWindowVisibility() == View.VISIBLE && view.getAlpha() > .01f;
    }

    private static final class Sample {
        final RecentsCardRadiusRange range;
        final double area;
        final int densityDpi, width, height, rotation;
        final long observedAt;

        Sample(RecentsCardRadiusRange range, double area, int density, int width, int height, int rotation, long now) {
            this.range = range; this.area = area; densityDpi = density;
            this.width = width; this.height = height; this.rotation = rotation;
            observedAt = now;
        }

        boolean sameGeometry(Sample other) {
            return densityDpi == other.densityDpi && width == other.width && height == other.height
                    && rotation == other.rotation && range.minOffsetDp == other.range.minOffsetDp
                    && range.maxOffsetDp == other.range.maxOffsetDp
                    && Math.abs(range.nativeRadiusDp - other.range.nativeRadiusDp) < .001d
                    && Math.abs(range.maxRadiusDp - other.range.maxRadiusDp) < .001d
                    && Math.abs(area - other.area) < 1d;
        }

        String geometry() {
            return "\"densityDpi\":" + densityDpi + ",\"displayWidthPx\":" + width
                    + ",\"displayHeightPx\":" + height + ",\"rotation\":" + rotation
                    + ",\"minOffsetDp\":" + range.minOffsetDp + ",\"maxOffsetDp\":" + range.maxOffsetDp
                    + ",\"nativeRadiusDp\":" + range.nativeRadiusDp + ",\"maxRadiusDp\":" + range.maxRadiusDp;
        }

        String rangeIdentity() {
            // Native layout can produce slightly different floating-point
            // radii for the same slider endpoints. Only a usable range or its
            // display environment change needs another persisted observation.
            return densityDpi + "," + width + "," + height + "," + rotation
                    + "," + range.minOffsetDp + "," + range.maxOffsetDp;
        }
    }
}
