package ls.augment.com.hook;

import android.graphics.Outline;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;

/** Clip only the ordinary island window while it contains our expanded panel. */
final class DuoPanelShape extends ViewOutlineProvider implements View.OnAttachStateChangeListener {
    private final View root;
    private ViewOutlineProvider previous;
    private boolean wasClipped;

    static void attach(View panel, Object root) {
        if (root instanceof View) panel.addOnAttachStateChangeListener(new DuoPanelShape((View)root));
    }

    private DuoPanelShape(View root) { this.root = root; }

    @Override public void onViewAttachedToWindow(View panel) {
        for (ViewParent parent = panel.getParent(); parent instanceof View; parent = parent.getParent()) {
            if (parent == root) {
                previous = root.getOutlineProvider();
                wasClipped = root.getClipToOutline();
                root.setOutlineProvider(this);
                root.setClipToOutline(true);
                break;
            }
        }
    }

    @Override public void getOutline(View view, Outline outline) {
        float maxRadius = 24 * view.getResources().getDisplayMetrics().density;
        outline.setRoundRect(0,0,view.getWidth(),view.getHeight(),Math.min(maxRadius,view.getHeight()/2f));
    }

    @Override public void onViewDetachedFromWindow(View panel) {
        if (root.getOutlineProvider() == this) {
            root.setOutlineProvider(previous);
            root.setClipToOutline(wasClipped);
        }
        previous = null;
    }
}
