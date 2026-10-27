package ls.augment.com.hook;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import ls.augment.com.NativeIslandCardProtocol;

/** Independent OEM source contracts; a missing optional scene leaves the others intact. */
final class NativeIslandPersonalScene {
    static final String MEETING = "calendar_meeting", GUIDE = "scenic_guide", CHARGING = "nearby_charging", CYCLING = "cycling", FLIGHT = "flight", BATTERY = "preflight_battery", WEATHER = "weather_travel";
    private static final String PKG = "com.zte.personalagent", CARDS = "com.zte.briefagent.event.cards.";
    final String id, type;
    final Class<?> cardClass, adapterClass;
    final Method create, cardId, supportsChannel;
    final NativeIslandPersonalCycling cycling;
    final NativeIslandPersonalFlight flight;
    final NativeIslandPersonalBattery battery;
    final NativeIslandPersonalWeather weather;
    private final String[] layouts, views;
    private final Method nativeId, cardEntity, contextFactory, remove, cardType;
    private final Method meetingViews, meetingVisibility;
    private final Field adapters, pushes, finishes;

    NativeIslandPersonalScene(ClassLoader loader, String id) throws Exception {
        this.id = id;
        boolean guide = GUIDE.equals(id);
        boolean charging = CHARGING.equals(id);
        boolean bike = CYCLING.equals(id);
        boolean air = FLIGHT.equals(id);
        boolean power = BATTERY.equals(id);
        boolean forecast = WEATHER.equals(id);
        if (!guide && !charging && !bike && !air && !power && !forecast && !MEETING.equals(id)) throw new IllegalArgumentException("unknown_personal_scene:" + id);
        type = forecast ? "WEATHER_REMIND" : power ? "TRAVEL_PRE_FLIGHT_BATTERY_LOW" : air ? null : bike ? "RETURN_BIKE" : charging ? "CHARGING_REMINDER" : guide ? "ELECTRONIC_GUIDE_CARD" : "MEETING_CARD";
        String stem = "com.zte.briefagent.event.scene." + (forecast ? "weather." : air || power ? "travel." : bike ? "cycling." : charging ? "charge." : guide ? "electronicguide." : "meeting.");
        String name = forecast ? "Weather" : power ? "BatteryCharging" : air ? "Flight" : bike ? "ReturnBike" : charging ? "ChargingReminder" : guide ? "ElectronicGuide" : "Meeting";
        Class<?> entity = Class.forName(PKG + ".database.data.model.entities.Card", false, loader);
        Class<?> cardContext = Class.forName(CARDS + "CardContext", false, loader);
        Class<?> card = Class.forName(CARDS + "ICard", false, loader);
        Class<?> message = Class.forName("com.zte.toolsdk.common.CardMessage", false, loader);
        if (MEETING.equals(id)) {
            Class<?> remote = Class.forName("com.zte.toolsdk.widget.RemoteViews", false, loader);
            meetingViews = exact(message, "getRemoteViews", remote);
            meetingVisibility = exact(remote, "setViewVisibility", void.class, int.class, int.class);
            if (Modifier.isStatic(meetingViews.getModifiers()) || Modifier.isStatic(meetingVisibility.getModifiers()))
                throw new NoSuchMethodException("meeting presentation methods must be instance methods");
        } else { meetingViews = meetingVisibility = null; }
        cardClass = Class.forName(forecast ? CARDS + "shape.Weather4x2Card" : air || power ? CARDS + "impl.DefaultCard" : stem + "card." + name + "Card", false, loader);
        cardType = exact(card, "getType", Class.forName(CARDS + "CardType", false, loader));
        adapterClass = Class.forName(stem + "starryisland." + name + "StarryIslandAdapter", false, loader);
        create = exact(adapterClass, "createCardMessage", message, cardContext);
        cardId = exact(adapterClass, "getCardId", String.class, cardContext);
        exact(adapterClass, "getActionForViewId", String.class, int.class);
        remove = exact(adapterClass, "shouldRemoveCard", boolean.class, cardContext, long.class, long.class);
        if (!charging && !air && !power && !forecast) exact(cardClass, "call", void.class, String.class, Map.class);
        supportsChannel = exact(cardClass, "supportsChannel", boolean.class, int.class);
        cycling = bike ? new NativeIslandPersonalCycling(loader, cardClass, card) : null;
        flight = air ? new NativeIslandPersonalFlight(loader, adapterClass, entity) : null;
        battery = power ? new NativeIslandPersonalBattery(loader, card, entity, adapterClass) : null;
        weather = forecast ? new NativeIslandPersonalWeather(loader, cardClass, card, entity, adapterClass) : null;
        Class<?> handler = forecast ? null : Class.forName(stem + "starryisland." + name + "StarryIslandCardClickHandler", false, loader);
        if (charging) {
            Method click = exact(handler, "handleAction", boolean.class, Context.class, String.class, cardContext);
            Method launch = exact(Class.forName("com.zte.briefagent.util.WeChatMiniprogramLauncher", false, loader),
                    "launchMonsterChargingMiniprogram", boolean.class, Context.class);
            handler.getConstructor();
            if (Modifier.isStatic(click.getModifiers()) || !Modifier.isStatic(launch.getModifiers()))
                throw new NoSuchMethodException(name + ".callback/launcher modifiers");
        } else if (!power && !forecast) {
            Method click = exact(handler, "handleCardClick", void.class, Context.class, String.class, entity);
            if (!Modifier.isStatic(click.getModifiers())) throw new NoSuchMethodException(name + ".callback static");
        }
        if (Modifier.isStatic(supportsChannel.getModifiers())) throw new NoSuchMethodException(name + ".channel instance");
        layouts = forecast ? new String[]{"notification_unusual_weather_custom", "notification_unusual_weather_capsule"}
                : power ? new String[]{"notification_battery_charging_custom", "starryisland_battery_charging", "mini_island_battery_charging"}
                : air ? flight.modern != null ? new String[]{"starryisland_flight_big", "starryisland_flight", "starryisland_flight_mini"}
                : new String[]{"notification_flight_scene_custom", "starryisland_flight"}
                : bike ? new String[]{"notification_return_bike_custom", "starryisland_bike", "mini_island_bike"}
                : charging ? new String[]{"notification_charging_reminder_custom", "starryisland_charging_reminder", "mini_island_charging_reminder"}
                : guide ? new String[]{"starryisland_electronic_guide", "starryisland_electronic_guide_big", "mini_island_electronic_guide"}
                : new String[]{"starryisland_meeting", "starryisland_meeting_big", "mini_island_meeting"};
        views = forecast ? new String[]{"tv_weather_suggestion", "tv_to_address", "btn_more_options", "btn_to_taxi", "iv_weather_icon", "tv_weather_small_suggestion"}
                : power ? new String[]{"tv_battery_title", "tv_battery_content", "btn_charging", "battery_card_content_area", "iv_battery_icon", "iv_battery_icon_capsule", "tv_charging_text_capsule"}
                : air && flight.modern != null ? new String[]{"iv_flight_big_logo", "tv_flight_big_status", "tv_flight_big_airline_number",
                "tv_flight_big_remind", "tv_flight_big_remind_tail", "ll_flight_big_remind_row", "tv_flight_big_departure_time",
                "tv_flight_big_departure_terminal", "tv_flight_big_arrival_time", "tv_flight_big_arrival_terminal", "tv_flight_big_departure_date",
                "tv_flight_big_duration", "v_flight_big_dash_line", "tv_flight_big_bottom_layout", "tv_flight_big_action_button",
                "ll_flight_big_card_content_area", "iv_flight_capsule", "tv_flight_number_capsule", "tv_flight_status_capsule"}
                : air ? new String[]{"tv_flight_title_area", "tv_flight_number_and_status", "btn_flight_detail",
                "tv_flight_number_capsule", "tv_flight_status_capsule", "ll_flight_card_content_area", "iv_flight_icon"}
                : bike ? new String[]{"tv_bike_title", "iv_bike_time", "iv_time_unit", "btn_return_bike", "bike_card_content_area", "iv_bike_icon", "iv_time_unit_capsule"}
                : charging ? new String[]{"tv_charging_title", "tv_charging_content", "btn_nearby_charging", "charging_card_content_area",
                "iv_charging_icon", "iv_charging_icon_capsule", "tv_charging_text_capsule"}
                : guide ? new String[]{"electronic_guide_card_content_area", "iv_electronic_guide_icon", "tv_electronic_guide_location",
                "tv_electronic_guide_introduction", "tv_electronic_guide_title_capsule", "btn_view_details"}
                : new String[]{"btn_join_meeting", "btn_ignore_meeting", "meeting_card_content_area", "iv_meeting_icon",
                "tv_meeting_title", "tv_meeting_time", "tv_meeting_address", "tv_meeting_organizer", "tv_meeting_title_capsule", "iv_time_unit_capsule"};
        if (timed()) {
            Class<?> renderer = Class.forName(CARDS + "render.StarryIslandCardRender", false, loader);
            nativeId = NativeIslandPersonalCards.require(renderer, "getCardStarryIslandId", String.class, card);
            cardEntity = exact(card, "getCardEntity", entity);
            contextFactory = exact(Class.forName(CARDS + "DefaultCardContext", false, loader), "of", cardContext, Context.class, entity, card);
            if (!Modifier.isStatic(contextFactory.getModifiers())) throw new NoSuchMethodException("DefaultCardContext.of static");
            adapters = NativeIslandPersonalCards.field(renderer, "cardIdToAdapterMap", Map.class);
            pushes = NativeIslandPersonalCards.field(renderer, "cardIdToPushTimeMap", Map.class);
            finishes = NativeIslandPersonalCards.field(renderer, "cardIdToFinishedTimeMap", Map.class);
            if (guide && !android.app.Activity.class.isAssignableFrom(Class.forName(PKG + ".scenic.ScenicDetailActivity", false, loader)))
                throw new ClassNotFoundException("ScenicDetailActivity is not an Activity");
        } else { nativeId = cardEntity = contextFactory = null; adapters = pushes = finishes = null; }
    }

    void validateResources(Context context) throws Exception {
        for (String name : layouts) resource(context, name, "layout");
        for (String name : views) resource(context, name, "id");
        if (weather != null) resource(context, "ic_wea_notic_thunder_shower_flat", "drawable");
        if (flight != null && flight.modern != null) {
            resource(context, "airplane_icon", "drawable"); resource(context, "flight_small_island_title_color", "color");
        }
        if (battery != null) { resource(context, "pic_battery_low", "drawable"); battery.validateActions(context); }
        if (GUIDE.equals(id) && !context.getPackageManager().getActivityInfo(new ComponentName(PKG, PKG + ".scenic.ScenicDetailActivity"), 0).enabled)
            throw new IllegalStateException("disabled_ScenicDetailActivity");
        if (CHARGING.equals(id)) {
            resource(context, "power_bank", "drawable");
            // Keep the OEM launcher and its WeChat-home fallback; never invent a mini-app URI.
            ComponentName mini = new Intent("miboard.intent.action.WxMiniProgram").setPackage("com.zte.mifavor.miboard")
                    .resolveActivity(context.getPackageManager());
            if (!launchable(context, mini) && !launchable(context, new ComponentName("com.tencent.mm", "com.tencent.mm.ui.LauncherUI")))
                throw new IllegalStateException("missing_charging_launch_target");
        }
    }
    boolean acceptsId(String rawId) {
        if (WEATHER.equals(id)) return NativeIslandCardProtocol.weatherId(rawId);
        if (BATTERY.equals(id)) return NativeIslandCardProtocol.batteryId(rawId);
        if (FLIGHT.equals(id)) return NativeIslandCardProtocol.flightId(rawId);
        // Verified upstream task key and the adapter's own fallback. Unknown identities stay native.
        if (CYCLING.equals(id)) return "ReturnBike".equals(rawId);
        return !CHARGING.equals(id) || "ChargingPowerReminder".equals(rawId) || "ChargingReminder".equals(rawId);
    }
    void finishMessage(Context context, Object message, Map<?, ?> data) throws Exception {
        if (meetingViews == null) return;
        Object views = meetingViews.invoke(message);
        if (views == null) throw new IllegalStateException("missing_meeting_large_card");
        for (String key : new String[]{"address", "organizer"}) {
            Object value = data == null ? null : data.get(key);
            boolean present = value instanceof String && !((String) value).trim().isEmpty();
            int id = context.getResources().getIdentifier("tv_meeting_" + key, "id", PKG);
            // Empty optional fields must not expose the sample text in the OEM layout.
            meetingVisibility.invoke(views, id, present ? 0 : 8);
        }
    }
    boolean matches(Object item) throws Exception {
        if (!cardClass.isInstance(item)) return false;
        if (weather != null) return weather.matches(item);
        String actual = String.valueOf(cardType.invoke(item));
        return FLIGHT.equals(id) ? NativeIslandCardProtocol.flightType(actual) : type.equals(actual);
    }
    boolean timed() { return GUIDE.equals(id) || CYCLING.equals(id) || FLIGHT.equals(id) || BATTERY.equals(id) || WEATHER.equals(id); }
    private static boolean launchable(Context context, ComponentName component) {
        if (component == null) return false;
        try {
            android.content.pm.ActivityInfo info = context.getPackageManager().getActivityInfo(component, 0);
            return info.enabled && info.exported && info.applicationInfo != null && info.applicationInfo.enabled;
        } catch (Exception unavailable) { return false; }
    }
    private static void resource(Context context, String name, String kind) {
        if (context.getResources().getIdentifier(name, kind, PKG) == 0) throw new IllegalStateException("missing_" + kind + ":" + name);
    }
    static Method exact(Class<?> owner, String name, Class<?> result, Class<?>... args) throws Exception {
        // getMethod includes concrete interface defaults used by old and new PersonalAgent builds.
        Method method = owner.getMethod(name, args);
        if (method.getReturnType() != result || Modifier.isAbstract(method.getModifiers()) && !owner.isInterface())
            throw new NoSuchMethodException(owner.getName() + "." + name);
        method.setAccessible(true);
        return method;
    }

    /** Save OEM timestamps, never old CardMessages. Only Duo-initiated recovery uses this history. */
    final class Replay {
        final Context context;
        final Map<String, Display> displayed = new HashMap<>();
        Replay(Context context) { this.context = context; }
        String id(Object renderer, Object card) throws Exception {
            return weather != null ? weather.id(card) : battery != null ? battery.wireId(battery.rawId(card)) : (String) nativeId.invoke(renderer, card);
        }
        boolean valid(Object renderer, Object card) throws Exception {
            Display previous = displayed.get(id(renderer, card));
            if (previous == null) return true;
            Object data = weather != null ? weather.reminder(card) : cardEntity.invoke(card);
            Object cc = contextFactory.invoke(null, context, data, card);
            return !Boolean.TRUE.equals(remove.invoke(previous.adapter, cc,
                    previous.finished == null ? previous.pushed : previous.finished, System.currentTimeMillis()));
        }
        void retain(Object renderer, List<?> current) throws Exception {
            Set<String> ids = new HashSet<>();
            for (Object item : current) if (matches(item)) ids.add(id(renderer, item));
            displayed.keySet().retainAll(ids);
        }
        @SuppressWarnings("unchecked") void capture(Object renderer, List<?> selected, boolean internal) throws Exception {
            Map<?, ?> activeAdapters = (Map<?, ?>) adapters.get(renderer);
            Map<String, Long> activePushes = (Map<String, Long>) pushes.get(renderer);
            Map<String, Long> activeFinishes = (Map<String, Long>) finishes.get(renderer);
            for (Object item : selected) if (matches(item)) {
                String key = id(renderer, item);
                Object adapter = activeAdapters.get(key), time = activePushes.get(key), finished = activeFinishes.get(key);
                if (!activeAdapters.containsKey(key)) continue; // Native hidden/expired/no-card path.
                if (!adapterClass.isInstance(adapter) || !(time instanceof Long) || finished != null && !(finished instanceof Long))
                    throw new IllegalStateException(NativeIslandPersonalScene.this.id + "_display_adapter_or_timestamp:" + key);
                Display previous = displayed.get(key);
                if (internal && previous != null) {
                    // Renderer CREATE would start a new timer after reconnect. Keep its original deadline.
                    activePushes.put(key, previous.pushed);
                    if (previous.finished == null) activeFinishes.remove(key); else activeFinishes.put(key, previous.finished);
                } else displayed.put(key, new Display(adapter, (Long) time, (Long) finished));
            }
        }
    }
    private static final class Display {
        final Object adapter;
        final long pushed;
        final Long finished;
        Display(Object adapter, long pushed, Long finished) { this.adapter = adapter; this.pushed = pushed; this.finished = finished; }
    }
}
