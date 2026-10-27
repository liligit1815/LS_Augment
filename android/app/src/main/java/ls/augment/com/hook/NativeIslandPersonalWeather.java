package ls.augment.com.hook;

import android.content.Context;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Map;
import ls.augment.com.NativeIslandCardProtocol;

/** A weather composite displays weather but follows the reminder's identity, channel and expiry. */
final class NativeIslandPersonalWeather {
    final Method compositeEntity, preferences;
    private final Method left, right, entity, type, key, body, extra, convert, weatherInfo, suggestion, address,
            action;
    private final NativeIslandPersonalNavigation navigation;
    private final Class<?> weatherCard, defaultCard, weatherBody, reminderBody;
    private final Object adapter;
    private final Field directMode;
    private final ThreadLocal<Request> request = new ThreadLocal<>();

    NativeIslandPersonalWeather(ClassLoader loader, Class<?> composite, Class<?> card, Class<?> data, Class<?> adapterClass) throws Exception {
        left = NativeIslandPersonalScene.exact(composite, "getLeft", card);
        right = NativeIslandPersonalScene.exact(composite, "getRight", card);
        compositeEntity = NativeIslandPersonalScene.exact(composite, "getCardEntity", data);
        entity = NativeIslandPersonalScene.exact(card, "getCardEntity", data);
        key = NativeIslandPersonalScene.exact(card, "getKey", String.class);
        type = NativeIslandPersonalScene.exact(card, "getType", Class.forName("com.zte.briefagent.event.cards.CardType", false, loader));
        weatherCard = Class.forName("com.zte.briefagent.event.scene.weather.card.WeatherCard", false, loader);
        defaultCard = Class.forName("com.zte.briefagent.event.cards.impl.DefaultCard", false, loader);
        body = NativeIslandPersonalScene.exact(defaultCard, "getBody", Map.class);
        extra = NativeIslandPersonalScene.exact(data, "getExtraData", Map.class);
        weatherBody = Class.forName("com.zte.briefagent.event.scene.weather.data.WeatherCardBody", false, loader);
        reminderBody = Class.forName("com.zte.briefagent.event.scene.weather.card.ReminderBody", false, loader);
        weatherInfo = NativeIslandPersonalScene.exact(weatherBody, "getWeatherInfo", Class.forName("com.zte.briefagent.event.supplier.weather.WeatherInfo", false, loader));
        suggestion = NativeIslandPersonalScene.exact(reminderBody, "getSuggestion", String.class);
        address = NativeIslandPersonalScene.exact(reminderBody, "getToAddress", String.class);
        convert = NativeIslandPersonalCards.requireStatic(Class.forName("com.zte.briefagent.util.BeanUtils", false, loader), "mapToObject", Object.class, Map.class, Class.class);
        preferences = NativeIslandPersonalCards.requireStatic(Class.forName("com.zte.briefagent.util.SPUtils", false, loader), "getString", String.class, Context.class, String.class, String.class, String.class);
        adapter = adapterClass.getConstructor().newInstance();
        action = NativeIslandPersonalScene.exact(adapterClass, "getActionForViewId", String.class, int.class);
        Class<?> voice = Class.forName("com.zte.futurewidget.digitalHuman.VoiceBroadCastHelper", false, loader);
        for (String method : new String[]{"doNaviMoreBroadcast", "doTakeTaxiBroadcast"})
            NativeIslandPersonalCards.requireStatic(voice, method, void.class, Context.class, String.class);
        navigation = new NativeIslandPersonalNavigation(loader);
        directMode = NativeIslandPersonalCards.field(Class.forName("com.zte.briefagent.data.config.StaticConfig", false, loader), "isVoiceTest", boolean.class);
        if (!Modifier.isStatic(directMode.getModifiers())) throw new NoSuchFieldException("weather_navigation_mode static");
    }

    boolean matches(Object item) throws Exception {
        Object reminder = right.invoke(item);
        return defaultCard.isInstance(reminder) && "WEATHER_REMIND".equals(String.valueOf(type.invoke(reminder)));
    }
    Object reminder(Object item) throws Exception { return entity.invoke(right.invoke(item)); }
    Object weather(Object item) throws Exception { return entity.invoke(left.invoke(item)); }
    String id(Object item) throws Exception { return wireId((String) key.invoke(right.invoke(item))); }
    String wireId(String raw) {
        String wire = raw == null ? null : "duo_weather_" + raw;
        return NativeIslandCardProtocol.weatherId(wire) ? wire : null;
    }
    Request data(Context context, Object item) throws Exception {
        Object a = left.invoke(item), b = right.invoke(item);
        if (!weatherCard.isInstance(a) || !matches(item) || !"WEATHER_CARD".equals(String.valueOf(type.invoke(a))) || id(item) == null)
            throw new IllegalStateException("weather_composite_children_or_identity");
        Object wa = entity.invoke(a), rb = entity.invoke(b);
        if (wa == null || rb == null) throw new IllegalStateException("weather_missing_entity");
        Object w = convert.invoke(null, extra.invoke(wa), weatherBody), r = convert.invoke(null, body.invoke(b), reminderBody);
        if (w == null || weatherInfo.invoke(w) == null || r == null) throw new IllegalStateException("weather_missing_data");
        String text = (String) suggestion.invoke(r), destination = (String) address.invoke(r);
        if (text == null || text.isEmpty() || destination == null || destination.isEmpty()) throw new IllegalStateException("weather_empty_suggestion_or_destination");
        return new Request(context, text, destination);
    }
    boolean actionAllowed(Context context, int view) {
        return view > 0 && (view == context.getResources().getIdentifier("btn_more_options", "id", "com.zte.personalagent")
                || view == context.getResources().getIdentifier("btn_to_taxi", "id", "com.zte.personalagent"));
    }
    void install(AugmentModule module) {
        module.registerFeatureHook(module.prepareFeatureHook(preferences, "rm.personal.native_cards.weather_action_data", false).intercept(chain -> {
            Request current = request.get();
            if (current != null && chain.getArgs().get(0) instanceof Context
                    && ((Context) chain.getArgs().get(0)).getApplicationContext() == current.context
                    && "starry_island_config".equals(chain.getArgs().get(1))) {
                if ("sp_suggestion_key".equals(chain.getArgs().get(2))) return current.suggestion;
                if ("sp_to_address_key".equals(chain.getArgs().get(2))) return current.address;
            }
            return chain.proceed(chain.getArgs().toArray());
        }));
    }
    void dispatch(Context context, Object item, int view) throws Exception {
        Request current = data(context, item), previous = request.get();
        if (!actionAllowed(context, view)) return;
        request.set(current);
        try {
            if (Boolean.TRUE.equals(directMode.get(null)) || NativeIslandPersonalNavigation.voiceAvailable(context)) {
                // The OEM lookup itself performs the action; never call it during preflight.
                action.invoke(adapter, view);
            } else if (navigation.available(context)) {
                // Use the OEM's existing direct-map route when its voice assistant is absent.
                String command = view == context.getResources().getIdentifier("btn_to_taxi", "id", "com.zte.personalagent")
                        ? "extract_address_navi_take_taxi" : "extract_address_navi_by_drive";
                navigation.start(context, command, current.address);
            }
        } finally { if (previous == null) request.remove(); else request.set(previous); }
    }
    String unavailable(Context context) {
        try {
            if (!Boolean.TRUE.equals(directMode.get(null)) && NativeIslandPersonalNavigation.voiceAvailable(context)) return "";
            return navigation.available(context) ? "" : "missing_weather_navigation_target";
        } catch (Exception missing) { return "weather_navigation_unavailable:" + missing; }
    }
    private static final class Request {
        final Context context;
        final String suggestion, address;
        Request(Context context, String suggestion, String address) { this.context = context.getApplicationContext(); this.suggestion = suggestion; this.address = address; }
    }
}
