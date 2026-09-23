package ls.augment.com.hook;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.os.Bundle;
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
    private FanTileHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        try {
            Class<?> type = Class.forName(PANEL, false, loader);
            int count = 0;
            for (String name : new String[]{"onFinishInflate", "updatePanel", "updateDataSwitch", "updateSwitchVisibility"}) {
                for (Method method : type.getDeclaredMethods()) {
                    if (!name.equals(method.getName())) continue;
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
                                if (panel != null) panel.render();
                            } catch (Throwable e) { module.logFeatureError("FAN_TILE_VIEW", e); }
                        }
                        return result;
                    }));
                    count++;
                }
            }
            Method click = type.getDeclaredMethod("onClick", View.class);
            module.registerFeatureHook(module.prepareFeatureHook(click, "fan.tile.native_mode", true).intercept(chain -> {
                Panel panel = panel((View) chain.getThisObject());
                if (panel == null || panel.bypass) return chain.proceed();
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
            Class<?> tile = Class.forName("com.zte.qs.tiles.CoolingFanTile", false, loader);
            Method listening = tile.getDeclaredMethod("handleSetListening", boolean.class);
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
            for (Method method : tile.getDeclaredMethods()) {
                if (!"handleUpdateState".equals(method.getName()) || method.isBridge()) continue;
                module.registerFeatureHook(module.prepareFeatureHook(method, "fan.tile.label", false).intercept(chain -> {
                    Object result = chain.proceed();
                    try {
                        Context context = (Context) field(chain.getThisObject(), "mContext");
                        Object state = chain.getArg(0);
                        if (Boolean.TRUE.equals(field(state, "value"))
                                && FeatureSettings.enabled(context, ConfigSchema.GAME_MASTER, false)
                                && FeatureSettings.enabled(context, ConfigSchema.FAN_FIXED_ENABLED, false)) {
                            int level = FeatureSettings.integer(context, ConfigSchema.FAN_FIXED_LEVEL, 0, 0, 5);
                            if (level > 0) findField(state.getClass(), "label").set(state, "固定" + NAMES[level - 1] + "档");
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

    private static Panel panel(View root) { Object p = root.getTag(TAG); return p instanceof Panel ? (Panel) p : null; }
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
        final CheckedTextView first, second, fixed;
        final LinearLayout extra;
        final TextView chosenLevel, status;
        final TextView[] ticks = new TextView[5];
        final SeekBar slider;
        final Runnable poll = this::read;
        final Rect backgroundBounds = new Rect();
        final android.view.ViewTreeObserver.OnPreDrawListener resizeBackground = () -> { resizeNativeBackground(); return true; };
        Bundle snapshot = new Bundle();
        boolean reading, sending, bypass, dragging;
        int generation;
        int pending = -1;
        long pendingSince;

        Panel(ViewGroup root) throws ReflectiveOperationException {
            this.root = root; context = root.getContext();
            first = (CheckedTextView) field(root, "mModeCheck1");
            second = (CheckedTextView) field(root, "mModeCheck2");
            LinearLayout container = (LinearLayout) field(root, "mEditContainer");
            // The OEM XML uses match_parent even though its original content is two rows.
            ViewGroup.LayoutParams cp = container.getLayoutParams(); cp.height = ViewGroup.LayoutParams.WRAP_CONTENT; container.setLayoutParams(cp);
            ViewGroup.LayoutParams rp = root.getLayoutParams(); if (rp != null) { rp.height = ViewGroup.LayoutParams.WRAP_CONTENT; root.setLayoutParams(rp); }
            fixed = new CheckedTextView(context);
            fixed.setText("固定档位"); fixed.setTextSize(android.util.TypedValue.COMPLEX_UNIT_PX, first.getTextSize());
            fixed.setTypeface(first.getTypeface()); fixed.setGravity(first.getGravity());
            // CheckedTextView.getPaddingRight includes its checkmark width. Copying it
            // would count that width twice and shift the third radio to the left.
            fixed.setPadding(first.getPaddingLeft(), first.getPaddingTop(), 0, first.getPaddingBottom());
            fixed.setMinHeight(dp(48)); fixed.setFocusable(true);
            fixed.setContentDescription("固定档位");
            fixed.setOnClickListener(v -> select(snapshot.getInt("rememberedLevel", 1), null));
            container.addView(fixed, new LinearLayout.LayoutParams(-1, first.getLayoutParams().height));
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
            container.addView(extra, new LinearLayout.LayoutParams(-1, -2));
            status = text("正在读取实际档位…", 12); status.setMinLines(2); status.setPadding(0, dp(8), 0, dp(12));
            status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_NONE);
            container.addView(status, new LinearLayout.LayoutParams(-1, -2));
            root.addOnAttachStateChangeListener(this);
            if (root.isAttachedToWindow()) onViewAttachedToWindow(root);
        }
        int dp(float value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }
        TextView text(String value, float sp) { TextView view = new TextView(context); view.setText(value); view.setTextSize(sp); return view; }
        @Override public void onViewAttachedToWindow(View view) {
            generation++; MAIN.removeCallbacks(poll); MAIN.post(poll);
            root.getViewTreeObserver().removeOnPreDrawListener(resizeBackground);
            root.getViewTreeObserver().addOnPreDrawListener(resizeBackground);
        }
        @Override public void onViewDetachedFromWindow(View view) {
            generation++; MAIN.removeCallbacks(poll);
            if (root.getViewTreeObserver().isAlive()) root.getViewTreeObserver().removeOnPreDrawListener(resizeBackground);
        }

        void resizeNativeBackground() {
            if (!root.isShown()) return;
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
                    if (!background.getBounds().equals(backgroundBounds)) background.setBounds(backgroundBounds);
                } catch (ReflectiveOperationException ignored) { }
                return;
            }
        }

        void read() {
            if (!root.isAttachedToWindow()) return;
            if (!root.isShown() || reading || sending) { schedule(); return; }
            reading = true; final int requestGeneration = generation;
            WORKER.execute(() -> {
                Bundle value;
                try { value = context.getContentResolver().call(PROVIDER, "fan_tile_read", null, null); }
                catch (RuntimeException unavailable) { value = null; }
                final Bundle result = value;
                MAIN.post(() -> {
                    reading = false;
                    if (requestGeneration != generation || !root.isAttachedToWindow()) return;
                    if (result != null && result.getBoolean("ok")) snapshot = result;
                    else snapshot = new Bundle();
                    if (pending >= 0 && (snapshot.getInt("selected", -1) == pending
                            || SystemClock.elapsedRealtime() - pendingSince > 6000)) pending = -1;
                    render(); schedule();
                });
            });
        }
        void schedule() { MAIN.removeCallbacks(poll); if (root.isAttachedToWindow()) MAIN.postDelayed(poll, 1200); }

        void select(int level, Runnable nativeClick) {
            if (sending) return;
            sending = true; render();
            WORKER.execute(() -> {
                Bundle result;
                try {
                    Bundle args = new Bundle(); args.putInt("level", level);
                    result = context.getContentResolver().call(PROVIDER, "fan_tile_select", null, args);
                } catch (RuntimeException unavailable) { result = null; }
                final Bundle reply = result;
                MAIN.post(() -> {
                    sending = false;
                    if (reply != null && reply.getBoolean("ok")) {
                        pending = level; pendingSince = SystemClock.elapsedRealtime();
                        FeatureSettings.invalidateSnapshot();
                        if (nativeClick != null) nativeClick.run();
                    } else Toast.makeText(context, reply == null ? "风扇控制暂时不可用" : reply.getString("message", "风扇档位未保存"), Toast.LENGTH_SHORT).show();
                    render(); MAIN.removeCallbacks(poll); MAIN.post(poll);
                });
            });
        }

        void render() {
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
            fixed.setChecked(selected > 0 || snapshot.getBoolean("fixedRpm"));
            fixed.setEnabled(supported && enabled && !sending && !snapshot.getBoolean("measuring"));
            fixed.setAlpha(fixed.isEnabled() ? 1f : .45f);
            extra.setVisibility(fixed.isChecked() ? View.VISIBLE : View.GONE);
            slider.setEnabled(fixed.isEnabled());
            slider.setProgressTintList(android.content.res.ColorStateList.valueOf(accent));
            slider.setThumbTintList(android.content.res.ColorStateList.valueOf(accent));
            int displayLevel = selected > 0 ? selected : Math.max(1, Math.min(5, snapshot.getInt("level", 1)));
            if (!dragging) slider.setProgress(displayLevel - 1);
            for (int i = 0; i < 5; i++) { ticks[i].setTextColor(selected == i + 1 ? accent : foreground); ticks[i].setAlpha(selected == i + 1 ? 1f : .6f); }
            if (selected > 0 || snapshot.getBoolean("fixedRpm")) { first.setChecked(false); second.setChecked(false); }
            else { first.setChecked(snapshot.getInt("mode", 1) == 1); second.setChecked(snapshot.getInt("mode", 1) == 0); }
            String detail;
            if (!snapshot.getBoolean("ok")) detail = "正在读取实际档位…";
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
                state = "固定" + NAMES[selected - 1] + "档 · " + (applied ? "已生效"
                        : control.startsWith("locked;") ? "已暂停，请重新选择" : !enabled ? "等待开启" : "切换中");
            } else state = snapshot.getBoolean("fixedRpm") ? "按目标转速匹配档位" : "跟随原厂散热模式";
            status.setText(detail + "\n" + state);
        }
    }
}
