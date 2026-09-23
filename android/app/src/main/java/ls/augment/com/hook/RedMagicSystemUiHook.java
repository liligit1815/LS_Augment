package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.telephony.SubscriptionManager;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSchema;
import ls.augment.com.SystemUiOptions;

/** RedMagic SystemUI adapters. Native permission and signal data remain owned by SystemUI. */
final class RedMagicSystemUiHook {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<View, RootState> ROOTS = new WeakHashMap<>();
    private static final Map<View, PrivacyViewState> PRIVACY_VIEWS = new WeakHashMap<>();
    private static AugmentModule module;
    private static boolean observing;
    private static boolean installed;
    private RedMagicSystemUiHook() { }

    static synchronized int install(AugmentModule owner, ClassLoader loader) {
        if (installed) return 0;
        installed = true;
        module = owner;
        int count = 0;
        String privacyController = null;
        try {
            privacyController = SystemUiCompatibility.privacyController(loader).getName();
            owner.logFeatureInfo("PRIVACY_DOT_ADAPTER " + privacyController);
        } catch (ClassNotFoundException unavailable) { owner.logFeatureError("PRIVACY_DOT_ADAPTER", unavailable); }
        count += hook(loader, privacyController,
                new String[]{"initialize", "updateDotView", "updateDesignatedCorner"},
                (target, args, result) -> {
                    for (Object arg : args) if (arg instanceof View) rememberPrivacy((View) arg);
                    for (String[] names : new String[][]{{"topLeft", "tl"}, {"topRight", "tr"},
                            {"bottomLeft", "bl"}, {"bottomRight", "br"}}) {
                        Object corner = field(target, names);
                        if (corner instanceof View) rememberPrivacy((View) corner);
                    }
                    hidePrivacyViews();
                });
        count += hook(loader, privacyController,
                new String[]{"showDotView", "hideDotView"}, (target, args, result) -> {
                    if (args.length > 0 && args[0] instanceof View) rememberPrivacy((View) args[0]);
                });
        count += hook(loader, "com.android.systemui.privacy.OngoingPrivacyChip",
                new String[]{"setPrivacyList", "updateView", "setBoundsForAnimation"},
                (target, args, result) -> { if (target instanceof View) rememberPrivacy((View) target); });
        // The scheduler must receive every PrivacyEvent, including changes while hidden.
        // Suppressing an event loses the persistent-dot state until the next permission change.
        count += hook(loader, "com.android.systemui.statusbar.events.SystemStatusAnimationSchedulerImpl",
                new String[]{"onStatusEvent"}, (target, args, result) -> {
                    ensureObserver(FeatureSettings.from(target));
                    hidePrivacyViews();
                });
        // Animated chips live in a separate status-event window, outside the normal bar roots.
        count += hook(loader, "com.android.systemui.statusbar.events.SystemEventChipAnimationControllerImpl",
                new String[]{"prepareChipAnimation"}, (target, args, result) -> {
                    Object chip = field(target, "currentAnimatedView");
                    if (chip instanceof View && chip.getClass().getName().equals("com.android.systemui.privacy.OngoingPrivacyChip")) {
                        rememberPrivacy((View) chip);
                    }
                });
        count += suppress(loader, "com.android.systemui.volume.VolumeDialogImpl",
                new String[]{"showSafetyWarningH", "showCsdWarningH"}, SystemUiOptions.AUDIO_NO_SAFE_WARNING);
        count += suppress(loader, "com.zte.feature.volume.MfvVolumeDialogImpl",
                new String[]{"showSafetyWarningH", "showCsdWarningH"}, SystemUiOptions.AUDIO_NO_SAFE_WARNING);
        for (String type : new String[]{"com.android.systemui.statusbar.phone.PhoneStatusBarView",
                "com.android.systemui.statusbar.phone.KeyguardStatusBarView",
                "com.zte.controlcenter.widget.CCHeaderView"}) {
            count += hook(loader, type, new String[]{"onFinishInflate", "onAttachedToWindow"},
                    (target, args, result) -> { if (target instanceof ViewGroup) watch((ViewGroup) target); });
        }
        count += hook(loader, "com.android.systemui.util.NoRemeasureMotionLayout",new String[]{"onMeasure"},
                (target,args,result)->{if(target instanceof ViewGroup)watch((ViewGroup)target);});
        count += RedMagicLegacyUiHook.install(owner, loader);
        count += ControlCenterGridHook.install(owner, loader);
        count += RedMagicAdvancedUiHook.install(owner, loader);
        count += ControlCenterHeaderHook.install(owner, loader);
        count += NotificationWeatherHook.install(owner, loader);
        count += ControlCenterSliderPercentHook.install(owner, loader);
        count += QuickSettingsEditorHook.install(owner, loader);
        owner.logFeatureInfo("RM_SYSTEMUI_READY hooks=" + count);
        return count;
    }

    private interface After { void run(Object target, Object[] args, Object result) throws Throwable; }
    private static int hook(ClassLoader loader, String className, String[] names, After after) {
        if (className == null) return 0;
        int count = 0;
        try {
            Class<?> type = Class.forName(className, false, loader);
            for (Method method : type.getDeclaredMethods()) {
                if (!contains(names, method.getName()) || method.isSynthetic()) continue;
                if (className.startsWith("com.android.systemui.statusbar.events.PrivacyDotViewController")
                        && !SystemUiCompatibility.privacyMethod(method)) continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,
                        "rm.systemui." + className + "." + method.getName() + "." + method.getParameterCount(), false)
                        .intercept(chain -> {
                            Object result = chain.proceed();
                            try { after.run(chain.getThisObject(), chain.getArgs().toArray(), result); }
                            catch (Throwable error) { module.logFeatureError("RM_SYSTEMUI_CALLBACK_" + method.getName(), error); }
                            return result;
                        }));
                count++;
            }
        } catch (Throwable error) { module.logFeatureError("RM_SYSTEMUI_LOOKUP_" + className, error); }
        return count;
    }

    private static int suppress(ClassLoader loader, String className, String[] names, String key) {
        int count = 0;
        try {
            Class<?> type = Class.forName(className, false, loader);
            for (Method method : type.getDeclaredMethods()) {
                if (!contains(names, method.getName()) || method.getReturnType() != void.class || method.isSynthetic()) continue;
                method.setAccessible(true);
                module.registerFeatureHook(module.prepareFeatureHook(method,
                        "rm.systemui.suppress." + className + "." + method.getName(), false).intercept(chain -> {
                    Context context = FeatureSettings.from(chain.getThisObject());
                    if (FeatureSettings.enabled(context, key)) {
                        ensureObserver(context);
                        return null;
                    }
                    return chain.proceed();
                }));
                count++;
            }
        } catch (ClassNotFoundException ignored) { }
        catch (Throwable error) { module.logFeatureError("RM_SYSTEMUI_SUPPRESS_" + className, error); }
        return count;
    }

    private static void ensureObserver(Context context) {
        if (context == null || observing) return;
        observing = FeatureSettings.addSnapshotListener(context, () -> MAIN.post(() -> {
            hidePrivacyViews();
            for (RootState state : new ArrayList<>(ROOTS.values())) state.refresh(true);
        }));
    }

    private static void rememberPrivacy(View view) {
        if (Looper.myLooper() != Looper.getMainLooper()) { MAIN.post(() -> rememberPrivacy(view)); return; }
        ensureObserver(view.getContext());
        PrivacyViewState state = PRIVACY_VIEWS.get(view);
        if (state == null) {
            state = new PrivacyViewState();
            PRIVACY_VIEWS.put(view, state);
        }
        // Keep known views registered while disabled: an already-active dot can then be
        // hidden immediately on enable, without requiring another PrivacyEvent.
        state.apply(view, !RedMagicLegacyUiHook.positionSizeOnly(view.getContext())
                && FeatureSettings.enabled(view.getContext(), SystemUiOptions.PRIVACY_HIDE));
    }

    private static final class PrivacyViewState {
        boolean hidden;
        float transitionAlpha;

        void apply(View view, boolean enabled) {
            // View composes this multiplier with the OEM alpha animation. Keep alpha,
            // visibility and animation end actions intact so disabling restores the
            // current native state, including permission sessions that already ended.
            if (enabled) {
                if (!hidden) {
                    transitionAlpha = view.getTransitionAlpha();
                    hidden = true;
                }
                if (view.getTransitionAlpha() != 0f) view.setTransitionAlpha(0f);
            } else if (hidden) {
                view.setTransitionAlpha(transitionAlpha);
                hidden = false;
            }
        }
    }

    private static void hidePrivacyViews() {
        if (Looper.myLooper() != Looper.getMainLooper()) { MAIN.post(RedMagicSystemUiHook::hidePrivacyViews); return; }
        for (View view : new ArrayList<>(PRIVACY_VIEWS.keySet())) if (view != null) rememberPrivacy(view);
    }

    private static void watch(ViewGroup root) {
        if (ROOTS.containsKey(root)) return;
        ensureObserver(root.getContext());
        RootState state = new RootState(root);
        ROOTS.put(root, state);
        root.getViewTreeObserver().addOnPreDrawListener(state);
        root.addOnAttachStateChangeListener(state);
    }

    private static final class RootState implements ViewTreeObserver.OnPreDrawListener, View.OnAttachStateChangeListener {
        final WeakReference<ViewGroup> root;
        long checked;
        SignalPair pair;
        ConnectivityIconSource signalSource;
        RootState(ViewGroup view) { root = new WeakReference<>(view); }
        @Override public boolean onPreDraw() { refresh(false); return true; }
        void refresh(boolean forced) {
            ViewGroup view = root.get();
            if (view == null) return;
            if (!forced && SystemClock.uptimeMillis() - checked < 200) return;
            checked = SystemClock.uptimeMillis();
            try {
                boolean bar=view.getClass().getSimpleName().equals("PhoneStatusBarView")||view.getClass().getSimpleName().equals("KeyguardStatusBarView");
                boolean grid = FeatureSettings.enabled(view.getContext(), ConfigSchema.SYSTEMUI_MASTER);
                boolean positionOnly = grid && FeatureSettings.enabled(view.getContext(), ConfigSchema.STATUSBAR_POSITION_SIZE_ONLY);
                boolean circle = grid && !positionOnly && FeatureSettings.enabled(view.getContext(),ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP);
                boolean stack = bar && !positionOnly && !circle && FeatureSettings.enabled(view.getContext(), SystemUiOptions.SIGNAL_DUAL);
                if(stack&&signalSource==null)signalSource=new ConnectivityIconSource(view.getContext(),()->{
                    ViewGroup current=root.get();if(current!=null)current.post(()->{refresh(true);current.invalidate();});
                });
                if(!stack&&signalSource!=null){signalSource.close();signalSource=null;}
                boolean signalsReady=signalSource!=null&&signalSource.ready&&signalSource.state.sims.size()==2;
                ArrayList<View> mobiles = new ArrayList<>();
                scan(view, mobiles, 0);
                View one = null, two = null;
                for (View mobile : mobiles) {
                    int slot = slot(mobile);
                    if (slot == 0 && mobile.getVisibility() == View.VISIBLE) one = mobile;
                    if (slot == 1 && mobile.getVisibility() == View.VISIBLE) two = mobile;
                }
                if (!stack || !signalsReady || one == null || two == null || one.getParent() != two.getParent()) {
                    if (pair != null) { pair.restore(); pair = null; }
                } else {
                    if (pair == null || !pair.matches(one, two,signalSource)) {
                        if (pair != null) pair.restore();
                        pair = SignalPair.create(one, two,signalSource);
                    }
                    if (pair != null && !pair.apply(!grid)) { pair.restore(); pair = null; }
                }
            } catch (Throwable error) {
                if (pair != null) { pair.restore(); pair = null; }
                module.logFeatureError("RM_SIGNAL_LAYOUT", error);
            }
        }
        @Override public void onViewAttachedToWindow(View view) { refresh(true); }
        @Override public void onViewDetachedFromWindow(View view) {
            if (pair != null) pair.restore();
            if(signalSource!=null){signalSource.close();signalSource=null;}
            view.getViewTreeObserver().removeOnPreDrawListener(this);
            view.removeOnAttachStateChangeListener(this);
            ROOTS.remove(view);
        }
    }

    private static void scan(View view, ArrayList<View> mobiles, int depth) {
        if (depth > 18) return;
        String type = view.getClass().getName();
        String id = resourceName(view);
        RedMagicLegacyUiHook.applyView(view);
        RedMagicAdvancedUiHook.applyStatusBarFont(view);
        if (type.endsWith("ModernStatusBarMobileView")) mobiles.add(view);
        if (type.endsWith("OngoingPrivacyChip") || id.equals("privacy_dot")) rememberPrivacy(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) scan(group.getChildAt(i), mobiles, depth + 1);
        }
    }

    private static int slot(View view) {
        try {
            Object value = view.getClass().getMethod("getSubId").invoke(view);
            return value instanceof Integer ? SubscriptionManager.getSlotIndex((Integer) value) : -1;
        } catch (Throwable ignored) { return -1; }
    }

    // The grid and dual-SIM adapter must agree on visibility and content bounds.
    // Alpha and measured width are native inputs, not an inter-adapter protocol.
    static boolean isCollapsedSignal(View view) {
        for (RootState state : ROOTS.values()) if (state.pair != null && state.pair.collapsed == view) return true;
        return false;
    }

    static Rect stackedSignalBounds(View view) {
        for (RootState state : ROOTS.values()) if (state.pair != null && state.pair.anchor == view) {
            SignalStackLayout.Geometry geometry = state.pair.drawable.geometry();
            if (geometry == null) return null;
            Rect bounds = new Rect();
            new RectF(geometry.left, geometry.top, geometry.left + geometry.width,
                    geometry.top + geometry.height()).roundOut(bounds);
            return bounds;
        }
        return null;
    }

    static float stackedSignalRowHeight(View view) {
        for (RootState state : ROOTS.values()) if (state.pair != null && state.pair.anchor == view) {
            SignalStackLayout.Geometry geometry = state.pair.drawable.geometry();
            return geometry == null ? 0 : geometry.height();
        }
        return 0;
    }

    private static final class SignalPair {
        final View one, two;
        final ImageView first, second;
        final View anchor, collapsed;
        final ImageView anchorSignal;
        final int dataSubscription;
        float firstTransitionAlpha, secondTransitionAlpha;
        int secondWidth, secondMinimum;
        boolean widthCollapsed;
        final SignalDrawable drawable;
        SignalPair(View one, View two, ImageView first, ImageView second,ConnectivityIconSource source) {
            this.one = one; this.two = two; this.first = first; this.second = second;
            dataSubscription=source.state.sims.get(0).subscriptionId;
            Object secondId=subscription(two);
            boolean secondIsData=secondId instanceof Integer&&(Integer)secondId==dataSubscription;
            anchor=secondIsData?two:one;collapsed=secondIsData?one:two;anchorSignal=secondIsData?second:first;
            firstTransitionAlpha = anchorSignal.getTransitionAlpha(); secondTransitionAlpha = collapsed.getTransitionAlpha();
            secondWidth = collapsed.getLayoutParams().width; secondMinimum = collapsed.getMinimumWidth();
            drawable = new SignalDrawable(anchor, anchorSignal, first, second,source);
        }
        static SignalPair create(View one, View two,ConnectivityIconSource source) {
            View first = find(one, "mobile_signal"), second = find(two, "mobile_signal");
            if (!(first instanceof ImageView) || !(second instanceof ImageView)
                    || one.getLayoutParams() == null || two.getLayoutParams() == null
                    || ((ImageView) first).getDrawable() == null || ((ImageView) second).getDrawable() == null) return null;
            SignalPair pair = new SignalPair(one, two, (ImageView) first, (ImageView) second,source);
            if (!pair.canDraw()) return null;
            pair.anchor.getOverlay().add(pair.drawable);
            return pair;
        }
        boolean matches(View one, View two,ConnectivityIconSource source) {
            return this.one == one && this.two == two && find(one, "mobile_signal") == first
                    && find(two, "mobile_signal") == second
                    && dataSubscription == source.state.sims.get(0).subscriptionId;
        }
        boolean canDraw() {
            return first.getDrawable() != null && second.getDrawable() != null
                    && visibleWithin(first, one) && visibleWithin(second, two)
                    && drawable.geometry() != null;
        }
        private static boolean visibleWithin(View child, View owner) {
            for (View current = child; current != null; current = current.getParent() instanceof View
                    ? (View) current.getParent() : null) {
                if (current.getVisibility() != View.VISIBLE) return false;
                if (current == owner) return true;
            }
            return false;
        }
        boolean apply(boolean compactNativeWidth) {
            if (!canDraw()) return false;
            // Use a separate render multiplier: the grid and the OEM both own
            // alpha, and saving their temporary zero prevented signal restoration.
            if (anchorSignal.getTransitionAlpha() != 0) firstTransitionAlpha = anchorSignal.getTransitionAlpha();
            if (collapsed.getTransitionAlpha() != 0) secondTransitionAlpha = collapsed.getTransitionAlpha();
            anchorSignal.setTransitionAlpha(0);
            collapsed.setTransitionAlpha(0);
            if (compactNativeWidth) {
                ViewGroup.LayoutParams params = collapsed.getLayoutParams();
                if (!widthCollapsed) {
                    secondWidth = params.width;
                    secondMinimum = collapsed.getMinimumWidth();
                    widthCollapsed = true;
                } else if (params.width != 0) secondWidth = params.width;
                if (collapsed.getMinimumWidth() != 0) collapsed.setMinimumWidth(0);
                if (params.width != 0) { params.width = 0; collapsed.setLayoutParams(params); }
            } else {
                restoreWidth();
            }
            drawable.setBounds(0, 0, anchor.getWidth(), anchor.getHeight());
            drawable.invalidateSelf();
            return true;
        }
        void restore() {
            anchor.getOverlay().remove(drawable);
            if (anchorSignal.getTransitionAlpha() == 0) anchorSignal.setTransitionAlpha(firstTransitionAlpha);
            if (collapsed.getTransitionAlpha() == 0) collapsed.setTransitionAlpha(secondTransitionAlpha);
            restoreWidth();
            anchor.requestLayout();
            collapsed.requestLayout();
            anchor.invalidate();
            collapsed.invalidate();
        }
        void restoreWidth() {
            if (!widthCollapsed) return;
            if (collapsed.getMinimumWidth() == 0) collapsed.setMinimumWidth(secondMinimum);
            if (collapsed.getLayoutParams() != null && collapsed.getLayoutParams().width == 0) {
                ViewGroup.LayoutParams params = collapsed.getLayoutParams(); params.width = secondWidth; collapsed.setLayoutParams(params);
            }
            widthCollapsed = false;
        }
        private static Object subscription(View view) {
            try { return view.getClass().getMethod("getSubId").invoke(view); }
            catch (ReflectiveOperationException ignored) { return field(view, "subId"); }
        }
    }

    /** Compact bars use real per-subscription levels and follow the native icon tint. */
    private static final class SignalDrawable extends Drawable {
        final View owner;
        final ImageView position, first, second;
        final ConnectivityIconSource source;
        final ls.augment.com.CompactSignalPainter painter=new ls.augment.com.CompactSignalPainter();
        SignalDrawable(View owner,ImageView position,ImageView first,ImageView second,ConnectivityIconSource source){this.owner=owner;this.position=position;this.first=first;this.second=second;this.source=source;}
        SignalStackLayout.Geometry geometry() {
            if (!(owner instanceof ViewGroup) || position.getDrawable() == null
                    || position.getWidth() <= 0 || position.getHeight() <= 0) return null;
            RectF ink = new RectF(position.getDrawable().getBounds());
            if (ink.isEmpty()) {
                int width = position.getDrawable().getIntrinsicWidth();
                int height = position.getDrawable().getIntrinsicHeight();
                ink.set(0, 0, width > 0 ? width : position.getWidth(), height > 0 ? height : position.getHeight());
            }
            position.getImageMatrix().mapRect(ink);
            Rect origin = new Rect(0, 0, 0, 0);
            ((ViewGroup) owner).offsetDescendantRectToMyCoords(position, origin);
            ink.offset(origin.left + position.getPaddingLeft(), origin.top + position.getPaddingTop());
            return SignalStackLayout.compact(ink.left, ink.top, ink.width(), ink.height(),
                    owner.getWidth(), owner.getHeight(), owner.getResources().getDisplayMetrics().density);
        }
        @Override public void draw(Canvas canvas) {
            if (first.getDrawable() == null || second.getDrawable() == null) return;
            SignalStackLayout.Geometry geometry = geometry();
            if (geometry == null) return;
            ls.augment.com.ConnectivityIconState state=source.state;
            painter.draw(canvas,geometry.left,geometry.top,geometry.width,geometry.height(),
                    state.litDots(0),state.litDots(1),state.barCount(0),state.barCount(1),2,tint(),28);
        }
        private int tint(){
            if(position.getImageTintList()!=null)return position.getImageTintList().getColorForState(position.getDrawableState(),0xffffffff);
            ColorFilter filter=position.getDrawable().getColorFilter();
            if(filter instanceof android.graphics.PorterDuffColorFilter)try{return (Integer)filter.getClass().getMethod("getColor").invoke(filter);}catch(ReflectiveOperationException ignored){}
            if(filter instanceof android.graphics.BlendModeColorFilter)return ((android.graphics.BlendModeColorFilter)filter).getColor();
            View root=owner;while(root.getParent() instanceof View&&!StatusBarGridHook.isBarRoot(root))root=(View)root.getParent();
            View label=find(root,"clock");if(!(label instanceof android.widget.TextView))label=find(root,"keyguard_carrier_text");
            return label instanceof android.widget.TextView?((android.widget.TextView)label).getCurrentTextColor():0xffffffff;
        }
        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static View find(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }
    private static String resourceName(View view) {
        try { return view.getResources().getResourceEntryName(view.getId()); }
        catch (Throwable ignored) { return ""; }
    }
    private static Object field(Object owner, String... names) {
        if (owner == null) return null;
        for (String name : names) for (Class<?> type = owner.getClass(); type != null; type = type.getSuperclass()) {
            try { java.lang.reflect.Field field = type.getDeclaredField(name); field.setAccessible(true); return field.get(owner); }
            catch (Throwable ignored) { }
        }
        return null;
    }
    private static boolean contains(String[] names, String name) {
        for (String value : names) if (value.equals(name)) return true;
        return false;
    }
}
