package ls.augment.com.hook;

import android.animation.ValueAnimator;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.SeekBar;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.GlassOptions;
import ls.augment.com.LayerBackdropSource;
import ls.augment.com.LiquidGlassDrawable;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Glass replaces verified native material backgrounds, never the whole panel or its foreground. */
final class LiquidGlassControlCenterHook {
    private static final String PANEL = "com.zte.controlcenter.view.ControlCenterPanelView";
    private static final String WIDE = "com.zte.qs.tileimpl.QSTileViewWide";
    private static final String CIRCLE = "com.zte.qs.tileimpl.QSTileViewCircle";
    private static final Map<View, State> STATES = new WeakHashMap<>();
    private LiquidGlassControlCenterHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        int count = hookNamed(module, loader, "liquid_glass", PANEL, "onFinishInflate", 0, null,
                (owner, args, result) -> { if (owner instanceof View) watch((View) owner); return PASS; });
        count += hookNamed(module, loader, "liquid_glass", PANEL, "dispatchDraw", 1,
                (owner, args, result) -> {
                    if (owner instanceof View && args[0] instanceof Canvas) watch((View) owner).prepare();
                    return PASS;
                }, null);
        count += hookNamed(module, loader, "liquid_glass", PANEL, "dispatchTouchEvent", 1,
                (owner, args, result) -> {
                    State state = STATES.get(owner);
                    if (state != null && args[0] instanceof MotionEvent) state.touch((MotionEvent) args[0]);
                    return PASS;
                }, null);
        return count;
    }

    private static State watch(View view) {
        State state = STATES.get(view);
        if (state == null) {
            state = new State(view); STATES.put(view, state); view.addOnAttachStateChangeListener(state);
        }
        if (view.isAttachedToWindow()) state.attach();
        return state;
    }

    private static View child(View view, String name) {
        int id = view.getResources().getIdentifier(name, "id", "com.android.systemui");
        return id == 0 ? null : view.findViewById(id);
    }

    private static boolean descendant(View view, View parent) {
        for (View at = view; at != null; ) {
            if (at == parent) return true;
            ViewParent next = at.getParent(); at = next instanceof View ? (View) next : null;
        }
        return false;
    }

    private static void backgroundPreservingPadding(View view, Drawable drawable) {
        int left = view.getPaddingLeft(), top = view.getPaddingTop();
        int right = view.getPaddingRight(), bottom = view.getPaddingBottom();
        view.setBackground(drawable);
        if (view.getPaddingLeft() != left || view.getPaddingTop() != top
                || view.getPaddingRight() != right || view.getPaddingBottom() != bottom)
            view.setPadding(left, top, right, bottom);
    }

    private static final class State implements View.OnAttachStateChangeListener {
        final WeakReference<View> reference;
        final Runnable changed = this::refresh;
        final Rect bounds = new Rect();
        // View.background owns its Surface. Registry/listener state must not retain a window.
        final Map<View, WeakReference<Surface>> surfaces = new WeakHashMap<>();
        LayerBackdropSource source;
        WeakReference<Surface> touched = new WeakReference<>(null);
        boolean attached, enabled, opaque, lessMotion, renderersFailed;
        String lastDiagnostic = "";

        State(View view) { reference = new WeakReference<>(view); }
        void attach() {
            if (attached) return;
            View view = reference.get(); if (view == null) return;
            attached = true; FeatureSettings.addSnapshotListener(view.getContext(), changed); refresh();
        }
        void refresh() {
            View view = reference.get(); if (view == null) return;
            try {
                enabled = attached && FeatureSettings.enabled(view.getContext(), GlassOptions.CONTROL_CENTER);
                boolean nextOpaque = FeatureSettings.enabled(view.getContext(), GlassOptions.CC_REDUCE_TRANSPARENCY);
                lessMotion = FeatureSettings.enabled(view.getContext(), GlassOptions.CC_REDUCE_MOTION);
                // A failed AGSL renderer is terminal; solid mode must start with a fresh material.
                if (!enabled || nextOpaque != opaque || renderersFailed) clear();
                opaque = nextOpaque;
                view.invalidate();
            } catch (RuntimeException | LinkageError error) { enabled = false; clear(); }
        }
        void prepare() {
            View panel = reference.get();
            if (!enabled || !(panel instanceof ViewGroup) || !panel.isShown()
                    || panel.getWidth() <= 0 || panel.getHeight() <= 0) return;
            try {
                // Verified in the OEM smali: these are separate native tile containers.
                Object all = field(panel, "allTilesLayout");
                if (!(all instanceof ViewGroup)) { clear(); diagnostic(panel, "native_layout_unavailable"); return; }
                if (source == null) source = new LayerBackdropSource(panel);
                bounds.set(0, 0, panel.getWidth(), panel.getHeight()); source.setRegion(bounds);
                for (Surface surface : liveSurfaces()) surface.seen = false;
                collectTiles((ViewGroup) all);
                Object big = field(panel, "bigTilesLayout");
                if (big instanceof ViewGroup) collectTiles((ViewGroup) big);
                Object top = field(panel, "topPanel");
                if (top instanceof View && descendant((View) top, panel)) {
                    // OEM TopPanel extends ControlCenterTileLayout; getBigTileViews() returns
                    // its getAnimViews(), not the legacy bigTilesLayout field.
                    if (top instanceof ViewGroup) collectTiles((ViewGroup) top);
                    Object player = field(top, "player");
                    if (player instanceof View) bind((View) player, (View) player, false, null);
                    Object brightness = field(top, "brightness");
                    if (brightness instanceof View) {
                        View frame = child((View) brightness, "slider_frame");
                        View seek = child((View) brightness, "slider");
                        if (frame != null && seek instanceof SeekBar) bindSlider(frame, (SeekBar) seek);
                    }
                    Object volume = field(top, "volume"), slider = field(top, "mVolumeSlider");
                    if (volume instanceof View && slider instanceof SeekBar) bindSlider((View) volume, (SeekBar) slider);
                }
                int ready = 0, total = 0, failed = 0;
                String firstGlassReason = "", rendererReason = "", hostReason = "", materialReason = "";
                for (Surface surface : liveSurfaces()) {
                    if (!surface.seen || !descendant(surface.view, panel)) {
                        surface.restore(); surfaces.remove(surface.view); continue;
                    }
                    total++;
                    if (surface.prepare((ViewGroup) panel)) ready++;
                    else {
                        String reason = surface.glass.failureReason();
                        if (reason != null && !reason.isEmpty() && firstGlassReason.isEmpty()) firstGlassReason = reason;
                        if (surface.glass.isFailed()) {
                            failed++;
                            if (rendererReason.isEmpty()) rendererReason = reason == null || reason.isEmpty() ? "renderer_unavailable" : reason;
                        } else if (!surface.validGeometry) {
                            if (hostReason.isEmpty()) hostReason = "control_geometry_unavailable";
                        } else if ("host_unavailable".equals(reason)) {
                            if (hostReason.isEmpty()) hostReason = reason;
                        } else if (materialReason.isEmpty() && reason != null) materialReason = reason;
                    }
                }
                if (!stopFailedCapture()) {
                    // A newly available native control can recover independently of failed ones.
                    if (renderersFailed) {
                        source = new LayerBackdropSource(panel); source.setRegion(bounds); renderersFailed = false;
                    }
                    if (!opaque) source.request();
                }
                String value = (total == 0 ? "native_controls_unavailable" : ready > 0
                        ? (opaque ? "reduced_transparency" : "active_control_backdrops") : "translucent_fallback")
                        + ":ready=" + ready + "/" + total + ";failed=" + failed;
                if (ready < total) {
                    String sourceReason = source.failureReason();
                    value += ";reason=" + fallbackReason(rendererReason, hostReason, materialReason, sourceReason);
                    if (!firstGlassReason.isEmpty()) value += ";glass=" + firstGlassReason;
                    if (sourceReason != null && !sourceReason.isEmpty()) value += ";source=" + sourceReason;
                }
                diagnostic(panel, value);
            } catch (RuntimeException | LinkageError error) {
                clear(); diagnostic(panel, "native_fallback:render_unavailable");
            }
        }
        String fallbackReason(String renderer, String host, String material, String sourceReason) {
            if (!renderer.isEmpty()) return renderer;
            if (!host.isEmpty()) return host;
            if (!material.isEmpty() && !"backdrop_unavailable".equals(material) && !"not_prepared".equals(material)) return material;
            if (sourceReason != null && !sourceReason.isEmpty()) return sourceReason;
            // No permanent renderer error or known host failure: a filtered frame is not usable yet.
            return "frame_pending_or_host_unavailable";
        }
        void collectTiles(ViewGroup group) {
            // OEM tile layouts (including TopPanel) contain tiles as direct children.
            for (int i = 0; i < Math.min(group.getChildCount(), 64); i++) {
                View tile = group.getChildAt(i); String name = tile.getClass().getName();
                if (!WIDE.equals(name) && !CIRCLE.equals(name)) continue;
                Object nativeBackground = field(tile, "colorBackgroundDrawable");
                if (!(nativeBackground instanceof GradientDrawable)) continue;
                View target = materialOwner(tile, (Drawable) nativeBackground, 0);
                if (target != null) bind(target, tile, CIRCLE.equals(name), null);
            }
        }
        View materialOwner(View view, Drawable original, int depth) {
            Drawable current = view.getBackground();
            if (current == original || (current instanceof Material && ((Material) current).original == original)) return view;
            if (depth < 2 && view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View found = materialOwner(group.getChildAt(i), original, depth + 1);
                    if (found != null) return found;
                }
            }
            return null;
        }
        void bindSlider(View frame, SeekBar seek) {
            // OEM SeekBars rotate 270 degrees; material belongs to the upright frame.
            // Replace only the standard background layer, retaining native progress/clip/level.
            Drawable progress = seek.getProgressDrawable();
            if (!(progress instanceof LayerDrawable)) return;
            LayerDrawable layers = (LayerDrawable) progress;
            Drawable background = layers.findDrawableByLayerId(android.R.id.background);
            if (background instanceof TrackBackground) background = ((TrackBackground) background).original;
            // toggle_slider_progress: the track and white ClipDrawable fill share these
            // radii (16dp on the audited ROM). A forced half-width capsule adds a second edge.
            if (sliderRadius(frame, background) < 0) return;
            bind(frame, frame, false, layers);
        }
        void bind(View view, View owner, boolean circle, LayerDrawable progress) {
            View panel = reference.get();
            if (panel == null || !descendant(view, panel)) return;
            WeakReference<Surface> saved = surfaces.get(view);
            Surface surface = saved == null ? null : saved.get();
            if (surface != null && (view.getBackground() != surface.material || surface.progress != progress
                    || (progress != null && (progress.findDrawableByLayerId(android.R.id.background) != surface.track
                    || Math.abs(surface.radiusDp - sliderRadius(view, surface.track.original)) > .01f)))) {
                surface.restore(); surfaces.remove(view); surface = null;
            }
            if (surface == null) {
                if (surfaces.size() >= 64) return;
                surface = new Surface(this, view, owner, circle, progress); surfaces.put(view, new WeakReference<>(surface));
            }
            surface.seen = true;
        }
        void touch(MotionEvent event) {
            if (!enabled) return;
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                touched.clear();
                for (Surface surface : liveSurfaces()) if (surface.region.contains((int) event.getX(), (int) event.getY())) {
                    touched = new WeakReference<>(surface); break;
                }
            }
            Surface target = touched.get();
            if (target != null) {
                boolean pressed = action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL;
                target.glass.setInteraction(event.getX() - target.region.left, event.getY() - target.region.top, pressed);
                if (!pressed) touched.clear();
            }
        }
        void clear() {
            touched.clear();
            for (Surface surface : liveSurfaces()) surface.restore(); surfaces.clear();
            if (source != null && !renderersFailed) source.release(); source = null; renderersFailed = false;
        }
        boolean stopFailedCapture() {
            List<Surface> live = liveSurfaces();
            if (live.isEmpty()) return false;
            for (Surface surface : live) if (!surface.glass.isFailed()) return false;
            if (!renderersFailed && source != null) source.release();
            renderersFailed = true;
            return true;
        }
        List<Surface> liveSurfaces() {
            List<Surface> result = new ArrayList<>();
            for (WeakReference<Surface> saved : surfaces.values()) {
                Surface surface = saved.get(); if (surface != null) result.add(surface);
            }
            return result;
        }
        void diagnostic(View view, String value) {
            if (value.equals(lastDiagnostic)) return; lastDiagnostic = value;
            FeatureSettings.diagnostic(view.getContext(), "ls_augment_rm_glass_cc_state", value);
        }
        @Override public void onViewAttachedToWindow(View view) { attach(); }
        @Override public void onViewDetachedFromWindow(View view) {
            attached = false; enabled = false; FeatureSettings.removeSnapshotListener(changed); clear(); lastDiagnostic = "";
        }
    }

    private static float sliderRadius(View view, Drawable background) {
        if (!(background instanceof GradientDrawable)) return -1;
        GradientDrawable shape = (GradientDrawable) background;
        if (shape.getShape() != GradientDrawable.RECTANGLE) return -1;
        float radius = shape.getCornerRadius();
        float[] corners = shape.getCornerRadii();
        if (corners != null && corners.length == 8) {
            radius = corners[0];
            for (float corner : corners) if (Math.abs(corner - radius) > .01f) return -1;
        }
        float density = view.getResources().getDisplayMetrics().density;
        return Float.isFinite(radius) && radius >= 0 && density > 0 ? radius / density : -1;
    }

    private static final class Surface implements LiquidGlassDrawable.BackdropSource {
        final State state;
        final View view, owner;
        final boolean circle;
        final float radiusDp;
        final Rect region = new Rect();
        final LiquidGlassDrawable glass;
        final Material material;
        final LayerDrawable progress;
        final TrackBackground track;
        boolean seen, drawn, fallbackDrawn, validGeometry;
        long lastRevision = Long.MIN_VALUE;
        boolean lastAvailable;
        long appearanceStarted = -1;
        float materialFraction;

        Surface(State state, View view, View owner, boolean circle, LayerDrawable progress) {
            this.state = state; this.view = view; this.owner = owner; this.circle = circle; this.progress = progress;
            Drawable nativeTrack = progress == null ? null : progress.findDrawableByLayerId(android.R.id.background);
            radiusDp = progress != null ? sliderRadius(view, nativeTrack) : circle ? 1000 : 24;
            glass = new LiquidGlassDrawable(view, this, radiusDp);
            // Control Center uses monochrome glyphs, so even circular controls need contrast.
            glass.setIconOnly(false);
            glass.setControlSurface(true);
            material = new Material(this, view.getBackground());
            backgroundPreservingPadding(view, material); material.bindCallback();
            if (progress != null) {
                track = new TrackBackground(this, progress.findDrawableByLayerId(android.R.id.background));
                progress.setDrawableByLayerId(android.R.id.background, track); track.bindCallback();
            } else track = null;
        }
        boolean prepare(ViewGroup panel) {
            Rect next = new Rect(0, 0, view.getWidth(), view.getHeight());
            panel.offsetDescendantRectToMyCoords(view, next);
            validGeometry = view.isShown() && !next.isEmpty() && state.bounds.contains(next);
            if (!region.equals(next)) { region.set(next); glass.invalidateBackdrop(); }
            glass.setBounds(0, 0, view.getWidth(), view.getHeight());
            glass.updatePreferences(state.opaque, state.lessMotion);
            Object nativeState = field(owner, "lastState");
            boolean active = nativeState instanceof Number && ((Number) nativeState).intValue() == 2;
            TextView label = null;
            if (WIDE.equals(owner.getClass().getName()) || CIRCLE.equals(owner.getClass().getName())) {
                try { Object candidate = call(owner, "getLabel"); if (candidate instanceof TextView) label = (TextView) candidate; }
                catch (ReflectiveOperationException ignored) { }
            } else { Object candidate = field(owner, "mTitleText"); if (candidate instanceof TextView) label = (TextView) candidate; }
            int color = label == null ? Color.BLACK : label.getCurrentTextColor();
            glass.setForegroundIsLight(circle && active || Color.luminance(color) > .5f);
            int tint = Color.WHITE;
            Drawable nativeBackground = material.original;
            if (active && nativeBackground instanceof GradientDrawable) {
                GradientDrawable gradient = (GradientDrawable) nativeBackground;
                int[] colors = gradient.getColors();
                if (colors != null && colors.length > 0) tint = colors[0];
                else if (gradient.getColor() != null) tint = gradient.getColor().getDefaultColor();
            }
            glass.setMaterialTint(tint, active ? .62f : 0f);
            int alpha = nativeBackground == null ? 255 : nativeBackground.getAlpha();
            if (glass.getAlpha() != alpha) glass.setAlpha(alpha);
            boolean available = validGeometry && glass.prepare();
            long revision = revision();
            if (lastRevision != revision || lastAvailable != available) {
                lastRevision = revision; lastAvailable = available;
                // A parent invalidation alone may reuse a child's cached hardware display list.
                view.invalidate();
            }
            return available;
        }
        @Override public boolean draw(Canvas canvas, int width, int height) {
            return isValid() && state.source.drawRegion(canvas, region, width, height);
        }
        @Override public boolean isValid() { return validGeometry && state.enabled && state.source != null && state.source.isValid(); }
        @Override public long revision() { return state.source == null ? -1 : state.source.revision(); }
        boolean drawMaterial(Canvas canvas) {
            fallbackDrawn = false;
            // draw() deliberately does nothing on software Canvas, without clearing isReady().
            if (!canvas.isHardwareAccelerated() || !state.enabled || !validGeometry) return false;
            if (glass.isReady()) { glass.draw(canvas); if (glass.isReady()) return true; }
            fallbackDrawn = glass.drawFallback(canvas);
            return fallbackDrawn;
        }
        float appearanceFraction() {
            if (drawn && materialFraction >= 1) return 1;
            if (state.lessMotion || !ValueAnimator.areAnimatorsEnabled()) return 1;
            long now = SystemClock.uptimeMillis();
            if (appearanceStarted < 0) appearanceStarted = now;
            float fraction = Math.max(0, Math.min(1, (now - appearanceStarted) / 160f));
            return fraction * fraction * (3 - 2 * fraction);
        }
        void resetAppearance() { appearanceStarted = -1; materialFraction = 0; }
        void restore() {
            drawn = false; validGeometry = false;
            resetAppearance();
            if (view.getBackground() == material) backgroundPreservingPadding(view, material.original);
            if (progress != null && progress.findDrawableByLayerId(android.R.id.background) == track)
                progress.setDrawableByLayerId(android.R.id.background, track.original);
            material.unbindCallback();
            if (track != null) track.unbindCallback();
            glass.release();
        }
    }

    /** Delegate native updates/animations to the original drawable, so disable/failure is reversible. */
    private abstract static class NativeDrawable extends Drawable implements Drawable.Callback {
        final Drawable original;
        NativeDrawable(Drawable original) { this.original = original; }
        void bindCallback() { if (original != null) original.setCallback(this); }
        void unbindCallback() { if (original != null && original.getCallback() == this) original.setCallback(null); }
        void drawOriginal(Canvas canvas) { if (original != null) original.draw(canvas); }
        void drawOriginal(Canvas canvas, int alpha) {
            if (original == null || alpha <= 0) return;
            if (alpha >= 255) { drawOriginal(canvas); return; }
            int save = canvas.saveLayerAlpha(null, alpha);
            try { drawOriginal(canvas); } finally { canvas.restoreToCount(save); }
        }
        @Override protected void onBoundsChange(Rect bounds) { if (original != null) original.setBounds(bounds); }
        @Override public void setAlpha(int alpha) { if (original != null) original.setAlpha(alpha); }
        @Override public int getAlpha() { return original == null ? 255 : original.getAlpha(); }
        @Override public void setColorFilter(ColorFilter filter) { if (original != null) original.setColorFilter(filter); }
        @Override public void setTintList(ColorStateList tint) { if (original != null) original.setTintList(tint); }
        @Override public void setTintMode(PorterDuff.Mode mode) { if (original != null) original.setTintMode(mode); }
        @Override public boolean isStateful() { return original != null && original.isStateful(); }
        @Override protected boolean onStateChange(int[] state) { return original != null && original.setState(state); }
        @Override protected boolean onLevelChange(int level) { return original != null && original.setLevel(level); }
        @Override public boolean setVisible(boolean visible, boolean restart) {
            boolean changed = super.setVisible(visible, restart);
            return (original != null && original.setVisible(visible, restart)) || changed;
        }
        @Override public void setHotspot(float x, float y) { if (original != null) original.setHotspot(x, y); }
        @Override public void setHotspotBounds(int l, int t, int r, int b) { if (original != null) original.setHotspotBounds(l, t, r, b); }
        @Override public boolean getPadding(Rect padding) { return original != null ? original.getPadding(padding) : super.getPadding(padding); }
        @Override public int getIntrinsicWidth() { return original == null ? -1 : original.getIntrinsicWidth(); }
        @Override public int getIntrinsicHeight() { return original == null ? -1 : original.getIntrinsicHeight(); }
        @Override public int getMinimumWidth() { return original == null ? 0 : original.getMinimumWidth(); }
        @Override public int getMinimumHeight() { return original == null ? 0 : original.getMinimumHeight(); }
        @Override public void getOutline(Outline outline) { if (original != null) original.getOutline(outline); }
        @Override public void jumpToCurrentState() { if (original != null) original.jumpToCurrentState(); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        @Override public void invalidateDrawable(Drawable who) { invalidateSelf(); }
        @Override public void scheduleDrawable(Drawable who, Runnable task, long when) { scheduleSelf(task, when); }
        @Override public void unscheduleDrawable(Drawable who, Runnable task) { unscheduleSelf(task); }
    }
    private static final class Material extends NativeDrawable {
        final Surface surface;
        Material(Surface surface, Drawable original) { super(original); this.surface = surface; }
        @Override public void draw(Canvas canvas) {
            try {
                // Native color animation can invalidate only this child's display list.
                View panel = surface.state.reference.get();
                if (surface.state.enabled && panel instanceof ViewGroup && descendant(surface.view, panel))
                    surface.prepare((ViewGroup) panel);
                float fraction = surface.appearanceFraction();
                if (fraction >= 1) surface.drawn = surface.drawMaterial(canvas);
                else {
                    int save = canvas.saveLayerAlpha(null, Math.round(255 * fraction));
                    try { surface.drawn = surface.drawMaterial(canvas); }
                    finally { canvas.restoreToCount(save); }
                }
                surface.materialFraction = surface.drawn ? fraction : 0;
                if (surface.glass.isFailed()) surface.state.stopFailedCapture();
            } catch (RuntimeException | LinkageError error) { surface.drawn = false; surface.fallbackDrawn = false; }
            if (!surface.drawn) { surface.resetAppearance(); drawOriginal(canvas); }
            else {
                drawOriginal(canvas, 255 - Math.round(255 * surface.materialFraction));
                if (surface.materialFraction < 1) surface.view.postInvalidateOnAnimation();
            }
        }
        @Override public void invalidateDrawable(Drawable who) {
            super.invalidateDrawable(who);
            View panel = surface.state.reference.get(); if (panel != null) panel.invalidate();
        }
    }
    private static final class TrackBackground extends NativeDrawable {
        final Surface surface;
        TrackBackground(Surface surface, Drawable original) { super(original); this.surface = surface; }
        @Override public void draw(Canvas canvas) {
            // A stale successful backdrop must not keep masking a native track after failure.
            boolean suppress;
            try { suppress = canvas.isHardwareAccelerated() && surface.drawn && surface.state.enabled && surface.validGeometry
                    && (surface.fallbackDrawn || surface.state.opaque || surface.isValid()); }
            catch (RuntimeException | LinkageError error) { suppress = false; }
            if (!suppress) drawOriginal(canvas);
            else drawOriginal(canvas, 255 - Math.round(255 * surface.materialFraction));
        }
        @Override public void invalidateDrawable(Drawable who) {
            super.invalidateDrawable(who); surface.view.invalidate();
        }
    }
}
