package ls.augment.com.hook;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/** Modern flight layouts keep OEM actions, with each SDK button tied to its current source data. */
final class NativeIslandPersonalFlightModern {
    private static final String PKG = "com.zte.personalagent", ACTIVITY = "com.zte.briefagent.activity.";
    private static final String CARD = "action_flight_card_click", NAV = "action_flight_navigation_click",
            TAXI = "action_flight_take_taxi_click", BOOK = "action_flight_booking_click";
    final Method button, nightChanged, stopNight, periodic;
    private final Method helperClick, build, data, attribute, handle, installed, storeIntent, webUrl;
    private final Field actionText, operation, destination, taxiAddress;
    private final Field activeAdapters, hashes;
    private final NativeIslandPersonalFlightState state;
    private final NativeIslandPersonalNavigation navigation;

    NativeIslandPersonalFlightModern(ClassLoader loader, Class<?> adapter, Class<?> entity,
                                    NativeIslandPersonalFlightState state) throws Exception {
        this.state = state;
        data = NativeIslandPersonalScene.exact(entity, "getExtraData", Map.class);
        Class<?> attributes = Class.forName("com.zte.briefagent.util.AttributeHelper", false, loader);
        attribute = NativeIslandPersonalCards.requireStatic(attributes, "getExtra", Object.class, Map.class, String.class, Object.class);
        Class<?> content = Class.forName("com.zte.briefagent.event.scene.travel.starryisland.FlightIslandBigCardBuilder$Content", false, loader);
        build = NativeIslandPersonalCards.requireStatic(Class.forName("com.zte.briefagent.event.scene.travel.starryisland.FlightIslandBigCardBuilder", false, loader),
                "build", content, Context.class, Map.class, String.class);
        actionText = NativeIslandPersonalCards.field(content, "actionTextResId", int.class);
        operation = NativeIslandPersonalCards.field(content, "action", String.class);
        destination = NativeIslandPersonalCards.field(content, "navigationDest", String.class);
        taxiAddress = NativeIslandPersonalCards.field(content, "taxiAddress", String.class);
        Class<?> helper = Class.forName("com.zte.toolsdk.producer.RemoteViewsHelper", false, loader);
        helperClick = NativeIslandPersonalScene.exact(helper, "setOnClickListener", void.class, int.class);
        button = NativeIslandPersonalCards.require(adapter, "setBigCardActionButtonClick", void.class,
                Context.class, helper, String.class, String.class, String.class, String.class);
        stopNight = NativeIslandPersonalCards.require(adapter, "removeNightObserver", void.class);
        nightChanged = callback(adapter, "lambda$startNightObserver$0", String.class, Context.class, Map.class,
                String.class, int.class, int[].class, String.class, Intent.class, boolean.class);
        nightChanged.setAccessible(true);
        periodic = NativeIslandPersonalCards.require(Class.forName("com.zte.briefagent.event.cards.render.StarryIslandCardRender", false, loader),
                "checkAndForceRefreshPersistentCards", void.class);
        Class<?> renderer = periodic.getDeclaringClass();
        activeAdapters = NativeIslandPersonalCards.field(renderer, "cardIdToAdapterMap", Map.class);
        hashes = NativeIslandPersonalCards.field(renderer, "cardDataHashes", Map.class);
        for (Method method : new Method[]{helperClick, button, stopNight, nightChanged, periodic})
            if (method.getReturnType() != void.class || Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException("flight_instance:" + method.getName());
        handle = NativeIslandPersonalCards.requireStatic(Class.forName("com.zte.briefagent.event.cards.starryisland.StarryIslandActionHelper", false, loader),
                "handleAction", void.class, Context.class, String.class, int.class, String.class, String.class, Map.class, entity);
        Class<?> click = Class.forName("com.zte.briefagent.event.scene.travel.starryisland.FlightStarryIslandCardClickHandler", false, loader);
        NativeIslandPersonalCards.requireStatic(click, "handleCardClick", void.class, Context.class, String.class, entity, String.class, String.class, String.class);
        NativeIslandPersonalCards.requireStatic(click, "handleBookingClick", void.class, Context.class, String.class, entity);
        for (String method : new String[]{"handleNavigationClick", "handleTakeTaxiClick"})
            NativeIslandPersonalCards.requireStatic(click, method, void.class, Context.class, String.class, entity, Map.class);
        Class<?> launcher = Class.forName("com.zte.briefagent.util.AppLauncher", false, loader);
        NativeIslandPersonalCards.requireStatic(launcher, "launchFlightAppWithJumpUrl", boolean.class, Context.class, String.class, String.class, String.class);
        NativeIslandPersonalCards.requireStatic(launcher, "launchFlightApp", boolean.class, Context.class);
        installed = NativeIslandPersonalCards.requireStatic(launcher, "isAppInstalled", boolean.class, Context.class, String.class);
        storeIntent = NativeIslandPersonalCards.requireStatic(launcher, "createAppStoreIntent", Intent.class, String.class);
        webUrl = NativeIslandPersonalCards.requireStatic(launcher, "isWebUrl", boolean.class, String.class);
        for (String name : new String[]{"CloudPushProviderWebActivity", "FlightNavigationActionActivity"})
            if (!Activity.class.isAssignableFrom(Class.forName(ACTIVITY + name, false, loader))) throw new ClassNotFoundException(name + " Activity");
        navigation = new NativeIslandPersonalNavigation(loader);
    }

    void attachButton(Context context, Object helper) throws Exception { helperClick.invoke(helper, id(context, "tv_flight_big_action_button")); }
    void stop(Object adapter) throws Exception { stopNight.invoke(adapter); }
    boolean active(Object renderer, Object adapter) throws Exception {
        for (Object value : ((Map<?, ?>) activeAdapters.get(renderer)).values()) if (value == adapter) return true;
        return false;
    }
    void invalidate(Object renderer, Object adapter) throws Exception {
        Map<?, ?> cache = (Map<?, ?>) hashes.get(renderer);
        for (Map.Entry<?, ?> entry : ((Map<?, ?>) activeAdapters.get(renderer)).entrySet())
            if (entry.getValue() == adapter) cache.remove(entry.getKey());
    }
    @SuppressWarnings("unchecked") private Map<String, Object> data(Object entity) throws Exception {
        Map<String, Object> value = (Map<String, Object>) data.invoke(entity);
        return value == null ? new HashMap<>() : new HashMap<>(value);
    }
    private String value(Map<String, Object> data, String key) throws Exception { return (String) attribute.invoke(null, data, key, ""); }
    Action action(Context context, Object entity, int view) throws Exception {
        Map<String, Object> values = data(entity), params = new HashMap<>();
        String phase = state.phase(entity), op;
        if (view == id(context, "tv_flight_big_action_button")) {
            Object content = build.invoke(null, context, values, phase);
            if ((Integer) actionText.get(content) == 0) return null;
            op = (String) operation.get(content);
            if (!NAV.equals(op) && !TAXI.equals(op) && !BOOK.equals(op)) throw new IllegalStateException("unsupported_flight_button:" + op);
            if (NAV.equals(op)) {
                String target = (String) destination.get(content);
                if (target == null || target.trim().isEmpty()) return null;
                // The native handler appends this suffix. Bypass the Activity's second append.
                target = target.trim();
                while (target.endsWith("机场") && target.length() > 2) target = target.substring(0, target.length() - 2);
                if (target.equals("机场")) return null;
                params.put("dest", target);
            } else if (TAXI.equals(op)) params.put("taxiAddress", Objects.toString(taxiAddress.get(content), ""));
        } else if (view == 0 || view == -1 || view == id(context, "ll_flight_big_card_content_area") || view == id(context, "iv_flight_big_logo")) {
            op = CARD;
            for (String key : new String[]{"jumpUrl", "wxappURL", "webURL"}) params.put(key, value(values, key));
        } else return null;
        return new Action(phase, op, params);
    }
    boolean valid(Context context, Object entity) throws Exception {
        Action body = action(context, entity, 0), button = action(context, entity, id(context, "tv_flight_big_action_button"));
        return body != null && available(context, body) && (button == null || available(context, button));
    }
    boolean available(Context context, Action action) throws Exception {
        if (CARD.equals(action.operation)) return detailAvailable(context, action.params);
        if (BOOK.equals(action.operation)) return flightHome(context);
        if (NAV.equals(action.operation)) return nativeNavigation(context) || navigation.available(context);
        if (TAXI.equals(action.operation)) return nativeTaxi(context) || navigation.available(context);
        return false;
    }
    String unavailable(Context context) {
        try {
            // A source-provided web URL can be valid even when no standalone flight app exists.
            return flightHome(context) || wechat(context) || internal(context, "CloudPushProviderWebActivity") ? "" : "missing_flight_launch_target";
        } catch (Exception failure) { return "flight_launch_target_unavailable:" + failure; }
    }
    void dispatch(Context context, String cardId, Object entity, int view, Action action) throws Exception {
        if (!available(context, action)) return;
        if (NAV.equals(action.operation) && !nativeNavigation(context)) {
            navigation.start(context, "extract_address_navi_by_drive", action.params.get("dest") + "机场");
        } else if (TAXI.equals(action.operation) && !nativeTaxi(context)) {
            navigation.start(context, "extract_address_navi_take_taxi", (String) action.params.get("taxiAddress"));
        } else handle.invoke(null, context, cardId, view, cardId, action.operation, new HashMap<>(action.params), entity);
    }
    private boolean nativeNavigation(Context context) {
        return internal(context, "FlightNavigationActionActivity") && NativeIslandPersonalNavigation.voiceAvailable(context);
    }
    private boolean nativeTaxi(Context context) throws Exception {
        if (isInstalled(context, "com.sdu.didi.psnger")) return launch(context, context.getPackageManager().getLaunchIntentForPackage("com.sdu.didi.psnger"), "com.sdu.didi.psnger");
        return NativeIslandPersonalNavigation.voiceAvailable(context);
    }
    private boolean detailAvailable(Context context, Map<String, Object> params) throws Exception {
        String url = (String) params.get("jumpUrl");
        if (!url.isEmpty() && isInstalled(context, "vz.com")
                && (launch(context, new Intent("android.intent.action.VIEW").setPackage("vz.com").setData(Uri.parse(url)), "vz.com") || flightHome(context))) return true;
        if (!((String) params.get("wxappURL")).isEmpty() && wechat(context)) return true;
        if (Boolean.TRUE.equals(webUrl.invoke(null, params.get("webURL"))) && internal(context, "CloudPushProviderWebActivity")) return true;
        return flightHome(context) || wechat(context);
    }
    private boolean flightHome(Context context) throws Exception {
        if (isInstalled(context, "vz.com") && launch(context, context.getPackageManager().getLaunchIntentForPackage("vz.com"), "vz.com")) return true;
        Intent probe = (Intent) storeIntent.invoke(null, "vz.com");
        String pkg = probe == null ? null : probe.getPackage();
        if (!"cn.nubia.neostore".equals(pkg) && !"zte.com.market".equals(pkg)) return false;
        String uri = "cn.nubia.neostore".equals(pkg) ? "market://search?q=" : "http://market.android.com/search?q=name:";
        return launch(context, new Intent("android.intent.action.VIEW").setPackage(pkg).setData(Uri.parse(uri + Uri.encode("飞常准"))), pkg);
    }
    private boolean wechat(Context context) throws Exception {
        if (!isInstalled(context, "com.tencent.mm")) return false;
        Intent mini = new Intent("com.zte.fingerflashpay.WECHAT_TASK").setClassName("com.zte.fingerflashpay", "com.zte.fingerflashpay.FingerFlashPayActivity").setPackage("com.zte.fingerflashpay");
        return launch(context, mini, "com.zte.fingerflashpay")
                || launch(context, new Intent().setComponent(new ComponentName("com.tencent.mm", "com.tencent.mm.ui.LauncherUI")), "com.tencent.mm")
                || launch(context, context.getPackageManager().getLaunchIntentForPackage("com.tencent.mm"), "com.tencent.mm");
    }
    private boolean isInstalled(Context context, String pkg) throws Exception { return Boolean.TRUE.equals(installed.invoke(null, context, pkg)); }
    private static boolean launch(Context context, Intent intent, String pkg) { return NativeIslandPersonalNavigation.launchable(context, intent, pkg); }
    private static boolean internal(Context context, String name) {
        try { return NativeIslandPersonalNavigation.accessible(context, context.getPackageManager().getActivityInfo(new ComponentName(PKG, ACTIVITY + name), 0), true); }
        catch (Exception missing) { return false; }
    }
    private static int id(Context context, String name) { return context.getResources().getIdentifier(name, "id", PKG); }
    private static Method callback(Class<?> owner, String name, Class<?>... arguments) throws NoSuchMethodException {
        // This OEM callback is synthetic; the general contract finder deliberately excludes
        // synthetic methods. Check its exact signature while allowing an inherited definition.
        for (Class<?> type = owner; type != null; type = type.getSuperclass()) {
            try { return type.getDeclaredMethod(name, arguments); }
            catch (NoSuchMethodException absent) { }
        }
        throw new NoSuchMethodException(owner.getName() + "." + name);
    }
    static final class Action {
        final String phase, operation;
        final Map<String, Object> params;
        Action(String phase, String operation, Map<String, Object> params) { this.phase = phase; this.operation = operation; this.params = Collections.unmodifiableMap(new HashMap<>(params)); }
        boolean same(Action other) { return other != null && phase.equals(other.phase) && operation.equals(other.operation) && params.equals(other.params); }
    }
}
