package ls.augment.com.hook;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewTreeObserver;
import java.util.function.Consumer;
import ls.augment.com.LayerBackdropSource;
import ls.augment.com.LiquidGlassDrawable;

/** One owned OEM island surface. Uses the same bounded, filtered compositor capture as other glass. */
final class IslandGlassBackground extends DrawableWrapper
        implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
    private final View host;
    private Drawable original;
    private final LayerBackdropSource source;
    private final LiquidGlassDrawable glass;
    private final Consumer<String> diagnostic;
    private java.util.function.IntConsumer foreground=color->{};
    private int foregroundColor=android.graphics.Color.WHITE;
    private final ViewTreeObserver observer;
    private final Rect region = new Rect();
    private boolean released, sourceReleased;
    private String reported = "";

    static IslandGlassBackground attach(View host, Consumer<String> diagnostic) {
        Drawable background = host.getBackground();
        // Subclasses retain the GradientDrawable contract; unfamiliar native surfaces stay native.
        if (!(background instanceof GradientDrawable)
                || ((GradientDrawable) background).getShape() != GradientDrawable.RECTANGLE) {
            diagnostic.accept("native;reason=unsupported_background:" + (background == null ? "null" : background.getClass().getName()));
            return null;
        }
        GradientDrawable shape = (GradientDrawable) background;
        float radius = shape.getCornerRadius();
        float[] corners = shape.getCornerRadii();
        if (corners != null) {
            radius = corners[0];
            for (float corner : corners) if (corner != radius) {
                diagnostic.accept("native;reason=nonuniform_corners"); return null;
            }
        }
        return new IslandGlassBackground(host, background, radius, diagnostic);
    }
    static IslandGlassBackground attach(View host,Consumer<String> diagnostic,java.util.function.IntConsumer foreground){
        IslandGlassBackground result=attach(host,diagnostic);if(result!=null)result.foreground=foreground;return result;
    }
    int foregroundColor(){return foregroundColor;}

    private IslandGlassBackground(View host, Drawable original, float radiusPx, Consumer<String> diagnostic) {
        super(original);
        this.host = host; this.original = original; this.diagnostic = diagnostic;
        source = new LayerBackdropSource(host);
        float radius = radiusPx / host.getResources().getDisplayMetrics().density;
        glass = new LiquidGlassDrawable(host, source, radius);
        glass.setForegroundIsLight(true);
        glass.setClarity(.82f);
        glass.setAnimatedFallback(true);
        glass.setCallback(this);
        background(host, this);
        // View.setBackground clears the old drawable callback; restore delegation after installation.
        original.setCallback(this);
        observer = host.getViewTreeObserver();
        observer.addOnPreDrawListener(this);
        host.addOnAttachStateChangeListener(this);
        host.invalidate();
    }

    /** OEM open/close animation changes the shape, not the lifetime of the captured material. */
    boolean replaceNative(Drawable next) {
        if (released || !(next instanceof GradientDrawable)) return false;
        GradientDrawable shape=(GradientDrawable)next;
        if(shape.getShape()!=GradientDrawable.RECTANGLE)return false;
        float radius=shape.getCornerRadius();float[] corners=shape.getCornerRadii();
        if(corners!=null){radius=corners[0];for(float corner:corners)if(corner!=radius)return false;}
        original.setCallback(null);original=next;setDrawable(next);next.setCallback(this);
        glass.setRadiusDp(radius/host.getResources().getDisplayMetrics().density);host.invalidate();return true;
    }

    @Override public boolean onPreDraw() {
        if (released) return true;
        if (host.getBackground() != this || !host.isAttachedToWindow()) { release(); return true; }
        if (!host.isShown() || host.getWindowVisibility() != View.VISIBLE) return true;
        region.set(getBounds());
        if (glass.isFailed()) releaseSource();
        else { source.setRegion(region); source.request(); }
        glass.setBounds(region);
        glass.setAlpha(original.getAlpha());
        boolean ready = glass.prepare();
        if(ready){
            int color=glass.isBackdropLight()?0xff17202b:android.graphics.Color.WHITE;
            if(color!=foregroundColor){foregroundColor=color;foreground.accept(color);}
        }
        String status = ready ? "refractive" : "translucent;reason="
                + (glass.isFailed() || source.failureReason().isEmpty() ? glass.failureReason() : source.failureReason());
        if (!status.equals(reported)) { reported = status; diagnostic.accept(status); }
        return true;
    }

    @Override public void draw(Canvas canvas) {
        if (!released && canvas.isHardwareAccelerated()) {
            if (glass.isReady()) { glass.draw(canvas); if (glass.isReady()) return; }
            if (glass.drawFallback(canvas)) return;
        }
        super.draw(canvas);
    }

    @Override protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        if (glass != null) glass.setBounds(bounds);
    }

    void release() {
        if (released) return;
        released = true;
        if (observer.isAlive()) observer.removeOnPreDrawListener(this);
        host.removeOnAttachStateChangeListener(this);
        releaseSource(); glass.release(); glass.setCallback(null);
        boolean owned = host.getBackground() == this;
        setDrawable(null);
        if (owned) background(host, original);
    }

    private void releaseSource() { if (!sourceReleased) { sourceReleased = true; source.release(); } }

    private static void background(View view, Drawable value) {
        int left = view.getPaddingLeft(), top = view.getPaddingTop(), right = view.getPaddingRight(), bottom = view.getPaddingBottom();
        view.setBackground(value);
        view.setPadding(left, top, right, bottom);
    }

    @Override public void onViewAttachedToWindow(View view) { }
    @Override public void onViewDetachedFromWindow(View view) { release(); }
}
