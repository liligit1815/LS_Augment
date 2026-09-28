package ls.augment.com.hook;

import android.graphics.Rect;
import android.view.View;
import java.util.IdentityHashMap;
import java.util.Map;

/** Explicit render-node clips are independent of ViewGroup.clipChildren. */
final class StatusBarClipping {
    private final Map<View, Saved> saved = new IdentityHashMap<>();
    private long boundsReleases, outlineReleases;

    void release(View view) {
        Rect bounds = view.getClipBounds();
        boolean outline = view.getClipToOutline();
        Saved state = saved.get(view);
        if (state == null) {
            if (bounds == null && !outline) return;
            state = new Saved();
            saved.put(view, state);
        }
        // Remember newer OEM animation clips instead of restoring a stale rectangle.
        if (bounds != null) state.bounds = new Rect(bounds);
        if (outline) state.outline = true;
        if (bounds != null) { view.setClipBounds(null); boundsReleases++; }
        if (outline) { view.setClipToOutline(false); outlineReleases++; }
    }

    String summary() { return "bounds=" + boundsReleases + ",outlines=" + outlineReleases; }

    void restore() {
        for (Map.Entry<View, Saved> entry : saved.entrySet()) {
            View view = entry.getKey();
            Saved state = entry.getValue();
            // A subsequent native write takes precedence over our last write.
            if (view.getClipBounds() == null) view.setClipBounds(state.bounds);
            if (!view.getClipToOutline()) view.setClipToOutline(state.outline);
        }
        saved.clear();
    }

    private static final class Saved { Rect bounds; boolean outline; }
}
