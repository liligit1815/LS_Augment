package ls.augment.com.hook;

import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.text.Layout;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

/** Drawing bounds in local coordinates, excluding a container's empty allocation. */
final class StatusBarContentBounds {
    private StatusBarContentBounds() { }

    static float wifiSignalHeight(View view) {
        // Resolve within this icon only: another Wi-Fi view can coexist in a header.
        if (!(view instanceof ViewGroup)) return 0;
        View signal = wifiSignal(view);
        if (!(signal instanceof ImageView)) return 0;
        RectF bounds = new RectF(of(signal));
        if (bounds.isEmpty()) return 0;
        for (View child = signal; child != view;) {
            child.getMatrix().mapRect(bounds);
            if (!(child.getParent() instanceof View)) return 0;
            child = (View) child.getParent();
        }
        return bounds.bottom - bounds.top;
    }

    private static View wifiSignal(View view) {
        try {
            if ("wifi_signal".equals(view.getResources().getResourceEntryName(view.getId()))) return view;
        } catch (android.content.res.Resources.NotFoundException ignored) { }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = wifiSignal(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    static Rect of(View view) {
        RectF bounds = new RectF();
        Rect stacked = RedMagicSystemUiHook.stackedSignalBounds(view);
        if (stacked != null) bounds.set(stacked);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child.getVisibility() != View.VISIBLE || child.getAlpha() == 0
                        || child.getTransitionAlpha() == 0
                        || RedMagicSystemUiHook.isCollapsedSignal(child)) continue;
                RectF part = new RectF(of(child));
                child.getMatrix().mapRect(part);
                part.offset(child.getLeft() - view.getScrollX(), child.getTop() - view.getScrollY());
                bounds.union(part);
            }
        } else if (view instanceof ImageView) {
            ImageView image = (ImageView) view;
            Drawable drawable = image.getDrawable();
            if (drawable != null && !drawable.getBounds().isEmpty()) {
                bounds.set(drawable.getBounds());
                image.getImageMatrix().mapRect(bounds);
                bounds.offset(view.getPaddingLeft(), view.getPaddingTop());
            }
        } else if (view instanceof TextView) {
            TextView text = (TextView) view;
            Layout layout = text.getLayout();
            if (layout != null && text.length() > 0) {
                for (int i = 0; i < layout.getLineCount(); i++) {
                    bounds.union(layout.getLineLeft(i), layout.getLineTop(i),
                            layout.getLineRight(i), layout.getLineBottom(i));
                }
                bounds.offset(text.getTotalPaddingLeft() - view.getScrollX(),
                        text.getTotalPaddingTop() - view.getScrollY());
            }
        }
        // A visible wrapper can contain only GONE/transparent children after
        // Wi-Fi is disabled. Its empty allocation must not become an icon.
        if (bounds.isEmpty() && !(view instanceof ViewGroup)
                && !(view instanceof ImageView) && !(view instanceof TextView))
            bounds.set(0, 0, Math.max(1, view.getWidth()), Math.max(1, view.getHeight()));
        Rect result = new Rect();
        bounds.roundOut(result);
        return result;
    }
}
