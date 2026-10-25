package ls.augment.com.hook;

import android.content.Context;
import android.database.ContentObserver;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.view.View;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import ls.augment.com.ConfigSchema;
import ls.augment.com.IosBatteryAssets;
import ls.augment.com.IosBatteryDrawable;
import ls.augment.com.IosBatteryPolicy;
import ls.augment.com.SystemUiOptions;
import static ls.augment.com.hook.SystemUiAdapter.*;

/** Adapts supplied artwork to the inspected RedMagic ImageView/number/charge widget. */
final class IosBatteryHook {
    private static final Map<View, State> STATES = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService POWER_READER = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "LS-ios-battery-power"); thread.setDaemon(true); return thread;
    });
    private static volatile int gamePowerMode;
    private static boolean observingPower;
    private static ContentObserver powerObserver;
    private IosBatteryHook() { }

    static int install(AugmentModule module, ClassLoader loader) {
        int count = 0;
        String layout = "com.zte.mifavor.views.MFVBatteryViewLayout";
        String meter = "com.zte.mifavor.views.MFVBatteryMeterView";
        for (String name : new String[]{"onDarkChanged", "onKeyguardColorChanged", "onPowerSaveChanged",
                "updateBatteryLevelText", "updateTextHollowEffectAvailable"}) {
            count += hookNamed(module, loader, "ios-battery", layout, name, -1, null, (owner, args, result) -> {
                if (owner instanceof View) nativeUpdated((View) owner, name.equals("updateTextHollowEffectAvailable")); return PASS;
            });
        }
        count += hookNamed(module, loader, "ios-battery", meter, "updateBattery", 0, null,
                (owner, args, result) -> { View parent = owner(owner); if (parent != null) nativeUpdated(parent, false); return PASS; });
        return count;
    }

    private static View owner(Object child) {
        while (child instanceof View) {
            View view = (View) child;
            if (view.getClass().getSimpleName().equals("MFVBatteryViewLayout")) return view;
            child = view.getParent();
        }
        return null;
    }

    static boolean enabled(View owner) {
        Context context = owner.getContext();
        return StatusBarGridHook.inBar(owner) && !RedMagicLegacyUiHook.positionSizeOnly(context)
                && FeatureSettings.enabled(context, ConfigSchema.STATUSBAR_NATIVE_BATTERY_ENABLED, true)
                && !FeatureSettings.enabled(context, ConfigSchema.STATUSBAR_CONNECTIVITY_GROUP)
                && FeatureSettings.integer(context, SystemUiOptions.BATTERY_PRESET, 0, 0, 1) == 1;
    }

    private static void nativeUpdated(View owner, boolean hollowRecalculated) {
        State state = STATES.get(owner);
        if (state != null && hollowRecalculated) {
            Object value = field(owner, "mTextHollowEffectAvailable");
            if (value instanceof Boolean) state.nativeHollow = (Boolean) value;
        }
        apply(owner);
    }

    static void apply(View owner) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            WeakReference<View> reference = new WeakReference<>(owner);
            MAIN.post(() -> { View current = reference.get(); if (current != null) apply(current); }); return;
        }
        State state = STATES.get(owner);
        if (!enabled(owner)) {
            // Native recalculation invokes nested callbacks. Remove ownership before replaying it.
            if (state != null) { STATES.remove(owner); state.restore(owner); }
            return;
        }
        Object raw = field(owner, "mBatteryIconView");
        if (!(raw instanceof ImageView)) return;
        if (state == null) { state = new State(); STATES.put(owner, state); }
        ImageView meter = (ImageView) raw;
        if (!(meter.getDrawable() instanceof IosBatteryDrawable)) state.nativeDrawable = meter.getDrawable();
        if (meter.getBackground() != null) state.nativeBackground = meter.getBackground();
        int level = integer(owner, "mBateryLevel", 100);
        int style = FeatureSettings.integer(owner.getContext(), SystemUiOptions.PREFIX + "battery_style", 0, 0, 6);
        boolean digits = IosBatteryPolicy.containsDigits(style, integer(owner, "mShowMode", 0));
        boolean charging = Boolean.TRUE.equals(field(owner, "mIsCharing"));
        boolean powerSave = IosBatteryPolicy.powerSave(gamePowerMode, Boolean.TRUE.equals(field(owner, "mIsPowerSave")));
        Object intensity = field(owner, "mDarkIntensity");
        boolean dark = intensity instanceof Number && ((Number) intensity).floatValue() >= .5f;
        // BatteryColors.mTint is the unmodified local contrast, including keyguard and header palettes.
        Object tintValue = field(field(owner, "mBatteryColors"), "mTint");
        if (tintValue instanceof Number || !(intensity instanceof Number)) {
            int tint = tintValue instanceof Number ? ((Number)tintValue).intValue() : integer(meter, "mContentColor", Color.WHITE);
            dark = Color.red(tint) * .299f + Color.green(tint) * .587f + Color.blue(tint) * .114f < 128;
        }
        String asset = IosBatteryPolicy.asset(digits, charging, powerSave, IosBatteryPolicy.performance(gamePowerMode), dark);
        if (!asset.equals(state.asset)) {
            IosBatteryAssets.Sheet sheet = IosBatteryAssets.cached(asset);
            if (sheet != null) state.setSheet(owner, asset, sheet, level);
            else if (!asset.equals(state.requested)) {
                state.requested = asset;
                WeakReference<View> reference = new WeakReference<>(owner);
                WeakReference<State> expected = new WeakReference<>(state);
                IosBatteryAssets.request(owner.getContext(), asset, loaded -> {
                    View current = reference.get(); State waiting = expected.get();
                    if (current == null || waiting == null || STATES.get(current) != waiting) return;
                    if (loaded != null && enabled(current) && asset.equals(waiting.requested)) {
                        waiting.setSheet(current, asset, loaded, integer(current, "mBateryLevel", 100));
                        apply(current); current.requestLayout(); current.invalidate();
                    } else if (loaded == null) FeatureSettings.diagnostic(current.getContext(),
                            "ls_augment_ios_battery_runtime", "asset_unavailable:" + asset);
                });
            }
        }
        if (state.drawable == null) return; // Native appearance remains visible until the APK asset is ready.
        state.drawable.updateLevel(level);
        if (meter.getDrawable() != state.drawable) meter.setImageDrawable(state.drawable);
        if (meter.getBackground() != null) meter.setBackground(null);
        state.active = true;
        Object hollow = field(owner, "mTextHollowEffectAvailable");
        if (!state.hollowCaptured) { state.nativeHollow = Boolean.TRUE.equals(hollow); state.hollowCaptured = true; }
        set(owner, "mTextHollowEffectAvailable", false);
        state.suppress(field(owner, "mBatteryLevelInsideView"));
        // The iOS charging sheets already contain their charging appearance. Preserve a native bypass indicator.
        boolean bypass = integer(owner, "mChargingSeparation", 0) == 1;
        state.suppressOrRestore(field(owner, "mInsideChargeView"), !bypass);
        state.suppressOrRestore(field(owner, "mOutsideChargeView"), !bypass && style != 5);
        observePower(owner.getContext());
        String diagnostic = "asset=" + state.asset + ";level=" + level + ";digits=" + digits
                + ";charging=" + charging + ";powerSave=" + powerSave + ";performanceMode=" + gamePowerMode
                + ";dark=" + dark;
        if (!diagnostic.equals(state.diagnostic)) {
            state.diagnostic = diagnostic;
            FeatureSettings.diagnostic(owner.getContext(), "ls_augment_ios_battery_runtime", diagnostic);
        }
    }

    private static int integer(Object owner, String name, int fallback) {
        Object value = field(owner, name); return value instanceof Number ? ((Number) value).intValue() : fallback;
    }

    private static void observePower(Context context) {
        if (observingPower) return;
        observingPower = true;
        Context application = context.getApplicationContext();
        Context source = application == null ? context : application;
        powerObserver = new ContentObserver(MAIN) {
            @Override public void onChange(boolean selfChange) { POWER_READER.execute(() -> readPower(source)); }
        };
        POWER_READER.execute(() -> {
            try { source.getContentResolver().registerContentObserver(Settings.Global.getUriFor("performance_mode_value"), false, powerObserver); }
            catch (RuntimeException ignored) { }
            readPower(source);
        });
    }

    private static void readPower(Context context) {
        int mode;
        try { mode = Settings.Global.getInt(context.getContentResolver(), "performance_mode_value", 0); }
        catch (RuntimeException ignored) { mode = 0; }
        if (mode == gamePowerMode) return;
        gamePowerMode = mode;
        MAIN.post(() -> { for (View owner : new ArrayList<>(STATES.keySet())) if (owner != null) { apply(owner); owner.invalidate(); } });
    }

    private static final class State {
        Drawable nativeDrawable, nativeBackground;
        IosBatteryDrawable drawable;
        String asset = "", requested = "", diagnostic = "";
        boolean active, nativeHollow, hollowCaptured;
        final Map<View, Float> alphas = new WeakHashMap<>();
        void setSheet(View owner, String name, IosBatteryAssets.Sheet sheet, int level) {
            asset = name; requested = name;
            drawable = new IosBatteryDrawable(sheet, level, owner.getResources().getDisplayMetrics().density);
        }
        void suppress(Object raw) { suppressOrRestore(raw, true); }
        void suppressOrRestore(Object raw, boolean hide) {
            if (!(raw instanceof View)) return; View view = (View) raw;
            if (hide) { if (!alphas.containsKey(view)) alphas.put(view, view.getAlpha()); if (view.getAlpha() != 0) view.setAlpha(0); }
            else { Float original = alphas.remove(view); if (original != null) view.setAlpha(original); }
        }
        void restore(View owner) {
            Object raw = field(owner, "mBatteryIconView");
            if (active && raw instanceof ImageView) {
                ImageView meter = (ImageView) raw;
                if (meter.getDrawable() == drawable) meter.setImageDrawable(nativeDrawable);
                if (meter.getBackground() == null) meter.setBackground(nativeBackground);
            }
            for (Map.Entry<View, Float> entry : new ArrayList<>(alphas.entrySet())) if (entry.getKey() != null) entry.getKey().setAlpha(entry.getValue());
            alphas.clear();
            if (hollowCaptured) set(owner, "mTextHollowEffectAvailable", nativeHollow);
            active = false;
            if (hollowCaptured) {
                // The native method also synchronizes MFVBatteryLevelView.mTextHollowAvailable.
                // Its updateColor can call updateBattery before returning, so a saved parent
                // field alone is not a reliable native value after nested palette updates.
                try { call(owner, "updateTextHollowEffectAvailable", false, false); }
                catch (ReflectiveOperationException ignored) { }
            }
            if (!diagnostic.isEmpty()) FeatureSettings.diagnostic(owner.getContext(), "ls_augment_ios_battery_runtime", "native_restored");
        }
    }
}
