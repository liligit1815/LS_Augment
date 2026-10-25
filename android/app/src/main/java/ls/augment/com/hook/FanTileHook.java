package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckedTextView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import ls.augment.com.ConfigSchema;
import ls.augment.com.ConfigSnapshot;
import ls.augment.com.FanCalibrationData;
import ls.augment.com.FanTilePolicy;

/** Extends only the OEM fan detail. Hardware commands remain in the fan process. */
final class FanTileHook {
    private static final String PANEL = "com.zte.mifavor.views.CoolingFanPanel";
    private static final int TAG = 0x7e0f0349;
    private static final Uri PROVIDER = Uri.parse("content://ls.augment.com.config");
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "LSFanTile"); t.setDaemon(true); return t;
    });
    private static final String[] NAMES = {"一", "二", "三", "四", "五"};
    private static final java.util.Map<Object, Runnable> TILE_LISTENERS = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private static final java.util.Map<Object, TileLabel> TILE_LABELS = java.util.Collections.synchronizedMap(new java.util.WeakHashMap<>());
    private FanTileHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> type = Class.forName(PANEL, false, loader);
            if(!ViewGroup.class.isAssignableFrom(type))throw new NoSuchFieldException(PANEL+":ViewGroup");
            checkedField(type,"mModeCheck1",CheckedTextView.class);
            checkedField(type,"mModeCheck2",CheckedTextView.class);
            checkedField(type,"mEditContainer",LinearLayout.class);
            checkedField(type,"mEmptyDesc",View.class);
            Method[] updates={checkedMethod(type,"onFinishInflate"),
                    checkedMethod(type,"updatePanel",String.class,java.util.List.class,boolean.class),
                    checkedMethod(type,"updateDataSwitch"),checkedMethod(type,"updateSwitchVisibility",boolean.class)};
            Method click=checkedMethod(type,"onClick",View.class);
            Class<?> tile = Class.forName("com.zte.qs.tiles.CoolingFanTile", false, loader);
            Method listening=checkedMethod(tile,"handleSetListening",boolean.class);
            checkedMethod(tile,"onChanged");checkedField(tile,"mContext",Context.class);
            Method labelMethod=null;
            for(Method candidate:tile.getDeclaredMethods()){
                Class<?>[] args=candidate.getParameterTypes();
                if(!candidate.getName().equals("handleUpdateState")||candidate.isBridge()||args.length!=2||args[1]!=Object.class)continue;
                checkedField(args[0],"value",boolean.class);checkedField(args[0],"label",CharSequence.class);
                if(labelMethod!=null)throw new NoSuchMethodException("ambiguous CoolingFanTile.handleUpdateState");
                labelMethod=checkedMethod(tile,candidate.getName(),args);
            }
            if(labelMethod==null)throw new NoSuchMethodException("CoolingFanTile.handleUpdateState(state,Object):void");
            int count = 0;
            for (Method method:updates) {
                    String name=method.getName();
                    method.setAccessible(true);
                    module.registerFeatureHook(module.prepareFeatureHook(method, "fan.tile." + name, false).intercept(chain -> {
                        Object result = chain.proceed();
                        if (chain.getThisObject() instanceof ViewGroup) {
                            ViewGroup root = (ViewGroup) chain.getThisObject();
                            try {
                                Panel panel = panel(root);
                                if (panel == null && "onFinishInflate".equals(name)) {
                                    panel = new Panel(root);
                                    root.setTag(TAG, panel);
                                }
                                if (panel != null) panel.onNativeUpdated(name,
                                        "updateSwitchVisibility".equals(name) ? Boolean.TRUE.equals(chain.getArg(0)) : null);
                            } catch (Throwable e) { module.logFeatureError("FAN_TILE_VIEW", e); }
                        }
                        return result;
                    }));
                    count++;
            }
            module.registerFeatureHook(module.prepareFeatureHook(click, "fan.tile.native_mode", true).intercept(chain -> {
                Panel panel = panel((View) chain.getThisObject());
                if (panel == null || panel.bypass || !panel.isEnhanced()
                        || !panel.snapshot.getBoolean("supported")) return chain.proceed();
                View target = (View) chain.getArg(0);
                if (target != panel.first && target != panel.second) return chain.proceed();
                panel.select(0, () -> {
                    panel.bypass = true;
                    try { target.performClick(); }
                    finally { panel.bypass = false; }
                });
                return null;
            }));
            count++;
            module.registerFeatureHook(module.prepareFeatureHook(listening, "fan.tile.listening", false).intercept(chain -> {
                Object result = chain.proceed();
                Object owner = chain.getThisObject();
                Runnable old = TILE_LISTENERS.remove(owner);
                if (old != null) FeatureSettings.removeSnapshotListener(old);
                if (Boolean.TRUE.equals(chain.getArg(0))) {
                    java.lang.ref.WeakReference<Object> reference = new java.lang.ref.WeakReference<>(owner);
                    Runnable refresh = () -> {
                        Object current = reference.get();
                        if (current != null) try { current.getClass().getMethod("onChanged").invoke(current); }
                        catch (ReflectiveOperationException ignored) { }
                    };
                    TILE_LISTENERS.put(owner, refresh);
                    FeatureSettings.addSnapshotListener((Context) field(owner, "mContext"), refresh);
                }
                return result;
            }));
            count++;
            for (Method method : new Method[]{labelMethod}) {
                module.registerFeatureHook(module.prepareFeatureHook(method, "fan.tile.label", false).intercept(chain -> {
                    Object result = chain.proceed();
                    try {
                        Context context = (Context) field(chain.getThisObject(), "mContext");
                        Object state = chain.getArg(0);
                        Field labelField = findField(state.getClass(), "label");
                        Object nativeLabel = labelField.get(state);
                        TileLabel previous = TILE_LABELS.get(state);
                        boolean updated = false;
                        if (enhancementRequested(context) && Boolean.TRUE.equals(field(state, "value"))
                                && FeatureSettings.enabled(context, ConfigSchema.GAME_MASTER, false)
                                && FeatureSettings.enabled(context, ConfigSchema.FAN_FIXED_ENABLED, false)) {
                            int level = FeatureSettings.integer(context, ConfigSchema.FAN_FIXED_LEVEL, 1, 1, 5);
                            if (level > 0) {
                                String label = "固定" + NAMES[level - 1] + "档";
                                if (previous != null && previous.enhanced.equals(nativeLabel)) nativeLabel = previous.nativeLabel;
                                TILE_LABELS.put(state, new TileLabel(nativeLabel, label));
                                labelField.set(state, label); updated = true;
                            }
                        }
                        if (!updated && previous != null) {
                            TILE_LABELS.remove(state);
                            // Some OEM versions retain the previous label when only config changes.
                            if (previous.enhanced.equals(nativeLabel)) labelField.set(state, previous.nativeLabel);
                        }
                    } catch (Throwable e) { module.logFeatureError("FAN_TILE_LABEL", e); }
                    return result;
                }));
                count++;
            }
            module.logFeatureInfo("FAN_TILE_READY hooks=" + count);
            return count;
        } catch (Throwable e) { module.logFeatureError("FAN_TILE_INSTALL", e); return 0; }
    }

    static Method checkedMethod(Class<?> type,String name,Class<?>...args)throws ReflectiveOperationException {
        for(Class<?> current=type;current!=null;current=current.getSuperclass())try{
            Method method=current.getDeclaredMethod(name,args);
            int modifiers=method.getModifiers();
            if(method.getReturnType()!=void.class||java.lang.reflect.Modifier.isStatic(modifiers)
                    ||java.lang.reflect.Modifier.isAbstract(modifiers))throw new IllegalStateException(method.toString());
            method.setAccessible(true);return method;
        }catch(NoSuchMethodException absent){}
        throw new NoSuchMethodException(type.getName()+"."+name);
    }
    static Field checkedField(Class<?> type,String name,Class<?> expected)throws ReflectiveOperationException {
        Field field=findField(type,name);
        if(!expected.isAssignableFrom(field.getType())||java.lang.reflect.Modifier.isStatic(field.getModifiers()))
            throw new IllegalStateException(type.getName()+"."+name+":"+field.getType().getName());
        return field;
    }

    private static Panel panel(View root) { Object p = root.getTag(TAG); return p instanceof Panel ? (Panel) p : null; }
    private static final class TileLabel {
        final Object nativeLabel;
        final String enhanced;
        TileLabel(Object nativeLabel, String enhanced) { this.nativeLabel = nativeLabel; this.enhanced = enhanced; }
    }
    private static boolean levelCapability(Context context) {
        return FanTilePolicy.supportedDevice(Build.DEVICE,Build.MODEL,Build.PRODUCT)
                ||ls.augment.com.FanCapabilityEvidence.levels(FeatureSettings.diagnosticValue(context,"ls_augment_fan_control_installed"),ls.augment.com.FanHardwareIdentity.current());
    }
    private static boolean enhancementRequested(Context context) {
        return levelCapability(context)
                && FeatureSettings.enabled(context, ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED, false);
    }
    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> at = type; at != null; at = at.getSuperclass()) {
            try { Field f = at.getDeclaredField(name); f.setAccessible(true); return f; }
            catch (NoSuchFieldException ignored) { }
        }
        throw new NoSuchFieldException(name);
    }
    private static Object field(Object owner, String name) throws ReflectiveOperationException { return findField(owner.getClass(), name).get(owner); }

    private static final class Panel implements View.OnAttachStateChangeListener {
        final ViewGroup root;
        final Context context;
        final LinearLayout container;
        final View emptyDescription;
        final CheckedTextView first, second, fixed;
        final LinearLayout extra;
        final TextView chosenLevel, status;
        final TextView[] ticks = new TextView[5];
        final SeekBar slider;
        final Runnable poll = this::read;
        final Runnable configurationListener = this::configurationChanged;
        final Rect backgroundBounds = new Rect();
        final java.util.Map<android.graphics.drawable.Drawable, Rect> nativeBackgroundBounds = new java.util.WeakHashMap<>();
        final android.view.ViewTreeObserver.OnPreDrawListener resizeBackground = () -> { resizeNativeBackground(); return true; };
        Bundle snapshot = new Bundle();
        final Runnable capabilityRetry=this::retryCapability;
        boolean reading, sending, bypass, dragging, requested, enhanced, restoring;
        boolean nativeFirstChecked, nativeSecondChecked;
        boolean nativeSwitchOn;
        int nativeContainerHeight, nativeRootHeight;
        int nativeContainerVisibility, nativeEmptyVisibility, nativeFirstVisibility, nativeSecondVisibility;
        int generation;
        int pending = -1;
        long pendingSince;
        long configurationRevision = -1;


        // Physical screen/driver/stock-layout coordinates, not logical reading order; changing LEFT/RIGHT would change geometry.
        //noinspection RtlHardcoded
        Panel(ViewGroup root) throws ReflectiveOperationException {
            this.root = root; context = root.getContext();
            first = (CheckedTextView) field(root, "mModeCheck1");
            second = (CheckedTextView) field(root, "mModeCheck2");
            container = (LinearLayout) field(root, "mEditContainer");
            emptyDescription = (View) field(root, "mEmptyDesc");
            nativeSwitchOn = container.getVisibility() == View.VISIBLE;
            captureNativeVisibility();
            captureNativeChecks();
            fixed = new CheckedTextView(context);
            fixed.setText("固定转速"); fixed.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, first.getTextSize());
            fixed.setTypeface(first.getTypeface()); fixed.setGravity(first.getGravity());
            // CheckedTextView.getPaddingRight includes its checkmark width. Copying it
            // would count that width twice and shift the third radio to the left.
            fixed.setPadding(first.getPaddingLeft(), first.getPaddingTop(), 0, first.getPaddingBottom());
            fixed.setMinHeight(dp(48)); fixed.setFocusable(true);
            fixed.setContentDescription("固定转速");
            fixed.setOnClickListener(v -> select(snapshot.getInt("rememberedLevel", 1), null));
            extra = new LinearLayout(context); extra.setOrientation(LinearLayout.VERTICAL);
            extra.setPadding(0, 0, 0, dp(10));
            chosenLevel = text("一档", 14); chosenLevel.setGravity(Gravity.CENTER);
            extra.addView(chosenLevel, new LinearLayout.LayoutParams(-1, -2));
            slider = new SeekBar(context); slider.setMax(4); slider.setKeyProgressIncrement(1);
            slider.setPadding(dp(15), 0, dp(15), 0);
            slider.setContentDescription("固定档位拖拽条");
            slider.setSplitTrack(false);
            GradientDrawable track = new GradientDrawable(); track.setColor(0x337b70ff); track.setCornerRadius(dp(3));
            GradientDrawable fill = new GradientDrawable(); fill.setColor(0xff7b70ff); fill.setCornerRadius(dp(3));
            LayerDrawable progress = new LayerDrawable(new android.graphics.drawable.Drawable[]{track,
                    new ClipDrawable(fill, Gravity.LEFT, ClipDrawable.HORIZONTAL)});
            progress.setId(0, android.R.id.background); progress.setId(1, android.R.id.progress);
            for (int i = 0; i < 2; i++) { progress.setLayerHeight(i, dp(5)); progress.setLayerGravity(i, Gravity.CENTER_VERTICAL | Gravity.FILL_HORIZONTAL); }
            slider.setProgressDrawable(progress);
            GradientDrawable thumb = new GradientDrawable(); thumb.setShape(GradientDrawable.OVAL);
            thumb.setColor(0xff7b70ff); thumb.setSize(dp(20), dp(20)); slider.setThumb(thumb);
            slider.setThumbOffset(dp(10));
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                @Override public void onStartTrackingTouch(SeekBar bar) { dragging = true; }

                // Injected host view uses the host Resources; module R IDs are invalid there. Preserve these short built-in Chinese labels.
                //noinspection SetTextI18n
                @Override public void onProgressChanged(SeekBar bar, int progress, boolean user) {
                    chosenLevel.setText(NAMES[progress] + "档");
                    bar.setStateDescription("固定" + NAMES[progress] + "档");
                    // Accessibility/key changes have no touch tracking callback.
                    if (user && !dragging) select(progress + 1, null);
                }
                @Override public void onStopTrackingTouch(SeekBar bar) {
                    dragging = false; select(bar.getProgress() + 1, null);
                }
            });
            extra.addView(slider, new LinearLayout.LayoutParams(-1, dp(40)));
            LinearLayout tickRow = new LinearLayout(context); tickRow.setOrientation(LinearLayout.HORIZONTAL);
            for (int i = 0; i < 5; i++) {
                TextView tick = text(NAMES[i] + "档", 12); tick.setGravity(Gravity.CENTER);
                ticks[i] = tick; tickRow.addView(tick, new LinearLayout.LayoutParams(0, -2, 1));
            }
            extra.addView(tickRow, new LinearLayout.LayoutParams(-1, -2));
            status = text("正在读取实际档位…", 12); status.setMinLines(2); status.setPadding(0, dp(8), 0, dp(12));
            status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_NONE);
            root.addOnAttachStateChangeListener(this);
            if (root.isAttachedToWindow()) onViewAttachedToWindow(root);
        }
        int dp(float value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }
        TextView text(String value, float sp) { TextView view = new TextView(context); view.setText(value); view.setTextSize(sp); return view; }
        @Override public void onViewAttachedToWindow(View view) {
            generation++; reading = false; sending = false;
            FeatureSettings.addSnapshotListener(context, configurationListener);
            configurationChanged();
        }
        @Override public void onViewDetachedFromWindow(View view) {
            generation++; reading = false; sending = false;
            MAIN.removeCallbacks(poll);
            FeatureSettings.removeSnapshotListener(configurationListener);
            MAIN.removeCallbacks(capabilityRetry);
            setEnhanced(false);
        }

        void captureNativeChecks() {
            nativeFirstChecked = first.isChecked(); nativeSecondChecked = second.isChecked();
        }

        void captureNativeVisibility() {
            nativeContainerVisibility = container.getVisibility();
            nativeEmptyVisibility = emptyDescription.getVisibility();
        }

        void onNativeUpdated(String method, Boolean switchOn) {
            if (switchOn != null) {
                nativeSwitchOn = switchOn;
                captureNativeVisibility();
            } else if (!enhanced) captureNativeVisibility();
            if (restoring) return;
            if (!enhanced || "updatePanel".equals(method)
                    || first.isChecked() || second.isChecked()) captureNativeChecks();
            reconcileRequested();
            if (enhanced) render();
        }

        void retryCapability() { if(root.isAttachedToWindow())reconcileRequested(); }
        void reconcileRequested() {
            ConfigSnapshot config = FeatureSettings.snapshot(context);
            boolean next = levelCapability(context)
                    && "1".equals(config.get(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED));
            if(!next&&"1".equals(config.get(ConfigSchema.FAN_TILE_ENHANCEMENT_ENABLED))&&root.isAttachedToWindow()) {
                MAIN.removeCallbacks(capabilityRetry);MAIN.postDelayed(capabilityRetry,1200);
            }else MAIN.removeCallbacks(capabilityRetry);
            boolean changed = next != requested;
            if (changed) {
                requested = next; generation++; reading = false; sending = false;
                pending = -1; dragging = false;
                MAIN.removeCallbacks(poll);
                if (!requested) { snapshot = new Bundle(); configurationRevision = -1; }
            }
            boolean configurationChanged = requested && seedConfiguration(config);
            // QSDetail reuses its view. Detach removes our rows without changing the
            // saved request, so attach must restore them before any telemetry reply.
            boolean remount = enhanced != requested;
            setEnhanced(requested);
            if (requested && (changed || configurationChanged || remount)) {
                render();
                if (root.isAttachedToWindow()) { MAIN.removeCallbacks(poll); MAIN.post(poll); }
            }
        }

        boolean seedConfiguration(ConfigSnapshot config) {
            if (configurationRevision == config.revision) return false;
            configurationRevision = config.revision;
            // This is an immutable, verified process cache. It only describes the
            // saved choice; capability, write permission and applied state still
            // require the provider response. No IPC or hardware read runs here.
            Bundle initial = new Bundle();
            int level = Integer.parseInt(config.get(ConfigSchema.FAN_FIXED_LEVEL));
            initial.putInt("rememberedLevel", level);
            initial.putInt("selected", "1".equals(config.get(ConfigSchema.GAME_MASTER))
                    && "1".equals(config.get(ConfigSchema.FAN_FIXED_ENABLED)) ? level : 0);
            initial.putString("request", config.get(ConfigSchema.FAN_TILE_REQUEST));
            initial.putBoolean("measuring", FanCalibrationData.validRequest(
                    config.get(ConfigSchema.FAN_CALIBRATION_REQUEST), System.currentTimeMillis()));
            initial.putBoolean("manual", nativeSwitchOn);
            initial.putInt("mode", nativeFirstChecked ? 1 : nativeSecondChecked ? 0 : -1);
            initial.putBoolean("loading", true);
            snapshot = initial;
            return true;
        }

        void configurationChanged() {
            reconcileRequested();
            if (requested && root.isAttachedToWindow()) {
                MAIN.removeCallbacks(poll); MAIN.post(poll);
            }
        }

        boolean isEnhanced() {
            reconcileRequested();
            return enhanced && requested;
        }

        void setEnhanced(boolean enable) {
            if (enhanced == enable) return;
            enhanced = enable; generation++; reading = false; sending = false;
            pending = -1; dragging = false;
            if (enable) {
                captureNativeChecks();
                captureNativeVisibility();
                nativeFirstVisibility = first.getVisibility(); nativeSecondVisibility = second.getVisibility();
                // Change OEM layout only while the independently enabled extension is visible.
                ViewGroup.LayoutParams cp = container.getLayoutParams();
                nativeContainerHeight = cp.height; cp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
                container.setLayoutParams(cp);
                ViewGroup.LayoutParams rp = root.getLayoutParams();
                nativeRootHeight = rp == null ? ViewGroup.LayoutParams.WRAP_CONTENT : rp.height;
                if (rp != null) { rp.height = ViewGroup.LayoutParams.WRAP_CONTENT; root.setLayoutParams(rp); }
                container.addView(fixed, new LinearLayout.LayoutParams(-1, first.getLayoutParams().height));
                container.addView(extra, new LinearLayout.LayoutParams(-1, -2));
                container.addView(status, new LinearLayout.LayoutParams(-1, -2));
                root.getViewTreeObserver().removeOnPreDrawListener(resizeBackground);
                root.getViewTreeObserver().addOnPreDrawListener(resizeBackground);
            } else {
                container.removeView(fixed); container.removeView(extra); container.removeView(status);
                first.setVisibility(nativeFirstVisibility); second.setVisibility(nativeSecondVisibility);
                ViewGroup.LayoutParams cp = container.getLayoutParams(); cp.height = nativeContainerHeight;
                container.setLayoutParams(cp);
                ViewGroup.LayoutParams rp = root.getLayoutParams();
                if (rp != null) { rp.height = nativeRootHeight; root.setLayoutParams(rp); }
                if (root.getViewTreeObserver().isAlive()) root.getViewTreeObserver().removeOnPreDrawListener(resizeBackground);
                for (java.util.Map.Entry<android.graphics.drawable.Drawable, Rect> original : nativeBackgroundBounds.entrySet())
                    original.getKey().setBounds(original.getValue());
                nativeBackgroundBounds.clear();
                restoring = true;
                try {
                    // Restore the latest OEM switch state using the real method signature.
                    Method update = root.getClass().getDeclaredMethod("updateSwitchVisibility", boolean.class);
                    update.setAccessible(true); update.invoke(root, nativeSwitchOn);
                } catch (ReflectiveOperationException unavailable) {
                    container.setVisibility(nativeContainerVisibility);
                    emptyDescription.setVisibility(nativeEmptyVisibility);
                } finally {
                    first.setChecked(nativeFirstChecked); second.setChecked(nativeSecondChecked);
                    restoring = false;
                }
            }
            root.requestLayout();
        }


        // Names belong to runtime OEM/module packages, not this APK's compile-time resources; preserve missing-resource fallback.
        //noinspection DiscouragedApi
        void resizeNativeBackground() {
            if (!isEnhanced() || !root.isShown()) return;
            for (android.view.ViewParent p = root.getParent(); p instanceof ViewGroup; p = p.getParent()) {
                if (!"com.zte.mifavor.qs.QSDetail".equals(p.getClass().getName())) continue;
                ViewGroup detail = (ViewGroup) p;
                try {
                    if (Boolean.TRUE.equals(field(detail, "mAnimatingOpen")) || Boolean.TRUE.equals(field(detail, "mClosingDetail"))) return;
                    android.graphics.drawable.Drawable background = detail.getBackground();
                    if (background == null || !background.getClass().getName().endsWith("QsDetailModule$RoundCornerDrawable")) return;
                    int id = context.getResources().getIdentifier("qs_detail_container", "id", "com.android.systemui");
                    View container = detail.findViewById(id);
                    if (container == null || container.getWidth() == 0) return;
                    container.getDrawingRect(backgroundBounds);
                    detail.offsetDescendantRectToMyCoords(container, backgroundBounds);
                    if (!background.getBounds().equals(backgroundBounds)) {
                        if (!nativeBackgroundBounds.containsKey(background))
                            nativeBackgroundBounds.put(background, new Rect(background.getBounds()));
                        background.setBounds(backgroundBounds);
                    }
                } catch (ReflectiveOperationException ignored) { }
                return;
            }
        }

        void read() {
            reconcileRequested();
            if (!requested || !root.isAttachedToWindow()) return;
            if (!root.isShown() || reading || sending) { schedule(); return; }
            reading = true; final int requestGeneration = generation;
            WORKER.execute(() -> {
                Bundle value;
                try { value = context.getContentResolver().call(PROVIDER, "fan_tile_read", null, null); }
                catch (RuntimeException unavailable) { value = null; }
                final Bundle result = value;
                MAIN.post(() -> {
                    if (requestGeneration != generation || !root.isAttachedToWindow()) return;
                    reading = false;
                    if (result != null && result.getBoolean("ok")
                            && result.getLong("revision", -1L) < configurationRevision) {
                        // A config notification may arrive while telemetry is being
                        // sampled. Keep the newer saved choice and refresh the data.
                        MAIN.removeCallbacks(poll); MAIN.post(poll); return;
                    }
                    if (result != null && result.getBoolean("ok")) {
                        snapshot = result;
                        setEnhanced(requested && snapshot.getBoolean("enhancementEnabled"));
                    } else {
                        snapshot = new Bundle(snapshot);
                        snapshot.putBoolean("loading", false);
                        snapshot.putBoolean("ok", false); snapshot.putBoolean("supported", false);
                    }
                    if (pending >= 0 && (snapshot.getInt("selected", -1) == pending
                            || SystemClock.elapsedRealtime() - pendingSince > 6000)) pending = -1;
                    render(); schedule();
                });
            });
        }
        void schedule() { MAIN.removeCallbacks(poll); if (requested && root.isAttachedToWindow()) MAIN.postDelayed(poll, 1200); }

        void select(int level, Runnable nativeClick) {
            if (!isEnhanced() || !snapshot.getBoolean("ok") || !snapshot.getBoolean("supported")
                    || snapshot.getBoolean("measuring") || sending || !root.isAttachedToWindow()) return;
            final int requestGeneration = generation;
            final long revision = snapshot.getLong("revision", -1L);
            sending = true; render();
            WORKER.execute(() -> {
                Bundle result;
                try {
                    Bundle args = new Bundle(); args.putInt("level", level); args.putLong("revision", revision);
                    result = context.getContentResolver().call(PROVIDER, "fan_tile_select", null, args);
                } catch (RuntimeException unavailable) { result = null; }
                final Bundle reply = result;
                MAIN.post(() -> {
                    if (reply != null && reply.getBoolean("ok")) FeatureSettings.invalidateSnapshot();
                    if (requestGeneration != generation || !root.isAttachedToWindow() || !isEnhanced()) return;
                    sending = false;
                    if (reply != null && reply.getBoolean("ok")) {
                        pending = level; pendingSince = SystemClock.elapsedRealtime();
                        if (nativeClick != null) nativeClick.run();
                    } else Toast.makeText(context, reply == null ? "风扇控制暂时不可用" : reply.getString("message", "风扇档位未保存"), Toast.LENGTH_SHORT).show();
                    render(); MAIN.removeCallbacks(poll); MAIN.post(poll);
                });
            });
        }


        // Injected host view uses the host Resources; module R IDs are invalid there. Preserve these short built-in Chinese labels.
        //noinspection SetTextI18n
        void render() {
            if (!isEnhanced()) return;
            int selected = pending >= 0 ? pending : snapshot.getInt("selected", 0);
            boolean supported = snapshot.getBoolean("supported");
            boolean fresh = snapshot.getBoolean("hardwareValid") && SystemClock.elapsedRealtime() - snapshot.getLong("sampledAt") < 5000;
            boolean enabled = snapshot.getBoolean("manual");
            int foreground = first.getCurrentTextColor();
            int accent = 0xff7b70ff;
            if (first.getCheckMarkTintList() != null) accent = first.getCheckMarkTintList().getColorForState(new int[]{android.R.attr.state_checked}, accent);
            fixed.setTextColor(foreground); chosenLevel.setTextColor(accent);
            status.setTextColor(foreground); status.setAlpha(.7f);
            android.graphics.drawable.Drawable check = first.getCheckMarkDrawable();
            if (check != null && check.getConstantState() != null)
                fixed.setCheckMarkDrawable(check.getConstantState().newDrawable(context.getResources()).mutate());
            fixed.setChecked(selected > 0);
            fixed.setEnabled(snapshot.getBoolean("ok") && supported && enabled && !sending && !snapshot.getBoolean("measuring"));
            fixed.setAlpha(fixed.isEnabled() ? 1f : .45f);
            extra.setVisibility(fixed.isChecked() ? View.VISIBLE : View.GONE);
            slider.setEnabled(fixed.isEnabled());
            slider.setProgressTintList(android.content.res.ColorStateList.valueOf(accent));
            slider.setThumbTintList(android.content.res.ColorStateList.valueOf(accent));
            int displayLevel = selected > 0 ? selected : Math.max(1, Math.min(5, snapshot.getInt("level", 1)));
            if (!dragging) slider.setProgress(displayLevel - 1);
            for (int i = 0; i < 5; i++) { ticks[i].setTextColor(selected == i + 1 ? accent : foreground); ticks[i].setAlpha(selected == i + 1 ? 1f : .6f); }
            if (selected > 0) { first.setChecked(false); second.setChecked(false); }
            else {
                int mode = snapshot.getInt("mode", -1);
                first.setChecked(mode < 0 ? nativeFirstChecked : mode == 1);
                second.setChecked(mode < 0 ? nativeSecondChecked : mode == 0);
            }
            String detail;
            if (snapshot.getBoolean("loading")) detail = "正在读取实际档位和转速…";
            else if (!snapshot.getBoolean("ok")) detail = "风扇控制暂时不可用，请稍后重试";
            else if (!supported) detail = "此机型尚未验证固定一至五档";
            else if (snapshot.getBoolean("measuring")) detail = "正在测量转速，暂不能切换档位";
            else if (!fresh) detail = "实际档位和转速暂时不可用";
            else if (snapshot.getInt("enabled") == 0) detail = "风扇已停止";
            else detail = "实际 " + snapshot.getInt("level") + " 档 · " + snapshot.getInt("rpm") + " 转/分钟";
            String control = snapshot.getString("control", "");
            String state;
            if (sending) state = "正在保存选择…";
            else if (selected > 0) {
                boolean applied = fresh && snapshot.getInt("enabled") == 1 && snapshot.getInt("level") == selected
                        && control.startsWith("controlled;") && control.contains(";level=" + selected + ";")
                        && control.contains(";selection=" + snapshot.getString("request", "") + ";");
                state = "固定" + NAMES[selected - 1] + "档 · " + (snapshot.getBoolean("loading") ? "正在读取状态" : applied ? "已生效"
                        : control.startsWith("locked;") ? "已暂停，请重新选择" : !enabled ? "等待开启" : "切换中");
            } else state = "跟随原厂散热模式";
            status.setText(detail + "\n" + state);
        }
    }
}
