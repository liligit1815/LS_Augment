package ls.augment.com;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** One bounded, in-memory copy of the Activity window behind a separate glass dialog. */
final class GlassWindowBackdrop {
    static final int MAX_PIXELS = 1024 * 1024;
    interface Result { void complete(Bitmap bitmap, String reason); }
    private final Activity activity;
    private final View owner;
    private final Handler main = new Handler(Looper.getMainLooper());
    private int request;
    private boolean pending;
    private final java.util.HashSet<String> diagnosticStates = new java.util.HashSet<>();
    private static final ThreadPoolExecutor WRITER = new ThreadPoolExecutor(0, 1, 20L, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(32), task -> {
                Thread thread = new Thread(task, "DuoGlassDiagnostics"); thread.setDaemon(true); return thread;
            }, new ThreadPoolExecutor.DiscardPolicy());

    GlassWindowBackdrop(Activity activity, View owner) { this.activity = activity; this.owner = owner; }
    boolean pending() { return pending; }
    // The native copy still owns its destination until callback. Do not start a second
    // allocation after cancellation while the first copy is in flight.
    void cancel() { ++request; }
    static boolean secure(Activity activity) {
        Window window = activity.getWindow();
        return window != null && (window.getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE) != 0;
    }

    /** TextureView's opaque software drawing cache is black on the target ROM. */
    static boolean needsWindow(View source, Rect area) {
        return inspect(source, area, 0, new int[]{0}) != 0;
    }

    private static int inspect(View view, Rect area, int depth, int[] visited) {
        // An unknown/overlarge tree must not silently take the unsafe software path.
        if (++visited[0] > 4096 || depth > 48) return 4;
        if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= .01f) return 0;
        Rect visible = new Rect();
        if (!view.getGlobalVisibleRect(visible) || !Rect.intersects(visible, area)) return 0;
        if (view instanceof TextureView) return 1;
        // A SurfaceView has a separate compositor layer; copying the Window cannot copy it.
        if (view instanceof SurfaceView) return 2;
        int found = 0;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                found |= inspect(group.getChildAt(i), area, depth + 1, visited);
                if ((found & 4) != 0) return found;
            }
        }
        return found;
    }

    private String unavailable(Window window) {
        if (activity.isDestroyed() || activity.isFinishing() || window == null) return "activity_unavailable";
        if ((window.getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE) != 0) return "secure_window";
        View decor = window.getDecorView();
        if (!owner.isAttachedToWindow() || !decor.isAttachedToWindow()) return "detached";
        // Capturing a window containing this lens would feed its previous frame into itself.
        if (owner.getRootView() == decor.getRootView()) return "same_window";
        if (!owner.isHardwareAccelerated() || !decor.isHardwareAccelerated()) return "no_hardware";
        if (owner.getWidth() <= 0 || owner.getHeight() <= 0 || decor.getWidth() <= 0 || decor.getHeight() <= 0)
            return "empty_geometry";
        return "";
    }

    void capture(int gutter, int background, Result result) {
        if (pending) return;
        Window window = activity.getWindow();
        String unavailable = unavailable(window);
        if (!unavailable.isEmpty()) { result.complete(null, unavailable); return; }
        final View decor = window.getDecorView();
        final int[] own = new int[2], origin = new int[2];
        owner.getLocationOnScreen(own); decor.getLocationOnScreen(origin);
        final int ownerWidth = owner.getWidth(), ownerHeight = owner.getHeight();
        int surfaces = inspect(activity.findViewById(android.R.id.content), new Rect(own[0] - gutter,
                own[1] - gutter, own[0] + ownerWidth + gutter, own[1] + ownerHeight + gutter), 0, new int[]{0});
        if ((surfaces & 6) != 0) { result.complete(null, (surfaces & 2) != 0 ? "separate_surface" : "tree_limit"); return; }
        final int decorWidth = decor.getWidth(), decorHeight = decor.getHeight();
        final int configuration = activity.getResources().getConfiguration().hashCode();
        final long fence = ResetWriteFence.generation();
        final Rect requested = new Rect(own[0] - origin[0] - gutter, own[1] - origin[1] - gutter,
                own[0] - origin[0] + ownerWidth + gutter, own[1] - origin[1] + ownerHeight + gutter);
        final int width = (requested.width() + 1) / 2, height = (requested.height() + 1) / 2;
        if (width <= 0 || height <= 0 || (long) width * height > MAX_PIXELS) {
            result.complete(null, "size_limit"); return;
        }
        final Rect crop = new Rect(requested);
        if (!crop.intersect(0, 0, decorWidth, decorHeight)) { result.complete(null, "outside_window"); return; }
        final int copiedWidth = Math.max(1, (int) Math.ceil(crop.width() * (double) width / requested.width()));
        final int copiedHeight = Math.max(1, (int) Math.ceil(crop.height() * (double) height / requested.height()));
        final int id = ++request;
        Bitmap copy = null;
        try {
            copy = Bitmap.createBitmap(copiedWidth, copiedHeight, Bitmap.Config.ARGB_8888);
            final Bitmap copied = copy;
            pending = true;
            PixelCopy.request(window, crop, copied, status -> {
                if (id != request) { pending = false; copied.recycle(); owner.invalidate(); return; }
                pending = false;
                int[] current = new int[2], currentOrigin = new int[2];
                owner.getLocationOnScreen(current); decor.getLocationOnScreen(currentOrigin);
                String reason = unavailable(window);
                if (activity.getWindow() != window || window.getDecorView() != decor
                        || ownerWidth != owner.getWidth() || ownerHeight != owner.getHeight()
                        || decorWidth != decor.getWidth() || decorHeight != decor.getHeight()
                        || own[0] != current[0] || own[1] != current[1]
                        || origin[0] != currentOrigin[0] || origin[1] != currentOrigin[1]
                        || configuration != activity.getResources().getConfiguration().hashCode()
                        || ResetWriteFence.stale(fence)) reason = "stale_geometry_or_owner";
                if (!reason.isEmpty() || status != PixelCopy.SUCCESS) {
                    copied.recycle(); result.complete(null, reason.isEmpty() ? copyFailure(status) : reason); return;
                }
                Bitmap complete = null;
                try {
                    // Keep gutters outside the source window themed; never stretch a clipped crop.
                    complete = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
                    complete.eraseColor(background);
                    Rect target = new Rect(
                            (int) Math.floor((crop.left - requested.left) * (double) width / requested.width()),
                            (int) Math.floor((crop.top - requested.top) * (double) height / requested.height()),
                            (int) Math.ceil((crop.right - requested.left) * (double) width / requested.width()),
                            (int) Math.ceil((crop.bottom - requested.top) * (double) height / requested.height()));
                    new Canvas(complete).drawBitmap(copied, null, target, new Paint(Paint.FILTER_BITMAP_FLAG));
                } catch (RuntimeException | OutOfMemoryError failure) {
                    if (!copied.isRecycled()) copied.recycle();
                    if (complete != null) complete.recycle();
                    result.complete(null, "compose_failed"); return;
                }
                copied.recycle();
                // Ownership passes exactly once. A consumer failure must not recycle an
                // already installed shader bitmap or invoke that consumer a second time.
                result.complete(complete, "ready");
            }, main);
        } catch (RuntimeException | OutOfMemoryError failure) {
            pending = false;
            if (copy != null) copy.recycle();
            result.complete(null, "request_failed");
        }
    }

    private static String copyFailure(int status) {
        switch (status) {
            case PixelCopy.ERROR_SOURCE_NO_DATA: return "source_no_data";
            case PixelCopy.ERROR_SOURCE_INVALID: return "source_invalid";
            case PixelCopy.ERROR_DESTINATION_INVALID: return "destination_invalid";
            case PixelCopy.ERROR_TIMEOUT: return "copy_timeout";
            default: return "copy_failed";
        }
    }

    void diagnostic(String source, String status, String reason) {
        String detail = "source=" + source + ";status=" + status + ";reason=" + reason;
        if (diagnosticStates.size() >= 12 || !diagnosticStates.add(detail)) return;
        try {
            Context context = activity.getApplicationContext();
            long fence = ResetWriteFence.generation();
            WRITER.execute(() -> AtomicWorkbenchDiagnostics.record(context, fence, "GLASS_BACKDROP", -1, -1,
                    "", -1, detail, null));
        } catch (RuntimeException | OutOfMemoryError ignored) { }
    }
}
