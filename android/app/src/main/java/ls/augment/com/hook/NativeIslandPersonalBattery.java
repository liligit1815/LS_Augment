package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import ls.augment.com.NativeIslandCardProtocol;

/** Preserve the original battery action, while giving its otherwise untyped travel ID a scope. */
final class NativeIslandPersonalBattery {
    private final Method key, entity, relate, enabled, click, action;
    private final Object adapter;

    NativeIslandPersonalBattery(ClassLoader loader, Class<?> card, Class<?> data, Class<?> adapterClass) throws Exception {
        key = NativeIslandPersonalScene.exact(card, "getKey", String.class);
        entity = NativeIslandPersonalScene.exact(card, "getCardEntity", data);
        relate = NativeIslandPersonalScene.exact(data, "getRelateKey", String.class);
        enabled = NativeIslandPersonalScene.exact(Class.forName("com.zte.briefagent.util.BatteryUtils", false, loader),
                "isPowerSaveModeEnabled", boolean.class, Context.class);
        click = NativeIslandPersonalScene.exact(Class.forName("com.zte.briefagent.event.scene.travel.starryisland.BatteryChargingStarryIslandCardClickHandler", false, loader),
                "handleChargingClick", void.class, Context.class, String.class, Object.class);
        if (!Modifier.isStatic(enabled.getModifiers()) || !Modifier.isStatic(click.getModifiers()))
            throw new NoSuchMethodException("battery_read/callback static");
        adapter = adapterClass.getConstructor().newInstance();
        action = NativeIslandPersonalScene.exact(adapterClass, "getActionForViewId", String.class, int.class);
    }

    String rawId(Object item) throws Exception {
        Object info = entity.invoke(item);
        String value = info == null ? null : (String) relate.invoke(info);
        return value == null || value.isEmpty() ? (String) key.invoke(item) : value;
    }

    String wireId(String raw) throws Exception {
        if (raw == null || raw.isEmpty() || raw.length() > 256) return null;
        for (int i = 0; i < raw.length(); i++) {
            char c = raw.charAt(i);
            if (Character.isISOControl(c)) return null;
            if (Character.isHighSurrogate(c)) {
                if (++i == raw.length() || !Character.isLowSurrogate(raw.charAt(i))) return null;
            } else if (Character.isLowSurrogate(c)) return null;
        }
        byte[] digest = MessageDigest.getInstance("SHA-256").digest(raw.getBytes(StandardCharsets.UTF_8));
        StringBuilder id = new StringBuilder(NativeIslandCardProtocol.BATTERY_ID_PREFIX);
        for (byte value : digest) id.append(Character.forDigit((value & 255) >>> 4, 16)).append(Character.forDigit(value & 15, 16));
        return id.toString();
    }

    private boolean powerSave(Context context) throws Exception {
        Object power = context.getSystemService(Context.POWER_SERVICE);
        if (power == null) throw new IllegalStateException("missing_power_service");
        boolean state = Boolean.TRUE.equals(NativeIslandPersonalScene.exact(power.getClass(), "isPowerSaveMode", boolean.class).invoke(power));
        if (state != Boolean.TRUE.equals(enabled.invoke(null, context))) throw new IllegalStateException("battery_readback_mismatch");
        return state;
    }

    void validateActions(Context context) throws Exception {
        for (String name : new String[]{"btn_charging", "battery_card_content_area", "iv_battery_icon"}) {
            int view = context.getResources().getIdentifier(name, "id", "com.zte.personalagent");
            String expected = name.equals("btn_charging") ? "action_charging" : "action_card_click";
            if (view == 0 || !expected.equals(action.invoke(adapter, view))) throw new IllegalStateException("battery_action:" + name);
        }
        for (int view : new int[]{0, -1}) if (!"action_card_click".equals(action.invoke(adapter, view)))
            throw new IllegalStateException("battery_launch_action:" + view);
    }

    boolean actionAllowed(Context context, int view) throws Exception {
        String expected;
        if (view == context.getResources().getIdentifier("btn_charging", "id", "com.zte.personalagent")) expected = "action_charging";
        else if (view == 0 || view == -1 || view == context.getResources().getIdentifier("battery_card_content_area", "id", "com.zte.personalagent")
                || view == context.getResources().getIdentifier("iv_battery_icon", "id", "com.zte.personalagent")) expected = "action_card_click";
        else return false;
        return expected.equals(action.invoke(adapter, view)) && !powerSave(context);
    }

    void dispatch(Context context, Object item) throws Exception {
        // The actual entity and original database key go to the original callback, never the wire ID.
        // It performs the write, verifies the result, refreshes the entity, or opens its settings fallback.
        click.invoke(null, context, key.invoke(item), entity.invoke(item));
    }

    String unavailable(Context context) {
        try {
            validateActions(context);
            powerSave(context);
            for (String target : new String[]{"com.zte.powersavemode.intent.action.PowerSaveModeActivity", "android.settings.BATTERY_SAVER_SETTINGS"})
                if (launchable(context, new Intent(target))) return "";
            Object power = context.getSystemService(Context.POWER_SERVICE);
            NativeIslandPersonalScene.exact(power.getClass(), "setPowerSaveModeEnabled", boolean.class, boolean.class);
            return context.checkSelfPermission("android.permission.DEVICE_POWER") == android.content.pm.PackageManager.PERMISSION_GRANTED ? "" : "missing_battery_saver_target_or_permission";
        } catch (Exception missing) { return "battery_capability_unavailable:" + missing; }
    }

    private static boolean launchable(Context context, Intent intent) {
        try {
            ComponentName target = intent.resolveActivity(context.getPackageManager());
            if (target == null) return false;
            ActivityInfo info = context.getPackageManager().getActivityInfo(target, 0);
            return info.enabled && info.exported && info.applicationInfo != null && info.applicationInfo.enabled
                    && (info.permission == null || info.permission.isEmpty() || context.checkSelfPermission(info.permission) == android.content.pm.PackageManager.PERMISSION_GRANTED);
        } catch (Exception missing) { return false; }
    }
}
