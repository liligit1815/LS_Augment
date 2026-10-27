package ls.augment.com.hook;

import android.content.Context;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

/** Reads the verified OEM flight policy without starting its display clock during preflight. */
final class NativeIslandPersonalFlightState {
    final boolean modern;
    private final Object adapter;
    private final Method entityType, extraData, extra, infer, show, skip, relate, stateKey, ignored;

    NativeIslandPersonalFlightState(ClassLoader loader, Class<?> adapterClass, Class<?> entity) throws Exception {
        adapter = adapterClass.getConstructor().newInstance();
        entityType = NativeIslandPersonalScene.exact(entity, "getType", String.class);
        extraData = NativeIslandPersonalScene.exact(entity, "getExtraData", Map.class);
        extra = NativeIslandPersonalCards.requireStatic(Class.forName("com.zte.briefagent.util.AttributeHelper", false, loader),
                "getExtra", Object.class, Map.class, String.class, Object.class);
        infer = NativeIslandPersonalCards.require(adapterClass, "inferPhaseFromCardType", String.class, String.class);
        show = NativeIslandPersonalCards.require(adapterClass, "shouldShowStarryIsland", boolean.class, String.class);
        Method candidate = find(adapterClass, "shouldSkipDisplayFor10SecondPhase", String.class, Map.class, Context.class);
        modern = candidate != null;
        skip = modern ? candidate : NativeIslandPersonalCards.require(adapterClass,
                "shouldSkipDisplayFor10SecondPhase", boolean.class, String.class, Map.class);
        if (skip.getReturnType() != boolean.class) throw new NoSuchMethodException("flight_skip boolean");
        for (Method method : new Method[]{infer, show, skip})
            if (Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException("flight_phase instance:" + method.getName());
        if (modern) {
            relate = NativeIslandPersonalScene.exact(entity, "getRelateKey", String.class);
            Class<?> ignore = Class.forName("com.zte.briefagent.event.scene.travel.task.TravelFlightIgnoreManager", false, loader);
            stateKey = NativeIslandPersonalCards.requireStatic(ignore, "resolveStateKey", String.class, Map.class);
            ignored = NativeIslandPersonalCards.requireStatic(ignore, "isIgnored", boolean.class, Context.class, String.class, String.class);
            // These methods distinguish the persistent/alert contract from a merely changed argument list.
            for (Method method : new Method[]{
                    NativeIslandPersonalCards.require(adapterClass, "isPersistentIsland", boolean.class, String.class, Map.class),
                    NativeIslandPersonalCards.require(adapterClass, "isAlertDisplayDurationReached", boolean.class, Map.class, long.class)})
                if (Modifier.isStatic(method.getModifiers())) throw new NoSuchMethodException("flight_policy instance:" + method.getName());
        } else { relate = stateKey = ignored = null; }
    }

    @SuppressWarnings("unchecked") private Map<String, Object> data(Object entity) throws Exception {
        Map<String, Object> data = (Map<String, Object>) extraData.invoke(entity);
        return data == null ? new HashMap<>() : new HashMap<>(data);
    }
    String phase(Object entity) throws Exception { return phase(entity, data(entity)); }
    private String phase(Object entity, Map<String, Object> data) throws Exception {
        String value = (String) extra.invoke(null, data, "flightPhase", "");
        if (value.isEmpty()) value = (String) infer.invoke(adapter, entityType.invoke(entity));
        switch (value) {
            case "AFTER_BOOKING": case "BEFORE_DEPARTURE_24H": case "AT_AIRPORT": case "BOARDING":
            case "DELAYED": case "AFTER_ARRIVAL": case "BEFORE_DEPARTURE_DAYS": case "IN_FLIGHT": return value;
            case "BEFORE_DEPARTURE_3H": case "ABNORMAL": case "CANCELLED": case "REFUNDED":
                if (modern) return value;
                break;
            default: break;
        }
        throw new IllegalStateException("unsupported_flight_phase:" + value);
    }
    boolean displayable(Context context, Object entity) throws Exception {
        Map<String, Object> data = data(entity);
        String phase = phase(entity, data);
        if (modern) {
            if (context == null) throw new IllegalArgumentException("flight_policy_context_missing");
            if ("TRAVEL_FLIGHT_AIRPORT".equals(entityType.invoke(entity))
                    && Boolean.TRUE.equals(ignored.invoke(null, context, relate.invoke(entity), stateKey.invoke(null, data)))) return false;
        }
        // The new OEM skip method initializes timestamps in its input map. Pass a copy:
        // readiness checks and stale-button checks must never start or extend a reminder.
        return Boolean.TRUE.equals(show.invoke(adapter, phase)) && !Boolean.TRUE.equals(modern
                ? skip.invoke(adapter, phase, data, context) : skip.invoke(adapter, phase, data));
    }
    private static Method find(Class<?> type, String name, Class<?>... args) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) try {
            Method method = current.getDeclaredMethod(name, args); method.setAccessible(true); return method;
        } catch (NoSuchMethodException missing) { }
        return null;
    }
}
