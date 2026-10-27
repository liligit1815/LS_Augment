package ls.augment.com.hook;

import android.content.BroadcastReceiver;
import android.content.ContentProviderClient;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import ls.augment.com.ConfigSchema;
import ls.augment.com.NativeIslandSceneOptions;
import ls.augment.com.SystemUiOptions;

/** Adds selected OEM suggestion cards to their existing, consent-gated event pipeline. */
final class NativeIslandPersonalCards {
    private static final String PKG = "com.zte.personalagent";
    private static final String CARDS = "com.zte.briefagent.event.cards.";
    private static final String ACTION_PREFIX = "ls.augment.com.native_personal.";
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ThreadLocal<Binding> constructing = new ThreadLocal<>();
    private final ThreadLocal<List<?>> renderingCards = new ThreadLocal<>();
    private final ThreadLocal<ActionBuild> buildingActions = new ThreadLocal<>();
    private final ThreadLocal<Binding> dispatchingAction = new ThreadLocal<>();
    private final Set<Object> retiredRenderers = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private final Set<Object> retiredProducers = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private final Set<Object> retiredFlightAdapters = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private final Field client, target, producerContext, rendererPusher, rendererContext, managerRenders, rendererCards;
    private final Method nativeSupport, render, stopExpiry, unregisterRender, cardType, cardEntity, extraData, channel, status, cardExpired,
            register, unregister, providerUri;
    private final Constructor<?> producerConstructor;
    private final Class<?> compositeCard;
    private final Method compositeLeft, compositeRight;
    private final List<NativeIslandPersonalScene> scenes = new ArrayList<>();
    private volatile Binding binding;

    static void install(AugmentModule module, ClassLoader loader) {
        try { new NativeIslandPersonalCards(module, loader); }
        catch (Throwable missing) { module.logFeatureError("NATIVE_PERSONAL_CARDS_CONTRACT", missing); }
    }

    private NativeIslandPersonalCards(AugmentModule module, ClassLoader loader) throws Exception {
        Class<?> environment = Class.forName("com.zte.briefagent.data.config.EnvironmentConfig", false, loader);
        Class<?> processor = Class.forName("com.zte.briefagent.event.EventProcessor", false, loader);
        Class<?> manager = Class.forName(CARDS + "CardManager", false, loader);
        Class<?> renderer = Class.forName(CARDS + "render.StarryIslandCardRender", false, loader);
        Class<?> renderInterface = Class.forName(CARDS + "CardRender", false, loader);
        Class<?> card = Class.forName(CARDS + "ICard", false, loader);
        Class<?> composite = null;
        Method left = null, right = null;
        try {
            composite = Class.forName(CARDS + "shape.Base4x2Card", false, loader);
            if (!card.isAssignableFrom(composite)) throw new NoSuchMethodException("Base4x2Card is not ICard");
            left = NativeIslandPersonalScene.exact(composite, "getLeft", card);
            right = NativeIslandPersonalScene.exact(composite, "getRight", card);
            if (Modifier.isStatic(left.getModifiers()) || Modifier.isStatic(right.getModifiers()))
                throw new NoSuchMethodException("Base4x2Card children must be instance methods");
        } catch (Exception | LinkageError missing) {
            composite = null; left = right = null;
            module.logFeatureInfo("NATIVE_PERSONAL_COMPOSITE_UNAVAILABLE " + missing);
        }
        compositeCard = composite; compositeLeft = left; compositeRight = right;
        Class<?> entity = Class.forName(PKG + ".database.data.model.entities.Card", false, loader);
        Class<?> type = Class.forName(CARDS + "CardType", false, loader);
        Class<?> cardContext = Class.forName(CARDS + "CardContext", false, loader);
        Class<?> message = Class.forName("com.zte.toolsdk.common.CardMessage", false, loader);
        Class<?> producer = Class.forName("com.zte.toolsdk.producer.CardPusher", false, loader);
        Method contextCard = require(cardContext, "getCard", card);
        for (String id : new String[]{NativeIslandPersonalScene.MEETING, NativeIslandPersonalScene.GUIDE, NativeIslandPersonalScene.CHARGING, NativeIslandPersonalScene.CYCLING, NativeIslandPersonalScene.FLIGHT, NativeIslandPersonalScene.BATTERY, NativeIslandPersonalScene.WEATHER}) {
            try { scenes.add(new NativeIslandPersonalScene(loader, id)); }
            catch (Exception | LinkageError missing) { module.logFeatureInfo("NATIVE_PERSONAL_SCENE_UNAVAILABLE " + id + ":" + missing); }
        }
        if (scenes.isEmpty()) throw new IllegalStateException("personal_no_verified_scene");
        cardType = require(card, "getType", type);
        cardEntity = require(card, "getCardEntity", entity);
        extraData = require(entity, "getExtraData", Map.class);
        channel = require(entity, "getChannel", int.class);
        status = require(entity, "getStatus", int.class);
        nativeSupport = requireStatic(environment, "isFeatureStarryIslandSupported", boolean.class, Context.class);
        Method enabled = requireStatic(environment, "enableStarryIsland", boolean.class, Context.class);
        Method initialize = require(processor, "registerCardRenders", void.class, manager, Context.class);
        Method deinitialize = require(processor, "deInit", void.class, Context.class);
        Method cleanup = require(manager, "cleanup", void.class);
        unregisterRender = require(manager, "unregisterCardRender", void.class, renderInterface);
        managerRenders = field(manager, "cardRenders", List.class);
        Method initPusher = require(renderer, "initCardPusher", void.class);
        render = require(renderer, "render", void.class, List.class);
        Method expire = require(renderer, "checkAndRemoveExpiredCards", void.class);
        cardExpired = require(renderer, "isCardExpired", boolean.class, entity);
        Method action = require(renderer, "handleCardAction", void.class, String.class, int.class, int.class, Object.class);
        stopExpiry = require(renderer, "stopExpireCheck", void.class);
        rendererPusher = field(renderer, "mCardPusher", producer);
        rendererContext = field(renderer, "context", Context.class);
        rendererCards = field(renderer, "cardIdToICardMap", Map.class);
        producerConstructor = producer.getDeclaredConstructor(Context.class, String.class);
        producerConstructor.setAccessible(true);
        Method instance = requireStatic(producer, "getInstance", producer, Context.class, String.class);
        Method connect = require(producer, "connect", boolean.class);
        Method disconnect = require(producer, "disconnect", void.class);
        client = field(producer, "mClient", ContentProviderClient.class);
        target = field(producer, "mTargetPackage", String.class);
        producerContext = field(producer, "mContext", Context.class);
        register = require(producer, "registerCallback", void.class);
        unregister = require(producer, "unregisterCallback", void.class);
        providerUri = requireStatic(Class.forName("com.zte.toolsdk.common.CardProviderContract", false, loader),
                "getProviderUri", Uri.class, String.class);
        Class<?> remoteViews = Class.forName("com.zte.toolsdk.widget.RemoteViews", false, loader);
        Method click = requireStatic(Class.forName("com.zte.toolsdk.utils.RemoteViewsUtil", false, loader),
                "setOnClickListener", void.class, Context.class, remoteViews, Intent.class, int.class, int.class);
        Class<?> userTask = Class.forName("com.zte.toolsdk.producer.UserTask", false, loader);
        Method execute = require(userTask, "execute", void.class);
        Field taskId = field(userTask, "mCardId", String.class), taskView = field(userTask, "mViewId", int.class),
                taskPosition = field(userTask, "mPosition", int.class), taskPush = field(userTask, "mIsPushCard", boolean.class),
                taskPackage = field(userTask, "mPackageName", String.class), taskContext = field(userTask, "mContext", Context.class);
        Field cardIdKey = field(Class.forName("com.zte.toolsdk.common.Constants$DataKey", false, loader), "CARD_ID", String.class);
        if (!Modifier.isStatic(cardIdKey.getModifiers()) || !"cardId".equals(cardIdKey.get(null)))
            throw new NoSuchFieldException("personal_card_action_key");

        // This gate is scoped to renderer registration, not the user's service/privacy/channel settings.
        module.registerFeatureHook(module.prepareFeatureHook(enabled, "rm.personal.native_cards.gate", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Binding source = constructing.get();
            return source != null && source.context == ((Context) chain.getArgs().get(0)).getApplicationContext() ? true : result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(initialize, "rm.personal.native_cards.initialize", false).intercept(chain -> {
            Context context = ((Context) chain.getArgs().get(1)).getApplicationContext();
            if (Boolean.TRUE.equals(nativeSupport.invoke(null, context))) return chain.proceed(chain.getArgs().toArray());
            List<?> existing = (List<?>) managerRenders.get(chain.getArgs().get(0));
            synchronized (existing) {
                for (Object item : existing) if (renderer.isInstance(item)) return chain.proceed(chain.getArgs().toArray());
            }
            Binding next;
            try {
                if (binding != null) binding.close();
                next = new Binding(context, chain.getArgs().get(0));
            } catch (Exception missing) {
                module.logFeatureInfo("NATIVE_PERSONAL_BINDING_UNAVAILABLE " + missing);
                return chain.proceed(chain.getArgs().toArray());
            }
            constructing.set(next);
            try {
                Object result = chain.proceed(chain.getArgs().toArray());
                boolean registered;
                synchronized (existing) { registered = next.renderer != null && existing.contains(next.renderer); }
                if (!registered) { next.close(); return result; }
                binding = next;
                try { next.start(); }
                catch (Exception failure) { next.close(); module.logFeatureError("NATIVE_PERSONAL_CARDS_START", failure); }
                return result;
            } catch (Throwable failure) { next.close(); throw failure; }
            finally { constructing.remove(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(instance, "rm.personal.native_cards.private_producer", false).intercept(chain -> {
            Binding source = constructing.get();
            if (source == null) source = dispatchingAction.get();
            if (source != null && "com.android.systemui".equals(chain.getArgs().get(1))
                    && ((Context) chain.getArgs().get(0)).getApplicationContext() == source.context) return source.producer;
            return chain.proceed(chain.getArgs().toArray());
        }));
        for (NativeIslandPersonalScene scene : scenes) if (scene.battery != null || scene.weather != null)
            module.registerFeatureHook(module.prepareFeatureHook(scene.cardId, "rm.personal.native_cards." + (scene.weather != null ? "weather_identity" : "battery_identity"), false).intercept(chain -> {
                Object original = chain.proceed(chain.getArgs().toArray());
                List<?> selected = renderingCards.get();
                Object actual = chain.getArgs().get(0) == null ? null : contextCard.invoke(chain.getArgs().get(0));
                if (binding != null && selected != null && scene.matches(actual))
                    for (Object item : selected) if (item == actual) return scene.weather != null ? scene.weather.wireId((String) original) : scene.battery.wireId((String) original);
                return original;
            }));
        for (NativeIslandPersonalScene scene : scenes) if (scene.weather != null) {
            scene.weather.install(module);
            module.registerFeatureHook(module.prepareFeatureHook(scene.weather.compositeEntity, "rm.personal.native_cards.weather_entity", false).intercept(chain -> {
                List<?> selected = renderingCards.get();
                if (binding != null && selected != null && scene.cardClass.isInstance(chain.getThisObject()))
                    for (Object item : selected) if (item == chain.getThisObject()) return scene.weather.reminder(item);
                return chain.proceed(chain.getArgs().toArray());
            }));
        }
        for (NativeIslandPersonalScene scene : scenes) module.registerFeatureHook(module.prepareFeatureHook(scene.create,
                "rm.personal.native_cards.action_card" + (NativeIslandPersonalScene.MEETING.equals(scene.id) ? "" : "." + scene.id), false).intercept(chain -> {
            Binding source = binding;
            List<?> selected = renderingCards.get();
            Object actual = chain.getArgs().get(0) == null ? null : contextCard.invoke(chain.getArgs().get(0));
            boolean owned = false;
            if (selected != null) for (Object item : selected) if (item == actual) { owned = true; break; }
            // New OEM periodic/theme refreshes build cards outside render(). Their active source
            // still needs the same gates and action identity as a regular publication.
            if (source != null && scene.flight != null && scene.flight.modern != null && source.owns(actual)) {
                owned = true;
                if (!source.available(scene) || !source.validData(actual) || !source.replayValid(scene, actual)) return null;
            }
            if (source == null || !owned) return chain.proceed(chain.getArgs().toArray());
            synchronized (source) {
                if (source.closed) return null;
                String id = (String) scene.cardId.invoke(chain.getThisObject(), chain.getArgs().get(0));
                if (id == null || id.isEmpty()) return null;
                if (!scene.acceptsId(id)) {
                    FeatureSettings.diagnostic(source.context, "ls_augment_native_island_personal_cards", "unsupported_card_id:" + scene.id + ":" + id);
                    return null;
                }
                if (scene.flight != null && scene.flight.modern != null) {
                    source.flightAdapters.put(chain.getThisObject(), scene);
                    retiredFlightAdapters.remove(chain.getThisObject());
                }
                ActionBuild next = new ActionBuild(source, id, scene, actual), previous = buildingActions.get();
                buildingActions.set(next);
                try {
                    Object result = chain.proceed(chain.getArgs().toArray());
                    if (result != null) {
                        if (NativeIslandPersonalScene.MEETING.equals(scene.id)) {
                            try { scene.finishMessage(source.context, result, (Map<?, ?>) extraData.invoke(cardEntity.invoke(actual))); }
                            catch (Exception missing) { source.disableReplay(scene, missing); return null; }
                        }
                        source.actions.values().removeIf(ticket -> ticket.cardId.equals(id));
                        source.actions.putAll(next.actions);
                    }
                    return result;
                } finally { if (previous == null) buildingActions.remove(); else buildingActions.set(previous); }
            }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(click, "rm.personal.native_cards.action_identity", false).intercept(chain -> {
            ActionBuild current = buildingActions.get();
            if (current == null || chain.getArgs().get(1) == null || chain.getArgs().get(2) == null
                    || ((Context) chain.getArgs().get(0)).getApplicationContext() != current.source.context)
                return chain.proceed(chain.getArgs().toArray());
            String token = ACTION_PREFIX + current.source.actionGeneration + "." + (++current.source.actionSequence);
            int position = (Integer) chain.getArgs().get(3), viewId = (Integer) chain.getArgs().get(4);
            // Extras alone do not distinguish PendingIntents. A category gives every card/control
            // its own identity while preserving the OEM receiver, action, data and queue.
            Intent intent = new Intent((Intent) chain.getArgs().get(2)).putExtra("cardId", token).addCategory(token);
            Object[] args = chain.getArgs().toArray(); args[2] = intent;
            Object result = chain.proceed(args);
            NativeIslandPersonalFlightModern.Action flight = current.scene.flight == null || current.scene.flight.modern == null ? null
                    : current.scene.flight.modern.action(current.source.context, cardEntity.invoke(current.item), viewId);
            current.actions.put(token, new ActionTicket(current.cardId, position, viewId, flight));
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(execute, "rm.personal.native_cards.action_task", false).intercept(chain -> {
            String id = (String) taskId.get(chain.getThisObject());
            if (id == null || !id.startsWith(ACTION_PREFIX)) return chain.proceed(chain.getArgs().toArray());
            Binding source = binding;
            if (source == null) return null;
            synchronized (source) {
                ActionTicket ticket = source.actions.get(id);
                Context context = (Context) taskContext.get(chain.getThisObject());
                if (ticket == null || context == null || context.getApplicationContext() != source.context
                        || !Boolean.TRUE.equals(taskPush.get(chain.getThisObject()))
                        || !"com.android.systemui".equals(taskPackage.get(chain.getThisObject()))
                        || ticket.position != (Integer) taskPosition.get(chain.getThisObject())
                        || ticket.viewId != (Integer) taskView.get(chain.getThisObject()) || !source.ticketAvailable(ticket)) return null;
                Binding previous = dispatchingAction.get(); dispatchingAction.set(source);
                try { return chain.proceed(chain.getArgs().toArray()); }
                finally { if (previous == null) dispatchingAction.remove(); else dispatchingAction.set(previous); }
            }
        }));
        for (NativeIslandPersonalScene scene : scenes) if (scene.flight != null && scene.flight.modern != null) {
            NativeIslandPersonalFlightModern modern = scene.flight.modern;
            module.registerFeatureHook(module.prepareFeatureHook(modern.button, "rm.personal.native_cards.flight_button", false).intercept(chain -> {
                ActionBuild current = buildingActions.get();
                if (current == null || current.scene != scene
                        || ((Context) chain.getArgs().get(0)).getApplicationContext() != current.source.context)
                    return chain.proceed(chain.getArgs().toArray());
                NativeIslandPersonalFlightModern.Action expected = modern.action(current.source.context, cardEntity.invoke(current.item),
                        current.source.context.getResources().getIdentifier("tv_flight_big_action_button", "id", PKG));
                if (expected == null || !expected.operation.equals(chain.getArgs().get(2)) || !current.cardId.equals(chain.getArgs().get(3)))
                    throw new IllegalStateException("flight_button_contract_changed");
                // Keep the original SDK's receiver, queue and callback. Its card/control ticket
                // replaces the shared Activity PendingIntent; the actual OEM handler is unchanged.
                modern.attachButton(current.source.context, chain.getArgs().get(1));
                return null;
            }));
            module.registerFeatureHook(module.prepareFeatureHook(modern.nightChanged, "rm.personal.native_cards.flight_night", false).intercept(chain -> {
                Binding source = binding;
                if (source != null) synchronized (source) {
                    if (!source.flightAdapters.containsKey(chain.getThisObject()))
                        return retiredFlightAdapters.contains(chain.getThisObject()) ? null : chain.proceed(chain.getArgs().toArray());
                    // The native closure captures old data and a global pusher. Rebuild all active
                    // cards of this cached adapter through the owned renderer and current data.
                    modern.invalidate(source.renderer, chain.getThisObject()); source.schedule();
                    return null;
                }
                return retiredFlightAdapters.contains(chain.getThisObject()) ? null : chain.proceed(chain.getArgs().toArray());
            }));
            module.registerFeatureHook(module.prepareFeatureHook(modern.periodic, "rm.personal.native_cards.flight_periodic", false).intercept(chain -> {
                if (retiredRenderers.contains(chain.getThisObject())) return null;
                Binding source = binding;
                if (source == null || source.renderer != chain.getThisObject()) return chain.proceed(chain.getArgs().toArray());
                synchronized (source) {
                    if (source.closed) return null;
                    source.sync();
                    List<?> current = new ArrayList<>(((Map<?, ?>) rendererCards.get(source.renderer)).values());
                    List<?> previous = renderingCards.get(); boolean wasInternal = source.internal;
                    renderingCards.set(current); source.internal = true;
                    try { Object result = chain.proceed(chain.getArgs().toArray()); source.captureDisplays(current); return result; }
                    finally { source.internal = wasInternal; if (previous == null) renderingCards.remove(); else renderingCards.set(previous); source.pruneActions(); }
                }
            }));
        }
        module.registerFeatureHook(module.prepareFeatureHook(initPusher, "rm.personal.native_cards.renderer", false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            Binding source = constructing.get();
            if (source != null && rendererPusher.get(chain.getThisObject()) == source.producer
                    && rendererContext.get(chain.getThisObject()) == source.context) source.renderer = chain.getThisObject();
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(connect, "rm.personal.native_cards.connect", false).intercept(chain -> {
            if (retiredProducers.contains(chain.getThisObject())) return false;
            Binding source = source(chain.getThisObject());
            if (source == null) return chain.proceed(chain.getArgs().toArray());
            synchronized (source) { return source.available() && source.connect(); }
        }));
        module.registerFeatureHook(module.prepareFeatureHook(disconnect, "rm.personal.native_cards.disconnect", false).intercept(chain -> {
            if (retiredProducers.contains(chain.getThisObject())) return null;
            Binding source = source(chain.getThisObject());
            if (source == null) return chain.proceed(chain.getArgs().toArray());
            synchronized (source) { source.release(); return null; }
        }));
        // ART can dispatch a copied interface default without entering the interface
        // method hook. Scope the same display-only channel to its concrete entity getter.
        module.registerFeatureHook(module.prepareFeatureHook(channel, "rm.personal.native_cards.entity_channel", false).intercept(chain -> {
            int original = (Integer) chain.proceed(chain.getArgs().toArray());
            List<?> current = renderingCards.get();
            if (original <= 0 || (original & 8) != 0 || current == null) return original;
            for (Object item : current) if (cardEntity.invoke(item) == chain.getThisObject()) return original | 8;
            return original;
        }));
        Map<Method, String> channelMethods = new LinkedHashMap<>();
        for (NativeIslandPersonalScene scene : scenes) channelMethods.putIfAbsent(scene.supportsChannel, scene.id);
        for (Map.Entry<Method, String> entry : channelMethods.entrySet()) module.registerFeatureHook(module.prepareFeatureHook(entry.getKey(),
                "rm.personal.native_cards.channel" + (NativeIslandPersonalScene.MEETING.equals(entry.getValue()) ? "" : "." + entry.getValue()), false).intercept(chain -> {
            Object result = chain.proceed(chain.getArgs().toArray());
            List<?> current = renderingCards.get();
            if (Boolean.TRUE.equals(result) || current == null || !Integer.valueOf(8).equals(chain.getArgs().get(0))) return result;
            for (Object item : current) if (item == chain.getThisObject()) {
                Object info = cardEntity.invoke(item);
                // Duo supplies the missing display channel only during its own renderer call.
                // Never change stored channels, disabled services, hidden cards or notification/widget behavior.
                return info != null && ((Integer) channel.invoke(info)) > 0;
            }
            return result;
        }));
        module.registerFeatureHook(module.prepareFeatureHook(render, "rm.personal.native_cards.render", false).intercept(chain -> {
            if (retiredRenderers.contains(chain.getThisObject())) return null;
            Binding source = binding;
            if (source == null || source.renderer != chain.getThisObject()) return chain.proceed(chain.getArgs().toArray());
            synchronized (source) {
                if (source.closed) return null;
                List<?> incoming = (List<?>) chain.getArgs().get(0);
                List<Object> current = new ArrayList<>();
                Set<Object> seen = Collections.newSetFromMap(new java.util.IdentityHashMap<>());
                Map<NativeIslandPersonalScene, Integer> candidates = new LinkedHashMap<>();
                for (Object item : incoming) {
                    // All other PersonalAgent cards keep their existing notification/widget paths.
                    Object actual = source.sourceCard(item);
                    if (actual != null) candidates.merge(source.scene(actual), 1, Integer::sum);
                    if (actual != null && source.validData(actual) && seen.add(actual)) current.add(actual);
                }
                if (!source.internal) {
                    source.latest = current;
                    source.retainDisplays(current);
                }
                List<Object> selected = new ArrayList<>();
                if (!source.clearing) for (Object item : current) {
                    NativeIslandPersonalScene scene = source.scene(item);
                    if (source.available(scene) && (!source.internal || source.replayValid(scene, item))) selected.add(item);
                }
                if (!selected.isEmpty() && !source.connect()) selected.clear();
                List<?> previous = renderingCards.get(); renderingCards.set(selected);
                try {
                    Object result = chain.proceed(new Object[]{selected});
                    source.captureDisplays(selected);
                    for (Map.Entry<NativeIslandPersonalScene, Integer> entry : candidates.entrySet()) {
                        NativeIslandPersonalScene scene = entry.getKey();
                        int valid = 0, sent = 0, active = 0;
                        for (Object item : current) if (source.scene(item) == scene) valid++;
                        for (Object item : selected) if (source.scene(item) == scene) sent++;
                        for (Object item : ((Map<?, ?>) rendererCards.get(source.renderer)).values())
                            if (source.scene(item) == scene) active++;
                        FeatureSettings.diagnostic(source.context, NativeIslandSceneOptions.key(scene.id) + "_render_status",
                                "candidates=" + entry.getValue() + ",valid=" + valid + ",selected=" + sent + ",active=" + active
                                        + ",configured=" + source.configured(scene) + ",host=" + NativeIslandCardClient.available(source.context, scene.id));
                    }
                    return result;
                }
                finally {
                    try { source.pruneActions(); }
                    finally { if (previous == null) renderingCards.remove(); else renderingCards.set(previous); }
                }
            }
        }));
        for (Method method : new Method[]{expire, action}) module.registerFeatureHook(module.prepareFeatureHook(method,
                "rm.personal.native_cards." + method.getName(), false).intercept(chain -> {
            if (retiredRenderers.contains(chain.getThisObject())) return null;
            Binding source = binding;
            if (source == null || source.renderer != chain.getThisObject()) return chain.proceed(chain.getArgs().toArray());
            synchronized (source) {
                if (source.closed) return null;
                if (method == action) {
                    String id = (String) chain.getArgs().get(0);
                    ActionTicket ticket = source.actions.get(id);
                    if (ticket != null) {
                        if (dispatchingAction.get() != source || ticket.position != (Integer) chain.getArgs().get(1)
                                || ticket.viewId != (Integer) chain.getArgs().get(2) || !source.ticketAvailable(ticket)) return null;
                        Object[] args = chain.getArgs().toArray(); args[0] = ticket.cardId;
                        if (source.dispatchSpecial(ticket.cardId, ticket.viewId)) return null;
                        return chain.proceed(args);
                    }
                    // New SDK buttons always have a ticket. Only an actual active card may use
                    // the raw ID (the native launch action); never search all cards for a match.
                    if (!source.actionAvailable(id, (Integer) chain.getArgs().get(2))) return null;
                    NativeIslandPersonalScene scene = source.scene(((Map<?, ?>) rendererCards.get(source.renderer)).get(id));
                    int view = (Integer) chain.getArgs().get(2);
                    if (scene != null && scene.flight != null && scene.flight.modern != null && view != 0 && view != -1) return null;
                    if (source.dispatchSpecial(id, (Integer) chain.getArgs().get(2))) return null;
                }
                try { return chain.proceed(chain.getArgs().toArray()); }
                finally { if (method == expire) source.pruneActions(); }
            }
        }));
        for (Method method : new Method[]{deinitialize, cleanup}) module.registerFeatureHook(module.prepareFeatureHook(method,
                "rm.personal.native_cards." + method.getName(), false).intercept(chain -> {
            Binding source = binding;
            if (source != null && (method == deinitialize || source.manager == chain.getThisObject())) source.close();
            return chain.proceed(chain.getArgs().toArray());
        }));
        for (NativeIslandPersonalScene scene : scenes) if (scene.cycling != null)
            module.registerFeatureHook(module.prepareFeatureHook(scene.cycling.capabilityChanged,
                    "rm.personal.native_cards.cycling_tool_capability", false).intercept(chain -> {
                Object result = chain.proceed(chain.getArgs().toArray());
                Binding source = binding;
                if (source != null) source.schedule();
                return result;
            }));
        module.logFeatureInfo("NATIVE_PERSONAL_CARDS_READY verified_scenes=" + scenes.size());
    }

    private Binding source(Object producer) {
        Binding source = constructing.get();
        if (source == null || source.producer != producer) source = binding;
        return source != null && source.producer == producer ? source : null;
    }

    private final class Binding {
        final Context context;
        final Object manager, producer;
        Object renderer;
        List<?> latest = Collections.emptyList();
        final String actionGeneration = Long.toHexString(System.nanoTime());
        final Map<String, ActionTicket> actions = new HashMap<>();
        final Map<Object, NativeIslandPersonalScene> flightAdapters = new java.util.IdentityHashMap<>();
        final List<NativeIslandPersonalScene> readyScenes = new ArrayList<>();
        final Map<NativeIslandPersonalScene, NativeIslandPersonalScene.Replay> replays = new LinkedHashMap<>();
        long actionSequence;
        ContentProviderClient connection;
        boolean closed, internal, clearing, reconnect, observing, receiving;
        final Runnable changed = this::schedule, refresh = this::sync;
        final ContentObserver settings = new ContentObserver(main) { @Override public void onChange(boolean self) { schedule(); } };
        final BroadcastReceiver recovery = new BroadcastReceiver() {
            @Override public void onReceive(Context ignored, Intent intent) {
                if (intent != null && NativeIslandScenePolicy.PERSONAL_SYNC_ACTION.equals(intent.getAction())) {
                    NativeIslandCardClient.invalidate(); synchronized (Binding.this) { reconnect = true; } schedule();
                } else if (intent != null && "android.os.action.POWER_SAVE_MODE_CHANGED".equals(intent.getAction())) schedule();
            }
        };
        Binding(Context context, Object manager) throws Exception {
            this.context = context; this.manager = manager;
            if (!PKG.equals(context.getPackageName())) throw new IllegalStateException("personal_context");
            for (NativeIslandPersonalScene scene : scenes) {
                try {
                    scene.validateResources(context); readyScenes.add(scene);
                    if (scene.timed()) replays.put(scene, scene.new Replay(context));
                } catch (Exception missing) {
                    FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key(scene.id) + "_source_capability", "unavailable:" + missing);
                }
            }
            if (readyScenes.isEmpty()) throw new IllegalStateException("personal_no_verified_resources");
            producer = producerConstructor.newInstance(context, "com.android.systemui");
            if (!"com.android.systemui".equals(target.get(producer)) || producerContext.get(producer) != context)
                throw new IllegalStateException("personal_producer_identity");
        }
        void start() {
            FeatureSettings.addSnapshotListener(context, changed);
            context.getContentResolver().registerContentObserver(Settings.System.getUriFor("dynamic_island_switch_state"), false, settings);
            observing = true;
            IntentFilter recoveryFilter = new IntentFilter(NativeIslandScenePolicy.PERSONAL_SYNC_ACTION);
            for (NativeIslandPersonalScene scene : readyScenes) if (scene.battery != null) {
                recoveryFilter.addAction("android.os.action.POWER_SAVE_MODE_CHANGED"); break;
            }
            context.registerReceiver(recovery, recoveryFilter,
                    NativeIslandScenePolicy.SOURCE_SYNC_PERMISSION, main, Context.RECEIVER_EXPORTED);
            receiving = true;
            for (NativeIslandPersonalScene scene : readyScenes) runtimeReady(scene);
            schedule();
        }
        boolean configured() {
            for (NativeIslandPersonalScene scene : readyScenes) if (configured(scene)) return true;
            return false;
        }
        boolean configured(NativeIslandPersonalScene scene) {
            return !closed && FeatureSettings.enabled(context, ConfigSchema.NATIVE_ISLAND_SELECTED)
                    && !FeatureSettings.enabled(context, SystemUiOptions.ISLAND)
                    && FeatureSettings.enabled(context, NativeIslandSceneOptions.ENABLED)
                    && FeatureSettings.enabled(context, NativeIslandSceneOptions.key(scene.id))
                    && Settings.System.getInt(context.getContentResolver(), "dynamic_island_switch_state", 0) == 1;
        }
        boolean available() {
            for (NativeIslandPersonalScene scene : readyScenes) if (available(scene)) return true;
            return false;
        }
        boolean available(NativeIslandPersonalScene scene) {
            return scene != null && (scene.cycling == null && scene.flight == null && scene.battery == null && scene.weather == null || runtimeReady(scene)) && configured(scene)
                    && NativeIslandCardClient.available(context, scene.id);
        }
        boolean runtimeReady(NativeIslandPersonalScene scene) {
            String reason = scene.cycling != null ? scene.cycling.unavailable(context)
                    : scene.flight != null ? scene.flight.unavailable(context)
                    : scene.battery != null ? scene.battery.unavailable(context)
                    : scene.weather != null ? scene.weather.unavailable(context) : "";
            FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key(scene.id) + "_source_capability",
                    reason.isEmpty() ? "ready:" + ls.augment.com.BuildConfig.VERSION_CODE : "unavailable:" + reason);
            return reason.isEmpty();
        }
        NativeIslandPersonalScene scene(Object item) throws Exception {
            if (item == null) return null;
            for (NativeIslandPersonalScene scene : readyScenes)
                if (scene.matches(item)) return scene;
            return null;
        }
        Object sourceCard(Object item) throws Exception {
            // Weather has its own verified composite semantics and must retain its wrapper.
            if (scene(item) != null) return item;
            if (compositeCard == null || !compositeCard.isInstance(item)) return null;
            Object left = compositeLeft.invoke(item), right = compositeRight.invoke(item);
            // The OEM default/travel combiners wrap the same selected source on both sides.
            // Never guess which entity/actions to use for a different or mixed composition.
            if (left == null || left != right || scene(right) == null
                    || cardEntity.invoke(item) != cardEntity.invoke(right)
                    || cardType.invoke(item) != cardType.invoke(right)) {
                FeatureSettings.diagnostic(context, "ls_augment_native_island_personal_cards",
                        "unsupported_composite_source:" + item.getClass().getName()
                                + ":left=" + (left == null ? "null" : left.getClass().getName())
                                + ":right=" + (right == null ? "null" : right.getClass().getName())
                                + ":same=" + (left == right));
                return null;
            }
            return right;
        }
        synchronized boolean owns(Object item) throws Exception {
            if (item == null || renderer == null) return false;
            for (Object current : ((Map<?, ?>) rendererCards.get(renderer)).values()) if (current == item) return true;
            return false;
        }
        boolean validData(Object item) throws Exception {
            NativeIslandPersonalScene scene = scene(item);
            if (scene != null && scene.weather != null) {
                try {
                    scene.weather.data(context, item);
                    Object reminder = scene.weather.reminder(item), weather = scene.weather.weather(item);
                    return (Integer) channel.invoke(reminder) > 0 && !Integer.valueOf(1).equals(status.invoke(reminder))
                            && !Integer.valueOf(1).equals(status.invoke(weather))
                            && !Boolean.TRUE.equals(cardExpired.invoke(renderer, reminder)) && !Boolean.TRUE.equals(cardExpired.invoke(renderer, weather));
                } catch (Exception changed) {
                    FeatureSettings.diagnostic(context, "ls_augment_native_island_personal_cards", "weather_data_unavailable:" + changed);
                    return false;
                }
            }
            Object info = cardEntity.invoke(item);
            if (info == null) return false;
            if (scene != null && scene.battery != null) {
                boolean valid = scene.battery.wireId(scene.battery.rawId(item)) != null;
                if (!valid) FeatureSettings.diagnostic(context, "ls_augment_native_island_personal_cards", "unsupported_battery_card_id");
                return valid;
            }
            if (scene != null && scene.flight != null) {
                try { return scene.flight.displayable(context, info); }
                catch (Exception changed) {
                    FeatureSettings.diagnostic(context, "ls_augment_native_island_personal_cards", "flight_data_unavailable:" + changed);
                    return false;
                }
            }
            if (scene != null && scene.cycling != null) {
                try {
                    if (scene.cycling.validState(item)) return true;
                    FeatureSettings.diagnostic(context, "ls_augment_native_island_personal_cards", "unsupported_cycling_state");
                } catch (Exception changed) {
                    FeatureSettings.diagnostic(context, "ls_augment_native_island_personal_cards", "cycling_state_unavailable:" + changed);
                }
                return false;
            }
            if (!"MEETING_CARD".equals(String.valueOf(cardType.invoke(item)))) return true;
            Map<?, ?> data = (Map<?, ?>) extraData.invoke(info);
            return meetingEndMillis(data) > System.currentTimeMillis();
        }
        boolean replayValid(NativeIslandPersonalScene scene, Object item) throws Exception {
            if (!scene.timed()) return true;
            try { return replays.containsKey(scene) && replays.get(scene).valid(renderer, item); }
            catch (Exception changed) { disableReplay(scene, changed); return false; }
        }
        void retainDisplays(List<?> current) {
            for (NativeIslandPersonalScene scene : new ArrayList<>(replays.keySet()))
                try { replays.get(scene).retain(renderer, current); }
                catch (Exception changed) { disableReplay(scene, changed); }
        }
        void captureDisplays(List<?> selected) {
            for (NativeIslandPersonalScene scene : new ArrayList<>(replays.keySet()))
                try { replays.get(scene).capture(renderer, selected, internal); }
                catch (Exception changed) { disableReplay(scene, changed); }
        }
        void disableReplay(NativeIslandPersonalScene scene, Exception changed) {
            readyScenes.remove(scene);
            NativeIslandPersonalScene.Replay replay = replays.remove(scene);
            if (replay != null) replay.displayed.clear();
            String label = NativeIslandPersonalScene.GUIDE.equals(scene.id) ? "scenic" : scene.id;
            FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key(scene.id) + "_source_capability",
                    "unavailable:" + label + "_runtime_contract:" + changed);
            schedule();
        }
        boolean actionAvailable(String id, int viewId) throws Exception {
            if (id == null || id.isEmpty() || renderer == null || !available()) return false;
            Object item = ((Map<?, ?>) rendererCards.get(renderer)).get(id);
            NativeIslandPersonalScene scene = scene(item);
            if (!available(scene) || !validData(item) || !replayValid(scene, item)) return false;
            if (scene.cycling != null && !scene.cycling.actionAllowed(context, item, viewId)) return false;
            Object info = scene.weather != null ? scene.weather.reminder(item) : cardEntity.invoke(item);
            if (scene.weather != null && !scene.weather.actionAllowed(context, viewId)) return false;
            if (scene.flight != null && !scene.flight.actionAllowed(context, info, viewId)) return false;
            if (scene.battery != null && !scene.battery.actionAllowed(context, viewId)) return false;
            return (Integer) channel.invoke(info) > 0
                    && !Integer.valueOf(1).equals(status.invoke(info)) && !Boolean.TRUE.equals(cardExpired.invoke(renderer, info));
        }
        boolean dispatchSpecial(String id, int viewId) throws Exception {
            Object item = ((Map<?, ?>) rendererCards.get(renderer)).get(id);
            NativeIslandPersonalScene scene = scene(item);
            NativeIslandPersonalFlightModern modern = scene == null || scene.flight == null ? null : scene.flight.modern;
            if (scene == null || scene.battery == null && scene.weather == null && modern == null) return false;
            try {
                if (modern != null) {
                    Object entity = cardEntity.invoke(item);
                    NativeIslandPersonalFlightModern.Action action = modern.action(context, entity, viewId);
                    if (action != null) modern.dispatch(context, id, entity, viewId, action);
                } else if (scene.weather != null) scene.weather.dispatch(context, item, viewId); else scene.battery.dispatch(context, item);
            }
            catch (Exception failure) { FeatureSettings.diagnostic(context, "ls_augment_native_island_personal_cards", scene.id + "_action_failed:" + failure); }
            finally { schedule(); }
            return true;
        }
        boolean ticketAvailable(ActionTicket ticket) throws Exception {
            if (!actionAvailable(ticket.cardId, ticket.viewId)) return false;
            Object item = ((Map<?, ?>) rendererCards.get(renderer)).get(ticket.cardId);
            NativeIslandPersonalScene scene = scene(item);
            if (scene.flight == null || scene.flight.modern == null) return ticket.flight == null;
            return ticket.flight != null && ticket.flight.same(scene.flight.modern.action(context, cardEntity.invoke(item), ticket.viewId));
        }
        void pruneActions() throws Exception {
            Map<?, ?> active = (Map<?, ?>) rendererCards.get(renderer);
            actions.values().removeIf(ticket -> !active.containsKey(ticket.cardId));
            for (Object adapter : new ArrayList<>(flightAdapters.keySet())) {
                NativeIslandPersonalFlightModern modern = flightAdapters.get(adapter).flight.modern;
                if (!modern.active(renderer, adapter)) {
                    modern.stop(adapter); flightAdapters.remove(adapter); retiredFlightAdapters.add(adapter);
                }
            }
        }
        boolean connect() throws Exception {
            if (closed) return false;
            if (connection != null && client.get(producer) == connection) return true;
            if (connection != null) release();
            // A replacement client belongs to its installer, even on our private producer.
            if (client.get(producer) != null) return false;
            ContentProviderClient next = context.getContentResolver().acquireUnstableContentProviderClient((Uri) providerUri.invoke(null, "com.android.systemui"));
            if (next == null) return false;
            try { client.set(producer, next); register.invoke(producer); connection = next; return true; }
            catch (Exception failure) { client.set(producer, null); next.close(); return false; }
        }
        void release() throws Exception {
            ContentProviderClient previous = connection; connection = null;
            if (previous == null) return;
            try {
                if (client.get(producer) == previous) {
                    try { unregister.invoke(producer); } catch (Exception ignored) { }
                    finally { client.set(producer, null); }
                }
            } finally { previous.close(); }
        }
        void schedule() { if (!closed) { main.removeCallbacks(refresh); main.post(refresh); } }
        synchronized void sync() {
            if (closed || renderer == null) return;
            try {
                internal = true;
                for (NativeIslandPersonalScene scene : readyScenes) if (scene.cycling != null || scene.flight != null || scene.battery != null || scene.weather != null) runtimeReady(scene);
                if (reconnect || !configured()) {
                    clearing = true;
                    try { render.invoke(renderer, Collections.emptyList()); } finally { clearing = false; }
                    release(); reconnect = false;
                }
                render.invoke(renderer, latest);
            } catch (Exception failure) { FeatureSettings.diagnostic(context, "ls_augment_native_island_personal_cards", "sync_failed:" + failure.getClass().getSimpleName()); }
            finally { internal = false; }
        }
        synchronized void close() {
            if (closed) return;
            try {
                internal = true; clearing = true;
                if (renderer != null) render.invoke(renderer, Collections.emptyList());
            } catch (Exception ignored) { }
            finally { closed = true; internal = false; clearing = false; latest = Collections.emptyList(); actions.clear(); }
            for (Object adapter : new ArrayList<>(flightAdapters.keySet())) {
                try { flightAdapters.get(adapter).flight.modern.stop(adapter); } catch (Exception ignored) { }
                retiredFlightAdapters.add(adapter);
            }
            flightAdapters.clear();
            if (renderer != null) {
                retiredRenderers.add(renderer);
                try { stopExpiry.invoke(renderer); } catch (Exception ignored) { }
                try { unregisterRender.invoke(manager, renderer); } catch (Exception ignored) { }
            }
            try { release(); } catch (Exception ignored) { }
            retiredProducers.add(producer);
            main.removeCallbacks(refresh); FeatureSettings.removeSnapshotListener(changed);
            if (observing) { context.getContentResolver().unregisterContentObserver(settings); observing = false; }
            if (receiving) { context.unregisterReceiver(recovery); receiving = false; }
            for (NativeIslandPersonalScene.Replay replay : replays.values()) replay.displayed.clear();
            for (NativeIslandPersonalScene scene : readyScenes)
                FeatureSettings.diagnostic(context, NativeIslandSceneOptions.key(scene.id) + "_source_capability", "unavailable:personal_service_stopped");
        }
    }
    private static long meetingEndMillis(Map<?, ?> data) {
        Object value = data == null ? null : data.get("toTime");
        // The OEM Room JsonConverter uses Gson Map<String,Object>, which reads stored
        // timestamps as Double. AttributeHelper also accepts numbers and integer text.
        // Normalize only for validation; keep the original map for the OEM adapter.
        if (value instanceof Number) {
            double number = ((Number) value).doubleValue();
            if (!Double.isFinite(number) || number <= 0 || number >= 0x1p63) return 0;
            return ((Number) value).longValue();
        }
        if (value instanceof String) {
            try { return Long.parseLong((String) value); }
            catch (NumberFormatException ignored) { }
        }
        return 0;
    }
    private static final class ActionTicket {
        final String cardId;
        final int position, viewId;
        final NativeIslandPersonalFlightModern.Action flight;
        ActionTicket(String cardId, int position, int viewId, NativeIslandPersonalFlightModern.Action flight) { this.cardId = cardId; this.position = position; this.viewId = viewId; this.flight = flight; }
    }
    private final class ActionBuild {
        final Binding source;
        final String cardId;
        final NativeIslandPersonalScene scene;
        final Object item;
        final Map<String, ActionTicket> actions = new HashMap<>();
        ActionBuild(Binding source, String cardId, NativeIslandPersonalScene scene, Object item) { this.source = source; this.cardId = cardId; this.scene = scene; this.item = item; }
    }
    static Method require(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method value = NativeIslandSceneContract.method(type, name, result, args);
        if (value == null) throw new NoSuchMethodException(type.getName() + "." + name);
        return value;
    }
    static Method requireStatic(Class<?> type, String name, Class<?> result, Class<?>... args) throws NoSuchMethodException {
        Method value = require(type, name, result, args);
        if (!Modifier.isStatic(value.getModifiers())) throw new NoSuchMethodException("static:" + type.getName() + "." + name);
        return value;
    }
    static Field field(Class<?> type, String name, Class<?> result) throws NoSuchFieldException {
        Field value = NativeIslandSceneContract.field(type, name, result);
        if (value == null) throw new NoSuchFieldException(type.getName() + "." + name);
        return value;
    }
}
