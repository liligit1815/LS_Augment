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
import android.view.ViewTreeObserver;
import android.view.ViewParent;
import android.widget.SeekBar;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.GlassOptions;
import ls.augment.com.GlassGeometry;
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
        int count=0;
        for(String panel:new String[]{PANEL,ControlCenterGlassTargets.MODERN}){
        count += hookNamed(module, loader, "liquid_glass", panel, "onFinishInflate", 0, null,
                (owner, args, result) -> { if (owner instanceof View) watch((View) owner); return PASS; });
        count += hookNamed(module, loader, "liquid_glass", panel, "dispatchDraw", 1,
                (owner, args, result) -> {
                    if (owner instanceof View && args[0] instanceof Canvas) watch((View) owner).prepareForDraw();
                    return PASS;
                }, null);
        }
        count += hookNamed(module, loader, "liquid_glass", PANEL, "dispatchTouchEvent", 1,
                (owner, args, result) -> {
                    State state = STATES.get(owner);
                    if (state != null && args[0] instanceof MotionEvent) state.touch((MotionEvent) args[0]);
                    return PASS;
                }, null);
        count += hookNamed(module,loader,"liquid_glass",ControlCenterGlassTargets.CONTENT,"dispatchTouchEvent",1,
                (owner,args,result)->{
                    if(owner instanceof View&&args[0] instanceof MotionEvent)
                        for(View node=(View)owner;node!=null;node=node.getParent() instanceof View?(View)node.getParent():null){
                            State state=STATES.get(node);if(state!=null){state.touch((MotionEvent)args[0],(View)owner);break;}
                        }
                    return PASS;
                },null);
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


    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
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

    private static final class State implements View.OnAttachStateChangeListener,ViewTreeObserver.OnPreDrawListener {
        final WeakReference<View> reference;
        final Runnable changed = this::refresh;
        final Rect bounds = new Rect();
        // View.background owns its Surface. Registry/listener state must not retain a window.
        final Map<View, WeakReference<Surface>> surfaces = new WeakHashMap<>();
        LayerBackdropSource source;
        WeakReference<Surface> touched = new WeakReference<>(null);
        boolean attached, enabled, opaque, lessMotion, renderersFailed,preDrawPrepared;
        int priorityOwned;
        String lastDiagnostic = "";

        State(View view) { reference = new WeakReference<>(view); }
        void attach() {
            if (attached) return;
            View view = reference.get(); if (view == null) return;
            attached = true; view.getViewTreeObserver().addOnPreDrawListener(this);
            FeatureSettings.addSnapshotListener(view.getContext(), changed); refresh();
        }
        @Override public boolean onPreDraw(){if(enabled){prepare();preDrawPrepared=true;}return true;}
        void prepareForDraw(){if(preDrawPrepared){preDrawPrepared=false;return;}prepare();}
        void refresh() {
            View view = reference.get(); if (view == null) return;
            try {
                enabled = attached && FeatureSettings.enabled(view.getContext(), GlassOptions.CONTROL_CENTER);
                boolean nextOpaque = FeatureSettings.enabled(view.getContext(), GlassOptions.CC_REDUCE_TRANSPARENCY);
                lessMotion = FeatureSettings.enabled(view.getContext(), GlassOptions.CC_REDUCE_MOTION);
                // A failed AGSL renderer is terminal; solid mode must start with a fresh material.
                if (!enabled || nextOpaque != opaque || renderersFailed) clear();
                opaque = nextOpaque;
                if(!enabled)diagnostic(view,"disabled");
                view.invalidate();
            } catch (RuntimeException | LinkageError error) { enabled = false; clear(); }
        }
        void prepare() {
            View panel = reference.get();
            if (!enabled || !(panel instanceof ViewGroup) || !panel.isShown()
                    || panel.getWidth() <= 0 || panel.getHeight() <= 0) return;
            try {
                // Verified in the OEM smali: these are separate native tile containers.
                priorityOwned=0;
                bounds.set(0, 0, panel.getWidth(), panel.getHeight());
                for (Surface surface : liveSurfaces()) surface.seen = false;
                if(ControlCenterGlassTargets.modern(panel)){
                    ControlCenterGlassTargets.collect(panel,new ControlCenterGlassTargets.Visitor(){
                        @Override public void tile(View tile){collectTile(tile);}
                        @Override public void slider(View frame,SeekBar seek){bindSlider(frame,seek);}
                        @Override public void media(View view){
                            Drawable bg=view.getBackground();
                            if(bg instanceof Material)bg=((Material)bg).original;
                            if(bg instanceof GradientDrawable&&sliderRadius(view,bg)>=0)
                                bind(view,view,false,null);
                        }
                    });
                }else{
                Object all = field(panel, "allTilesLayout");
                if (!(all instanceof ViewGroup)) { clear(); diagnostic(panel, "native_layout_unavailable"); return; }
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
                }
                int ready = 0, total = 0, failed = 0, outside = 0;
                String firstGlassReason = "", rendererReason = "", hostReason = "", materialReason = "";
                for (Surface surface : liveSurfaces()) {
                    if (!surface.seen || !descendant(surface.view, panel)) {
                        surface.restore(); surfaces.remove(surface.view); continue;
                    }
                    if(source==null)source=new LayerBackdropSource(panel);source.setRegion(bounds);
                    boolean available=surface.prepare((ViewGroup)panel);
                    if(surface.outside){outside++;continue;}
                    total++;
                    if (available) ready++;
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
                if(total==0){
                    // Retain bound off-page materials so page entry can invalidate
                    // their display lists without waiting for a new parent draw.
                    if(outside==0)clear();
                    else if(source!=null){source.release();source=null;}
                    diagnostic(panel,(outside>0?"no_visible_controls":priorityOwned>0?"appearance_priority":"native_controls_unavailable")+":ready=0/0;failed=0;outside="+outside);
                    return;
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
                diagnostic(panel, value+";outside="+outside);
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
                collectTile(group.getChildAt(i));
            }
        }
        void collectTile(View tile){
                boolean circle=ControlCenterGlassTargets.isType(tile,CIRCLE);
                if (!ControlCenterGlassTargets.isType(tile,WIDE) && !circle) return;
                Object nativeBackground = field(tile, "colorBackgroundDrawable");
                if (!(nativeBackground instanceof GradientDrawable)) return;
                View target = materialOwner(tile, (Drawable) nativeBackground, 0);
                if (target != null) bind(target, tile, circle, null);
                else if(ControlCenterAppearanceHook.ownsMaterial(tile,tile,false))priorityOwned++;
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
            if(ControlCenterAppearanceHook.ownsMaterial(view,owner,progress!=null)){priorityOwned++;return;}
            View panel = reference.get();
            if (panel == null || !descendant(view, panel)) return;
            WeakReference<Surface> saved = surfaces.get(view);
            Surface surface = saved == null ? null : saved.get();
            if (surface != null && ((!surface.trackOnly&&view.getBackground() != surface.material) || surface.progress != progress
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
            touch(event,reference.get());
        }
        void touch(MotionEvent event,View origin) {
            if (!enabled) return;
            float x=event.getX(),y=event.getY();View panel=reference.get();
            if(origin!=panel){Rect point=new Rect((int)x,(int)y,(int)x+1,(int)y+1);
                if(origin==null||panel==null||!GlassGeometry.map(origin,panel,point,true))return;x=point.left;y=point.top;}
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                touched.clear();
                for (Surface surface : liveSurfaces()) if (surface.region.contains((int) x, (int) y)) {
                    touched = new WeakReference<>(surface); break;
                }
            }
            Surface target = touched.get();
            if (target != null) {
                boolean pressed = action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL;
                Rect local=target.glass.getBounds();
                target.glass.setInteraction(local.left+(x-target.region.left)*local.width()/Math.max(1,target.region.width()),
                        local.top+(y-target.region.top)*local.height()/Math.max(1,target.region.height()),pressed);
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
            if(ControlCenterGlassTargets.modern(view))value+=";adapter=mfv_qs;host="+view.getWidth()+"x"+view.getHeight();
            value += ";build=" + ls.augment.com.BuildConfig.VERSION_CODE + ";geometry=viewport_v2";
            if (value.equals(lastDiagnostic)) return; lastDiagnostic = value;
            if(enabled)FeatureSettings.diagnostic(view.getContext(), "ls_augment_rm_glass_cc_last_enabled", value);
            FeatureSettings.diagnostic(view.getContext(), "ls_augment_rm_glass_cc_state", value);
        }
        @Override public void onViewAttachedToWindow(View view) { attach(); }
        @Override public void onViewDetachedFromWindow(View view) {
            if(view.getViewTreeObserver().isAlive())view.getViewTreeObserver().removeOnPreDrawListener(this);
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
        final boolean trackOnly;
        final ControlCenterAppearanceHook.GlassStyle appearance=new ControlCenterAppearanceHook.GlassStyle();
        boolean seen, drawn, fallbackDrawn, validGeometry,outside;
        long lastRevision = Long.MIN_VALUE;
        boolean lastAvailable;
        long appearanceStarted = -1;
        float materialFraction;

        Surface(State state, View view, View owner, boolean circle, LayerDrawable progress) {
            this.state = state; this.view = view; this.owner = owner; this.circle = circle; this.progress = progress;
            trackOnly=progress!=null&&view instanceof SeekBar;
            Drawable nativeTrack = progress == null ? null : progress.findDrawableByLayerId(android.R.id.background);
            float nativeRadius=24;
            if(progress==null&&ControlCenterGlassTargets.modern(state.reference.get())&&view.getBackground() instanceof GradientDrawable)
                nativeRadius=sliderRadius(view,view.getBackground());
            radiusDp = progress != null ? sliderRadius(view, nativeTrack) : circle ? 1000 : nativeRadius;
            glass = new LiquidGlassDrawable(view, this, radiusDp);
            // Control Center uses monochrome glyphs, so even circular controls need contrast.
            glass.setIconOnly(false);
            glass.setControlSurface(true);
            material = new Material(this, view.getBackground());
            if(!trackOnly){backgroundPreservingPadding(view, material); material.bindCallback();}
            if (progress != null) {
                track = new TrackBackground(this, progress.findDrawableByLayerId(android.R.id.background));
                progress.setDrawableByLayerId(android.R.id.background, track); track.bindCallback();
            } else track = null;
        }
        boolean prepare(ViewGroup panel) {
            Rect next = new Rect(0, 0, view.getWidth(), view.getHeight());
            Rect local=new Rect(next);
            if(trackOnly){
                local.set(track.original.getBounds());next.set(local);
                // ProgressBar draws its progress drawable after translating by its
                // content padding. Use the native track bounds, never the SeekBar box.
                next.offset(view.getPaddingLeft(),view.getPaddingTop());
            }
            boolean priorGeometry=validGeometry;
            boolean mapped=view.isShown()&&GlassGeometry.map(view,panel,next,true);
            outside=!view.isShown()||next.isEmpty()||mapped&&(next.right<=state.bounds.left||next.left>=state.bounds.right
                    ||next.bottom<=state.bounds.top||next.top>=state.bounds.bottom);
            validGeometry=mapped&&!outside;
            boolean moved=!region.equals(next);
            if (moved) { region.set(next); glass.invalidateBackdrop(); }
            glass.setBounds(local);
            glass.updatePreferences(state.opaque, state.lessMotion);
            Object nativeState = field(owner, "lastState");
            boolean active = nativeState instanceof Number && ((Number) nativeState).intValue() == 2;
            TextView label = null;
            if (ControlCenterGlassTargets.isType(owner,WIDE) || ControlCenterGlassTargets.isType(owner,CIRCLE)) {
                try { Object candidate = call(owner, "getLabel"); if (candidate instanceof TextView) label = (TextView) candidate; }
                catch (ReflectiveOperationException ignored) { }
            } else { Object candidate = field(owner, "mTitleText"); if (candidate instanceof TextView) label = (TextView) candidate;
                else{View title=child(owner,"header_title");if(title instanceof TextView)label=(TextView)title;}}
            int color = label == null ? Color.BLACK : label.getCurrentTextColor();
            glass.setForegroundIsLight(circle && active || Color.luminance(color) > .5f);
            int tint = Color.WHITE;
            Drawable nativeBackground = trackOnly?track.original:material.original;
            if (active && nativeBackground instanceof GradientDrawable) {
                GradientDrawable gradient = (GradientDrawable) nativeBackground;
                int[] colors = gradient.getColors();
                if (colors != null && colors.length > 0) tint = colors[0];
                else if (gradient.getColor() != null) tint = gradient.getColor().getDefaultColor();
            }
            if(!appearance.apply(view,owner,glass,radiusDp))glass.setMaterialTint(tint, active ? .62f : 0f);
            int alpha = nativeBackground == null ? 255 : nativeBackground.getAlpha();
            if (glass.getAlpha() != alpha) glass.setAlpha(alpha);
            boolean available = validGeometry && glass.prepare();
            long revision = revision();
            if (moved || priorGeometry!=validGeometry || lastRevision != revision || lastAvailable != available) {
                lastRevision = revision; lastAvailable = available;
                // A parent invalidation alone may reuse a child's cached hardware display list.
                view.invalidate();
            }
            return available;
        }
        @Override public boolean draw(Canvas canvas, int width, int height) {
            return isValid() && state.source.drawRegion(canvas, region, width, height);
        }
        @Override public boolean mapsLocalScale() { return true; }
        @Override public boolean isValid() {
            View panel=state.reference.get();
            if (!validGeometry || !state.enabled || panel==null || state.source==null || !state.source.isValid()) return false;
            Rect current=new Rect(0,0,view.getWidth(),view.getHeight());
            if(trackOnly){current.set(track.original.getBounds());current.offset(view.getPaddingLeft(),view.getPaddingTop());}
            return GlassGeometry.map(view,panel,current,true) && current.equals(region);
        }
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
            if(!trackOnly)material.unbindCallback();
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
        @Override public void getOutline(Outline outline){
            if(!surface.state.enabled||!surface.appearance.outline(surface.view,outline,getBounds()))super.getOutline(outline);
        }
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
            if(surface.trackOnly){
                View panel=surface.state.reference.get();
                try{
                    if(panel instanceof ViewGroup)surface.prepare((ViewGroup)panel);
                    surface.drawn=surface.drawMaterial(canvas);
                }catch(RuntimeException|LinkageError error){surface.drawn=false;}
                if(!surface.drawn)drawOriginal(canvas);
                return;
            }
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
