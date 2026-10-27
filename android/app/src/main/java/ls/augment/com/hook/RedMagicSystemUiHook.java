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
        count += suppress(loader, "com.zte.feature.volume.VolumeDialogImpl",
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
        count += DualSignalTint.install(owner, loader);
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
        StatusBarAssetsHook.privacy(view);
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
        StatusBarAssetsHook.watch(root);
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
        CapacityBlock capacityBlock;
        ConnectivityIconSource signalSource;
        RootState(ViewGroup view) { root = new WeakReference<>(view); }
        @Override public boolean onPreDraw() { refresh(false); return true; }
        void refresh(boolean forced) {
            ViewGroup view = root.get();
            if (view == null) return;
            if (!forced && SystemClock.uptimeMillis() - checked < 200 && (pair==null||!pair.needsRefresh())) return;
            checked = SystemClock.uptimeMillis();
            try {
                String rootType=view.getClass().getSimpleName();
                boolean bar=rootType.equals("PhoneStatusBarView")||rootType.equals("KeyguardStatusBarView")
                        ||rootType.equals("CCHeaderView")||rootType.equals("NoRemeasureMotionLayout");
                boolean grid = StatusBarGridHook.configuredIconLayout(view);
                boolean circle = StatusBarGridHook.ownsConnectivityReplacement(view);
                // Dual SIM is an explicit icon option, including with the native preset.
                boolean stack = bar && !circle && FeatureSettings.enabled(view.getContext(), SystemUiOptions.SIGNAL_DUAL);
                if(stack&&signalSource==null)signalSource=new ConnectivityIconSource(view.getContext(),()->{
                    ViewGroup current=root.get();if(current!=null)current.post(()->{refresh(true);current.invalidate();});
                });
                if(!stack&&signalSource!=null){signalSource.close();signalSource=null;}
                boolean signalsReady=signalSource!=null&&signalSource.ready&&!signalSource.state.sims.isEmpty();
                ArrayList<View> mobiles = new ArrayList<>();
                scan(view, mobiles, 0);
                View one = null, two = null;
                for (View mobile : mobiles) {
                    int slot = slot(mobile);
                    if (slot == 0 && mobile.getVisibility() == View.VISIBLE) one = mobile;
                    if (slot == 1 && mobile.getVisibility() == View.VISIBLE) two = mobile;
                }
                if(one==null){one=two;two=null;}
                if (!stack || !signalsReady || one == null || two!=null&&one.getParent() != two.getParent()) {
                    if(capacityBlock!=null){capacityBlock.failed.publish("disabled");capacityBlock.close();capacityBlock=null;}
                    if (pair != null) { pair.restore(); pair = null; }
                } else {
                    if(capacityBlock!=null){
                        if(capacityBlock.matches(view,one,two,signalSource)){capacityBlock.failed.publish("capacity");return;}
                        capacityBlock.close();capacityBlock=null;
                    }
                    if (pair == null || !pair.matches(one, two,signalSource)) {
                        if (pair != null) {pair.restore();pair=null;}
                        // restore() returns width ownership immediately, but measured
                        // sizes still describe the old composite until native layout.
                        if(SignalPair.nativeLayoutSettled(one,two))pair=SignalPair.create(one,two,signalSource);
                        else checked=SystemClock.uptimeMillis()-200;
                    }
                    if (pair != null && !pair.apply(!grid)) {
                        SignalPair failed=pair;failed.restore();pair=null;
                        if(failed.stopReason.equals("capacity"))capacityBlock=new CapacityBlock(view,failed);
                    }
                }
                // Re-evaluate native local contrast after the composite's final
                // allocation, including the native preset without a grid transform.
                StatusBarTintHook.refresh(view);
            } catch (Throwable error) {
                if (pair != null) { pair.restore(); pair = null; }
                module.logFeatureError("RM_SIGNAL_LAYOUT", error);
            }
        }
        @Override public void onViewAttachedToWindow(View view) { refresh(true); }
        @Override public void onViewDetachedFromWindow(View view) {
            if (pair != null) pair.restore();
            if(capacityBlock!=null){capacityBlock.failed.publish("disabled");capacityBlock.close();capacityBlock=null;}
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
        RedMagicAdvancedUiHook.applyNativeNotificationIcon(view);
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
        for (RootState state : ROOTS.values()) if (state.pair != null && state.pair.drawable.readyToDraw && state.pair.collapsed == view) return true;
        return false;
    }

    /** Native foreground palette changes repaint the independent overlay immediately. */
    static void signalTintChanged(View mobile) {
        for(RootState state:new ArrayList<>(ROOTS.values())){
            SignalPair pair=state.pair;
            if(pair!=null&&(pair.one==mobile||pair.two==mobile)){
                pair.drawable.invalidateSelf();pair.anchor.invalidate();
            }
        }
    }

    static Rect stackedSignalBounds(View view) {
        for (RootState state : ROOTS.values()) if (state.pair != null && state.pair.drawable.readyToDraw && state.pair.anchor == view) {
            return state.pair.drawable.contentBounds();
        }
        return null;
    }

    /** A hidden OEM child and its virtual glyph must never both consume IS1. */
    static boolean ownsStackedChildBoundary(View view){
        for(RootState state:ROOTS.values()){
            SignalPair pair=state.pair!=null?state.pair:state.capacityBlock==null?null:state.capacityBlock.failed;
            if(pair==null)continue;
            for(View at=view;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
                if(at==pair.anchor||at==pair.collapsed)return at!=view;
            }
        }
        return false;
    }
    static void prepareStackedGrid(View view,float glyphScale){
        for(RootState state:ROOTS.values())if(state.pair!=null&&state.pair.anchor==view)
            state.pair.drawable.gridScale=Float.isFinite(glyphScale)&&glyphScale>0?glyphScale:1;
    }
    static void stackedGridRejected(View root){
        for(RootState state:ROOTS.values())if(state.pair!=null){
            for(View at=state.pair.anchor;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)
                if(at==root){SignalPair failed=state.pair;failed.restore("capacity");state.pair=null;
                    ViewGroup owner=state.root.get();if(owner!=null)state.capacityBlock=new CapacityBlock(owner,failed);break;}
        }
    }
    static void stackedGridBudget(View view,long signature,ls.augment.com.DualSignalSpacingObservation.Fits fits){
        for(RootState state:ROOTS.values())if(state.pair!=null&&state.pair.anchor==view)state.pair.gridBudget(signature,fits);
    }
    static boolean spacedStack(View view){
        for(RootState state:ROOTS.values())if(state.pair!=null&&state.pair.anchor==view){
            SignalDrawable drawable=state.pair.drawable;
            SignalStackLayout.Geometry g=drawable.geometry();
            ls.augment.com.DualSignalLayout layout=g==null?null:drawable.layout(g);
            return layout!=null&&layout.plan.hasSpacing;
        }
        return false;
    }
    static float stackedSignalRowHeight(View view) {
        for (RootState state : ROOTS.values()) if (state.pair != null && state.pair.drawable.readyToDraw && state.pair.anchor == view) {
            SignalStackLayout.Geometry geometry = state.pair.drawable.geometry();
            return geometry == null ? 0 : geometry.height();
        }
        return 0;
    }

    /** One failed-input latch per observed bar; never retry an unchanged overflow. */
    private static final class CapacityBlock {
        final SignalPair failed;final String inputs;String restoredShape;
        final ViewTreeObserver observer;long layoutEpoch;
        final ViewTreeObserver.OnGlobalLayoutListener nativeLayout=()->layoutEpoch++;
        CapacityBlock(ViewGroup root,SignalPair failed){
            this.failed=failed;inputs=inputs(root,failed.drawable.source);
            observer=root.getViewTreeObserver();observer.addOnGlobalLayoutListener(nativeLayout);
        }
        boolean matches(ViewGroup root,View one,View two,ConnectivityIconSource source){
            if(one!=failed.one||two!=failed.two||!inputs.equals(inputs(root,source)))return false;
            // restore() has requested native measure/layout. In particular, a
            // WRAP_CONTENT host can still report our expanded measured width.
            // It is not an external input change until the native pass finishes.
            if(restoredShape==null){
                if(layoutEpoch==0||root.isLayoutRequested()||!failed.layoutSettled())return true;
                restoredShape=shape(root);close();return true;
            }
            return restoredShape.equals(shape(root));
        }
        void close(){if(observer.isAlive())observer.removeOnGlobalLayoutListener(nativeLayout);}
        private String inputs(ViewGroup root,ConnectivityIconSource source){
            StringBuilder out=new StringBuilder(FeatureSettings.snapshot(root.getContext()).checksum);
            out.append(':').append(StatusBarGridHook.configuredIconLayout(root)).append(':').append(root.getWidth()).append('x').append(root.getHeight());
            out.append(':').append(root.getResources().getConfiguration()).append(':').append(root.getLayoutDirection());
            if(root.getDisplay()!=null)out.append(':').append(root.getDisplay().getRotation());
            out.append(':').append(source.state.activeDataSubscription);
            for(ls.augment.com.ConnectivityIconState.Sim sim:source.state.sims)out.append('/').append(sim.subscriptionId).append(',').append(sim.slot);
            out.append(':').append(StatusBarAssetsHook.virtualWholeReady(failed.anchor,"dual_signal"));
            return out.toString();
        }
        private static String shape(ViewGroup root){StringBuilder out=new StringBuilder();append(root,out,0,new int[]{0});return out.toString();}
        private static void append(View view,StringBuilder out,int depth,int[] count){
            if(depth>18||count[0]++>512)return;
            ViewGroup.LayoutParams p=view.getLayoutParams();
            int width=p!=null&&p.width>0?p.width:view.getMeasuredWidth(),height=p!=null&&p.height>0?p.height:view.getMeasuredHeight();
            out.append('|').append(System.identityHashCode(view)).append(':').append(view.getVisibility()).append(':').append(width).append('x').append(height);
            out.append(':').append(view.getPaddingLeft()).append(',').append(view.getPaddingTop()).append(',').append(view.getPaddingRight()).append(',').append(view.getPaddingBottom());
            if(p instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)p;out.append(':').append(m.getMarginStart()).append(',').append(m.topMargin).append(',').append(m.getMarginEnd()).append(',').append(m.bottomMargin);}
            if(p instanceof android.widget.FrameLayout.LayoutParams)out.append(':').append(((android.widget.FrameLayout.LayoutParams)p).gravity);
            if(view instanceof ImageView){ImageView image=(ImageView)view;Drawable d=image.getDrawable();if(d!=null)out.append(':').append(d.getIntrinsicWidth()).append('x').append(d.getIntrinsicHeight()).append(':').append(d.getBounds());out.append(':').append(image.getImageMatrix());}
            if(view instanceof android.widget.TextView){android.widget.TextView text=(android.widget.TextView)view;android.text.Layout layout=text.getLayout();out.append(':').append(text.getTextSize());if(layout!=null){out.append(':').append(layout.getHeight());for(int i=0;i<layout.getLineCount();i++)out.append(',').append(layout.getLineWidth(i));}}
            if(view instanceof ViewGroup)for(int i=0;i<((ViewGroup)view).getChildCount();i++)append(((ViewGroup)view).getChildAt(i),out,depth+1,count);
        }
    }

    private static final class SignalPair {
        final View one, two;
        private static final Map<View,WeakReference<SignalPair>> OWNERS=new WeakHashMap<>();
        final ImageView first, second;
        final View anchor, collapsed;
        final ImageView anchorSignal;
        float firstTransitionAlpha, secondTransitionAlpha;
        int secondWidth, secondMinimum;
        boolean widthCollapsed;
        int anchorWidth,appliedAnchorWidth,nativeWidthBudget;
        long layoutEpoch,nativeWait=-1,ownedWait=-1;
        String nativeSignature="",planSignature="";
        final ViewTreeObserver observer;
        final ViewTreeObserver.OnGlobalLayoutListener nativeLayout=()->layoutEpoch++;
        boolean closed;
        String restoreFailure="";
        long generation,budgetSignature=Long.MIN_VALUE,publishedAt;
        int budgetWidth,budgetHeight;String stopReason="disabled";String published="",environmentChecksum="",environmentKey="";
        boolean widthExpanded;
        final Map<View,Float> badges=new WeakHashMap<>();
        final SignalDrawable drawable;
        SignalPair(View one, View two, ImageView first, ImageView second,ConnectivityIconSource source) {
            this.one = one; this.two = two; this.first = first; this.second = second;
            // RootState selects one/two by physical slot, independently of the
            // currently active data subscription. Only activity moves between rows.
            anchor=one;collapsed=two;anchorSignal=first;
            DualSignalTint.watch(one,first);if(two!=null)DualSignalTint.watch(two,second);
            firstTransitionAlpha = anchorSignal.getTransitionAlpha(); secondTransitionAlpha = collapsed==null?1:collapsed.getTransitionAlpha();
            secondWidth = collapsed==null?0:collapsed.getLayoutParams().width; secondMinimum = collapsed==null?0:collapsed.getMinimumWidth();
            drawable = new SignalDrawable(anchor, collapsed,anchorSignal, first, second,source);
            drawable.invalidIdentity=()->{
                for(RootState state:ROOTS.values())if(state.pair==this){restore(drawable.fallbackReason);state.pair=null;return;}
            };
            anchorWidth=anchor.getLayoutParams().width;
            nativeWidthBudget=anchor.getMeasuredWidth()+(collapsed==null?0:collapsed.getMeasuredWidth());
            observer=anchor.getViewTreeObserver();observer.addOnGlobalLayoutListener(nativeLayout);
        }
        static SignalPair create(View one, View two,ConnectivityIconSource source) {
            if(occupied(one)||occupied(two))return null;
            View first = find(one, "mobile_signal"), second = two==null?null:find(two, "mobile_signal");
            if (!(first instanceof ImageView) || two!=null&&!(second instanceof ImageView)
                    || one.getLayoutParams() == null || two!=null&&two.getLayoutParams() == null
                    || ((ImageView) first).getDrawable() == null || second!=null&&((ImageView) second).getDrawable() == null) return null;
            SignalPair pair = new SignalPair(one, two, (ImageView) first, (ImageView) second,source);
            OWNERS.put(one,new WeakReference<>(pair));if(two!=null)OWNERS.put(two,new WeakReference<>(pair));
            try{
                if (!pair.canDraw()){pair.restore(DualSignalTint.color(one,(ImageView)first)==null?"tint_unknown":"slot_unknown");return null;}
                pair.anchor.getOverlay().add(pair.drawable);
                return pair;
            }catch(RuntimeException failure){pair.restore("create_failed");throw failure;}
        }
        private static boolean occupied(View view){
            WeakReference<SignalPair> ref=OWNERS.get(view);SignalPair pair=ref==null?null:ref.get();
            return pair!=null&&!pair.closed;
        }
        private void releaseOwner(View view){
            WeakReference<SignalPair> ref=OWNERS.get(view);if(ref!=null&&ref.get()==this)OWNERS.remove(view);
        }
        boolean matches(View one, View two,ConnectivityIconSource source) {
            return this.one == one && this.two == two && find(one, "mobile_signal") == first
                    && (two==null||find(two, "mobile_signal") == second);
        }
        boolean canDraw() {
            return first.getDrawable() != null && (second==null||second.getDrawable() != null)
                    && visibleWithin(first, one) && (second==null||visibleWithin(second, two))
                    && drawable.geometry() != null && DualSignalTint.color(anchor,anchorSignal)!=null
                    && drawable.artworkReady();
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
            if(closed)return false;
            long beforeLayout=layoutEpoch;
            boolean released=StatusBarIconLayoutHook.releaseStackedChildBoundaries(anchor);
            if(collapsed!=null)released|=StatusBarIconLayoutHook.releaseStackedChildBoundaries(collapsed);
            StatusBarIconLayoutHook.refreshComposite(anchor);
            if(collapsed!=null)StatusBarIconLayoutHook.refreshComposite(collapsed);
            if(released){beginNativeLayout(beforeLayout);return true;}
            if(nativeWait>=0){
                if(layoutEpoch<=nativeWait||!layoutSettled())return true;
                drawable.reference=drawable.nativeGeometry();
                nativeWidthBudget=anchor.getMeasuredWidth()+(collapsed==null?0:collapsed.getMeasuredWidth());
                nativeSignature=drawable.inputs();nativeWait=-1;generation++;budgetSignature=Long.MIN_VALUE;
            }
            if(ownedWait>=0){
                if(layoutEpoch<=ownedWait||!layoutSettled())return true;
                // The just-completed host-width change belongs to this adapter.
                // Record its native child positions without enlarging the glyph.
                nativeSignature=drawable.inputs();ownedWait=-1;generation++;
            }
            if(drawable.readyToDraw&&!nativeSignature.equals(drawable.inputs())){
                beginNativeLayout(layoutEpoch);return true;
            }
            if(!canDraw()){if(DualSignalTint.color(anchor,anchorSignal)==null)stopReason="tint_unknown";return false;}
            if(compactNativeWidth)drawable.gridScale=1;
            drawable.refresh();
            Rect planned=drawable.contentBounds();
            if(planned==null){stopReason="slot_unknown";return false;}
            if(compactNativeWidth&&drawable.layout(drawable.geometry())!=null&&drawable.layout(drawable.geometry()).plan.hasSpacing&&!nativeSpace(planned)){
                budgetWidth=Math.max(0,nativeWidthBudget-anchor.getPaddingRight()-(int)Math.floor(drawable.geometry().left));
                budgetHeight=Math.max(0,anchor.getHeight()-(int)Math.floor(drawable.geometry().top));stopReason="capacity";publish("capacity");
                FeatureSettings.diagnostic(anchor.getContext(),"ls_augment_dual_signal_spacing_runtime","native_fallback:space_insufficient");
                return false;
            }
            boolean wroteLayout=false;
            for(String id:new String[]{"mobile_type","mobile_volte","mobile_ims","mobile_roaming","mobile_roaming_large","data_inout","mobile_in","mobile_out"}){
                View badge=find(anchor,id);if(badge==null)continue;
                if(!badges.containsKey(badge)||badge.getTransitionAlpha()!=0)badges.put(badge,badge.getTransitionAlpha());
                badge.setTransitionAlpha(0);
            }
            Rect bounds=drawable.contentBounds();
            if(bounds!=null){
                int desired=Math.max(1,bounds.right+anchor.getPaddingRight());
                ViewGroup.LayoutParams params=anchor.getLayoutParams();
                if(params.width!=desired){if(!widthExpanded||params.width!=appliedAnchorWidth)anchorWidth=params.width;params.width=desired;appliedAnchorWidth=desired;anchor.setLayoutParams(params);widthExpanded=true;wroteLayout=true;}
            }
            // Use a separate render multiplier: the grid and the OEM both own
            // alpha, and saving their temporary zero prevented signal restoration.
            if (anchorSignal.getTransitionAlpha() != 0) firstTransitionAlpha = anchorSignal.getTransitionAlpha();
            if (collapsed!=null&&collapsed.getTransitionAlpha() != 0) secondTransitionAlpha = collapsed.getTransitionAlpha();
            anchorSignal.setTransitionAlpha(0);
            if(collapsed!=null)collapsed.setTransitionAlpha(0);
            if (compactNativeWidth&&collapsed!=null) {
                ViewGroup.LayoutParams params = collapsed.getLayoutParams();
                if (!widthCollapsed) {
                    secondWidth = params.width;
                    secondMinimum = collapsed.getMinimumWidth();
                    widthCollapsed = true;
                } else if (params.width != 0) secondWidth = params.width;
                if (collapsed.getMinimumWidth() != 0){collapsed.setMinimumWidth(0);wroteLayout=true;}
                if (params.width != 0) { params.width = 0; collapsed.setLayoutParams(params);wroteLayout=true; }
            } else {
                if(widthCollapsed)wroteLayout=true;
                restoreWidth();
            }
            if(wroteLayout){
                ownedWait=layoutEpoch;
                // A live badge (4G / 5G / 5G+) may require a wider host. Its
                // vertical calibration has not changed: keep the accepted
                // overlay and suppression until that owned width settles.
                // First acquisition still waits with the original icons visible.
                if(!drawable.readyToDraw)showNative();
                anchor.requestLayout();publish("awaiting_layout");return true;
            }
            nativeSignature=drawable.inputs();planSignature=drawable.planInputs();
            drawable.readyToDraw=true;
            if(compactNativeWidth){
                budgetWidth=Math.max(0,nativeWidthBudget-anchor.getPaddingRight()-(int)Math.floor(drawable.geometry().left));
                budgetHeight=Math.max(0,anchor.getHeight()-(int)Math.floor(drawable.geometry().top));publish("ok");
            }else publish(budgetSignature==Long.MIN_VALUE?"grid_pending":"ok");
            drawable.setBounds(0, 0, anchor.getWidth(), anchor.getHeight());
            drawable.invalidateSelf();
            return true;
        }
        boolean needsRefresh(){return !closed&&(nativeWait>=0||ownedWait>=0
                ||!nativeSignature.equals(drawable.inputs())||!planSignature.equals(drawable.planInputs()));}
        static boolean nativeLayoutSettled(View one,View two){
            for(View stop:new View[]{one,two})if(stop!=null){
                View child=find(stop,"mobile_signal");if(child==null)child=stop;
                for(View at=child;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null){
                    if(at.isLayoutRequested())return false;if(at==stop)break;
                }
            }
            return true;
        }
        boolean layoutSettled(){return nativeLayoutSettled(one,two);}
        void showNative(){
            drawable.readyToDraw=false;
            for(Map.Entry<View,Float> e:badges.entrySet())if(e.getKey().getTransitionAlpha()==0)e.getKey().setTransitionAlpha(e.getValue());
            badges.clear();
            if(anchorSignal.getTransitionAlpha()==0)anchorSignal.setTransitionAlpha(firstTransitionAlpha);
            if(collapsed!=null&&collapsed.getTransitionAlpha()==0)collapsed.setTransitionAlpha(secondTransitionAlpha);
        }
        void restoreAnchorWidth(){
            if(widthExpanded&&anchor.getLayoutParams()!=null){ViewGroup.LayoutParams params=anchor.getLayoutParams();
                if(params.width==appliedAnchorWidth){params.width=anchorWidth;anchor.setLayoutParams(params);}widthExpanded=false;}
        }
        void beginNativeLayout(long beforeLayout){
            showNative();restoreAnchorWidth();restoreWidth();
            nativeWait=beforeLayout;ownedWait=-1;drawable.reference=null;
            anchor.requestLayout();if(collapsed!=null)collapsed.requestLayout();publish("awaiting_layout");
        }
        void gridBudget(long signature,ls.augment.com.DualSignalSpacingObservation.Fits fits){
            if(!drawable.readyToDraw||drawable.geometry()==null)return;
            if(signature!=budgetSignature){
                ls.augment.com.DualSignalSpacingObservation input=observation("grid_pending");if(input==null)return;
                int[] zero=input.required(ls.augment.com.StatusBarIconSpacingSpec.empty());if(zero==null)return;
                // Keep a currently accepted saved rule inside its conservative
                // envelope; independent maxima must not label live geometry invalid.
                Rect current=drawable.contentBounds();int baseW=zero[0],baseH=zero[1];
                if(current!=null&&fits.test(current.width(),current.height())){baseW=Math.max(baseW,current.width());baseH=Math.max(baseH,current.height());}
                int[] envelope=ls.augment.com.DualSignalSpacingObservation.envelope(baseW,baseH,zero[0]+(int)Math.ceil(288*input.units()+36*input.referenceHeight/85),zero[1]+(int)Math.ceil(96*input.units()),fits);
                budgetWidth=envelope[0];budgetHeight=envelope[1];budgetSignature=signature;generation++;
            }
            Rect b=drawable.contentBounds();publish(b!=null&&fits.test(b.width(),b.height())?"ok":"capacity");
        }
        ls.augment.com.DualSignalSpacingObservation observation(String reason){
            if(anchor.getDisplay()==null)return null;String surface=StatusBarAssetsHook.surfaceFor(anchor);
            if(!ls.augment.com.StatusBarSurfaceSpec.valid(surface))return null;
            ls.augment.com.ConfigSnapshot snapshot=FeatureSettings.snapshot(anchor.getContext());
            if(!environmentChecksum.equals(snapshot.checksum)){environmentChecksum=snapshot.checksum;environmentKey=ls.augment.com.DualSignalSpacingObservation.environment(snapshot.values());}
            long now=SystemClock.elapsedRealtime();ls.augment.com.StatusBarHeaderSpacingObservation profile=new ls.augment.com.StatusBarHeaderSpacingObservation(System.currentTimeMillis()-now,now,ls.augment.com.BuildConfig.VERSION_CODE,anchor.getDisplay().getDisplayId(),anchor.getDisplay().getRotation(),Math.round(anchor.getResources().getDisplayMetrics().density*1000),Math.round(anchor.getResources().getConfiguration().fontScale*1000),anchor.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL?1:0,0);
            SignalStackLayout.Geometry g=drawable.geometry();ls.augment.com.ConnectivityIconState.Sim a=drawable.rowSim(anchor),b=drawable.rowSim(collapsed);
            boolean measured=g!=null&&a!=null&&a.slot>=0&&a.slot<=1&&(collapsed==null||b!=null&&b.slot>=0&&b.slot<=1&&b.slot!=a.slot);
            int[] slots=measured?(b==null?new int[]{a.slot}:new int[]{a.slot,b.slot}):new int[0];
            float[][] aspects=!measured?new float[0][3]:b==null?new float[][]{drawable.badgeAspects(false)}:new float[][]{drawable.badgeAspects(false),drawable.badgeAspects(true)};
            int active=!measured?-1:a.subscriptionId==drawable.source.state.activeDataSubscription?0:b!=null&&b.subscriptionId==drawable.source.state.activeDataSubscription?1:-1;
            boolean whole=measured&&StatusBarAssetsHook.virtualWholeReady(anchor,"dual_signal");
            if(!measured&&!reason.equals("disabled")&&!reason.equals("awaiting_layout"))reason="slot_unknown";
            if(whole&&reason.equals("ok"))reason="whole_covered";
            if(!FeatureSettings.enabled(anchor.getContext(),ConfigSchema.SYSTEMUI_MASTER)||RedMagicLegacyUiHook.positionSizeOnly(anchor.getContext()))reason="disabled";
            if(StatusBarAssetsHook.isHidden(anchor,"dual_signal"))reason="native_hidden";
            for(View at=anchor;at!=null;at=at.getParent() instanceof View?(View)at.getParent():null)if(at.getVisibility()!=View.VISIBLE){reason="native_hidden";break;}
            return new ls.augment.com.DualSignalSpacingObservation(profile,surface,environmentKey,reason,generation,slots,aspects,active,drawable.activity,whole,g==null?0:g.height(),drawable.gridScale,g==null?0:g.left,g==null?0:g.top,budgetWidth,budgetHeight,drawable.iosStyle());
        }
        void publish(String reason){
            ls.augment.com.DualSignalSpacingObservation current=observation(reason);if(current==null)return;
            String raw=current.serialize();String stable=raw.substring(0,raw.lastIndexOf(';'))+";env="+current.profile.build+":"+current.profile.display+":"+current.profile.rotation+":"+current.profile.densityMilli+":"+current.profile.fontMilli+":"+current.profile.rtl;long now=SystemClock.elapsedRealtime();
            if(stable.equals(published)&&now-publishedAt<30000)return;published=stable;publishedAt=now;
            FeatureSettings.diagnostic(anchor.getContext(),ls.augment.com.DualSignalSpacingObservation.key(current.surface,current.profile.rotation),raw);
        }
        boolean nativeSpace(Rect bounds){
            // Consume only the allocation already owned by the two replaced
            // native SIMs. Do not guess OEM spacing or borrow a neighbour's slot.
            if(!(anchor.getParent() instanceof ViewGroup))return false;
            if(bounds.top<0||bounds.bottom>anchor.getHeight())return false;
            return bounds.right+anchor.getPaddingRight()<=nativeWidthBudget;
        }
        void restore(){restore(stopReason);}
        void restore(String reason) {
            if(closed)return;
            // Close before any callback or diagnostic can re-enter this pair.
            closed=true;drawable.readyToDraw=false;drawable.invalidIdentity=null;
            cleanup("tint_first",()->DualSignalTint.unwatch(one));
            if(two!=null)cleanup("tint_second",()->DualSignalTint.unwatch(two));
            cleanup("observer",()->{if(observer.isAlive())observer.removeOnGlobalLayoutListener(nativeLayout);});
            for(Map.Entry<View,Float> entry:new ArrayList<>(badges.entrySet()))cleanup("badge",()->{
                View badge=entry.getKey();if(badge!=null&&badge.getTransitionAlpha()==0)badge.setTransitionAlpha(entry.getValue());
            });
            badges.clear();
            cleanup("signal_alpha",()->{if(anchorSignal.getTransitionAlpha()==0)anchorSignal.setTransitionAlpha(firstTransitionAlpha);});
            if(collapsed!=null)cleanup("second_alpha",()->{if(collapsed.getTransitionAlpha()==0)collapsed.setTransitionAlpha(secondTransitionAlpha);});
            cleanup("overlay",()->anchor.getOverlay().remove(drawable));
            cleanup("anchor_width",this::restoreAnchorWidth);
            cleanup("second_width",this::restoreWidth);
            cleanup("anchor_layout",()->{anchor.requestLayout();anchor.invalidate();});
            if(collapsed!=null)cleanup("second_layout",()->{collapsed.requestLayout();collapsed.invalidate();});
            releaseOwner(one);releaseOwner(two);
            // Evidence collection must never prevent native state from being restored.
            cleanup("publish",()->publish(reason));
            if(!restoreFailure.isEmpty())try{FeatureSettings.diagnostic(anchor.getContext(),
                    "ls_augment_dual_signal_restore_error",restoreFailure);}catch(RuntimeException|LinkageError ignored){ }
        }
        private void cleanup(String phase,Runnable action){
            try{action.run();}catch(RuntimeException|LinkageError failure){
                if(restoreFailure.length()<1024)restoreFailure+=phase+":"+failure.getClass().getSimpleName()+";";
            }
        }
        void restoreWidth() {
            if (!widthCollapsed) return;
            widthCollapsed = false;
            try{if (collapsed.getMinimumWidth() == 0) collapsed.setMinimumWidth(secondMinimum);}
            finally{
                if (collapsed.getLayoutParams() != null && collapsed.getLayoutParams().width == 0) {
                    ViewGroup.LayoutParams params = collapsed.getLayoutParams(); params.width = secondWidth; collapsed.setLayoutParams(params);
                }
            }
        }
        private static Object subscription(View view) {
            if(view==null)return null;
            try { return view.getClass().getMethod("getSubId").invoke(view); }
            catch (ReflectiveOperationException ignored) { return field(view, "subId"); }
        }
    }

    /** Compact bars use real per-subscription levels and follow the native icon tint. */
    private static final class SignalDrawable extends Drawable {
        final View owner;
        final View otherOwner;
        final SignalTypeBadge firstType=new SignalTypeBadge(),secondType=new SignalTypeBadge();
        final SignalTypeBadge firstRoaming=new SignalTypeBadge(),secondRoaming=new SignalTypeBadge();
        final SignalTypeBadge firstHd=new SignalTypeBadge(),secondHd=new SignalTypeBadge();
        boolean showTypes;
        final ImageView position, first, second;
        final ConnectivityIconSource source;
        final ls.augment.com.DualSignalPainter painter=new ls.augment.com.DualSignalPainter();
        final ls.augment.com.IosSignalPainter iosPainter=new ls.augment.com.IosSignalPainter();
        final Runnable artworkInvalidated;
        boolean activity,readyToDraw;
        float gridScale=1,nativeInkHeight,nativeFrameHeight;
        SignalStackLayout.Geometry reference;
        Runnable invalidIdentity;boolean fallbackQueued;String fallbackReason="slot_unknown";
        void refresh(){
            activity=!FeatureSettings.enabled(owner.getContext(),SystemUiOptions.PREFIX+"hide_mobile_activity");
            showTypes=!FeatureSettings.enabled(owner.getContext(),SystemUiOptions.PREFIX+"hide_mobile_type");
            refreshType(firstType,owner);refreshType(secondType,otherOwner);
            refreshBadge(firstRoaming,owner,"mobile_roaming","mobile_roaming_large");
            refreshBadge(secondRoaming,otherOwner,"mobile_roaming","mobile_roaming_large");
            refreshBadge(firstHd,owner,"mobile_volte","mobile_ims");
            refreshBadge(secondHd,otherOwner,"mobile_volte","mobile_ims");
            SignalStackLayout.Geometry g=geometry();
            FeatureSettings.diagnostic(owner.getContext(),"ls_augment_signal_badges",
                    "art="+(iosStyle()?"ios-png-v4-"+(second==null?"single":"dual"):"honor-reference-v5")+";cards="+(second==null?1:2)+";types="+showTypes+";arrows="+activity
                            +";native_ink_h="+nativeInkHeight+";native_frame_h="+nativeFrameHeight
                            +";frame_px="+(g==null?"pending":g.width+"x"+g.height())+";"+source.state.description());
        }
        boolean iosStyle(){return "1".equals(FeatureSettings.snapshot(owner.getContext()).get(SystemUiOptions.SIGNAL_DUAL_STYLE));}
        boolean unavailable(ls.augment.com.ConnectivityIconState.Sim sim){
            return source.state.airplane||sim.level<0||sim.serviceKnown&&!sim.inService;
        }
        boolean artworkReady(){
            if(!iosStyle()||StatusBarAssetsHook.virtualWholeReady(owner,"dual_signal"))return true;
            Integer color=DualSignalTint.color(owner,position);if(color==null)return false;
            ls.augment.com.ConnectivityIconState.Sim one=rowSim(owner),two=rowSim(otherOwner);
            if(one==null||otherOwner!=null&&two==null)return false;
            boolean firstReady=ls.augment.com.IosSignalAssets.ready(owner.getContext(),
                    ls.augment.com.IosSignalPolicy.filename(one.level,one.bars,unavailable(one),color,otherOwner==null),artworkInvalidated);
            boolean secondReady=two==null||ls.augment.com.IosSignalAssets.ready(owner.getContext(),
                    ls.augment.com.IosSignalPolicy.filename(two.level,two.bars,unavailable(two),color,false),artworkInvalidated);
            // Retain actual native icons until both replacement rows exist.
            return firstReady&&secondReady;
        }
        void refreshType(SignalTypeBadge badge,View container){
            View type=container==null?null:find(container,"mobile_type");
            badge.refresh(showTypes&&type instanceof ImageView&&SignalPair.visibleWithin(type,container)?(ImageView)type:null);
        }
        void refreshBadge(SignalTypeBadge badge,View container,String... names){
            ImageView found=null;
            if(container!=null)for(String name:names){View candidate=find(container,name);
                if(candidate instanceof ImageView&&SignalPair.visibleWithin(candidate,container)){found=(ImageView)candidate;break;}}
            badge.refresh(found);
        }
        float badgeAspect(boolean secondRow){
            SignalTypeBadge[] badges=secondRow?new SignalTypeBadge[]{secondType,secondRoaming,secondHd}:new SignalTypeBadge[]{firstType,firstRoaming,firstHd};
            float sum=0;for(SignalTypeBadge badge:badges)if(badge.aspect()>0)sum+=badge.aspect()+(sum>0?.12f:0);return sum;
        }
        ls.augment.com.ConnectivityIconState.Sim rowSim(View container){
            Object id=SignalPair.subscription(container);
            return id instanceof Integer?source.state.simForSubscription((Integer)id):null;
        }
        ls.augment.com.DualSignalLayout layout(SignalStackLayout.Geometry geometry){
            ls.augment.com.ConnectivityIconState.Sim one=rowSim(owner),two=rowSim(otherOwner);
            // Invalid source identity cannot be repurposed as physical slot zero.
            if(one==null||one.slot<0||one.slot>1||otherOwner!=null&&(two==null||two.slot<0||two.slot>1||two.slot==one.slot)){
                refuseIdentity();return null;
            }
            int[] slots=two==null?new int[]{one.slot}:new int[]{one.slot,two.slot};
            float[][] aspects=two==null?new float[][]{badgeAspects(false)}:new float[][]{badgeAspects(false),badgeAspects(true)};
            int active=one.subscriptionId==source.state.activeDataSubscription?0:two!=null&&two.subscriptionId==source.state.activeDataSubscription?1:-1;
            final boolean enabled=!StatusBarAssetsHook.isHidden(owner,"dual_signal")&&!StatusBarAssetsHook.virtualWholeReady(owner,"dual_signal")&&FeatureSettings.enabled(owner.getContext(),ConfigSchema.SYSTEMUI_MASTER)
                    &&!RedMagicLegacyUiHook.positionSizeOnly(owner.getContext());
            final ls.augment.com.StatusBarIconSpacingSpec parsed=ls.augment.com.StatusBarIconSpacingSpec.parse(
                    FeatureSettings.snapshot(owner.getContext()).get(ls.augment.com.StatusBarIconSpacingSpec.KEY));
            final String surface=StatusBarAssetsHook.surfaceFor(owner);
            return ls.augment.com.DualSignalLayout.spaced(geometry.height(),activity,slots,aspects,active,
                    (slot,part)->enabled&&parsed!=null&&ls.augment.com.StatusBarSurfaceSpec.valid(surface)?parsed.resolve(surface,"mobile"+(slot+1)+"."+part):ls.augment.com.StatusBarIconSpacingSpec.ZERO,
                    owner.getResources().getDisplayMetrics().density/gridScale,owner.getLayoutDirection()==View.LAYOUT_DIRECTION_RTL,iosStyle());
        }
        void refuseIdentity(){refuse("slot_unknown");}
        void refuse(String reason){
            fallbackReason=reason;
            readyToDraw=false;
            if(!fallbackQueued&&invalidIdentity!=null){fallbackQueued=true;MAIN.post(invalidIdentity);}
        }
        float[] badgeAspects(boolean secondRow){
            return secondRow?new float[]{secondType.aspect(),secondRoaming.aspect(),secondHd.aspect()}
                    :new float[]{firstType.aspect(),firstRoaming.aspect(),firstHd.aspect()};
        }
        Rect contentBounds(){
            SignalStackLayout.Geometry geometry=geometry();if(geometry==null)return null;
            ls.augment.com.DualSignalLayout layout=layout(geometry);if(layout==null)return null;
            Rect bounds=new Rect();new RectF(geometry.left,geometry.top,geometry.left+layout.width,geometry.top+layout.height).roundOut(bounds);return bounds;
        }
        SignalDrawable(View owner,View otherOwner,ImageView position,ImageView first,ImageView second,ConnectivityIconSource source){
            this.owner=owner;this.otherOwner=otherOwner;this.position=position;this.first=first;this.second=second;this.source=source;
            artworkInvalidated=()->{
                // A loading pair has already returned native ownership. Force
                // its live source to retry; a lone invalidate can hit the 200ms throttle.
                for(RootState state:new ArrayList<>(ROOTS.values()))if(state.signalSource==source)state.refresh(true);
                owner.invalidate();
            };
            reference=nativeGeometry();
        }
        SignalStackLayout.Geometry geometry(){return reference;}
        String inputs(){
            StringBuilder b=new StringBuilder(owner.getResources().getConfiguration().toString());
            b.append(':').append(position.getImageMatrix()).append(':').append(owner.getHeight()).append(':').append(owner.getLayoutDirection());
            // Switching between PNG and vector proportions releases owned host
            // width and recaptures the original slot before measuring the new style.
            b.append(":ios=").append(iosStyle());
            Drawable d=position.getDrawable();if(d!=null)b.append(':').append(d.getBounds());
            for(View at=position;at!=null&&at!=owner;at=at.getParent() instanceof View?(View)at.getParent():null){
                // The OEM moves its signal sideways when 4G/5G/5G+ changes width.
                // Our measured badge column owns that horizontal layout. Restoring
                // the native pair for a sideways move exposes two different OEM
                // label sizes for a frame and unnecessarily recaptures the scale.
                b.append('/').append(at==position?at.getWidth():0).append(',').append(at.getTop()).append(',').append(at.getHeight());
                b.append(',').append(at.getPaddingLeft()).append(',').append(at.getPaddingTop());
                if(at.getLayoutParams() instanceof ViewGroup.MarginLayoutParams){ViewGroup.MarginLayoutParams m=(ViewGroup.MarginLayoutParams)at.getLayoutParams();
                    b.append(',').append(m.getMarginStart()).append(',').append(m.topMargin).append(',').append(m.getMarginEnd()).append(',').append(m.bottomMargin);}
            }
            return b.toString();
        }
        String planInputs(){return FeatureSettings.snapshot(owner.getContext()).get(ls.augment.com.StatusBarIconSpacingSpec.KEY)
                +":"+FeatureSettings.snapshot(owner.getContext()).get(SystemUiOptions.SIGNAL_DUAL_STYLE)
                +":"+FeatureSettings.enabled(owner.getContext(),ConfigSchema.SYSTEMUI_MASTER)+":"+RedMagicLegacyUiHook.positionSizeOnly(owner.getContext())
                +":"+gridScale+":"+StatusBarAssetsHook.surfaceFor(owner)+":"+StatusBarAssetsHook.virtualWholeReady(owner,"dual_signal")
                +":"+source.state.activeDataSubscription+":"+SignalPair.subscription(owner)+":"+SignalPair.subscription(otherOwner);}
        SignalStackLayout.Geometry nativeGeometry() {
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
            nativeInkHeight=ink.height();
            nativeFrameHeight=position.getHeight()-position.getPaddingTop()-position.getPaddingBottom();
            // Use this native icon's content frame, with a bounded increase over
            // its drawable ink. The surrounding status-bar container is not a glyph.
            float height=SignalStackLayout.referenceHeight(nativeInkHeight,nativeFrameHeight,owner.getHeight());
            ink.top-=(height-nativeInkHeight)/2;ink.bottom=ink.top+height;
            // The replacement owns both original SIM allocations. Restricting it
            // to the first SIM alone shrinks a full-height glyph before the host
            // can expand, especially when network-type badges are hidden.
            float slotWidth=owner.getWidth()+(otherOwner==null?0:otherOwner.getWidth());
            if(iosStyle())return SignalStackLayout.ios(ink.left,ink.top,ink.width(),ink.height(),slotWidth,owner.getHeight(),otherOwner==null);
            if(otherOwner==null)return SignalStackLayout.compactSingle(ink.left,ink.top,ink.width(),ink.height(),owner.getWidth(),owner.getHeight());
            return SignalStackLayout.compact(ink.left, ink.top, ink.width(), ink.height(),
                    slotWidth, owner.getHeight(), owner.getResources().getDisplayMetrics().density);
        }
        @Override public void draw(Canvas canvas) {
            if(!readyToDraw)return;
            if (first.getDrawable() == null || second!=null&&second.getDrawable() == null) return;
            SignalStackLayout.Geometry geometry = geometry();
            if (geometry == null) return;
            ls.augment.com.DualSignalLayout measured=layout(geometry);if(measured==null)return;
            Integer nativeColor=DualSignalTint.color(owner,position);
            if(nativeColor==null){refuse("tint_unknown");return;}
            int foreground=nativeColor;
            ls.augment.com.DualSignalLayout legacyCanvas=iosStyle()
                    ?(otherOwner==null?ls.augment.com.DualSignalLayout.iosSingle(geometry.height(),activity,badgeAspect(false))
                            :ls.augment.com.DualSignalLayout.ios(geometry.height(),activity,Math.max(badgeAspect(false),badgeAspect(true))))
                    :otherOwner==null
                    ?ls.augment.com.DualSignalLayout.single(geometry.height(),activity,badgeAspect(false))
                    :new ls.augment.com.DualSignalLayout(geometry.height(),activity,Math.max(badgeAspect(false),badgeAspect(true)));
            float artworkRight=geometry.left+legacyCanvas.width,artworkBottom=geometry.top+legacyCanvas.height;
            if(StatusBarAssetsHook.drawLayer(owner,canvas,"dual_signal","whole",geometry.left,geometry.top,artworkRight,artworkBottom,foreground))return;
            StatusBarAssetsHook.drawLayer(owner,canvas,"dual_signal","background",geometry.left,geometry.top,artworkRight,artworkBottom,foreground);
            ls.augment.com.ConnectivityIconState state=source.state;
            Object firstId=SignalPair.subscription(owner),secondId=SignalPair.subscription(otherOwner);
            final ls.augment.com.ConnectivityIconState.Sim rowOne=firstId instanceof Integer?state.simForSubscription((Integer)firstId):null;
            final ls.augment.com.ConnectivityIconState.Sim rowTwo=secondId instanceof Integer?state.simForSubscription((Integer)secondId):null;
            if(rowOne==null||otherOwner!=null&&rowTwo==null)return;
            final int activityRow=rowOne.subscriptionId==state.activeDataSubscription?0:
                    rowTwo!=null&&rowTwo.subscriptionId==state.activeDataSubscription?1:-1;
            painter.setArtwork((target,part,layer,l,t,r,b,color)->{
                boolean useSecond=part.startsWith("row1")||part.startsWith("data")&&activityRow==1;
                ls.augment.com.ConnectivityIconState.Sim sim=useSecond?rowTwo:rowOne;
                if(sim==null)return false;
                String semantic="mobile"+(sim.slot+1)+part.substring(part.indexOf('.'));
                if(StatusBarAssetsHook.isHidden(owner,semantic))return true;
                View nativeSource=useSecond?otherOwner:owner;
                boolean fitSignalInk=part.startsWith("row")&&part.endsWith(".signal")&&"whole".equals(layer);
                if(StatusBarAssetsHook.drawLayer(owner,nativeSource,target,semantic,layer,l,t,r,b,color,fitSignalInk))return true;
                if(fitSignalInk&&iosStyle()){
                    StatusBarAssetsHook.drawLayer(owner,nativeSource,target,semantic,"background",l,t,r,b,color);
                    boolean drawn=iosPainter.drawRow(owner.getContext(),target,l,t,r,b,sim.level,sim.bars,unavailable(sim),color,useSecond?1:0,otherOwner==null,artworkInvalidated);
                    StatusBarAssetsHook.drawLayer(owner,nativeSource,target,semantic,"foreground",l,t,r,b,color);
                    if(!drawn)refuse("awaiting_layout");
                    return true;
                }
                return false;
            });
            painter.drawSpaced(canvas,geometry.left,geometry.top,measured,
                    state.airplane?0:rowOne.level,rowTwo==null||state.airplane?0:rowTwo.level,rowOne.bars,rowTwo==null?4:rowTwo.bars,
                    foreground,state.dataActivity(state.activeDataSubscription),activityRow,
                    (target,index,badge,box,color)->{
                        ls.augment.com.ConnectivityIconState.Sim sim=index==0?rowOne:rowTwo;
                        if(sim!=null)drawBadge(target,index==1?otherOwner:owner,sim,index==1,badge,box,color);
                    });
            StatusBarAssetsHook.drawLayer(owner,canvas,"dual_signal","foreground",geometry.left,geometry.top,artworkRight,artworkBottom,foreground);
        }
        void drawBadge(Canvas target,View nativeOwner,ls.augment.com.ConnectivityIconState.Sim sim,
                boolean lower,int index,ls.augment.com.DualSignalLayout.Box box,int color){
            SignalTypeBadge[] badges=lower?new SignalTypeBadge[]{secondType,secondRoaming,secondHd}:new SignalTypeBadge[]{firstType,firstRoaming,firstHd};
            String[] names={"mobile_type","mobile_roaming","mobile_volte"},roles={"type","roaming","volte"};
            String semantic="mobile"+(sim.slot+1)+"."+roles[index];
            if(StatusBarAssetsHook.isHidden(owner,semantic))return;
            View nativeSource=find(nativeOwner,names[index]);
            float l=box.x,t=box.y,r=l+box.width,b=t+box.height;
            if(!StatusBarAssetsHook.drawLayer(owner,nativeSource,target,semantic,"whole",l,t,r,b,color)){
                StatusBarAssetsHook.drawLayer(owner,nativeSource,target,semantic,"background",l,t,r,b,color);
                badges[index].draw(target,l,t,box.width,box.height,color);
                StatusBarAssetsHook.drawLayer(owner,nativeSource,target,semantic,"foreground",l,t,r,b,color);
            }
        }
        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }


    // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
    //noinspection DiscouragedApi
    private static View find(View root, String name) {
        int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }
    private static String resourceName(View view) {
        if(view.getId()==View.NO_ID||view.getId()==0)return "";
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
